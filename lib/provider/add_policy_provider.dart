import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insuram_pf/ocr_scanner_screen.dart';

class AddPolicyProvider with ChangeNotifier {
  String selectedImagePath = '';
  Map<String, String> policiesImages = {};

  String? otherPoliciesdropdownValue = 'Select Other Policy Type';
  bool otherisOpen = false;

  changeOtherIsOpen() {
    otherisOpen = !otherisOpen;
    notifyListeners();
  }

  String? dropdownValue = 'Select Policy Type';
  bool isOpen = false;
  changeIsOpen() {
    isOpen = !isOpen;
    notifyListeners();
  }

  Map<String, dynamic> existingPolicies = {
  'Health Insurance': [

    ],
    'Motor Insurance': [

    ],
    'Other Insurance': [
      {
        'Term Insurance': [

        ],
        'Life Insurance': [

        ]
      },
    ]
  };



  Future selectImage(
    BuildContext context,
    String docName,
  ) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: 180,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        dropdownValue == 'Health Insurance' ||
                                dropdownValue == 'Motor Insurance'
                            ? GestureDetector(
                                onTap: () async {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.white.withOpacity(0.9),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          topRight: Radius.circular(25),
                                        ),
                                      ),
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (ctx) {
                                        return Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(25),
                                                topRight: Radius.circular(25),
                                              ),
                                              gradient: LinearGradient(colors: [
                                                Colors.indigo.withOpacity(0.2),
                                                Colors.purple.withOpacity(0.2)
                                              ])),
                                          height:
                                              MediaQuery.of(ctx).size.height -
                                                  80,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(child: OcrPage()),
                                              //Expanded(child: ToggleEnterManuallyorUpload()),
                                              //################################## SUbmitt Button on showModalSheet

                                              // Padding(
                                              //   padding:
                                              //       const EdgeInsets.symmetric(
                                              //           vertical: 80,
                                              //           horizontal: 20),
                                              //   child: Align(
                                              //     alignment:
                                              //         Alignment.bottomRight,
                                              //     child: InkWell(
                                              //       onTap: () {
                                              //         Future.delayed(
                                              //             const Duration(
                                              //                 seconds: 2),
                                              //             () => Navigator
                                              //                 .pushNamed(
                                              //                     context,
                                              //                     HomePage
                                              //                         .routeName));
                                              //         showDialog(
                                              //             barrierDismissible:
                                              //                 true,
                                              //             context: context,
                                              //             builder: (context) {
                                              //               return StatefulBuilder(
                                              //                 builder: (context,
                                              //                     setState) {
                                              //                   return const AlertDialog(
                                              //                     title: Text(
                                              //                         'Data Submitted Succesfully'),
                                              //                   );
                                              //                 },
                                              //               );
                                              //             });
                                              //       },
                                              //       child: Container(
                                              //         color: Colors.green,
                                              //           child: Center(
                                              //               child: Text(
                                              //             'Submit',
                                              //             style: TextStyle(
                                              //                 fontSize: 16,
                                              //                 fontWeight:
                                              //                     FontWeight
                                              //                         .bold,
                                              //                 color: Colors
                                              //                     .indigo
                                              //                     .shade400),
                                              //           )),
                                              //           height: 45,
                                              //           width: 120),
                                              //     ),
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        );
                                      });
                                  // Navigator.pop(context);
                                },
                                child:Container(
                                  height: 100,
                                  width: 100,
                                  child:
                                  Card(
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          height: 60,
                                          width: 60,
                                          child: Column(
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Icon(
                                                  Icons.document_scanner_rounded,
                                                  color: Colors.greenAccent,
                                                  size: 50,
                                                ),
                                              ),
                                              Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.all(6.0),
                                                    child: Text(
                                                        'Scan PDF'),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )),
                                )

                              )
                            : SizedBox(),
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromGallery();
                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              policiesImages[docName] = selectedImagePath;
                              notifyListeners();
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                dismissDirection: DismissDirection.up,
                                backgroundColor: Colors.red,
                                content: Text("No Image Selected !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'images/gallery.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromCamera();
                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              policiesImages[docName] = selectedImagePath;
                              notifyListeners();
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                dismissDirection: DismissDirection.up,
                                backgroundColor: Colors.red,
                                content: Text("No Image Captured !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'images/camera.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  deleteImage(String docName) async {
    policiesImages[docName] = '';
    notifyListeners();
  }
}
