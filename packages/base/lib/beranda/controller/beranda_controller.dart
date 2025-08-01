import 'package:base/base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // Impor geolocator

class BerandaController extends State<BerandaView> {
  static late BerandaController instance;
  late BerandaView view;

  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isSearching = false;

  // Variabel untuk menangani lokasi pengguna
  Position? currentPosition;
  bool isLoadingLocation = true;
  String locationStatusMessage = 'Mencari lokasi...';

  // Stream untuk mendengarkan perubahan data dari Firestore secara real-time
  late Stream<QuerySnapshot> restaurantStream;

  final List<String> allRestaurants = [
    'McDonald’s',
    'Burger King',
    'KFC',
    'Sushi Tei',
    'Pizza Hut',
    'McDonald’s 2',
    'Burger King 2',
    'KFC 2',
    'Sushi Tei 2',
    'Sushi Tei 2',
    'Pizza Hut 2',
  ];
  List<String> filteredRestaurants = [];

  final List<Widget> navigationPages = const [
    BerandaView(),
    SplashScreenView(),
  ];
  int navigationIndex = 0;

  final Map<String, Map<String, String>> restaurantImages = {
    'McDonald’s': {
      'image':
          'https://craftsnippets.com/uploads/post_images/_1320x500_crop_center-center_none/875/art-hanging-photographs-photos-265946.webp',
      'description': 'Restoran cepat saji populer dunia.',
    },
    'Burger King': {
      'image':
          'https://craftsnippets.com/uploads/post_images/_1320x500_crop_center-center_none/875/art-hanging-photographs-photos-265946.webp',
      'description': 'Nikmati burger bakar khas.',
    },
    'KFC': {
      'image':
          'https://craftsnippets.com/uploads/post_images/_1320x500_crop_center-center_none/875/art-hanging-photographs-photos-265946.webp',
      'description': 'Ayam goreng krispi dengan resep rahasia.',
    },
    'Sushi Tei': {
      'image':
          'https://craftsnippets.com/uploads/post_images/_1320x500_crop_center-center_none/875/art-hanging-photographs-photos-265946.webp',
      'description': 'Pilihan sushi segar dan lezat.',
    },
    'Pizza Hut': {
      'image':
          'https://craftsnippets.com/uploads/post_images/_1320x500_crop_center-center_none/875/art-hanging-photographs-photos-265946.webp',
      'description': 'Pizza pan klasik dan pasta creamy.',
    },
    'McDonald’s 2': {
      'image':
          'https://craftsnippets.com/uploads/post_images/_1320x500_crop_center-center_none/875/art-hanging-photographs-photos-265946.webp',
      'description': 'Restoran cepat saji populer dunia.',
    },
    'Burger King 2': {
      'image':
          'https://craftsnippets.com/uploads/post_images/_1320x500_crop_center-center_none/875/art-hanging-photographs-photos-265946.webp',
      'description': 'Nikmati burger bakar khas.',
    },
    'KFC 2': {
      'image':
          'https://craftsnippets.com/uploads/post_images/_1320x500_crop_center-center_none/875/art-hanging-photographs-photos-265946.webp',
      'description': 'Ayam goreng krispi dengan resep rahasia.',
    },
    'Sushi Tei 2': {
      'image':
          'https://craftsnippets.com/uploads/post_images/_1320x500_crop_center-center_none/875/art-hanging-photographs-photos-265946.webp',
      'description': 'Pilihan sushi segar dan lezat.',
    },
    'Pizza Hut 2': {
      'image':
          'https://craftsnippets.com/uploads/post_images/_1320x500_crop_center-center_none/875/art-hanging-photographs-photos-265946.webp',
      'description': 'Pizza pan klasik dan pasta creamy.',
    },
  };

  void onSearchChanged() {
    final keyWord = searchController.text.toLowerCase();
    setState(() {
      filteredRestaurants = allRestaurants.where((r) => r.toLowerCase().contains(keyWord)).toList();
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

    // Inisialisasi stream dan ambil lokasi saat widget pertama kali dibuat
    restaurantStream = FirebaseFirestore.instance.collection('restaurants').snapshots();
    _fetchCurrentLocation();
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
