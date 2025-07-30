import 'dart:async';
import 'package:core/database/list_pejabat_pengawas_database.dart';
import 'package:core/models/list_pejabat_pengawas_model.dart';
import 'package:auth/service/api_service_auth.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  final Uri prod = Uri.parse('http://sakti.bapendajabar.intra:8004');

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ApiServiceAuth api = ApiServiceAuth();
  ApiServiceCore apiCore = ApiServiceCore();

  String username = '';
  String password = '';
  bool obscureText = true;
  bool isProdMode = true;
  bool isLoading = false;
  String? token;

  authPin() {
    IpDatabase.save(
      "http://172.27.77.155:8000",
    );

    isProdMode = IpDatabase.host == "https://apisakti.bapenda.jabarprov.go.id";
    api = ApiServiceAuth();
    apiCore = ApiServiceCore();

    update();
    Get.back();
  }

  doLogin() async {
    showCircleDialogLoading();
    try {
      Map result = await api.login(
        username: username,
        password: password,
      );
      SessionDatabase.save(result["token"]);

      // handle cancel login
      UserDataModel userDataResult = await api.getUserData();
      if (!References.check.isRoleActive(
        userDataResult.data?.roleMenuAbleLoginMobile,
      )) {
        SessionDatabase.save("");
        Get.back();
        showInfoDialog(
          'Maaf, akun Anda tidak diizinkan untuk login. Silakan hubungi tim PSIP untuk informasi lebih lanjut.',
        );
        return;
      }

      ReferenceModel referenceResult = await api.referenceData();
      ListPejabatPengawas listPejabatPengawas = await apiCore.getMyPejabatPengawas();

      await ReferenceDatabase.save(referenceResult);
      await UserDataDatabase.save(userDataResult);
      await ListPejabatPengawasDatabase.save(listPejabatPengawas);

      Get.back();
      if (mounted) newRouter.go(RouterUtils.beranda);
    } catch (e) {
      SessionDatabase.save("");

      Get.back();
      showInfoDialog(e.toString());
    }
  }

  OtaEvent? currentEvent;
  Stream<OtaEvent>? streamOtaEvent;

  String ipApk = "";
  String urlApk = "";
  String? ket;

  final int maxFailures = 3;
  int failureCount = 0;

  bool isChecking = false;
  bool isDownloadFailure = false;

  VersioningModel versioningModel = VersioningModel();

  Timer? _pingTimer;

  // checkVersion({bool isCheckVersion = false}) async {
  //   isCheckVersion ? showCircleDialogLoading() : null;
  //   try {
  //     versioningModel = await apiCore.checkVersion(
  //       type: "sakti_mobile",
  //     );

  //     urlApk =
  //         StringUtils.trimString(versioningModel.data?.versionLinkUrlVersion);

  //     String pattern = r"(?<=:\/\/)(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})";

  //     Match? matchLink = RegExp(pattern).firstMatch(urlApk);

  //     if (matchLink != null) {
  //       ipApk = matchLink.group(0)!;
  //     }

  //     String versionVer =
  //         StringUtils.trimString(versioningModel.data?.versionVerVersion);

  //     isCheckVersion ? Get.back() : null;

  //     FeatureDatabase.save(
  //       false,
  //       versioningModel,
  //     );
  //     if (versionVer != VersionDatabase.version) {
  //       showDialogBase(
  //         maxWidth: 450,
  //         content: DialogUpdate(
  //           updateType: EnumUpdate.tersedia,
  //           controller: instance,
  //         ),
  //       );
  //     } else {
  //       isCheckVersion
  //           ? showDialogBase(
  //               maxWidth: 450,
  //               content: DialogUpdate(
  //                 updateType: EnumUpdate.terbaru,
  //                 controller: instance,
  //               ),
  //             )
  //           : null;
  //     }
  //   } catch (e) {
  //     Get.back();
  //     showInfoDialog(e.toString());
  //   }
  // }

  Future<void> tryOtaUpdate() async {
    try {
      // print('ABI Platform: ${await OtaUpdate().getAbi()}');
      OtaUpdate().cancel();
      streamOtaEvent = OtaUpdate().execute(
        urlApk,
        destinationFilename: 'sakti_jawara_app.apk',
      );
      FeatureDatabase.save(
        true,
        versioningModel,
      );
    } catch (e) {
      showInfoDialog('Failed to make OTA update. Details: $e');
    }
  }

  void startPeriodicPing(setState) {
    _pingTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!isChecking) {
        checkConnectionApk(setState);
      }
    });
  }

  Future<void> checkConnectionApk(setState) async {
    isChecking = true;
    final ping = Ping(ipApk, count: 2).stream;

    await for (final PingData data in ping) {
      if (!data.response.toString().contains("ttl")) {
        if (data.error != null) {
          failureCount += 1;
          if (failureCount >= maxFailures) {
            if (mounted) {
              setState(() {
                isDownloadFailure = true;
                _pingTimer?.cancel();
              });
            }
          }
        }
      } else {
        failureCount = 0;
      }
    }

    isChecking = false;
  }

  Future<void> launchInBrowser() async {
    try {
      await launchUrl(
        prod,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      showInfoDialog(e.toString());
    }
  }

  @override
  void initState() {
    instance = this;
    // if (!kIsWeb) {
    //   checkVersion();
    //   FeatureDatabase.isFeatureNew
    //       ? WidgetsBinding.instance.addPostFrameCallback((_) {
    //           showDialogBase(
    //             barrierDismissible: false,
    //             content: const DialogWhatsNew(),
    //           );
    //         })
    //       : null;
    // }
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
