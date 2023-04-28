import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/doc_image_name_provider.dart';

class SelectedDocNameAndImageList extends StatelessWidget {
  final bool? showEditDelete;
   SelectedDocNameAndImageList({Key? key, required this.showEditDelete}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<MyDocsProvider>(context, listen:  false);
   // print('${provider.myDocu[0]['${provider.myDocNames()[0]}'].length}-001');
  //  print('${provider.myDocNames()}-002');
   // print('${provider.selectedDocToUploadImage}-002');

    return Column(
        children: [
          provider.dropdownValue !='Select Document'?
          SingleChildScrollView(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                    child: Container(
                      //height: 60,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Colors.indigo.withOpacity(0.2))),
                      child: ExpansionTile(
                        initiallyExpanded: true,
                          expandedAlignment: Alignment.topLeft,
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          backgroundColor: Colors.blue.withOpacity(0.03),
                          collapsedIconColor: Colors.purple,
                          iconColor: Colors.indigo,
                          title: Text('${'${provider.selectedDocToUploadImage[index]}'}'),
                          //Text(provider.documentsnDetails[index].keys.map((e) => Text(e)).toList() as String),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                // isThreeLine: true,
                                shape: RoundedRectangleBorder(
                                  //<-- SEE HERE
                                  side: const BorderSide(width: 0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusColor: Colors.white,
                                hoverColor: Colors.white,
                                // leading: CircleAvatar(backgroundImage:AssetImage('images/lic.png'),radius: 15,),
                                title: Consumer<MyDocsProvider>(
                                  builder: (context, myDocsProvider, child) {

                                    return
                                      myDocsProvider.myDocu[0]['${myDocsProvider.selectedDocToUploadImage[index]}'].isEmpty
                                        ?
                                      TextButton.icon(
                                        onPressed: () {
                                          provider.selectImage(context,
                                              provider.selectedDocToUploadImage[index]);
                                        },
                                        icon:
                                        const Icon(Icons.upload_file_rounded),
                                        label: const Text(
                                          'Image Not Selected \n Click To Upload One ',
                                          style: TextStyle(
                                            color: Colors.indigo,
                                            fontSize: 10,
                                          ),
                                          textAlign: TextAlign.center,
                                        ))
                                        :
                                      Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 4),
                                      child: SizedBox(
                                        height: MediaQuery.of(context).size.height/6,
                                        width: MediaQuery.of(context).size.height/6,
                                        child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                          child: Row(

                                            children: [
                                              for(int i =0; i<myDocsProvider.myDocu[0]['${myDocsProvider.selectedDocToUploadImage[index]}'].length; i++)
                                              SizedBox(
                                                height:140 ,
                                                width: 50,
                                                child:

                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Image.file(
                                                        File(myDocsProvider.myDocu[0]['${myDocsProvider.selectedDocToUploadImage[index]}'][i].path,

                                                                        ),
                                                                        filterQuality: FilterQuality.low,
                                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                                      ),
                                                    );

  },
),
                                        // Image.file(
                                        //   File(
                                        //     myDocsProvider.myDocu[0]['${myDocsProvider.selectedDocToUploadImage[index]}'],
                                        //   ),
                                        //   // fit: BoxFit.cover,
                                        //   filterQuality: FilterQuality.low,
                                        // ),



                                subtitle:
                                     provider.dropdownValue != ''
                                        ?
                                        showEditDelete ==false && provider.dropdownValue != ''?
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(onPressed: (){
                                          provider.selectImage(context,
                                              provider.selectedDocToUploadImage[index]);
                                        },
                                            icon: const Icon(Icons.edit,color: Colors.indigo,)),
                                        IconButton(
                                            onPressed: (){
                                              provider.deleteImage(provider.selectedDocToUploadImage[index]);
                                            },
                                            icon: const Icon(Icons.delete,color: Colors.purple,)),
                                      ],): const SizedBox():SizedBox()
                                    // TextButton.icon(
                                    //     onPressed: () {
                                    //       provider.selectImage(context,
                                    //           provider.myDocNames()[index]);
                                    //     },
                                    //     icon:
                                    //     const Icon(Icons.upload_file_rounded),
                                    //     label: const Text(
                                    //       'Image Not Selected \n Click To Upload One ',
                                    //       style: TextStyle(
                                    //         color: Colors.indigo,
                                    //         fontSize: 10,
                                    //       ),
                                    //       textAlign: TextAlign.center,
                                    //     ))

                                    // Padding(
                                    //   padding:
                                    //   const EdgeInsets.only(bottom: 40),
                                    //   child: Image.file(
                                    //     File(
                                    //       pprovider
                                    //           .myDocImages()[index]
                                    //           .toString(),
                                    //     ),
                                    //     fit: BoxFit.fitWidth,
                                    //     filterQuality: FilterQuality.low,
                                    //   ),
                                    // );

                                ),

                                // trailing: InkWell(
                                //   onTap: () {},
                                //   child: TextButton.icon(
                                //     onPressed: () {
                                //       provider.selectImage(
                                //           context, provider.myDocNames()[index]);
                                //     },
                                //     icon: const Icon(
                                //       Icons.add_box_rounded,
                                //       color: Colors.indigo,
                                //     ),
                                //     label: Text('Upload Image'),
                                //   ),
                                // ),
                              ),

                            // ListTile(
                            //     focusColor: Colors.white,
                            //     hoverColor: Colors.white,
                            //     title: ExpansionTile (
                            //         collapsedIconColor: Colors.purple,
                            //         iconColor: Colors.indigo,
                            //         title:Text('${ExistingPliciesList[index]}'),
                            //         children:[
                            //           CustomAlertDialog(PolicyName: ExistingPliciesList[index].toString(),),
                            //         ]
                            //
                            //     )
                            //
                            //
                            // ),
                          ]
                      ),
                    ),
                  );
                },
                itemCount: provider.selectedDocToUploadImage.length,
                // primary: true,
                 physics: BouncingScrollPhysics(),
                shrinkWrap: true,
              )
          ):SizedBox(),

        ]
    );
  }
}
