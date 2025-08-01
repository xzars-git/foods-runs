// base/daftar_restoran/controller/daftar_restoran_controller.dart

import 'package:base/base.dart';
import 'package:base/daftar_restoran/view/daftar_restoran_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DaftarRestoranController extends State<DaftarRestoranView> {
  static late DaftarRestoranController instance;
  late DaftarRestoranView view;

  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isSearching = false;

  int navigationIndex = 1; // 0: Beranda, 1: Daftar Restoran

  // Variabel untuk menampung lokasi pengguna
  Position? currentPosition;
  bool isLoadingLocation = true;
  String locationStatusMessage = 'Mencari lokasi...';

  // Stream untuk mendengarkan perubahan koleksi 'restaurants' dari Firestore
  late Stream<QuerySnapshot> restaurantStream;

  // List untuk menampung semua data restoran dari Firestore
  List<RestaurantModel> allRestaurantsFromFirestore = [];

  // List untuk menampung data restoran yang sudah difilter/dicari
  List<RestaurantModel> filteredRestaurants = [];

  // Fungsi untuk memproses snapshot dari Firestore dan menghitung jarak
  List<RestaurantWithDistance> getRestaurantsWithDistance(QuerySnapshot snapshot) {
    if (currentPosition == null) {
      return [];
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

  // Fungsi untuk mendapatkan lokasi pengguna
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

  // Fungsi untuk menyaring restoran saat teks pencarian berubah
  void onSearchChanged() {
    final keyWord = searchController.text.toLowerCase();
      if (keyWord.isEmpty) {
        filteredRestaurants = allRestaurantsFromFirestore;
      } else {
        filteredRestaurants = allRestaurantsFromFirestore
            .where((restaurant) => restaurant.nama.toLowerCase().contains(keyWord))
            .toList();
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
    getCurrentLocation();
  }

  @override
  void dispose() {
    searchController.removeListener(onSearchChanged);
    searchController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
