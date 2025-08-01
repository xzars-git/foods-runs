import 'package:base/base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class BerandaController extends State<BerandaView> {
  static late BerandaController instance;
  late BerandaView view;

  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isSearching = false;

  Position? currentPosition;
  bool isLoadingLocation = true;
  String locationStatusMessage = 'Mencari lokasi...';

  late Stream<QuerySnapshot> restaurantStream;
  List<RestaurantModel> _allRestaurantsFromFirestore = [];
  List<RestaurantModel> filteredRestaurants = [];

  final List<Widget> navigationPages = const [
    BerandaView(),
    SplashScreenView(),
  ];
  int navigationIndex = 0;

  // Fungsi untuk memfilter data restoran dari Firestore
  void onSearchChanged() {
    final keyWord = searchController.text.toLowerCase();
    setState(() {
      filteredRestaurants = _allRestaurantsFromFirestore
          .where((restaurant) => restaurant.nama.toLowerCase().contains(keyWord))
          .toList();
    });
  }

  // Fungsi untuk mendapatkan lokasi pengguna
  Future<void> _fetchCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          locationStatusMessage = "Layanan lokasi dinonaktifkan.";
          isLoadingLocation = false;
        });
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            locationStatusMessage = "Izin lokasi ditolak.";
            isLoadingLocation = false;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          locationStatusMessage = "Izin lokasi ditolak permanen.";
          isLoadingLocation = false;
        });
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentPosition = position;
        isLoadingLocation = false;
        locationStatusMessage = 'Lokasi berhasil ditemukan.';
      });
    } catch (e) {
      setState(() {
        locationStatusMessage = "Gagal mendapatkan lokasi: ${e.toString()}";
        isLoadingLocation = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    instance = this;
    searchController.addListener(onSearchChanged);
    focusNode.addListener(() {
      setState(() {
        isSearching = focusNode.hasFocus;
      });
    });

    restaurantStream = FirebaseFirestore.instance.collection('restaurants').snapshots();
    _fetchCurrentLocation();

    // Mendengarkan stream dan mengisi data restoran
    restaurantStream.listen((snapshot) {
      _allRestaurantsFromFirestore =
          snapshot.docs.map((doc) => RestaurantModel.fromFirestore(doc)).toList();
      onSearchChanged(); // Perbarui hasil pencarian setiap kali data baru masuk
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
