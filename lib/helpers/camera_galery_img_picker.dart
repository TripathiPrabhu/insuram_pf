//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:insuram_a/helpers/toggle_upload_policy.dart';
// import '../home_page.dart';
// import '../provider/doc_image_provider.dart';
//
// class CameraGalleryOcr{
//
//   String? defaultTextsfield = 'Select Documents';
//   String selectedImagePath = '';
//
//   String? documents;
//
//  //List document = provider.documentsnDetails[0].keys.map((e) => e).toList();
//
//   String? pickedValue ;
//
//
//   Future selectImage(BuildContext context, VoidCallback callback) {
//
//
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20.0)), //this right here
//             child: SizedBox(
//               height: 150,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   children: [
//                     const Text(
//                       'Select Image From !',
//                       style: TextStyle(
//                           fontSize: 18.0, fontWeight: FontWeight.bold),
//                     ),
//                     /////####################Select image from Gallery and camera
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         GestureDetector(
//                           onTap: () async {
//                             selectedImagePath = await selectImageFromGallery();
//                             if (selectedImagePath != '') {
//                               Navigator.pop(context);
//                               documents = selectedImagePath;
//                               callback();
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                                 content: Text("No Image Selected !"),
//                               ));
//                             }
//                           },
//                           child: Card(
//                               elevation: 5,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Image.asset(
//                                       'images/gallery.png',
//                                       height: 60,
//                                       width: 60,
//                                     ),
//                                     const Text('Gallery'),
//                                   ],
//                                 ),
//                               )),
//                         ),
//                         GestureDetector(
//                           onTap: () async {
//                             selectedImagePath = await selectImageFromCamera();
//
//
//                             if (selectedImagePath != '') {
//                               Navigator.pop(context);
//                               callback();
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                                 content: Text("No Image Captured !"),
//                               ));
//                             }
//                           },
//                           child: Card(
//                               elevation: 5,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   children: [
//                                     Image.asset(
//                                       'images/camera.png',
//                                       height: 60,
//                                       width: 60,
//                                     ),
//                                     const Text('Camera'),
//                                   ],
//                                 ),
//                               )),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
//
//   selectImageFromGallery() async {
//     XFile? file = await ImagePicker()
//         .pickImage(source: ImageSource.gallery, imageQuality: 10);
//     if (file != null) {
//       return  file.path;
//     } else {
//       return '';
//     }
//   }
//
//
//   selectImageFromCamera() async {
//     XFile? file = await ImagePicker()
//         .pickImage(source: ImageSource.camera, imageQuality: 10);
//     if (file != null) {
//       return file.path;
//     } else {
//       return '';
//     }
//   }
//
//
//   Future vehicleHealthInsuranceSelection(BuildContext ctx,VoidCallback callback) {
//     return showDialog(
//         context: ctx,
//         builder: (BuildContext context) {
//           return Dialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0)), //this right here
//             child: SizedBox(
//               height: 150,
//               //    width: double.maxFinite,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     const Text(
//                       'Select Your Way !',
//                       style: TextStyle(
//                           fontSize: 18.0, fontWeight: FontWeight.bold),
//                     ),
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           GestureDetector(
//                             onTap: () async {
//
//                               showModalBottomSheet(
//                                   backgroundColor: Colors.white.withOpacity(0.9),
//                                   shape: const RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25),),),
//                                   isScrollControlled: true,
//                                   context: context,
//                                   builder:(ctx){
//                                     return Container(
//                                       decoration: BoxDecoration(
//                                           borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25),),
//                                           gradient: LinearGradient(
//                                               colors: [
//                                                 Colors.indigo.withOpacity(0.2),
//                                                 Colors.purple.withOpacity(0.2)
//
//                                               ])
//                                       ),
//                                       height: MediaQuery.of(ctx).size.height-80,
//
//
//
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           ToggleEnterManuallyorUpload(),
//                                           //################################## SUbmitt Button on showModalSheet
//
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(vertical: 80,horizontal: 20),
//                                             child: Align(
//                                               alignment: Alignment.bottomRight,
//                                               child: InkWell(
//                                                 onTap: (){
//
//                                                   Future.delayed(const Duration(seconds: 2),()=>
//                                                       Navigator.pushNamed(context, HomePage.routeName)
//                                                   );
//                                                   showDialog(
//                                                       barrierDismissible: true,
//                                                       context: context,
//                                                       builder: (context) {
//                                                         return StatefulBuilder(builder: (context, setState) {
//                                                           return const AlertDialog(
//                                                             title: Text('Data Submitted Succesfully'),
//                                                           );},);});
//
//
//                                                 },
//                                                 child: Container(
//                                                     child: Center(child: Text('Submit',style: TextStyle(
//                                                         fontSize: 16,
//                                                         fontWeight: FontWeight.bold,
//                                                         color: Colors.indigo.shade400
//                                                     ),)),
//                                                     height: 45,
//                                                     width: 120),
//                                               ),
//                                             ),
//                                           )
//
//                                         ],
//                                       ),
//                                     );
//                                   }
//                               );
//                               // Navigator.pop(context);
//                             },
//                             child: Card(
//                                 elevation: 5,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(4.0),
//                                   child: Column(
//                                     children: const [
//                                       Icon(Icons.edit_note,size: 50,),
//                                       Expanded(child: Text('Enter Data \nManually')),
//                                     ],
//                                   ),
//                                 )),
//                           ),
//                           Expanded(
//                             child: GestureDetector(
//                               onTap: () async {
//                                 selectedImagePath = await selectImageFromGallery();
//                                 if (selectedImagePath != '') {
//                                   Navigator.pop(context);
//                                   documents =selectedImagePath as String?;
//                                   callback();
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                                     content: Text("No Image Selected !"),
//                                   ));
//                                 }
//                               },
//                               child: Card(
//                                   elevation: 5,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Column(
//                                       children: [
//                                         Image.asset(
//                                           'images/gallery.png',
//                                           height: 50,
//                                           width: 50,
//                                         ),
//                                         const Text('Gallery'),
//                                       ],
//                                     ),
//                                   )),
//                             ),
//                           ),
//                           Expanded(
//                             child: GestureDetector(
//                               onTap: () async {
//
//                                 selectedImagePath = await selectImageFromCamera();
//
//                                 documents =selectedImagePath;
//                                 if (selectedImagePath != '') {
//                                   Navigator.pop(context);
//                                   callback();
//                                 } else {
//                                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                                     content: Text("No Image Captured !"),
//                                   ));
//                                 }
//                               },
//                               child: Card(
//                                   elevation: 5,
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Column(
//                                       children: [
//                                         Image.asset(
//                                           'images/camera.png',
//                                           height: 50,
//                                           width: 50,
//                                         ),
//                                         const Text('Camera'),
//                                       ],
//                                     ),
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
//
//
//
//
// }