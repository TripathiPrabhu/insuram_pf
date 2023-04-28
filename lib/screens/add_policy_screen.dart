import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/add_policy_screen_helpers/add_policy_helper/add_health_insurance.dart';
import '../helpers/add_policy_screen_helpers/add_policy_helper/add_motor_insurance.dart';
import '../helpers/add_policy_screen_helpers/add_policy_helper/add_other_insurance.dart';
import '../helpers/add_policy_screen_helpers/select_policy_from_dropdown.dart';
import '../models/app_bar.dart';
import '../provider/add_policy_provider.dart';

class EnterPolicyData extends StatefulWidget {
  static const routeName = '/EnterPolicyData';

  const EnterPolicyData({Key? key}) : super(key: key);

  @override
  State<EnterPolicyData> createState() => _EnterPolicyDataState();
}

class _EnterPolicyDataState extends State<EnterPolicyData> {

  //
  // TextEditingController vehicleNumberController = TextEditingController();
  //
  // TextEditingController policyNumbercontroller = TextEditingController();
  //
  // TextEditingController expiryDateController = TextEditingController();
  //
  //
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //
  //
  // String? vehicleNumber;
  // String? policyNumber;
  // String? expiryDate;
  // String? docIMG;
  //
  //
  //
  //
  //
  // @override
  // void dispose() {
  //   vehicleNumberController.dispose();
  //   policyNumbercontroller.dispose();
  //   expiryDateController.dispose();
  //   super.dispose();
  // }


  //
  // /// [_validatepolicyNumber] validates the value of [_policyNumber]
  // String? _validatepolicyNumber(String policyNumber) {
  //   // Regular Expression for fullname (a space between first name and second name)
  //   String nameRegExp = r"^[a-zA-Z0-9]+$";
  //
  //   if (policyNumber.isEmpty) {
  //     // Name field should not be empty
  //     return 'Enter Policy Number';
  //   }
  //   if (!RegExp(nameRegExp).hasMatch(policyNumber)) {
  //     // If the value in name field doesn't match with the regular expression
  //     // then it throws an error message.
  //     return 'Enter Policy Number';
  //   }
  //   return null;
  //
  // }
  //
  // /// [_validatevehicleNumber] validates the value of [vehicleNumber]
  // String? _validatevehicleNumber(String vehicleNumber) {
  //   // Regular Expression for mpbile
  //   String mobileRegExp = r"^[a-zA-Z0-9]+$";
  //   if (vehicleNumber.isEmpty) {
  //     // Name field should not be empty
  //     return 'Enter your vehicle number';
  //   }
  //   if (!RegExp(mobileRegExp).hasMatch(vehicleNumber)) {
  //     // If the value in email field doesn't match with the regular expression
  //     // then it throws an error message.
  //     return 'Enter correctly';
  //   }
  //   return null;
  //
  // }
  //
  // /// [_validateexpiryDate] validates the value of [_expiryDate]
  // String? _validateexpiryDate(String expiryDate) {
  //   // Regular Expression for email
  //   String expiryDateRegExp =
  //       r"^[a-zA-Z0-9]+$";
  //   if (expiryDate.isEmpty) {
  //     // Name field should not be empty
  //     return 'Enter your email';
  //   }
  //   if (!RegExp(expiryDateRegExp).hasMatch(expiryDate)) {
  //     // If the value in email field doesn't match with the regular expression
  //     // then it throws an error message.
  //     return 'Enter correctly';
  //   }
  //   return null;
  // }



