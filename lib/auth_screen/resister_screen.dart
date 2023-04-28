import 'package:flutter/material.dart';
import '../models/text_fields.dart';
import 'login_screen.dart';

class MyRegister extends StatefulWidget {
  static const routeName = '/MyRegister';
  const MyRegister({Key? key}) : super(key: key);

  @override
  MyRegisterState createState() => MyRegisterState();
}

class MyRegisterState extends State<MyRegister> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String? name;
  String? mobile;
  String? email;
  String? password;
  String? confirmPassword;


  @override
  void dispose() {
    // Disposing [_nameEditingController]
    nameController.dispose();
    mobileController.dispose();
    // Disposing [_emailEditingController]
    emailController.dispose();
    // Disposing [_messageEditingController]
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }



  /// [_validateName] validates the value of [_name]
  String? _validateName(String name) {
    // Regular Expression for fullname (a space between first name and second name)
    String nameRegExp = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";

    if (name.isEmpty) {
      // Name field should not be empty
      return 'Enter your name';
    }
    if (!RegExp(nameRegExp).hasMatch(name)) {
      // If the value in name field doesn't match with the regular expression
      // then it throws an error message.
      return 'Give a space between \nyour first name and last name';
    }
    return null;

  }

  /// [_validateMobile] validates the value of [_mobile]
  String? _validateMobile(String mobile ) {
    // Regular Expression for mpbile
    String mobileRegExp = (r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if (mobile.isEmpty) {
      // Name field should not be empty
      return 'Enter your mobile number';
    }
    if (!RegExp(mobileRegExp).hasMatch(mobile)) {
      // If the value in email field doesn't match with the regular expression
      // then it throws an error message.
      return 'Enter correctly.\nexample: 9685XXXX81';
    }
    return null;

  }

  /// [_validateEmail] validates the value of [_email]
  String? _validateEmail(String email) {
    // Regular Expression for email
    String emailRegExp =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    if (email.isEmpty) {
      // Name field should not be empty
      return 'Enter your email';
    }
    if (!RegExp(emailRegExp).hasMatch(email)) {
      // If the value in email field doesn't match with the regular expression
      // then it throws an error message.
      return 'Enter correctly.\nexample: username@example.com';
    }
    return null;
  }



  /// [_validatePassword] validates the value of [_password]
  String? _validatePassword(String password) {
    String passRegExp = r'^(?=.*?[!@#\$&*~]).{8,}$';
    if (password.isEmpty) {
      // Message field should not be empty
      return 'Password is empty. Please fill it.';
    }
    if (!RegExp(passRegExp).hasMatch(password)) {
      // If the value in email field doesn't match with the regular expression
      // then it throws an error message.
      return 'Enter correctly.\nexample: Abcd@12345';
    }
    return null;

  }

  /// [_validatePassword] validates the value of [_confirmPassword]
  String? _validateConfirmPassword(String confirmPassword) {
    if (confirmPassword.isEmpty) {
      // Message field should not be empty
      return 'Confirm Password is empty. Please fill it.';
    }
    if (passwordController.text == confirmPasswordController.text) {
      // If the value in email field doesn't match with the regular expression
      // then it throws an error message.
      return  null;
    }else{
      return 'Password mismatched';
    }

  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(

       gradient: LinearGradient(
           colors: [
             Colors.indigo.withOpacity(0.3),
             Colors.purple.withOpacity(0.3)
           ])      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Create Account',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          elevation: 0,
        ),
        body: Stack(
          children: [

            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  //color: Colors.red,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 120,
                        child: Image.asset('images/Insugo_logo.png'),
                      ),
                      const SizedBox(height: 40,),
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            MyTextField(hintText: 'Enter Name',
                              myController: nameController,
                              lblText: 'Name',
                              inputData: nameController.text,
                              formFieldValidator: (String? value) {
                              return
                              _validateName(nameController.text);
                              },),
                              const SizedBox(height: 20,),

                            MyTextField(
                              hintText: 'Enter Mobile',
                              myController: mobileController,
                              kebrdTyp: TextInputType.phone,
                              lblText: 'Mobile',
                              inputData: mobileController.text,
                              formFieldValidator: (String? value) {
                                return
                                _validateMobile(mobileController.text);
                              },),
                            const SizedBox(height: 20,),

                            MyTextField(
                              hintText: 'Enter Email',
                              myController: emailController,
                              kebrdTyp: TextInputType.emailAddress,
                              lblText: 'Email',
                              inputData: emailController.text,
                              formFieldValidator: (String? value) {
                                return
                                _validateEmail(emailController.text);
                              },),
                            const SizedBox(
                              height: 20,
                            ),
                            MyTextField(hintText: 'Enter Password',
                              myController: passwordController,
                              lblText: 'Password',
                              inputData: passwordController.text,
                              formFieldValidator: (String? value) {
                              return
                              _validatePassword(passwordController.text);
                              },),
                            const SizedBox(height: 20,),
                            MyTextField(
                              hintText: 'Enter Password Again',
                              myController: confirmPasswordController,
                              lblText: 'Confirm Password',
                              inputData: confirmPasswordController.text,
                              formFieldValidator: (String? value) {
                                return
                                _validateConfirmPassword(confirmPasswordController.text);
                              },),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: (){
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          setState(() {
                                            const SnackBar(content: Text('Congratulations ! \n You Have Resistered Successfully '));


                                            showDialog(
                                              barrierDismissible: true,
                                              context: context,
                                              builder: (context) {
                                                return StatefulBuilder(builder: (context, setState) {
                                                  return  AlertDialog(
                                                    shadowColor: Colors.indigo.withOpacity(0.5),
                                                    title: const Text('We Will Get Back To You \nVery Soon',textAlign: TextAlign.center,),
                                                  );},);},);
                                            Future.delayed(const Duration(seconds: 2),
                                              // ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()))
                                              // _sendEmail(
                                              //   name: name.toString(),
                                              //   destEmail: widget.destinationEmail,
                                              //   body: message.toString(),
                                            );
                                          });
                                        }


                                        },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                               child: const Text(
                                         'Sign In',
                                                textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                decoration: TextDecoration.underline,
                                            color: Colors.white,
                                          fontSize: 18),
                                               ),

                                  onPressed:
                                      () {
                                 Navigator.pushNamed(context, MyLogin.routeName);
                                  }
                              //style: const ButtonStyle(),

                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}