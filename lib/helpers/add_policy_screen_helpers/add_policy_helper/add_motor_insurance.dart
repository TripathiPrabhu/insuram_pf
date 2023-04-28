import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/text_fields.dart';
import '../../../provider/add_policy_provider.dart';
import '../../../screens/home_page.dart';

class MotorInsurance extends StatefulWidget {
  const MotorInsurance({Key? key}) : super(key: key);

  @override
  State<MotorInsurance> createState() => _MotorInsuranceState();
}

class _MotorInsuranceState extends State<MotorInsurance> {
  TextEditingController vehicleNumberController = TextEditingController();

  TextEditingController policyNumbercontroller = TextEditingController();

  TextEditingController expiryDateController = TextEditingController();

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? vehicleNumber;
  String? policyNumber;
  String? expiryDate;
  String? docIMG;

  @override
  void dispose() {
    vehicleNumberController.dispose();
    policyNumbercontroller.dispose();
    expiryDateController.dispose();
    super.dispose();
  }

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

  /// [_validatevehicleNumber] validates the value of [vehicleNumber]
  String? _validatevehicleNumber(String vehicleNumber) {
    // Regular Expression for mpbile
    String mobileRegExp = r"^[a-zA-Z0-9]+$";
    if (vehicleNumber.isEmpty) {
      // Name field should not be empty
      return 'Enter your vehicle number';
    }
    if (!RegExp(mobileRegExp).hasMatch(vehicleNumber)) {
      // If the value in email field doesn't match with the regular expression
      // then it throws an error message.
      return 'Enter correctly';
    }
    return null;
  }

  /// [_validateexpiryDate] validates the value of [_expiryDate]
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

  Map miObj = {};

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddPolicyProvider>(context, listen: false);
    // print(provider.existingPolicies);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 0,
          ),
          child: Card(
            child: Column(
              children: [
                //// Upload Insurance Copy ###################
                Padding(
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 8, left: 8, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Upload Insurance Copy',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.indigo.withOpacity(0.5)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  provider.dropdownValue != ''
                                      ? SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: provider.selectedImagePath ==
                                                  ''
                                              ? const Icon(
                                                  Icons.image,
                                                  color: Colors.indigo,
                                                  size: 60,
                                                )
                                              : Image.file(
                                                  File(
                                                    provider.selectedImagePath
                                                        .toString(),
                                                  ),
                                                  fit: BoxFit.fitWidth,
                                                  filterQuality:
                                                      FilterQuality.low,
                                                ),
                                        )
                                      : const SizedBox(),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.indigo.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextButton.icon(
                                        onPressed: () {
                                          provider.selectImage(
                                              context,
                                              provider.dropdownValue
                                                  .toString());
                                        },
                                        icon: const Icon(
                                            Icons.upload_file_rounded),
                                        label: provider.dropdownValue == ''
                                            ? const Text('No file Choosen')
                                            : Text(provider.dropdownValue
                                                .toString())),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )),

                //// 'Enter your Vehicle Number', ############
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 8, left: 8, right: 8),
                  child: MyTextField(
                    hintText: 'Enter your Vehicle Number',
                    myController: vehicleNumberController,
                    lblText: 'Vehicle Number',
                    inputData: vehicleNumberController.text,
                    formFieldValidator: (String? value) {
                      return _validatevehicleNumber(
                          vehicleNumberController.text);
                    },
                    kebrdTyp: TextInputType.text,
                  ),
                ),

                //// Enter your Policy Number, ###############
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 8, left: 8, right: 8),
                  child: MyTextField(
                    myController: policyNumbercontroller,
                    hintText: 'Enter your Policy Number',
                    lblText: 'Policy Number',
                    inputData: vehicleNumberController.text,
                    formFieldValidator: (String? value) {
                      return _validatevehicleNumber(
                          policyNumbercontroller.text);
                    },
                    kebrdTyp: TextInputType.text,
                  ),
                ),

                ///############Enter Expiry Date #############
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 8, left: 8, right: 8),
                  child: MyTextField(
                    kebrdTyp: TextInputType.datetime,
                    myController: expiryDateController,
                    hintText: 'Enter Expiry Date',
                    lblText: 'Expiry Date',
                    inputData: expiryDateController.text,
                    formFieldValidator: (String? value) {
                      return _validatevehicleNumber(expiryDateController.text);
                    },
                  ),
                ),

                //////##############   ADD BUTTON ############
                Padding(
                  padding: const EdgeInsets.only(top: 80, right: 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Consumer<AddPolicyProvider>(
                      builder: (context, addPolicyProvider, child) {
                        return MaterialButton(
                          onPressed: () {
                            miObj["policyName"] = vehicleNumberController.text;
                            miObj["policyNumber"] = policyNumbercontroller.text;
                            miObj["expiryDate"] = expiryDateController.text;
                            miObj["policyDoc"] =
                                addPolicyProvider.selectedImagePath;
                            addPolicyProvider
                                .existingPolicies['Motor Insurance']
                                .add(miObj);
                            print(
                                '${addPolicyProvider.existingPolicies} #######  Motor Insurance');
                            // print(expiryDate);

                            // addPolicyProvider.addMotorPolicyData(
                            //   policyName:vehicleNumberController.text,
                            //     policyNumber: policyNumbercontroller.text,
                            //     expiryDate:expiryDateController.text,
                            //     policyDoc:addPolicyProvider.selectedImagePath,
                            //
                            // );
                            Navigator.pushNamed(context, HomePage.routeName);
                          },
                          color: Colors.indigo,
                          splashColor: Colors.teal,
                          hoverColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'ADD',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
