import 'package:base/base.dart';
import 'package:base/daftar_restoran/view/daftar_restoran_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
  List<RestaurantModel> allRestaurantsFromFirestore = [];
  List<RestaurantModel> filteredRestaurants = [];

  final List<Widget> navigationPages = [
    const BerandaView(),
    const DaftarRestoranView(),
  ];
  int navigationIndex = 0;

  void onSearchChanged() {
    final keyWord = searchController.text.toLowerCase();
    filteredRestaurants = allRestaurantsFromFirestore
        .where((restaurant) => restaurant.nama.toLowerCase().contains(keyWord))
        .toList();
  }

  // Fungsi untuk memproses snapshot dari Firestore
  List<RestaurantWithDistance> getRestaurantsWithDistance(QuerySnapshot snapshot) {
    if (currentPosition == null) {
      return []; // Mengembalikan list kosong jika lokasi belum didapat
    }

    final List<RestaurantModel> restaurants =
        snapshot.docs.map((doc) => RestaurantModel.fromFirestore(doc)).toList();

    final List<RestaurantWithDistance> restaurantsWithDistance = [];
    for (var restaurant in restaurants) {
      final distanceInMeters = Geolocator.distanceBetween(
        currentPosition!.latitude,
        currentPosition!.longitude,
        restaurant.latitude,
        restaurant.longitude,
      );
      restaurantsWithDistance.add(
        RestaurantWithDistance(
          restaurant: restaurant,
          distanceInKm: distanceInMeters / 1000,
        ),
      );
    }

    // Urutkan daftar restoran berdasarkan jarak dari yang terdekat
    restaurantsWithDistance.sort((a, b) => a.distanceInKm.compareTo(b.distanceInKm));

    return restaurantsWithDistance;
  }

  // Fungsi untuk mendapatkan lokasi pengguna dan mengubahnya menjadi alamat
  Future<void> getCurrentLocation() async {
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

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        setState(() {
          currentPosition = position;
          locationStatusMessage = "${placemark.street}, ${placemark.subLocality}";
          isLoadingLocation = false;
        });
      } else {
        setState(() {
          currentPosition = position;
          locationStatusMessage = "Lokasi tidak ditemukan.";
          isLoadingLocation = false;
        });
      }
    } catch (e) {
      setState(() {
        locationStatusMessage = "Gagal mendapatkan lokasi.";
        isLoadingLocation = false;
      });
    }
  }

  // Fungsi untuk mendapatkan posisi pengguna dan mengembalikannya
  Future<Position?> fetchCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return null;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return position;
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    instance = this;
    searchController.text = "";
    searchController.addListener(onSearchChanged);
    focusNode.addListener(() {
      setState(() {
        isSearching = focusNode.hasFocus;
      });
    });

    restaurantStream = FirebaseFirestore.instance.collection('restaurants').snapshots();
    getCurrentLocation();
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
