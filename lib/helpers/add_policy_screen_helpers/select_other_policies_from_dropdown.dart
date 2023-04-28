import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/add_policy_provider.dart';

class SelectOtherPoliciesDropDown extends StatelessWidget {
   SelectOtherPoliciesDropDown({Key? key}) : super(key: key);

  List myOtherMap = [];

  @override
  Widget build(BuildContext context) {
    final policyProvider = Provider.of<AddPolicyProvider>(context, listen: false);
    policyProvider.existingPolicies['Other Insurance'][0].keys.map((e) => myOtherMap.add(e)).toList();
    return Column(children: [
      SingleChildScrollView(
        child: InkWell(
            onTap: (){
              policyProvider.changeOtherIsOpen();

            },
            child:Container(
              height: 50,
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.indigo.withOpacity(0.5),
                    width: 2
                ),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white10,),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(policyProvider.otherPoliciesdropdownValue!,
                      style: TextStyle(fontWeight: FontWeight.w600,color: Colors.purple.withOpacity(0.8),),),
                    Consumer<AddPolicyProvider>(
                        builder: (BuildContext context, addPolicyProvider, _) {
                          if(addPolicyProvider.otherisOpen==false){
                            return const Icon(Icons.arrow_drop_down,size:30,  color: Colors.indigo,);
                          }
                          else {
                            return SizedBox();
                          }

                        },
                    )
                  ],
                ),
              ),

            )
        ),
      ),


    policyProvider.otherisOpen==true?
            Container(
              decoration: BoxDecoration(
                boxShadow:  [
                  BoxShadow(
                    color: Colors.indigo.withOpacity(0.3),
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],

                border: Border.all(
                    color: Colors.indigo.withOpacity(0.5),
                    width: 2
                ),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white10,),
              child: ListView(
                  primary: true,
                  shrinkWrap: true,
                  children:
                  myOtherMap.map((e) => InkWell(
                    onTap: (){

                      policyProvider.otherPoliciesdropdownValue = e;
                      policyProvider.changeOtherIsOpen();

                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8
                      ),
                      child: Text(e,style: TextStyle(fontWeight: FontWeight.w600,color: Colors.purple.withOpacity(0.8), ),),
                    ),
                  )).toList()

              //
              //         policyProvider.existingPolicies['Other Insurance'].keys.map((e) =>
              // InkWell(
              //           onTap: (){
              //             policyProvider.otherPoliciesdropdownValue = e;
              //             policyProvider.changeOtherIsOpen();
              //
              //           },
              //           child: Padding(
              //             padding: const EdgeInsets.symmetric(
              //                 vertical: 16,
              //                 horizontal: 8
              //             ),
              //             child: Text(e,style: TextStyle(fontWeight: FontWeight.w600,color: Colors.purple.withOpacity(0.8), ),),
              //           ),
              //         )).toList()

              ),
            ):const SizedBox(),

    ],);
  }
}


