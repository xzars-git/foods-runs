// import 'package:core/core.dart';
// import 'package:flutter/material.dart';

// class DialogWhatsNew extends StatelessWidget {
//   const DialogWhatsNew({super.key});

//   @override
//   Widget build(BuildContext context) {
//     DataVersioning? versioning = FeatureDatabase.versioningModel.data;
//     return Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.surface,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           constraints: BoxConstraints(
//             maxHeight: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 180,
//           ),
//           padding: const EdgeInsets.all(24),
//           child: SingleChildScrollView(
//             controller: ScrollController(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Sakti Mobile",
//                   style: Get.theme.textTheme.titleLarge?.copyWith(
//                     color: blue700,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16.0,
//                 ),
//                 Text(
//                   "Apa yang baru?",
//                   style: Get.theme.textTheme.titleMedium,
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
//               ],
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(
//             bottom: 16.0,
//             left: 16,
//             right: 16,
//           ),
//           child: BaseSecondaryButton(
//             text: "Tutup",
//             onPressed: () {
//               FeatureDatabase.save(false, VersioningModel());
//               Get.back();
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
