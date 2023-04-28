// import 'package:flutter/material.dart';
//
// import '../ocr_scanner_screen.dart';
// import '../screens/add_policy_screen.dart';
//
// enum Choose { fillField, scanUploadDocs }
//
// class ToggleEnterManuallyorUpload extends StatefulWidget {
//   const ToggleEnterManuallyorUpload({super.key});
//
//   @override
//   State<ToggleEnterManuallyorUpload> createState() =>
//       _ToggleEnterManuallyorUploadState();
// }
//
// class _ToggleEnterManuallyorUploadState
//     extends State<ToggleEnterManuallyorUpload> {
//   Choose choosen = Choose.fillField;
//   bool choosefirst = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       width: 300,
//       child: Column(children: [
//         const SizedBox(
//           height: 25,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: ListTile(
//                 dense: true,
//                 selectedTileColor: Colors.indigo,
//                 title: const Text('Fill Following Fields'),
//                 leading: Radio<Choose>(
//                   value: Choose.fillField,
//                   groupValue: choosen,
//                   onChanged: (value) {
//                     setState(() {
//                       choosen = value!;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(0),
//                 child: ListTile(
//                   dense: true,
//                   title: const Text('Scan A PDF/Image'),
//                   leading: Radio<Choose>(
//                     value: Choose.scanUploadDocs,
//                     groupValue: choosen,
//                     onChanged: (value) {
//                       setState(() {
//                         choosen = value!;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         choosen == Choose.fillField ? const SizedBox() : SizedBox()
//         //const OcrPage(),
//       ]),
//     );
//   }
// }
