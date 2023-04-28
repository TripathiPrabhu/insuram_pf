// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'provider/doc_image_name_provider.dart';
//
// class AddUploadDocumentPage extends StatelessWidget {
//   static const routeName = '/AddUploadDocumentPage';
//   const AddUploadDocumentPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<MyDocsProvider>(context,listen: false);
//
//     return Scaffold(
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//           child: GridView.builder(
//             shrinkWrap: true,
//             itemCount: provider.myDocNames().length,
//             gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
//             itemBuilder: (BuildContext context, int index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16),
//                     color: Colors.indigo.withOpacity(0.1),
//                   ),
//                   child: Consumer<MyDocsProvider>(
//                         builder: (context, pprovider, child) {
//                            return GridTile(
//                               footer: ClipRRect(
//                                 borderRadius: const BorderRadius.only(
//                                   bottomLeft: Radius.circular(16),
//                                   bottomRight: Radius.circular(16),
//                                 ),
//                                 child: GridTileBar(
//                                   backgroundColor: Colors.indigo.withOpacity(0.3),
//                                     leading: Text('${provider.myDocNames()[index]}'),
//                                       subtitle: provider.myDocImages()[index] == ''
//                             ? InkWell(
//                                   onTap: () {
//                                     provider.selectImage(context, provider.myDocNames()[index]);
//                                     // provider.setValue(
//                                     //     '${provider.myDocNames()[index]}');
//                                   },
//                                   child: const Text('Upload Docs'))
//                             : IconButton(
//                                   onPressed: () {
//                                     pprovider.selectImage(context, provider.myDocNames()[index]);
//                                     // pprovider.setValue(
//                                     //     '${provider.myDocNames()[index]}'
//                                     // );
//                                   },
//                                   icon: const Icon(Icons.edit),
//                                   color: Colors.indigo,
//                                 ),
//                         trailing: IconButton(
//                           onPressed: () {
//                             pprovider.deleteImage('${provider.myDocNames()[index]}');
//                           },
//                           icon: provider.myDocImages()[index] == ''
//                                 ? const SizedBox()
//                                 : Icon(
//                                     Icons.delete,
//                                     color: Colors.red.shade400,
//                                   ),
//                         ),
//                       ),
//                               ),
//                       child: provider.myDocImages()[index] == ''
//                           ? TextButton.icon(
//                               onPressed: () {
//                                 // pprovider
//                                 //     .setValue('${provider.myDocNames()[index]}');
//                               },
//                               icon: const Icon(Icons.upload_file_rounded),
//                               label: const Text(
//                                 'Image Not Selected \n Click To Upload One ',
//                                 style: TextStyle(
//                                   color: Colors.indigo,
//                                   fontSize: 10,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ))
//                           : Padding(
//                         padding: const EdgeInsets.only(bottom: 40),
//                             child: Image.file(
//
//                                 File(pprovider.myDocImages()[index].toString(), ),
//                               fit: BoxFit.fitWidth,
//                               filterQuality: FilterQuality.low,
//                               ),
//                           ));
//   },
// ),
//                 ),
//               );
//             },
//           ),
//         ),
//       )),
//     );
//   }
// }
