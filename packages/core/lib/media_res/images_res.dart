class Images {
  static String basePath = 'assets/images';

  final menu = _ImagesMenu();
  final profile = _Profile();
  final ilustrasi = _Ilustrasi();
  final logo = _ImagesLogo();
  final vehicle = _ImagesVehicle();
  final layanan = _ImagesLayanan();
  final lepasKepemilikan = _ImagesLepasKepemilikan();
  final infoProgresif = _ImagesInfoProgresif();
  final state = _ImageState();
  final svg = _SVGState();

  String get lengkapiProfil => '${Images.basePath}/lengkapi_profil.svg';
  String get profil => '${Images.basePath}/profil.svg';
  String get profilDark => '${Images.basePath}/profil_dark.svg';
  String get notFound => '${Images.basePath}/not_found.png';
  String get notFoundDark => '${Images.basePath}/not_found_dark.png';
}

class _SVGState {
  static String basePath = 'svg';
  String get back => '${Images.basePath}/$basePath/back.svg';
  String get location => '${Images.basePath}/$basePath/location.svg';
  String get logo => '${Images.basePath}/$basePath/logo.svg';
  String get plus => '${Images.basePath}/$basePath/plus.svg';
  String get rating => '${Images.basePath}/$basePath/rating.svg';
  String get rightArrow => '${Images.basePath}/$basePath/right_arrow.svg';
  String get search => '${Images.basePath}/$basePath/search.svg';
  String get backgroundSplashScreen => '${Images.basePath}/$basePath/background_splash_screen.svg';
  String get splashScreenFood1 => '${Images.basePath}/$basePath/splash_screen_food_1.svg';
  String get splashScreenFood2 => '${Images.basePath}/$basePath/splash_screen_food_2.svg';
}

class _ImageState {
  static String basePath = 'state';

  String get cantLoad => '${Images.basePath}/$basePath/cant_load.png';
  String get cantLoadDark => '${Images.basePath}/$basePath/cant_load_dark.png';
  String get download => '${Images.basePath}/$basePath/download.svg';
  String get downloadDark => '${Images.basePath}/$basePath/download_dark.svg';
  String get failed => '${Images.basePath}/$basePath/failed.svg';
  String get failedDark => '${Images.basePath}/$basePath/failed_dark.svg';
  String get info => '${Images.basePath}/$basePath/info.svg';
  String get infoDark => '${Images.basePath}/$basePath/info_dark.svg';
  String get proses => '${Images.basePath}/$basePath/proses.svg';
  String get prosesDark => '${Images.basePath}/$basePath/proses_dark.svg';
  String get success => '${Images.basePath}/$basePath/success.svg';
  String get successDark => '${Images.basePath}/$basePath/success_dark.svg';
  String get notFound => '${Images.basePath}/$basePath/not_found.svg';
  String get notFoundDark => '${Images.basePath}/$basePath/not_found_dark.svg';
}

class _Ilustrasi {
  static String basePath = 'ilustrasi';

  String get ubahKataSandi => '${Images.basePath}/$basePath/ubah_kata_sandi.svg';
  String get dotIllustration => '${Images.basePath}/$basePath/dot.svg';
  String get ubahKataSandiDark => '${Images.basePath}/$basePath/ubah_kata_sandi_dark.svg';
  String get salahLokasi => '${Images.basePath}/$basePath/salah_lokasi.svg';
  String get salahLokasiDark => '${Images.basePath}/$basePath/salah_lokasi_dark.svg';
  String get tanggalSalah => '${Images.basePath}/$basePath/tanggal_salah.svg';
  String get tanggalSalahDark => '${Images.basePath}/$basePath/tanggal_salah_dark.svg';
  String get tglTmpSalah => '${Images.basePath}/$basePath/tgl_&_tmp_salah.svg';
  String get tglTmpSalahDark => '${Images.basePath}/$basePath/tgl_&_tmp_salah_dark.svg';
  String get rekonEsamsatNopol => '${Images.basePath}/$basePath/rekon_esamsat_nopol.svg';
  String get rekonEsamsatKodeBayar => '${Images.basePath}/$basePath/rekon_esamsat_kode_bayar.svg';
}

class _Profile {
  static String basePath = 'profile';

  String get darkMode => '${Images.basePath}/$basePath/dark_mode.svg';
  String get kataSandi => '${Images.basePath}/$basePath/kata_sandi.svg';
  String get version => '${Images.basePath}/$basePath/version.svg';
  String get darkModeDark => '${Images.basePath}/$basePath/dark_mode_dark.svg';
  String get kataSandiDark => '${Images.basePath}/$basePath/kata_sandi_dark.svg';
  String get versionDark => '${Images.basePath}/$basePath/version_dark.svg';
}

