import 'package:flutter/material.dart';

import '../../screens/get_a_quote.dart';

class ExistingPoliciesListModel extends StatelessWidget {
  final String? titleText;
  final String? conditionalText;
  final String? key1Text;
  final String? value1Text;
  final String? key2Text;
  final String? value2Text;
  final String? key3Text;
  final String? value3Text;
  final String? key4Text;
  final String? value4Text;
  final String? key5Text;
  final String? value5Text;
   int listLenth =0;
   ExistingPoliciesListModel({Key? key,
    required this.titleText, required this.conditionalText,
    required this.key1Text, required this.value1Text,
    required this.key2Text, required this.value2Text,
    required this.key3Text, required this.value3Text,
    this.key4Text, this.value4Text,
    this.key5Text, this.value5Text,  required this.listLenth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
              //height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.green,
                  //color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.indigo.withOpacity(0.2))),
              child: Column(
                children: [

                  ExpansionTile(
                      expandedAlignment: Alignment.topLeft,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      backgroundColor: Colors.blue.withOpacity(0.03),
                      collapsedIconColor: Colors.purple,
                      iconColor: Colors.indigo,
                      title: Text(titleText!
                      ),
                      children: [conditionalText == ''
                            ? Center(
                          child:  Text('Oops ! Nothing Found \n Please Add One' ,textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.teal, fontSize: 16, fontWeight: FontWeight.bold),),
                        )
                            : ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: listLenth,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    isThreeLine: true,
                                    shape: RoundedRectangleBorder(
                                      //<-- SEE HERE
                                      side: const BorderSide(width: 0.2),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusColor: Colors.white,
                                    hoverColor: Colors.white,
                                    // leading: CircleAvatar(backgroundImage:AssetImage('images/lic.png'),radius: 15,),
                                    title: titleText == 'Other Insurance'?
                                    Column(
                                      children: [
                                        ExpansionTile(
                                            expandedAlignment: Alignment.topLeft,
                                            expandedCrossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            tilePadding: const EdgeInsets.all(0),
                                            //  backgroundColor: Colors.white,
                                            backgroundColor:
                                            Colors.indigo.withOpacity(0.03),
                                            collapsedIconColor: Colors.purple,
                                            iconColor: Colors.indigo,
                                            title: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    text: key1Text!,
                                                    style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: value1Text!,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                    ],
                                                  ),
                                                ),

                                                ///############## Policy Number/#####################
                                                RichText(
                                                  text: TextSpan(
                                                    text: key2Text!,
                                                    style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                    children:  <TextSpan>[
                                                      TextSpan(
                                                          text: value2Text!,
                                                          //'${provider.existingPolicies['Health Insurance'][0]["Policy Name"].toString()}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                    ],
                                                  ),
                                                ),

                                                ///##############  Expiry Date/#####################
                                                RichText(
                                                  text: TextSpan(
                                                    text: key3Text!,
                                                    style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                    children:  <TextSpan>[
                                                      TextSpan(
                                                          text: value3Text!,
                                                          //'${provider.existingPolicies['Health Insurance'][0]["Expiry Date"].toString()}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                    ],
                                                  ),
                                                ),

                                                Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                            backgroundColor:
                                                            Colors.indigo
                                                                .shade600),
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                  const GetAQuote(
                                                                    withIcons:
                                                                    true,
                                                                    destinationEmail:
                                                                    'prabhuveramasa1@gmail.com',
                                                                  )));
                                                        },
                                                        child: const Text(
                                                            'Get A Quote'))

                                                )
                                              ],
                                            ),
                                            children: const [
                                              // PolicyDetailInTable(
                                              //   policyName: policyList[index].toString(),
                                              // ),
                                            ]),

                                        ExpansionTile(
                                            expandedAlignment: Alignment.topLeft,
                                            expandedCrossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            tilePadding: const EdgeInsets.all(0),
                                            //  backgroundColor: Colors.white,
                                            backgroundColor:
                                            Colors.indigo.withOpacity(0.03),
                                            collapsedIconColor: Colors.purple,
                                            iconColor: Colors.indigo,
                                            title: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    text: key1Text!,
                                                    style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: value1Text!,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                    ],
                                                  ),
                                                ),

                                                ///############## Policy Number/#####################
                                                RichText(
                                                  text: TextSpan(
                                                    text: key2Text!,
                                                    style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                    children:  <TextSpan>[
                                                      TextSpan(
                                                          text: value2Text!,
                                                          //'${provider.existingPolicies['Health Insurance'][0]["Policy Name"].toString()}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                    ],
                                                  ),
                                                ),

                                                ///##############  Expiry Date/#####################
                                                RichText(
                                                  text: TextSpan(
                                                    text: key3Text!,
                                                    style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                    children:  <TextSpan>[
                                                      TextSpan(
                                                          text: value3Text!,
                                                          //'${provider.existingPolicies['Health Insurance'][0]["Expiry Date"].toString()}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold)),
                                                    ],
                                                  ),
                                                ),

                                                Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                            backgroundColor:
                                                            Colors.indigo
                                                                .shade600),
                                                        onPressed: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) =>
                                                                  const GetAQuote(
                                                                    withIcons:
                                                                    true,
                                                                    destinationEmail:
                                                                    'prabhuveramasa1@gmail.com',
                                                                  )));
                                                        },
                                                        child: const Text(
                                                            'Get A Quote'))

                                                )
                                              ],
                                            ),
                                            children: const [
                                              // PolicyDetailInTable(
                                              //   policyName: policyList[index].toString(),
                                              // ),
                                            ])
                                      ],
                                    )
                                        :
                                    ExpansionTile(
                                        expandedAlignment: Alignment.topLeft,
                                        expandedCrossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        tilePadding: const EdgeInsets.all(0),
                                        //  backgroundColor: Colors.white,
                                        backgroundColor:
                                        Colors.indigo.withOpacity(0.03),
                                        collapsedIconColor: Colors.purple,
                                        iconColor: Colors.indigo,
                                        title: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: key1Text!,
                                                style:
                                                DefaultTextStyle.of(context)
                                                    .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: value1Text!,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold)),
                                                ],
                                              ),
                                            ),

                                            ///############## Policy Number/#####################
                                            RichText(
                                              text: TextSpan(
                                                text: key2Text!,
                                                style:
                                                DefaultTextStyle.of(context)
                                                    .style,
                                                children:  <TextSpan>[
                                                  TextSpan(
                                                      text: value2Text!,
                                                      //'${provider.existingPolicies['Health Insurance'][0]["Policy Name"].toString()}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold)),
                                                ],
                                              ),
                                            ),

                                            ///##############  Expiry Date/#####################
                                            RichText(
                                              text: TextSpan(
                                                text: key3Text!,
                                                style:
                                                DefaultTextStyle.of(context)
                                                    .style,
                                                children:  <TextSpan>[
                                                  TextSpan(
                                                      text: value3Text!,
                                                      //'${provider.existingPolicies['Health Insurance'][0]["Expiry Date"].toString()}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold)),
                                                ],
                                              ),
                                            ),

                                            Align(
                                                alignment: Alignment.bottomRight,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                        backgroundColor:
                                                        Colors.indigo
                                                            .shade600),
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                              const GetAQuote(
                                                                withIcons:
                                                                true,
                                                                destinationEmail:
                                                                'prabhuveramasa1@gmail.com',
                                                              )));
                                                    },
                                                    child: const Text(
                                                        'Get A Quote'))

                                            )
                                          ],
                                        ),
                                        children: const [
                                          // PolicyDetailInTable(
                                          //   policyName: policyList[index].toString(),
                                          // ),
                                        ]),
                                    subtitle: const Text(''),
                                  ),
                                );
                              },

                            ),
                      ]),
                ],
              ),
            ),
    );
  }
}
