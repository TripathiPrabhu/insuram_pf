import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/add_documents_screen_helper/select_documents_from_dropdown.dart';
import '../models/app_bar.dart';
import '../models/selected_doc_andImage_list.dart';
import '../provider/doc_image_name_provider.dart';

class UploadEditDocScreen extends StatelessWidget {
  static const routeName = '/UploadEditDocScreen';

  const UploadEditDocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final docProvider = Provider.of<MyDocsProvider>(context, listen: false);
    // print(docProvider.myDocu);
    return Scaffold(
      appBar: CustomAppBar(
        elvtn: 0,
        automaticallyImplyLeading: true,
        bakgrndclr: Colors.transparent,
        preferredSize: const Size.fromHeight(50.0),
        tlbarht: 100,
        flxblSpx: const Padding(
          padding: EdgeInsets.only(top: 50, left: 200),
          child: Text('Upload Documents'),
        ),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SelectDocumentsDropDown(),
                  SelectedDocNameAndImageList(showEditDelete: false,)

                  // Consumer<MyDocsProvider>(
                  //    builder: (context, myDocsProvider, child) {
                  //      return Column(
                  //        children: [
                  //          myDocsProvider.dropdownValue !='Select Document'?
                  //          SingleChildScrollView(
                  //              child: ListView.builder(
                  //                itemBuilder: (BuildContext context, int index) {
                  //                  return Padding(
                  //                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                  //                    child: Container(
                  //                      //height: 60,
                  //                      width: double.maxFinite,
                  //                      decoration: BoxDecoration(
                  //                          color: Colors.grey.withOpacity(0.1),
                  //                          borderRadius: BorderRadius.circular(12),
                  //                          border: Border.all(color: Colors.indigo.withOpacity(0.2))),
                  //                      child: ExpansionTile(
                  //                          expandedAlignment: Alignment.topLeft,
                  //                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  //                          backgroundColor: Colors.blue.withOpacity(0.03),
                  //                          collapsedIconColor: Colors.purple,
                  //                          iconColor: Colors.indigo,
                  //                          title: Text('${'${myDocsProvider.selectedDocToUploadImage[index]}'}'),
                  //                          //Text(provider.documentsnDetails[index].keys.map((e) => Text(e)).toList() as String),
                  //                          children: [
                  //                            Padding(
                  //                              padding: const EdgeInsets.all(8.0),
                  //                              child: ListTile(
                  //                                // isThreeLine: true,
                  //                                shape: RoundedRectangleBorder(
                  //                                  //<-- SEE HERE
                  //                                  side: const BorderSide(width: 0.2),
                  //                                  borderRadius: BorderRadius.circular(12),
                  //                                ),
                  //                                focusColor: Colors.white,
                  //                                hoverColor: Colors.white,
                  //                                // leading: CircleAvatar(backgroundImage:AssetImage('images/lic.png'),radius: 15,),
                  //                                title: Consumer<MyDocsProvider>(
                  //                                  builder: (context, myDocsProvider, child) {
                  //                                    return myDocsProvider.dropdownValue == ''
                  //                                        ? TextButton.icon(
                  //                                        onPressed: () {
                  //                                          docProvider.selectImage(context,
                  //                                              myDocsProvider.dropdownValue.toString());
                  //                                        },
                  //                                        icon:
                  //                                        const Icon(Icons.upload_file_rounded),
                  //                                        label: const Text(
                  //                                          'Image Not Selected \n Click To Upload One ',
                  //                                          style: TextStyle(
                  //                                            color: Colors.indigo,
                  //                                            fontSize: 10,
                  //                                          ),
                  //                                          textAlign: TextAlign.center,
                  //                                        ))
                  //                                        : Padding(
                  //                                      padding:
                  //                                      const EdgeInsets.only(bottom: 4),
                  //                                      child: SizedBox(
                  //                                        height: MediaQuery.of(context).size.height/6,
                  //                                        width: MediaQuery.of(context).size.height/6,
                  //                                        child: Image.file(
                  //                                          File(
                  //                                            myDocsProvider.myDocu[0]['${myDocsProvider.selectedDocToUploadImage[index]}'],
                  //                                          ),
                  //                                          // fit: BoxFit.cover,
                  //                                          filterQuality: FilterQuality.low,
                  //                                        ),
                  //                                      ),
                  //                                    );
                  //                                  },
                  //                                ),
                  //                                subtitle: Consumer<MyDocsProvider>(
                  //                                  builder: (context, pprovider, child){
                  //                                    return myDocsProvider.dropdownValue != ''
                  //                                        ?
                  //                                    Row(
                  //                                      mainAxisAlignment: MainAxisAlignment.end,
                  //                                      children: [
                  //                                        IconButton(onPressed: (){
                  //                                          docProvider.selectImage(context,
                  //                                              myDocsProvider.selectedDocToUploadImage[index]);
                  //                                        },
                  //                                            icon: const Icon(Icons.edit,color: Colors.indigo,)),
                  //                                        IconButton(
                  //                                            onPressed: (){
                  //                                              pprovider.deleteImage(myDocsProvider.selectedDocToUploadImage[index]);
                  //                                            },
                  //                                            icon: const Icon(Icons.delete,color: Colors.purple,)),
                  //                                      ],): const SizedBox();
                  //                                    // TextButton.icon(
                  //                                    //     onPressed: () {
                  //                                    //       provider.selectImage(context,
                  //                                    //           provider.myDocNames()[index]);
                  //                                    //     },
                  //                                    //     icon:
                  //                                    //     const Icon(Icons.upload_file_rounded),
                  //                                    //     label: const Text(
                  //                                    //       'Image Not Selected \n Click To Upload One ',
                  //                                    //       style: TextStyle(
                  //                                    //         color: Colors.indigo,
                  //                                    //         fontSize: 10,
                  //                                    //       ),
                  //                                    //       textAlign: TextAlign.center,
                  //                                    //     ))
                  //
                  //                                    // Padding(
                  //                                    //   padding:
                  //                                    //   const EdgeInsets.only(bottom: 40),
                  //                                    //   child: Image.file(
                  //                                    //     File(
                  //                                    //       pprovider
                  //                                    //           .myDocImages()[index]
                  //                                    //           .toString(),
                  //                                    //     ),
                  //                                    //     fit: BoxFit.fitWidth,
                  //                                    //     filterQuality: FilterQuality.low,
                  //                                    //   ),
                  //                                    // );
                  //                                  },
                  //                                ),
                  //
                  //                                // trailing: InkWell(
                  //                                //   onTap: () {},
                  //                                //   child: TextButton.icon(
                  //                                //     onPressed: () {
                  //                                //       provider.selectImage(
                  //                                //           context, provider.myDocNames()[index]);
                  //                                //     },
                  //                                //     icon: const Icon(
                  //                                //       Icons.add_box_rounded,
                  //                                //       color: Colors.indigo,
                  //                                //     ),
                  //                                //     label: Text('Upload Image'),
                  //                                //   ),
                  //                                // ),
                  //                              ),
                  //                            ),
                  //                            // ListTile(
                  //                            //     focusColor: Colors.white,
                  //                            //     hoverColor: Colors.white,
                  //                            //     title: ExpansionTile (
                  //                            //         collapsedIconColor: Colors.purple,
                  //                            //         iconColor: Colors.indigo,
                  //                            //         title:Text('${ExistingPliciesList[index]}'),
                  //                            //         children:[
                  //                            //           CustomAlertDialog(PolicyName: ExistingPliciesList[index].toString(),),
                  //                            //         ]
                  //                            //
                  //                            //     )
                  //                            //
                  //                            //
                  //                            // ),
                  //                          ]
                  //                      ),
                  //                    ),
                  //                  );
                  //                },
                  //                itemCount: myDocsProvider.selectedDocToUploadImage.length,
                  //               // primary: true,
                  //               // physics: ScrollPhysics(),
                  //                shrinkWrap: true,
                  //              )
                  //          ):SizedBox(),
                  //
                  //                ]
                  //                );
                  //      }
                  // )


                  // SingleChildScrollView(
                  //   child: Padding(
                  //     padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                  //     child: ListView.builder(
                  //       scrollDirection: Axis.vertical,
                  //       shrinkWrap: true,
                  //       physics: const BouncingScrollPhysics(),
                  //       itemCount: docProvider.myDocNames().length,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return Padding(
                  //           padding: const EdgeInsets.symmetric(vertical: 10),
                  //           child: Container(
                  //             //height: 60,
                  //             width: double.maxFinite,
                  //             decoration: BoxDecoration(
                  //                 color: Colors.grey.withOpacity(0.1),
                  //                 borderRadius: BorderRadius.circular(12),
                  //                 border: Border.all(color: Colors.indigo.withOpacity(0.2))),
                  //             child: ExpansionTile(
                  //                 expandedAlignment: Alignment.topLeft,
                  //                 expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  //                 backgroundColor: Colors.blue.withOpacity(0.03),
                  //                 collapsedIconColor: Colors.purple,
                  //                 iconColor: Colors.indigo,
                  //                 title: Text('${docProvider.myDocNames()[index]}'),
                  //                 //Text(provider.documentsnDetails[index].keys.map((e) => Text(e)).toList() as String),
                  //                 children: [
                  //                   Padding(
                  //                     padding: const EdgeInsets.all(8.0),
                  //                     child: ListTile(
                  //                       // isThreeLine: true,
                  //                       shape: RoundedRectangleBorder(
                  //                         //<-- SEE HERE
                  //                         side: const BorderSide(width: 0.2),
                  //                         borderRadius: BorderRadius.circular(12),
                  //                       ),
                  //                       focusColor: Colors.white,
                  //                       hoverColor: Colors.white,
                  //                       // leading: CircleAvatar(backgroundImage:AssetImage('images/lic.png'),radius: 15,),
                  //                       title: Consumer<MyDocsProvider>(
                  //                         builder: (context, pprovider, child) {
                  //                           return docProvider.myDocImages()[index] == ''
                  //                               ? TextButton.icon(
                  //                               onPressed: () {
                  //                                 docProvider.selectImage(context,
                  //                                     docProvider.myDocNames()[index]);
                  //                               },
                  //                               icon:
                  //                               const Icon(Icons.upload_file_rounded),
                  //                               label: const Text(
                  //                                 'Image Not Selected \n Click To Upload One ',
                  //                                 style: TextStyle(
                  //                                   color: Colors.indigo,
                  //                                   fontSize: 10,
                  //                                 ),
                  //                                 textAlign: TextAlign.center,
                  //                               ))
                  //                               : Padding(
                  //                             padding:
                  //                             const EdgeInsets.only(bottom: 4),
                  //                             child: SizedBox(
                  //                               height: MediaQuery.of(context).size.height/6,
                  //                               width: MediaQuery.of(context).size.height/6,
                  //                               child: Image.file(
                  //                                 File(
                  //                                   pprovider
                  //                                       .myDocImages()[index]
                  //                                       .toString(),
                  //                                 ),
                  //                                // fit: BoxFit.cover,
                  //                                 filterQuality: FilterQuality.low,
                  //                               ),
                  //                             ),
                  //                           );
                  //                         },
                  //                       ),
                  //                       subtitle: Consumer<MyDocsProvider>(
                  //                         builder: (context, pprovider, child){
                  //                           return docProvider.myDocImages()[index] != ''
                  //                               ?
                  //                           Row(
                  //                             mainAxisAlignment: MainAxisAlignment.end,
                  //                             children: [
                  //                               IconButton(onPressed: (){
                  //                                 docProvider.selectImage(context,
                  //                                     docProvider.myDocNames()[index]);
                  //                               },
                  //                                   icon: const Icon(Icons.edit,color: Colors.indigo,)),
                  //                               IconButton(
                  //                                   onPressed: (){
                  //                                     pprovider.deleteImage(docProvider.myDocNames()[index]);
                  //                                   },
                  //                                   icon: const Icon(Icons.delete,color: Colors.purple,)),
                  //                             ],): const SizedBox();
                  //                           // TextButton.icon(
                  //                           //     onPressed: () {
                  //                           //       provider.selectImage(context,
                  //                           //           provider.myDocNames()[index]);
                  //                           //     },
                  //                           //     icon:
                  //                           //     const Icon(Icons.upload_file_rounded),
                  //                           //     label: const Text(
                  //                           //       'Image Not Selected \n Click To Upload One ',
                  //                           //       style: TextStyle(
                  //                           //         color: Colors.indigo,
                  //                           //         fontSize: 10,
                  //                           //       ),
                  //                           //       textAlign: TextAlign.center,
                  //                           //     ))
                  //
                  //                           // Padding(
                  //                           //   padding:
                  //                           //   const EdgeInsets.only(bottom: 40),
                  //                           //   child: Image.file(
                  //                           //     File(
                  //                           //       pprovider
                  //                           //           .myDocImages()[index]
                  //                           //           .toString(),
                  //                           //     ),
                  //                           //     fit: BoxFit.fitWidth,
                  //                           //     filterQuality: FilterQuality.low,
                  //                           //   ),
                  //                           // );
                  //                         },
                  //                       ),
                  //
                  //                       // trailing: InkWell(
                  //                       //   onTap: () {},
                  //                       //   child: TextButton.icon(
                  //                       //     onPressed: () {
                  //                       //       provider.selectImage(
                  //                       //           context, provider.myDocNames()[index]);
                  //                       //     },
                  //                       //     icon: const Icon(
                  //                       //       Icons.add_box_rounded,
                  //                       //       color: Colors.indigo,
                  //                       //     ),
                  //                       //     label: Text('Upload Image'),
                  //                       //   ),
                  //                       // ),
                  //                     ),
                  //                   ),
                  //                   // ListTile(
                  //                   //     focusColor: Colors.white,
                  //                   //     hoverColor: Colors.white,
                  //                   //     title: ExpansionTile (
                  //                   //         collapsedIconColor: Colors.purple,
                  //                   //         iconColor: Colors.indigo,
                  //                   //         title:Text('${ExistingPliciesList[index]}'),
                  //                   //         children:[
                  //                   //           CustomAlertDialog(PolicyName: ExistingPliciesList[index].toString(),),
                  //                   //         ]
                  //                   //
                  //                   //     )
                  //                   //
                  //                   //
                  //                   // ),
                  //                 ]),
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
