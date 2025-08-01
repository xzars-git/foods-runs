import 'package:base/base.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart' as GET;

class SetRouteController extends State<SetRouteView> {
  static late SetRouteController instance;
  late SetRouteView view;

  // Variabel untuk menyimpan posisi saat ini
  Position? currentPosition;
  bool isLoading = true;
  String addressText = "Loading address...";

  @override
  void initState() {
    super.initState();
    instance = this;
    _determinePosition();
    _fetchAddress();
  }

  // Mendapatkan posisi GPS saat ini
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      GET.Get.snackbar("Error", "Layanan lokasi dinonaktifkan.");
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        GET.Get.snackbar("Error", "Izin lokasi ditolak.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      GET.Get.snackbar("Error", "Izin lokasi ditolak secara permanen.");
      return;
    }

    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentPosition = position;
        isLoading = false;
      });
    } catch (e) {
      GET.Get.snackbar("Error", "Gagal mendapatkan lokasi: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  // Mengambil informasi alamat dari lat/long
  Future<void> _fetchAddress() async {
    // Karena paket geocoding tidak bisa langsung digunakan di Flutter web, kita akan gunakan data dummy
    // Di aplikasi nyata, Anda akan menggunakan Geocoding.
    try {
      // Dummy address untuk demonstrasi
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        addressText = "109, Freedom Way, Off Lekki Phase\nVictoria Island, Lagos.";
      });
    } catch (e) {
      GET.Get.snackbar("Error", "Gagal mendapatkan alamat: $e");
      setState(() {
        addressText = "Alamat tidak tersedia";
      });
    }
  }

  // Membuka aplikasi peta eksternal untuk rute
  Future<void> openMap() async {
    final destination = '${view.latitude},${view.longitude}';
    final url = Uri.parse(
        'https://www.google.com/maps/dir/?api=1&destination=$destination&travelmode=driving');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      GET.Get.snackbar("Error", "Gagal membuka aplikasi peta.");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
