import 'package:base/base.dart';
import 'package:base/daftar_restoran/view/daftar_restoran_view.dart';
import 'package:flutter/material.dart';

class DaftarRestoranController extends State<DaftarRestoranView> {
  static late DaftarRestoranController instance;
  late DaftarRestoranView view;

  final List<Widget> navigationPages = [
    const BerandaView(),
    const DaftarRestoranView(),
  ];
  int navigationIndex = 1;

  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool isSearching = false;

  // Variabel untuk menampung semua item menu dari data masukan
  final List<Map<String, dynamic>> _allMenu = [];
  // Variabel untuk menampung menu yang sudah difilter
  List<Map<String, dynamic>> filteredMenu = [];
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
