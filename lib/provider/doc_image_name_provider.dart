import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MyDocsProvider with ChangeNotifier {

  String? dropdownValue = 'Select Document';
  List selectedDocToUploadImage = [];

  // void addToList(String value) {
  //   if (!selectedDocToUploadImage.contains(value)) {
  //     selectedDocToUploadImage.add(value);
  //   }
  // }


  myDocNames() {
    return myDocu[0].keys.map((e) => e).toList();
  }

  myDocImages() {
    return myDocu[0].values.map((e) => e).toList();
  }

  bool isOpen = false;
  changeIsOpen(){
    isOpen = !isOpen;
    notifyListeners();
  }
  final List<Map<String, dynamic>> _myDocu = [
    {
      'Aadhar': '',
      'PAN': '',
      'RC': '',
      'DL': '',
      'prabhu': '',
    }
  ];

  List<Map<String, dynamic>> get myDocu => _myDocu;

  List selectedImagefromGallery1 = [];

 // List selectedImagefromGallery1 = [];

  Future selectImage(BuildContext context, String docName) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: 150,
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
                        GestureDetector(
                          onTap: () async {

                           // selectImageFromGallery();
                           // selectedImagefromGallery1 = await selectImageFromGallery();
                            selectedImagefromGallery1 = await ImagePicker().pickMultiImage(imageQuality: 50);
                           print(selectedImagefromGallery1);
                            if (selectedImagefromGallery1.isNotEmpty ) {
                              Navigator.pop(context);
                              myDocu[0][docName]= selectedImagefromGallery1;
                              notifyListeners();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
                                  children: const [
                                    Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            selectedImagefromGallery1 = await selectImageFromCamera();


                            if (selectedImagefromGallery1 != '') {
                              Navigator.pop(context);
                              myDocu[0][docName]= selectedImagefromGallery1;
                              notifyListeners();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
                                  children: const [
                                    // Image.asset(
                                    //   'images/camera.png',
                                    //   height: 60,
                                    //   width: 60,
                                    // ),
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
    selectedImagefromGallery1 = await ImagePicker().pickMultiImage(imageQuality: 50);

    if (selectedImagefromGallery1.isNotEmpty) {

      myDocu[0].values.map((e) => selectedImagefromGallery1.map((e) => File(e as String)).toList());
     // selectedImagefromGallery = images.map((XFile image) => File(image.path as String)).toList();
    }else{
      return '';
    }

  }
  //   XFile? file = await ImagePicker()
  //       .pickImage(source: ImageSource.gallery, imageQuality: 10);
  //   if (file != null) {
  //     return file.path;
  //   } else {
  //     return '';
  //   }
  // }

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
    myDocu[0][docName] = '';
    notifyListeners();
  }

}
