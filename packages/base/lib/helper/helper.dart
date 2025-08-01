class Helper {
  // Fungsi helper untuk memformat angka jarak dengan pemisah ribuan
  static String formatDistance(double distanceInKm) {
    // Membulatkan angka menjadi 2 desimal
    String distanceString = distanceInKm.toStringAsFixed(2);

    // Memisahkan bagian integer dan desimal
    List<String> parts = distanceString.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : '';

    // Menambahkan pemisah ribuan (titik) pada bagian integer
    String formattedInteger = '';
    int count = 0;
    for (int i = integerPart.length - 1; i >= 0; i--) {
      formattedInteger = integerPart[i] + formattedInteger;
      count++;
      if (count % 3 == 0 && i > 0) {
        formattedInteger = '.$formattedInteger';
      }
    }

    // Menggabungkan kembali bagian integer yang sudah diformat dengan bagian desimal
    if (decimalPart.isNotEmpty) {
      return '$formattedInteger,$decimalPart';
    } else {
      return formattedInteger;
    }
  }

  // Helper function untuk format harga
  static String formatRupiah(dynamic number) {
    if (number == null) {
      return 'Harga N/A';
    }
    // Konversi ke string lalu gunakan regex untuk menambahkan titik
    final numberString = number.toString();
    final regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return 'Rp. ${numberString.replaceAllMapped(regex, (Match m) => '${m[1]}.')}';
  }
}
