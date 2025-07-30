// import 'package:auth/login/controller/login_controller.dart';
// import 'package:core/core.dart';
// import 'package:flutter/material.dart';

// class DialogUpdate extends StatefulWidget {
//   final EnumUpdate updateType;
//   final LoginController controller;

//   const DialogUpdate({
//     super.key,
//     required this.updateType,
//     required this.controller,
//   });

//   @override
//   State<DialogUpdate> createState() => _DialogUpdateState();
// }

// class _DialogUpdateState extends State<DialogUpdate> {
//   EnumUpdate updateType = EnumUpdate.terbaru;

//   @override
//   void initState() {
//     updateType = widget.updateType;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget content = Container();

//     switch (updateType) {
//       case EnumUpdate.terbaru:
//         content = _contentTerbaruUpdate();
//         break;
//       case EnumUpdate.tersedia:
//         content = _contentTersediaUpdate();
//         break;
//       case EnumUpdate.gagal:
//         content = _contentGagalUpdate();
//         break;
//       case EnumUpdate.loading:
//         content = _contentLoadingUpdate();
//         break;
//       default:
//     }

//     return Container(
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.surface,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       padding: const EdgeInsets.all(16),
//       child: content,
//     );
//   }

//   Widget _contentTerbaruUpdate() {
//     return Column(
//       children: [
//         SvgPicture.asset(
//           isDarkMode(context) ? MediaRes.images.state.successDark : MediaRes.images.state.success,
//         ),
//         const SizedBox(
//           height: 16.0,
//         ),
//         Text(
//           "Aplikasi Anda Sudah Versi Terbaru!",
//           style: Get.theme.textTheme.displaySmall,
//         ),
//         const SizedBox(
//           height: 8.0,
//         ),
//         Text(
//           "Selamat! Aplikasi Anda sudah diperbarui ke versi terbaru. Nikmati fitur-fitur terbaru dan pengalaman yang lebih baik.",
//           style: Get.theme.textTheme.bodyLarge,
//         ),
//         const SizedBox(
//           height: 24.0,
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: BaseSecondaryButton(
//                 text: "Apa yang baru?",
//                 onPressed: () {
//                   Get.back();
//                   showDialogBase(
//                     content: const DialogWhatsNew(),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(
//               width: 16.0,
//             ),
//             Expanded(
//               child: BasePrimaryButton(
//                 text: "Ya, saya mengerti",
//                 onPressed: () {
//                   Get.back();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _contentTersediaUpdate() {
//     DataVersioning? versioning = FeatureDatabase.versioningModel.data;

//     return Column(
//       children: [
//         Container(
//           constraints: BoxConstraints(
//             maxHeight: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 200,
//           ),
//           child: SingleChildScrollView(
//             controller: ScrollController(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Konfirmasi Update Aplikasi",
//                   style: Get.theme.textTheme.displaySmall,
//                 ),
//                 const SizedBox(
//                   height: 24.0,
//                 ),
//                 Row(
//                   children: [
//                     SvgPicture.asset(
//                         isDarkMode(context)
//                             ? MediaRes.images.logo.saktiCircleDark
//                             : MediaRes.images.logo.saktiCircle,
//                         width: 50,
//                         height: 50),
//                     const SizedBox(
//                       width: 8.0,
//                     ),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Sakti Mobile",
//                             style: Get.theme.textTheme.headlineLarge,
//                           ),
//                           Text(
//                             "versi ${VersionDatabase.version}",
//                             style: Get.theme.textTheme.bodyMedium,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 16.0,
//                 ),
//                 Text(
//                   "Tersedia versi aplikasi terbaru. Segera perbarui untuk merasakan fitur baru dan kenyamanan yang lebih baik!",
//                   style: Get.theme.textTheme.bodyLarge,
//                 ),
//                 const SizedBox(
//                   height: 16.0,
//                 ),
//                 Text(
//                   "Apa yang baru?",
//                   style: Get.theme.textTheme.titleMedium,
//                 ),
//                 const SizedBox(
//                   height: 8.0,
//                 ),
//                 Builder(
//                   builder: (context) {
//                     if (versioning?.versionKet1Version?.isEmpty ?? true) {
//                       return const SizedBox.shrink();
//                     }

//                     return FleatherEditor(
//                       readOnly: true,
//                       controller: FleatherController(
//                           document: ParchmentDocument.fromJson(JsonUtils.handleDecode(
//                               value: versioning?.versionKet1Version,
//                               defaultValue: [
//                             {"insert": "\n"},
//                           ]))),
//                     );
//                   },
//                 ),
//                 const SizedBox(
//                   height: 24.0,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: BaseSecondaryButton(
//                 text: "Perbarui Nanti",
//                 onPressed: () {
//                   Get.back();
//                 },
//               ),
//             ),
//             const SizedBox(
//               width: 16.0,
//             ),
//             Expanded(
//               child: BasePrimaryButton(
//                 text: "Perbarui Sekarang",
//                 onPressed: () {
//                   widget.controller.tryOtaUpdate();
//                   updateType = EnumUpdate.loading;
//                   update();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _contentGagalUpdate() {
//     return Column(
//       children: [
//         SvgPicture.asset(
//           isDarkMode(context) ? MediaRes.images.state.failedDark : MediaRes.images.state.failed,
//         ),
//         const SizedBox(
//           height: 16.0,
//         ),
//         Text(
//           "Gagal Melakukan Pembaruan Aplikasi",
//           style: Get.theme.textTheme.displaySmall,
//         ),
//         const SizedBox(
//           height: 8.0,
//         ),
//         Text(
//           "Terjadi kesalahan dalam proses unduh aplikasi.",
//           textAlign: TextAlign.center,
//           style: Get.theme.textTheme.bodyLarge,
//         ),
//         const SizedBox(
//           height: 24.0,
//         ),
//         BasePrimaryButton(
//           text: "Coba Lagi",
//           onPressed: () {
//             Get.back();
//           },
//         ),
//       ],
//     );
//   }

//   Widget _contentLoadingUpdate() {
//     return Column(
//       children: [
//         SvgPicture.asset(
//           isDarkMode(context) ? MediaRes.images.state.downloadDark : MediaRes.images.state.download,
//         ),
//         const SizedBox(
//           height: 16.0,
//         ),
//         StreamBuilder<OtaEvent>(
//           stream: widget.controller.streamOtaEvent,
//           builder: (context, snapshot) {
//             OtaStatus? status = snapshot.data?.status;
//             OtaEvent? event = snapshot.data;
//             double value = double.tryParse(event?.value ?? "0") ?? 0;

//             if (status == OtaStatus.DOWNLOADING) {
//               return Column(
//                 children: [
//                   Text(
//                     "Mengunduh...",
//                     style: Get.theme.textTheme.displaySmall,
//                   ),
//                   const SizedBox(
//                     height: 8.0,
//                   ),
//                   Text(
//                     "$value%",
//                     style: Get.theme.textTheme.titleMedium,
//                   ),
//                   const SizedBox(
//                     height: 24.0,
//                   ),
//                   LinearProgressIndicator(
//                     color: blue700,
//                     backgroundColor: green100,
//                     value: value / 100,
//                   ),
//                   widget.controller.isDownloadFailure
//                       ? Column(
//                           children: [
//                             const SizedBox(
//                               height: 24.0,
//                             ),
//                             BasePrimaryButton(
//                               text: "Coba lagi",
//                               onPressed: () {
//                                 WidgetsBinding.instance.addPostFrameCallback((_) {
//                                   if (mounted) {
//                                     setState(() {
//                                       widget.controller.isDownloadFailure = false;

//                                       widget.controller.tryOtaUpdate();
//                                     });
//                                   }
//                                 });
//                               },
//                             ),
//                             const SizedBox(
//                               height: 24.0,
//                             ),
//                             BaseSecondaryButton(
//                               onPressed: () {
//                                 widget.controller.launchInBrowser();
//                               },
//                               text: "Masuk ke Website",
//                             ),
//                           ],
//                         )
//                       : Container(),
//                 ],
//               );
//             } else if (status == OtaStatus.INSTALLING) {
//               return Column(
//                 children: [
//                   Text(
//                     "Memasang...",
//                     style: Get.theme.textTheme.displaySmall,
//                   ),
//                   const SizedBox(
//                     height: 24.0,
//                   ),
//                   BasePrimaryButton(
//                     text: "Coba lagi",
//                     onPressed: () {
//                       WidgetsBinding.instance.addPostFrameCallback((_) {
//                         if (mounted) {
//                           setState(() {
//                             widget.controller.isDownloadFailure = false;

//                             widget.controller.tryOtaUpdate();
//                           });
//                         }
//                       });
//                     },
//                   ),
//                 ],
//               );
//             } else {
//               return BasePrimaryButton(
//                 text: "Kembali",
//                 onPressed: () {
//                   WidgetsBinding.instance.addPostFrameCallback((_) {
//                     if (mounted) {
//                       setState(() {
//                         widget.controller.isDownloadFailure = false;
//                       });
//                     }
//                   });

//                   Get.back();
//                 },
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
