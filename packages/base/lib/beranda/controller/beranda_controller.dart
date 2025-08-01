import 'package:base/base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BerandaController extends State<BerandaView> {
  static late BerandaController instance;
  late BerandaView view;

  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isSearching = false;
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
    'Pizza Hut 2',
  ];

  // Stream untuk mendengarkan perubahan data dari Firestore secara real-time
  late Stream<QuerySnapshot> restaurantStream;

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
  List<String> filteredRestaurants = [];

  void onSearchChanged() {
    final keyWord = searchController.text.toLowerCase();
    setState(() {
      filteredRestaurants = allRestaurants.where((r) => r.toLowerCase().contains(keyWord)).toList();
    });
  }

  @override
  void initState() {
    instance = this;
    searchController.addListener(onSearchChanged);
    focusNode.addListener(() {
      setState(() {
        isSearching = focusNode.hasFocus;
      });
    });

    // Inisialisasi stream untuk mengambil data restoran dari Firestore
    restaurantStream = FirebaseFirestore.instance.collection('restaurants').snapshots();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
