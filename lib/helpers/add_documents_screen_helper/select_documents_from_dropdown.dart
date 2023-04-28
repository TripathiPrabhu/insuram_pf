import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/doc_image_name_provider.dart';

class SelectDocumentsDropDown extends StatefulWidget {
  const SelectDocumentsDropDown({Key? key}) : super(key: key);

  @override
  State<SelectDocumentsDropDown> createState() => _SelectDocumentsDropDownState();
}

class _SelectDocumentsDropDownState extends State<SelectDocumentsDropDown> {


  @override
  Widget build(BuildContext context) {
    final docProvider = Provider.of<MyDocsProvider>(context, listen: true);
    print(docProvider.dropdownValue);
    return Column(children: [
      SingleChildScrollView(
        child: Consumer<MyDocsProvider>(
          builder: (context, myDocsProvider, child) {
            return InkWell(
                onTap: (){
                  myDocsProvider.changeIsOpen();
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
                        Text(myDocsProvider.dropdownValue!,style: TextStyle(fontWeight: FontWeight.w600,color: Colors.purple.withOpacity(0.8),),),
                        myDocsProvider.isOpen==false?const Icon(Icons.arrow_drop_down,size:30,  color: Colors.indigo,) :SizedBox()
                      ],
                    ),
                  ),

                )
            );
          },
        ),
      ),

      Consumer<MyDocsProvider>(
        builder: (context, myDocsProvider, child) {
          return
            myDocsProvider.isOpen==true?
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
                  docProvider.myDocu[0].keys.map((e) => InkWell(
                    onTap: (){
                      myDocsProvider.dropdownValue = e;
                     // myDocsProvider.selectedDocToUploadImage.add(myDocsProvider.dropdownValue);
                      //myDocsProvider.addToList(myDocsProvider.dropdownValue.toString());

                        if (!myDocsProvider.selectedDocToUploadImage.contains(myDocsProvider.dropdownValue)) {
                          myDocsProvider.selectedDocToUploadImage.add(myDocsProvider.dropdownValue);
                        };
                        print( myDocsProvider.selectedDocToUploadImage);


                      myDocsProvider.changeIsOpen();

                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8
                      ),
                      child: Text(e,style:
                      TextStyle(fontWeight: FontWeight.w600,color: Colors.purple.withOpacity(0.8), ),),
                    ),
                  )).toList()

              ),
            ):const SizedBox();
        },
      )
    ],);
  }
}


