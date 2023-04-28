import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers/add_policy_screen_helpers/existing_policies_Ui.dart';
import '../models/selected_doc_andImage_list.dart';
import '../screens/add_documents_screen.dart';
import '../screens/add_policy_screen.dart';
import '../provider/add_policy_provider.dart';

homeScreenExistingPoliciesSection(BuildContext context,index) {

  final addPolicyProvider = Provider.of<AddPolicyProvider>(context, listen: false);
 //for(int i = 0; i<5 ; i++)
 var hiKeys = addPolicyProvider.existingPolicies['Health Insurance'].isNotEmpty?
                  addPolicyProvider.existingPolicies['Health Insurance'][addPolicyProvider.existingPolicies['Health Insurance'].length-1].keys.map((kkeys)=> kkeys).toList():'';
 // for(int i = 0; i<5 ; i++)

    var hiValues = addPolicyProvider.existingPolicies['Health Insurance'].isNotEmpty?
                  addPolicyProvider.existingPolicies['Health Insurance'][addPolicyProvider.existingPolicies['Health Insurance'].length-1].values.map((kkeys)=> kkeys).toList():'';




  //################ Health Insurance Data #################{Note : - hi stand for Health Insurance}#######?////////
 //var hiKeys = addPolicyProvider.existingPolicies['Health Insurance'][index].keys.map((e) => e).toList();
// print(hiKeys);

//  var hiValues = addPolicyProvider.existingPolicies[addPolicyProvider.existingPolicies.keys.map((e) => e).toList()[0]][0].values.map((e)=>e).toList();
// print(hiValues);
  //######################## Motor Insurance Data ########################?////////
//   var miKeys = addPolicyProvider.existingPolicies[addPolicyProvider.existingPolicies.keys.map((e) => e).toList()[1]][0].keys.map((e)=>e).toList();
//   print(miKeys);
//   var miValues = addPolicyProvider.existingPolicies[addPolicyProvider.existingPolicies.keys.map((e) => e).toList()[1]][0].values.map((e)=>e).toList();
// print(miValues);
  //######################## Other(Term Insurance) Insurance Data ########################?////////
  // var tiKeys = addPolicyProvider.existingPolicies[addPolicyProvider.existingPolicies.keys.map((e) => e).toList()[2]][0]['Term Insurance'][0].keys.map((e)=>e).toList();
  // var tiValues = addPolicyProvider.existingPolicies[addPolicyProvider.existingPolicies.keys.map((e) => e).toList()[2]][0]['Term Insurance'][0].values.map((e)=>e).toList();
 // print(addPolicyProvider.existingPolicies[addPolicyProvider.existingPolicies.keys.map((e) => e).toList()[2]][0].keys);

   //######################## Other(Life Insurance) Insurance Data ########################?////////
 // var liKeys = addPolicyProvider.existingPolicies[addPolicyProvider.existingPolicies.keys.map((e) => e).toList()[2]][0]['Life Insurance'][0].keys.map((e)=>e).toList();
  //var liValues = addPolicyProvider.existingPolicies[addPolicyProvider.existingPolicies.keys.map((e) => e).toList()[2]][0]['Life Insurance'][0].values.map((e)=>e).toList();



  return Column(
    children: [

      Padding(
        padding: const EdgeInsets.only(top: 20, left: 24),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Existing Policies',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.indigo.withOpacity(0.8)),
          ),
        ),
      ),

      ///####################### Health Insurance Tiles ###########


     ListView.builder(
       shrinkWrap: true,
       itemCount: addPolicyProvider.existingPolicies['Health Insurance'].length+1,
       itemBuilder: (BuildContext context, int index) {
         return ExistingPoliciesListModel(
             titleText: '${addPolicyProvider.existingPolicies.keys.map((e) => e).toList()[0]}',
             conditionalText: hiValues.isNotEmpty?hiValues[0]:'',
             //hiKeys[0].length == 0?'': '${hiKeys[0]}',
             key1Text: addPolicyProvider.existingPolicies['Health Insurance'].isNotEmpty?'${hiKeys[0]}: ':'',
             key2Text: addPolicyProvider.existingPolicies['Health Insurance'].isNotEmpty?'${hiKeys[1]}: ':'',
             key3Text: addPolicyProvider.existingPolicies['Health Insurance'].isNotEmpty?'${hiKeys[2]}: ':'',

             value1Text: addPolicyProvider.existingPolicies['Health Insurance'].isNotEmpty?'${hiValues[index]}':'',
             value2Text: addPolicyProvider.existingPolicies['Health Insurance'].isNotEmpty?'${hiValues[index]}':'',
             value3Text: addPolicyProvider.existingPolicies['Health Insurance'].isNotEmpty?'${hiValues[index]}':'',

             listLenth: 1);

       },
     ),
         //addPolicyProvider.existingPolicies['Health Insurance'].length),

      //####################### Motor Insurance Tiles ###########
      ExistingPoliciesListModel(
        titleText: '${addPolicyProvider.existingPolicies.keys.map((e) => e).toList()[1]}',
        conditionalText: '',
        //'${addPolicyProvider.existingPolicies['Motor Insurance']!}',
        key1Text: '',
        value1Text: '',
        key2Text: '',
        value2Text: '',
        key3Text: '',
        value3Text: '', listLenth:addPolicyProvider.existingPolicies['Motor Insurance'].length),
      ///####################### Other Insurance Tiles ###########
      ExistingPoliciesListModel(
        titleText: '${addPolicyProvider.existingPolicies.keys.map((e) => e).toList()[2]}',
        conditionalText: '',
        key1Text:'',
        value1Text: '',
        key2Text: '',
        value2Text: '',
        key3Text: '',
        value3Text: '', listLenth:addPolicyProvider.existingPolicies['Other Insurance'].length,),

      //////////// Add Policy Icon Button Start here /////////////

      Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, EnterPolicyData.routeName);
                },
                child: Icon(
                  Icons.add_circle,
                  size: 40,
                  color: Colors.indigo.withOpacity(0.8),
                ))),
      ),
      //////////// Divider Start here /////////////
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          width: double.maxFinite,
          height: 3,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.purple.withOpacity(0.4),
            Colors.indigo.withOpacity(0.4)
          ])),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 14, left: 24, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Documents',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo.withOpacity(0.8)),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, UploadEditDocScreen.routeName);
              },
              color: Colors.indigo,
              splashColor: Colors.teal,
              hoverColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'ADD DOC',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      SelectedDocNameAndImageList(showEditDelete: true,)

      // Padding(
      //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
      //   child: ListView.builder(
      //     scrollDirection: Axis.vertical,
      //     shrinkWrap: true,
      //     physics: const BouncingScrollPhysics(),
      //     itemCount: docProvider.selectedDocToUploadImage.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Padding(
      //           padding:
      //               const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      //           child: Container(
      //               //height: 60,
      //               width: double.maxFinite,
      //               decoration: BoxDecoration(
      //                   color: Colors.grey.withOpacity(0.1),
      //                   borderRadius: BorderRadius.circular(12),
      //                   border:
      //                       Border.all(color: Colors.indigo.withOpacity(0.2))),
      //               child: ExpansionTile(
      //                   expandedAlignment: Alignment.topLeft,
      //                   expandedCrossAxisAlignment: CrossAxisAlignment.start,
      //                   backgroundColor: Colors.blue.withOpacity(0.03),
      //                   collapsedIconColor: Colors.purple,
      //                   iconColor: Colors.indigo,
      //                   title: Text('${docProvider.selectedDocToUploadImage[index]}'),
      //                   //Text(provider.documentsnDetails[index].keys.map((e) => Text(e)).toList() as String),
      //                   children: [
      //                     Padding(
      //                         padding: const EdgeInsets.all(8.0),
      //                         child: ListTile(
      //                             // isThreeLine: true,
      //                             shape: RoundedRectangleBorder(
      //                               //<-- SEE HERE
      //                               side: const BorderSide(width: 0.2),
      //                               borderRadius: BorderRadius.circular(12),
      //                             ),
      //                             focusColor: Colors.white,
      //                             hoverColor: Colors.white,
      //                             // leading: CircleAvatar(backgroundImage:AssetImage('images/lic.png'),radius: 15,),
      //                             title: Consumer<MyDocsProvider>(
      //                               builder: (context, pprovider, child) {
      //                                 return docProvider.myDocImages()[index] ==
      //                                         ''
      //                                     ? TextButton.icon(
      //                                         onPressed: () {
      //                                           Navigator.pushNamed(
      //                                               context,
      //                                               UploadEditDocScreen
      //                                                   .routeName);
      //                                           // docProvider.selectImage(context,
      //                                           //     docProvider.myDocNames()[index]);
      //                                         },
      //                                         icon: const Icon(
      //                                             Icons.upload_file_rounded),
      //                                         label: const Text(
      //                                           'Image Not Selected \n Click To Upload One ',
      //                                           style: TextStyle(
      //                                             color: Colors.indigo,
      //                                             fontSize: 10,
      //                                           ),
      //                                           textAlign: TextAlign.center,
      //                                         ))
      //                                     : Padding(
      //                                         padding: const EdgeInsets.only(
      //                                             bottom: 40),
      //                                         child: Image.file(
      //                                           File(
      //                                             pprovider
      //                                                 .myDocImages()[index]
      //                                                 .toString(),
      //                                           ),
      //                                           fit: BoxFit.fitWidth,
      //                                           filterQuality:
      //                                               FilterQuality.low,
      //                                         ),
      //                                       );
      //                               },
      //                             ),
      //                             subtitle: Consumer<MyDocsProvider>(
      //                                 builder: (context, pprovider, child) {
      //                               return docProvider.myDocImages()[index] !=
      //                                       ''
      //                                   ? Row(
      //                                       mainAxisAlignment:
      //                                           MainAxisAlignment.end,
      //                                       children: [
      //                                         IconButton(
      //                                             onPressed: () {
      //                                               docProvider.selectImage(
      //                                                   context,
      //                                                   docProvider
      //                                                           .myDocNames()[
      //                                                       index]);
      //                                             },
      //                                             icon: const Icon(
      //                                               Icons.edit,
      //                                               color: Colors.indigo,
      //                                             )),
      //                                         IconButton(
      //                                             onPressed: () {
      //                                               pprovider.deleteImage(
      //                                                   docProvider
      //                                                           .myDocNames()[
      //                                                       index]);
      //                                             },
      //                                             icon: const Icon(
      //                                               Icons.delete,
      //                                               color: Colors.purple,
      //                                             )),
      //                                       ],
      //                                     )
      //                                   : const SizedBox();
      //                             })))
      //                   ])));
      //     },
      //   ),
      // ),
    ],
  );
}
