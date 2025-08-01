import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  final String id;
  final String nama;
  final String alamat;
  final double latitude;
  final double longitude;
  final String imageUrl;
  final String deskripsi;
  final double rating;
  final Map<String, dynamic> menu;

  RestaurantModel({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
    required this.deskripsi,
    required this.rating,
    required this.menu,
  });

  // Factory constructor untuk membuat objek dari Firestore DocumentSnapshot
  factory RestaurantModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<dynamic, dynamic>;
    return RestaurantModel(
      id: doc.id,
      nama: data['nama'] ?? 'N/A',
      alamat: data['alamat'] ?? 'N/A',
      latitude: data['latitude'],
      longitude: data['longitude'],
      imageUrl: data['image_url'] ?? '',
      deskripsi: data['deskripsi'] ?? 'N/A',
      rating: (data['rating'] is String)
          ? double.parse(data['rating'])
          : data['rating']?.toDouble() ?? 0.0,
      menu: data['menu'] ?? {},
    );
  }
}
