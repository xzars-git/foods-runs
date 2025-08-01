import 'package:base/base.dart';
import 'package:flutter/material.dart';
import '../view/daftar_menu_view.dart';

class DaftarMenuController extends State<DaftarMenuView> {
  static late DaftarMenuController instance;
  late DaftarMenuView view;

  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isSearching = false;

  // Variabel untuk menampung semua item menu dari data masukan
  List<Map<String, dynamic>> _allMenu = [];
  // Variabel untuk menampung menu yang sudah difilter
  List<Map<String, dynamic>> filteredMenu = [];

  final List<Widget> navigationPages = const [
    BerandaView(),
    SplashScreenView(),
  ];
  int navigationIndex = 0;

  // Fungsi untuk menyaring menu saat teks pencarian berubah
  void onSearchChanged() {
    final keyWord = searchController.text.toLowerCase();
    setState(() {
      if (keyWord.isEmpty) {
        // Jika input kosong, tampilkan semua menu
        filteredMenu = _allMenu;
      } else {
        // Jika ada input, filter menu berdasarkan nama
        filteredMenu = _allMenu.where((menuItem) {
          final nama = menuItem['nama']?.toLowerCase();
          return nama?.contains(keyWord) ?? false;
        }).toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    instance = this;
    searchController.text = "";

    final menuData = widget.dataRestoran.menu;
    _allMenu = menuData.values.map((item) {
      if (item is Map<String, dynamic>) {
        return item;
      }
      return <String, dynamic>{};
    }).toList();

    filteredMenu = _allMenu;

    searchController.addListener(onSearchChanged);
    focusNode.addListener(() {
      setState(() {
        isSearching = focusNode.hasFocus;
      });
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