class _ImagesMenu {
  static String basePath = 'menu';

  String get awalHari => '${Images.basePath}/$basePath/awal_hari.png';
  String get awalHariDark => '${Images.basePath}/$basePath/awal_hari_dark.png';
  String get batalTransaksi => '${Images.basePath}/$basePath/batal_transaksi.png';
  String get batalTransaksiDark => '${Images.basePath}/$basePath/batal_transaksi_dark.png';
  String get infoPkb => '${Images.basePath}/$basePath/infopkb.png';
  String get infoPkbDark => '${Images.basePath}/$basePath/infopkb_dark.png';
  String get laporan => '${Images.basePath}/$basePath/laporan.png';
  String get laporanDark => '${Images.basePath}/$basePath/laporan_dark.png';
  String get laporanBulanan => '${Images.basePath}/$basePath/laporan_bulanan.png';
  String get laporanBulananDark => '${Images.basePath}/$basePath/laporan_bulanan_dark.png';
  String get loket => '${Images.basePath}/$basePath/loket.png';
  String get loketDark => '${Images.basePath}/$basePath/loket_dark.png';
  String get manajemenPetugas => '${Images.basePath}/$basePath/manajemen_petugas.png';
  String get manajemenPetugasDark => '${Images.basePath}/$basePath/manajemen_petugas_dark.png';
  String get monitoringAkhirHari => '${Images.basePath}/$basePath/monitoring_akhir_hari.png';
  String get monitoringAkhirHariDark =>
      '${Images.basePath}/$basePath/monitoring_akhir_hari_dark.png';
  String get njkb => '${Images.basePath}/$basePath/njkb.png';
  String get njkbDark => '${Images.basePath}/$basePath/njkb_dark.png';
  String get proteksi => '${Images.basePath}/$basePath/proteksi.png';
  String get proteksiDark => '${Images.basePath}/$basePath/proteksi_dark.png';
  String get riwayatBatalTransaksi => '${Images.basePath}/$basePath/riwayat_batal_transaksi.png';
  String get riwayatBatalTransaksiDark =>
      '${Images.basePath}/$basePath/riwayat_batal_transaksi_dark.png';
  String get riwayatStsOnline => '${Images.basePath}/$basePath/riwayat_sts_online.png';
  String get riwayatTabelObjekPajak => '${Images.basePath}/$basePath/riwayat_tabel_objek_pajak.png';
  String get riwayatTabelObjekPajakDark =>
      '${Images.basePath}/$basePath/riwayat_tabel_objek_pajak_dark.png';
  String get tabelObjekPajak => '${Images.basePath}/$basePath/tabel_objek_pajak.png';
  String get tabelObjekPajakDark => '${Images.basePath}/$basePath/tabel_objek_pajak_dark.png';
  String get riwayatTabelReport => '${Images.basePath}/$basePath/riwayat_tabel_report.png';
  String get riwayatTabelReportDark => '${Images.basePath}/$basePath/riwayat_tabel_report_dark.png';
  String get riwayatTabelSubjekPajak =>
      '${Images.basePath}/$basePath/riwayat_tabel_subjek_pajak.png';
  String get riwayatTabelSubjekPajakDark =>
      '${Images.basePath}/$basePath/riwayat_tabel_subjek_pajak_dark.png';
  String get riwayatTabelTransaksi => '${Images.basePath}/$basePath/riwayat_tabel_transaksi.png';
  String get riwayatTabelTransaksiDark =>
      '${Images.basePath}/$basePath/riwayat_tabel_transaksi_dark.png';
  String get stsOnline => '${Images.basePath}/$basePath/sts_online.png';
  String get stsOnlineDark => '${Images.basePath}/$basePath/sts_online_dark.png';
  String get suplemenStsOnline => '${Images.basePath}/$basePath/suplemen_sts_online.png';
  String get suplemenStsOnlineDark => '${Images.basePath}/$basePath/suplemen_sts_online_dark.png';
  String get tabelReport => '${Images.basePath}/$basePath/tabel_report.png';
  String get tabelSubjekPajak => '${Images.basePath}/$basePath/tabel_subjek_pajak.png';
  String get tabelTransaksi => '${Images.basePath}/$basePath/tabel_transaksi.png';
  String get tapping => '${Images.basePath}/$basePath/tapping.png';
  String get tappingDark => '${Images.basePath}/$basePath/tapping_dark.png';
  String get verifikasiReservasi => '${Images.basePath}/$basePath/verifikasi_reservasi.png';
  String get verifikasiReservasiDark =>
      '${Images.basePath}/$basePath/verifikasi_reservasi_dark.png';
  String get verifikasiPrioritas =>
      '${Images.basePath}/$basePath/verifikasi_reservasi_prioritas.png';
  String get verifikasiPrioritasDark =>
      '${Images.basePath}/$basePath/verifikasi_reservasi_prioritas_dark.png';
  String get kuotaAntrean => '${Images.basePath}/$basePath/kuota_antrean.png';
  String get kuotaAntreanDark => '${Images.basePath}/$basePath/kuota_antrean_dark.png';
  String get kuotaCekFisik => '${Images.basePath}/$basePath/kuota_cek_fisik.png';
  String get kuotaCekFisikDark => '${Images.basePath}/$basePath/kuota_cek_fisik_dark.png';
  String get kuotaReservasiAntrean => '${Images.basePath}/$basePath/kuota_reservasi_antrean.png';
  String get kuotaReservasiAntreanDark =>
      '${Images.basePath}/$basePath/kuota_reservasi_antrean_dark.png';
  String get rekon => '${Images.basePath}/$basePath/rekon.png';
  String get rekonDark => '${Images.basePath}/$basePath/rekon_dark.png';
  String get riwayatProteksi => '${Images.basePath}/$basePath/riwayat_proteksi.png';
  String get riwayatProteksiDark => '${Images.basePath}/$basePath/riwayat_proteksi_dark.png';
  String get riwayatBlokir => '${Images.basePath}/$basePath/riwayat_blokir.png';
  String get riwayatBlokirDark => '${Images.basePath}/$basePath/riwayat_blokir_dark.png';
}

