import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/text_fields.dart';
import '../../../provider/add_policy_provider.dart';

class HealthInsurance extends StatefulWidget {
  const HealthInsurance({Key? key}) : super(key: key);

  @override
  State<HealthInsurance> createState() => _HealthInsuranceState();
}

class _HealthInsuranceState extends State<HealthInsurance> {
  TextEditingController policyNameController = TextEditingController();

  TextEditingController policyNumbercontroller = TextEditingController();

  TextEditingController expiryDateController = TextEditingController();


 // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String? policyName;
  String? policyNumber;
  String? expiryDate;
  String? docIMG;





  @override
  void dispose() {
    policyNameController.dispose();
    policyNumbercontroller.dispose();
    expiryDateController.dispose();
    super.dispose();
  }



  /// [_validatePolicyName] validates the value of [PolicyName]
  String? _validatePolicyName(String policyName) {
    // Regular Expression for mpbile
    String mobileRegExp = r"^[a-zA-Z0-9]+$";
    if (policyName.isEmpty) {
      // Name field should not be empty
      return 'Enter Policy Name ';
    }
    if (!RegExp(mobileRegExp).hasMatch(policyName)) {
      // If the value in email field doesn't match with the regular expression
      // then it throws an error message.
      return 'Enter correctly';
    }
    return '';


  }


  /// [_validatepolicyNumber] validates the value of [_policyNumber]
  String? _validatepolicyNumber(String policyNumber) {
    // Regular Expression for fullname (a space between first name and second name)
    String nameRegExp = r"^[a-zA-Z0-9]+$";

    if (policyNumber.isEmpty) {
      // Name field should not be empty
      return 'Enter Policy Number';
    }
    if (!RegExp(nameRegExp).hasMatch(policyNumber)) {
      // If the value in name field doesn't match with the regular expression
      // then it throws an error message.
      return 'Enter Policy Number';
    }
    return null;

  }


  /// [_validateexpiryDate] validates the value of [_expiryDate]
  String? _validateexpiryDate(String expiryDate) {
    // Regular Expression for email
    String expiryDateRegExp =
        r"^[a-zA-Z0-9]+$";
    if (expiryDate.isEmpty) {
      // Name field should not be empty
      return 'Enter your email';
    }
    if (!RegExp(expiryDateRegExp).hasMatch(expiryDate)) {
      // If the value in email field doesn't match with the regular expression
      // then it throws an error message.
      return 'Enter correctly';
    }
    return null;
  }


  Map hiObj = {};
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddPolicyProvider>(context, listen:  false);
 //   print(provider.dropdownValue);
    return  Column(
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
                            top: 16,
                            bottom: 8,
                            left: 8,
                            right: 8),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Upload Insurance Copy',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.indigo
                                      .withOpacity(0.5)),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  Column(
                                        children: [
                                          provider.dropdownValue != ''?
                                          provider.selectedImagePath ==''?const Icon(Icons.image,color: Colors.indigo,size: 60,):
                                          Consumer<AddPolicyProvider>(builder: (BuildContext context, addPolicyProvider, Widget? child) {
                                            return SizedBox(
                                              height: 150,
                                              width: 200,
                                              child: Image.file(
                                              File(
                                              addPolicyProvider.selectedImagePath.toString(),),
                                                   fit: BoxFit.fitWidth,
                                                     filterQuality: FilterQuality.low,
                                                                 ),
                                            );
                                          },

                                          ):const SizedBox(),

                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.indigo
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                BorderRadius.circular(
                                                    12)),
                                            child: TextButton.icon(
                                                onPressed: () {
                                                  provider.selectImage(context, provider.dropdownValue.toString());

                                                },
                                                icon: const Icon(Icons
                                                    .upload_file_rounded),
                                                label: provider.dropdownValue == ''?
                                                const Text('No file Choosen'):Text(provider.dropdownValue.toString())),
                                          ),
                                        ],

                                  )
                                ],
                              ),
                            )
                          ],
                        )),


                    //// 'Enter your Policy Name', ############
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 8, left: 8, right: 8),
                      child: MyTextField(
                        hintText: 'Enter Policy Name',
                        myController: policyNameController,
                        lblText: 'policy Name',
                        inputData:   policyNameController.text,
                        formFieldValidator: (String? value){
                          return _validatePolicyName(policyNameController.text);
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
                        inputData:policyNumbercontroller.text,
                        formFieldValidator: (String? value){
                          return _validatepolicyNumber(policyNumbercontroller.text);
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
                        formFieldValidator: (String? value){
                          return _validateexpiryDate(expiryDateController.text);
                        },

                      ),
                    ),

                    //////##############   ADD BUTTON ############
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30, right: 20),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: MaterialButton(
                          onPressed: () {

                            hiObj["policyName"] = policyNameController.text;
                            hiObj["policyNumber"] = policyNumbercontroller.text;
                            hiObj["expiryDate"] = expiryDateController.text;
                            hiObj["policyDoc"] =
                                provider.selectedImagePath;
                            provider
                                .existingPolicies['Health Insurance']
                                .add(hiObj);
                            print(
                                '${provider.existingPolicies} ####### Health Insurance');
                            // provider.addHeathPolicyData(
                            //     policyName : policyName = policyNameController.text.toString(),
                            //     policyNumber : policyNumber= policyNumbercontroller.text.toString(),
                            //     expiryDate : expiryDate = expiryDateController.text.toString(),
                            //     policyDoc:provider.selectedImagePath,
                            // );
                            // Navigator.pushNamed(context, HomePage.routeName);


                          },
                          color: Colors.indigo,
                          splashColor: Colors.teal,
                          hoverColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'ADD',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
