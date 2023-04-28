import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Color? bakgrndclr;
 final  bool? automaticallyImplyLeading;
  final double? elvtn;
  final double? tlbarht;
  final Widget flxblSpx;

  CustomAppBar(
      {super.key,
        required this.tlbarht,
        required this.flxblSpx,
    required this.elvtn,
    required this.automaticallyImplyLeading,
   required this.bakgrndclr,
    //required this.titl,
    required this.preferredSize,
}
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: SizedBox(
          height: 45,
          width: 60,
          child: flxblSpx),
      backgroundColor: bakgrndclr,
      elevation: elvtn,
        iconTheme: const IconThemeData(
        color: Colors.indigo),
      title: Transform(
    transform:  Matrix4.translationValues(-10.0, 0.0, 0.0),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child:  Container(
      padding: const EdgeInsets.all(10),
      width: 80,
      //  height: 40,
      decoration: BoxDecoration(

          color: Colors.indigo,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: Colors.indigo)),
      child: Center(
          child: Image.asset('images/Insugo_logo.png',fit: BoxFit.fitHeight,)
      ),
    ),
    ),
    ),


    );
  }
}