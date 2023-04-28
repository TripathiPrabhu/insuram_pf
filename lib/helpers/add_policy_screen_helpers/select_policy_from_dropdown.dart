import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/add_policy_provider.dart';

class SelectPolicyDropDown extends StatelessWidget {
  const SelectPolicyDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final policyProvider = Provider.of<AddPolicyProvider>(context, listen: false);
  // print(policyProvider.existingPolicies.keys);
    return Column(children: [
      SingleChildScrollView(
        child: InkWell(
         onTap: (){
           policyProvider.changeIsOpen();
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
             child: Consumer<AddPolicyProvider>(
  builder: (context, addPolicyProvider, child) {
  return Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(policyProvider.dropdownValue!,
                   style: TextStyle(fontWeight: FontWeight.w600,color: Colors.purple.withOpacity(0.8),),),
                  addPolicyProvider.isOpen==false?const Icon(Icons.arrow_drop_down,size:30,  color: Colors.indigo,) :SizedBox()
               ],
             );
  },
),
           ),

         )
        ),
      ),

      Consumer<AddPolicyProvider>(
  builder: (context, addPolicyProvider, child) {
  return
    addPolicyProvider.isOpen==true?
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
            children: policyProvider.existingPolicies.keys.map((e) => InkWell(
              onTap: (){
                policyProvider.dropdownValue = e;
                policyProvider.changeIsOpen();

              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8
                ),
                child: Text(e,style: TextStyle(fontWeight: FontWeight.w600,color: Colors.purple.withOpacity(0.8), ),),
              ),
            )).toList()

        ),
      ):const SizedBox();
  },
)
    ],);
  }
}


