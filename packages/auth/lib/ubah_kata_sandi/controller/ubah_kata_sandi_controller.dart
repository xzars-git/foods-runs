import 'package:auth/service/api_service_auth.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../view/ubah_kata_sandi_view.dart';

class UbahKataSandiController extends State<UbahKataSandiView> {
  static late UbahKataSandiController instance;
  late UbahKataSandiView view;

  ApiServiceAuth api = ApiServiceAuth();

  GlobalKey<FormState> ubahSandiKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool obscurePassLama = true;
  bool obscurePassBaru = true;
  bool obscureKonfirmPassBaru = true;
  bool isLoading = false;

  final ScrollController scrollController = ScrollController();
  final FocusNode form1FocusNode = FocusNode();

  void _scrollToButton() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        300,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  updatePassword(context) async {
    showCircleDialogLoading();
    try {
      await api.updatePassword(
        oldPassword: StringUtils.trimString(oldPasswordController.text),
        newPassword: StringUtils.trimString(newPasswordController.text),
      );

      Get.back();

      showDialogBase(
        content: ContentDialogSelesai(
          illustration: isDarkMode(context)
              ? MediaRes.images.state.successDark
              : MediaRes.images.state.success,
          title: "Perubahan Kata Sandi Berhasil",
          description:
              "Perubahan kata sandi berhasil, silahkan masuk kembali menggunakan kata sandi baru Anda.",
        ),
      );

      Future.delayed(
        const Duration(seconds: 1),
        () async {
          Get.back();
          await doLogout();
        },
      );
    } catch (e) {
      Get.back();
      showInfoDialog(e.toString());
    }
  }

  ApiServiceCore apiCore = ApiServiceCore();
  doLogout() async {
    showCircleDialogLoading();
    try {
      await apiCore.logout();
      Get.back();

      Future.delayed(
        const Duration(milliseconds: 500),
        () async {
          await globalLogout();
        },
      );
    } catch (e) {
      Get.back();
      showInfoDialog(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    // Listener untuk mendeteksi kapan form 1 mendapatkan fokus
    form1FocusNode.addListener(() {
      if (form1FocusNode.hasFocus) {
        _scrollToButton();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    form1FocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