  // /// [_validatePassword] validates the value of [_password]
  // String? _validatePassword(String password) {
  //   String passRegExp = r'^(?=.*?[!@#\$&*~]).{8,}$';
  //   if (password.isEmpty) {
  //     // Message field should not be empty
  //     return 'Password is empty. Please fill it.';
  //   }
  //   if (!RegExp(passRegExp).hasMatch(password)) {
  //     // If the value in email field doesn't match with the regular expression
  //     // then it throws an error message.
  //     return 'Enter correctly.\nexample: Abcd@12345';
  //   }
  //   return null;
  //
  // }
  //
  // /// [_validatePassword] validates the value of [_confirmPassword]
  // String? _validateConfirmPassword(String confirmPassword) {
  //   if (confirmPassword.isEmpty) {
  //     // Message field should not be empty
  //     return 'Confirm Password is empty. Please fill it.';
  //   }
  //   if (passwordController.text == confirmPasswordController.text) {
  //     // If the value in email field doesn't match with the regular expression
  //     // then it throws an error message.
  //     return  null;
  //   }else{
  //     return 'Password mismatched';
  //   }
  //
  // }






  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: _selectedDate ?? DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       _selectedDate = picked;
  //       PolicyExpirydateController.text =
  //           "${_selectedDate.toLocal()}".split(' ')[0];
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    final policyProvider =
    Provider.of<AddPolicyProvider>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(
        elvtn: 0,
        automaticallyImplyLeading: false,
        bakgrndclr: Colors.transparent,
        preferredSize: const Size.fromHeight(60.0),
        tlbarht: 0,
        flxblSpx: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
          child: Column(
            children: [
              const SelectPolicyDropDown(),


              Consumer<AddPolicyProvider>(
                builder: (context, addPolicyProvider, child) {

                  if(policyProvider.dropdownValue == 'Motor Insurance' ) {
                    return MotorInsurance();
                  }
                  else if(policyProvider.dropdownValue == 'Health Insurance'){
                    return HealthInsurance();
                  }else if(policyProvider.dropdownValue == 'Other Insurance'){
                    return OtherInsurance();
                  }else return SizedBox();

                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //     vertical: 20,
                    //     horizontal: 8,
                    //   ),
                    //   child: Card(
                    //     child: Column(
                    //       children: [
                    //
                    //         //// Upload Insurance Copy ###################
                    //         Padding(
                    //             padding: const EdgeInsets.only(
                    //                 top: 16,
                    //                 bottom: 8,
                    //                 left: 8,
                    //                 right: 8),
                    //             child: Column(
                    //               crossAxisAlignment:
                    //               CrossAxisAlignment.start,
                    //               children: [
                    //                 Text(
                    //                   'Upload Insurance Copy',
                    //                   style: TextStyle(
                    //                       fontWeight: FontWeight.w800,
                    //                       fontSize: 16,
                    //                       color: Colors.indigo
                    //                           .withOpacity(0.5)),
                    //                 ),
                    //                 Padding(
                    //                   padding:
                    //                   const EdgeInsets.only(top: 20),
                    //                   child: Row(
                    //                     children: [
                    //                       Consumer<AddPolicyProvider>(
                    //                         builder: (context, addPolicyProvider,
                    //                             child) {
                    //                           return Column(
                    //                             children: [
                    //                               addPolicyProvider.dropdownValue != ''?
                    //                               SizedBox(
                    //                                 height: 100,
                    //                                 width: 100,
                    //                                 child:addPolicyProvider.selectedImagePath ==''?
                    //                                 const Icon(Icons.image,color: Colors.indigo,size: 60,): Image.file(
                    //                                   File(
                    //                                     addPolicyProvider.selectedImagePath.toString(),
                    //                                   ),
                    //                                   fit: BoxFit.fitWidth,
                    //                                   filterQuality: FilterQuality.low,
                    //                                 ),
                    //                               ):const SizedBox(),
                    //
                    //                               Container(
                    //                                 decoration: BoxDecoration(
                    //                                     color: Colors.indigo
                    //                                         .withOpacity(0.2),
                    //                                     borderRadius:
                    //                                     BorderRadius.circular(
                    //                                         12)),
                    //                                 child: TextButton.icon(
                    //                                     onPressed: () {
                    //                                       addPolicyProvider.selectImage(context, addPolicyProvider.dropdownValue.toString());
                    //
                    //                                     },
                    //                                     icon: const Icon(Icons
                    //                                         .upload_file_rounded),
                    //                                     label: addPolicyProvider.dropdownValue == ''?
                    //                                     const Text('No file Choosen'):Text(addPolicyProvider.dropdownValue.toString())),
                    //                               ),
                    //                             ],
                    //                           );
                    //                         },
                    //                       )
                    //                     ],
                    //                   ),
                    //                 )
                    //               ],
                    //             )),
                    //
                    //
                    //         //// 'Enter your Vehicle Number', ############
                    //         Padding(
                    //           padding: const EdgeInsets.only(
                    //               top: 16, bottom: 8, left: 8, right: 8),
                    //           child: MyTextField(
                    //             hintText: 'Enter your Vehicle Number',
                    //             myController: vehicleNumberController,
                    //             lblText: 'Vehicle Number',
                    //             inputData: vehicleNumberController.text,
                    //             formFieldValidator: (String? value){
                    //               return _validatevehicleNumber(vehicleNumberController.text);
                    //             },
                    //             kebrdTyp: TextInputType.text,
                    //           ),
                    //         ),
                    //
                    //
                    //         //// Enter your Policy Number, ###############
                    //         Padding(
                    //           padding: const EdgeInsets.only(
                    //               top: 16, bottom: 8, left: 8, right: 8),
                    //           child: MyTextField(
                    //             myController: policyNumbercontroller,
                    //             hintText: 'Enter your Policy Number',
                    //             lblText: 'Policy Number',
                    //             inputData: vehicleNumberController.text,
                    //             formFieldValidator: (String? value){
                    //               return _validatevehicleNumber(policyNumbercontroller.text);
                    //             },
                    //             kebrdTyp: TextInputType.text,
                    //           ),
                    //         ),
                    //
                    //
                    //         ///############Enter Expiry Date #############
                    //         Padding(
                    //           padding: const EdgeInsets.only(
                    //               top: 16, bottom: 8, left: 8, right: 8),
                    //           child: MyTextField(
                    //             kebrdTyp: TextInputType.datetime,
                    //             myController: expiryDateController,
                    //             hintText: 'Enter Expiry Date',
                    //             lblText: 'Expiry Date',
                    //             inputData: expiryDateController.text,
                    //             formFieldValidator: (String? value){
                    //               return _validatevehicleNumber(expiryDateController.text);
                    //             },
                    //
                    //           ),
                    //         ),
                    //
                    //         //////##############   ADD BUTTON ############
                    //         Padding(
                    //           padding: const EdgeInsets.only(
                    //               top: 80, right: 20),
                    //           child: Align(
                    //             alignment: Alignment.bottomRight,
                    //             child: MaterialButton(
                    //               onPressed: () {
                    //                 policyProvider.addMotorPolicyData(
                    //                     vehicleNumberController.text,
                    //                     policyNumbercontroller.text,
                    //                     expiryDateController.text,
                    //                     policyProvider.selectedImagePath,
                    //                   1
                    //                     );
                    //                 Navigator.pushNamed(context, HomePage.routeName);
                    //                  print(addPolicyProvider.existingPolicies['Motor Insurance']![1]['Vehicle Number'] );
                    //                 // print(addPolicyProvider.existingPolicies['Motor Insurance']![1]['Policy Number'] );
                    //                 // print(addPolicyProvider.existingPolicies['Motor Insurance']![1]['Expiry Date'] );
                    //                 // print(addPolicyProvider.existingPolicies['Motor Insurance']![1]['Policy Doc'] );
                    //
                    //               },
                    //               color: Colors.indigo,
                    //               splashColor: Colors.teal,
                    //               hoverColor: Colors.purple,
                    //               shape: RoundedRectangleBorder(
                    //                 borderRadius:
                    //                 BorderRadius.circular(8),
                    //               ),
                    //               child: const Text(
                    //                 'ADD',
                    //                 style: TextStyle(
                    //                   fontSize: 16,
                    //                   color: Colors.white,
                    //                   fontWeight: FontWeight.w600,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //         const SizedBox(
                    //           height: 40,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ) :
                },
              )


              // Container(color: Colors.green,height: 100)

              //  const SizedBox(height: 100,),
              //   const Padding(
              //     padding: EdgeInsets.only(top: 20,bottom: 15),
              //     child: Padding(
              //       padding: EdgeInsets.all(8.0),
              //       child: Text('ADD A POLICY',
              //         style: TextStyle(fontSize: 16,color: Colors.indigo,
              //             fontWeight: FontWeight.w600,
              //         ),),
              //     ),
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Container(
              //       height: 50,
              //       decoration: const ShapeDecoration(
              //         gradient: LinearGradient(
              //           colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomCenter,
              //           stops: [0.0, 0.4],
              //           tileMode: TileMode.clamp,
              //         ),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(16.0)),
              //         ),
              //       ),
              //       child: TextFormField(
              //         // onTap: (){},
              //         controller: policyNameController,
              //         decoration: InputDecoration(
              //           prefixIcon: const Icon(
              //             Icons.policy,
              //             size: 26,
              //             color: Colors.purple,
              //           ),
              //           hintText: 'Enter Policy Name',
              //           helperStyle: const TextStyle(
              //             color: Colors.blueGrey,
              //           ),
              //           labelText: 'Policy Name',
              //           labelStyle: const TextStyle(
              //               fontSize: 18,
              //               color: Colors.indigo,
              //               fontWeight: FontWeight.bold),
              //           contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              //           border: OutlineInputBorder(
              //             gapPadding: 10,
              //             borderSide: BorderSide.none,
              //             borderRadius: BorderRadius.circular(20),
              //           ),
              //         ),
              //         validator: (value) {
              //           if (value!.isEmpty) {
              //             return 'Please enter your Policy name';
              //           }
              //           return null;
              //         },
              //         onSaved: (value) {
              //         },
              //       ),
              //     ),
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Container(
              //         height: 50,
              //         decoration: const ShapeDecoration(
              //           gradient: LinearGradient(
              //             colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
              //             begin: Alignment.topCenter,
              //             end: Alignment.bottomCenter,
              //             stops: [0.0, 0.4],
              //             tileMode: TileMode.clamp,
              //           ),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(16.0)),
              //           ),
              //         ),
              //         child: TextFormField(
              //           onTap: () async {
              //             DateTime? date = DateTime(1900);
              //             FocusScope.of(context).requestFocus(FocusNode());
              //
              //             date = await showDatePicker(
              //                 context: context,
              //                 initialDate: DateTime.now(),
              //                 firstDate: DateTime(1900),
              //                 lastDate: DateTime(2100));
              //
              //             policyExpirydateController.text =
              //                 '${date!.day}/${date.month.round()}/${date.year}';
              //           },
              //           validator: (value) {
              //             if (value!.isEmpty) {
              //               return 'Please enter a date';
              //             }
              //             return null;
              //           },
              //           controller: policyExpirydateController,
              //           decoration: InputDecoration(
              //               prefixIcon: const Icon(
              //                 (Icons.calendar_month),
              //                 size: 26,
              //                 color: Colors.purple,
              //               ),
              //               hintText: 'Enter Policy Expiry Date',
              //               helperStyle: const TextStyle(
              //                 color: Colors.blueGrey,
              //               ),
              //               labelText: 'Expiry Date',
              //               labelStyle: const TextStyle(
              //                   fontSize: 18,
              //                   color: Colors.indigo,
              //                   fontWeight: FontWeight.bold),
              //               contentPadding:
              //                   const EdgeInsets.symmetric(horizontal: 15),
              //               border: OutlineInputBorder(
              //                 gapPadding: 10,
              //                 borderSide: BorderSide.none,
              //                 borderRadius: BorderRadius.circular(20),
              //               )),
              //         )),
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Container(
              //       height: 50,
              //       decoration: const ShapeDecoration(
              //         gradient: LinearGradient(
              //           colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomCenter,
              //           stops: [0.0, 0.4],
              //           tileMode: TileMode.clamp,
              //         ),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(16.0)),
              //         ),
              //       ),
              //       child: TextFormField(
              //           keyboardType: TextInputType.number,
              //           controller: insuredValueController,
              //           decoration: InputDecoration(
              //               prefixIcon: const Icon(
              //                 Icons.price_change_sharp,
              //                 size: 26,
              //                 color: Colors.purple,
              //               ),
              //               hintText: 'Enter Insurance Value',
              //               labelText: 'Insured value',
              //               labelStyle: const TextStyle(
              //                   fontSize: 18,
              //                   color: Colors.indigo,
              //                   fontWeight: FontWeight.bold),
              //               helperStyle: const TextStyle(
              //                 color: Colors.blueGrey,
              //               ),
              //               contentPadding:
              //                   const EdgeInsets.symmetric(horizontal: 15),
              //               border: OutlineInputBorder(
              //                 gapPadding: 10,
              //                 borderSide: BorderSide.none,
              //                 borderRadius: BorderRadius.circular(20),
              //               ))),
              //     ),
              //   ),
              //   Padding(
              //     padding:
              //         const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              //     child: Container(
              //       height: 50,
              //       decoration: const ShapeDecoration(
              //         gradient: LinearGradient(
              //           colors: [Color(0xFFe6dfd8), Color(0xFFf7f5ec)],
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomCenter,
              //           stops: [0.0, 0.4],
              //           tileMode: TileMode.clamp,
              //         ),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(16.0)),
              //         ),
              //       ),
              //       child: ListTile(
              //         dense: true,
              //         leading: const Padding(
              //           padding: EdgeInsets.all(8.0),
              //           child: Text(
              //             'Upload Document',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 16,
              //                 color: Colors.indigo),
              //           ),
              //         ),
              //         title: InkWell(
              //           onTap: (){
              //          //   CameraGalleryOcr();
              //           },
              //           child: Padding(
              //             padding: const EdgeInsets.only(left: 10),
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 gradient: LinearGradient(
              //                   begin: Alignment.topRight,
              //                   end: Alignment.bottomLeft,
              //                   stops: const [
              //                     0.4,
              //                     0.9,
              //                   ],
              //                   colors: [
              //                     Colors.indigo.withOpacity(0.03),
              //                     Colors.teal.withOpacity(0.03),
              //                   ],
              //                 ),
              //                 borderRadius: BorderRadius.circular(12),
              //               ),
              //               width: 70,
              //               height: 40,
              //               child: const Center(
              //                 child: Align(
              //                   alignment: AlignmentDirectional.centerEnd,
              //                   child: Padding(
              //                     padding: EdgeInsets.only(right: 10),
              //                     child: Icon(
              //                       Icons.image,
              //                       size: 35,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //
              //         //######################## Upload Image for Specific Card
              //         trailing: GestureDetector(
              //           //#################### remove specific index item
              //           onTap: () {
              //             setState(() {});
              //           },
              //           child: const Icon(
              //             Icons.delete_rounded,
              //             color: Colors.red,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Align(
              //       alignment: Alignment.bottomRight,
              //       child: MaterialButton(
              //           onPressed: (){
              //
              //           },
              //         color: Colors.indigo,
              //         splashColor: Colors.teal,
              //         hoverColor: Colors.purple,
              //
              //         shape:RoundedRectangleBorder(
              //          borderRadius: BorderRadius.circular(8),
              //         ),
              //         child: const Text('Submit',
              //           style: TextStyle(fontSize: 16,color: Colors.white,
              //           fontWeight: FontWeight.w600,),
              //
              //       ),
              //       ),
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
