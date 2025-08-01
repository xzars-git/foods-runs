import 'package:base/base.dart';
import 'package:flutter/material.dart';
import '../view/daftar_menu_view.dart';
import 'package:get/get.dart';

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
      print("Debug Search: Kata kunci pencarian: '$keyWord'");
      if (keyWord.isEmpty) {
        // Jika input kosong, tampilkan semua menu
        filteredMenu = _allMenu;
        print(
            "Debug Search: Kata kunci kosong, menampilkan semua menu. Jumlah menu: ${filteredMenu.length}");
      } else {
        // Jika ada input, filter menu berdasarkan nama
        filteredMenu = _allMenu.where((menuItem) {
          final nama = menuItem['nama']?.toLowerCase();
          return nama?.contains(keyWord) ?? false;
        }).toList();
        print(
            "Debug Search: Kata kunci ada, menampilkan menu yang difilter. Jumlah menu: ${filteredMenu.length}");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    instance = this;
    searchController.text = "";

    print("Debug Init: Data daftar menu yang diterima: ${widget.dataDaftarMenu}");
    // Proses data menu yang datang dari widget
    // Menggunakan dataDaftarMenu secara langsung karena tidak ada kunci 'menu' di dalamnya
    final menuData = widget.dataDaftarMenu;
    print("Debug Init: Data menu ditemukan. Memproses...");
    _allMenu = menuData.values.map((item) {
      // Pastikan setiap item adalah Map<String, dynamic>
      if (item is Map<String, dynamic>) {
        return item;
      }
      // Jika bukan, kembalikan map kosong atau tangani sesuai kebutuhan
      return <String, dynamic>{};
    }).toList();

    // Inisialisasi daftar menu yang difilter dengan semua menu
    filteredMenu = _allMenu;

    print("Debug Init: Ukuran _allMenu setelah diproses: ${_allMenu.length}");
    print("Debug Init: Ukuran filteredMenu setelah inisialisasi: ${filteredMenu.length}");

    searchController.addListener(onSearchChanged);
    focusNode.addListener(() {
      setState(() {
        isSearching = focusNode.hasFocus;
        print("Debug Focus: Status pencarian diperbarui: $isSearching");
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