class _ImagesLogo {
  static String basePath = 'logo';

  String get bapendaGrey => '${Images.basePath}/$basePath/bapenda_grey.svg';
  String get bapenda => '${Images.basePath}/$basePath/bapenda.svg';
  String get logo => '${Images.basePath}/$basePath/logo.svg';
  String get saktiJawara => '${Images.basePath}/$basePath/sakti_jawara.svg';
  String get saktiJawaraWhite => '${Images.basePath}/$basePath/sakti_jawara_white.svg';
  String get timPembinaSamsat => '${Images.basePath}/$basePath/tim_pembina_samsat.svg';
  String get saktiCircle => '${Images.basePath}/$basePath/sakti_circle.svg';
  String get saktiCircleDark => '${Images.basePath}/$basePath/sakti_circle_dark.svg';
}

class _ImagesVehicle {
  static String basePath = 'vehicle';

  String get carFalse => '${Images.basePath}/$basePath/car_false.svg';
  String get car => '${Images.basePath}/$basePath/car.svg';
  String get vespaFalse => '${Images.basePath}/$basePath/vespa_false.svg';
  String get vespa => '${Images.basePath}/$basePath/vespa.svg';
}

class _ImagesLayanan {
  static String basePath = 'layanan';

  String get roda4 => '${Images.basePath}/$basePath/roda_4.svg';
  String get roda2 => '${Images.basePath}/$basePath/roda_2.svg';
  String get allRoda => '${Images.basePath}/$basePath/all_roda.svg';
  String get batal => '${Images.basePath}/$basePath/batal.svg';
  String get layanan => '${Images.basePath}/$basePath/layanan.svg';
  String get layananPng => '${Images.basePath}/$basePath/layanan.png';
  String get loket => '${Images.basePath}/$basePath/loket.svg';
  String get sts => '${Images.basePath}/$basePath/sts.svg';
  String get tabelOperasional => '${Images.basePath}/$basePath/tabel_operasional.svg';
  String get tapping => '${Images.basePath}/$basePath/tapping.svg';
}

class _ImagesLepasKepemilikan {
  static String basePath = 'lepas_kepemilikan';

  String get lepasKepemilikan => '${Images.basePath}/$basePath/lepas_kepemilikan.svg';
  String get lepasKepemilikanDark => '${Images.basePath}/$basePath/lepas_kepemilikan_dark.svg';
}

class _ImagesInfoProgresif {
  static String basePath = 'info_progresif';

  String get bukaProteksi => '${Images.basePath}/$basePath/buka_proteksi.svg';
  String get bukaProteksiDarkMode => '${Images.basePath}/$basePath/buka_proteksi_dark_mode.svg';
  String get proteksi => '${Images.basePath}/$basePath/proteksi.svg';
  String get proteksiDarkMode => '${Images.basePath}/$basePath/proteksi_dark_mode.svg';
}
