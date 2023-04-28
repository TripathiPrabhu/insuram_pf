import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String? hintText;
  String? inputData;
  final String? lblText;
  final TextEditingController? myController;
  final TextInputType? kebrdTyp;
  final FormFieldValidator<String>? formFieldValidator;
  //final  VoidCallbackAction? onChngd;
 // final  VoidCallbackAction? onSvd;



   MyTextField({super.key, required this.hintText,
      this.myController,
      required this.lblText,
      this.kebrdTyp,
      required this.inputData,
      this.formFieldValidator,


   });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: widget.kebrdTyp,
      controller: widget.myController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => widget.formFieldValidator!(value!),
      onChanged: (value) {
        setState(() {
          widget.inputData = value;
        });
      },
      onSaved: (value) {
        setState(() {
          widget.inputData = value!;
        });
      },



      style:  const TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold, letterSpacing: 1.5),
      obscureText: false,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.indigo,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.purple
            ),
          ),
          labelText: widget.lblText,
          labelStyle: const TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,fontSize: 16),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.indigo),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
