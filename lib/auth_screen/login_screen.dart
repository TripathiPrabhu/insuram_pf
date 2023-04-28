import 'package:flutter/material.dart';
import 'package:insuram_pf/auth_screen/resister_screen.dart';
import '../screens/home_page.dart';
import '../models/text_fields.dart';

class MyLogin extends StatefulWidget {
  static const routeName = '/MyLogin';
  const MyLogin({Key? key}) : super(key: key);

  @override
  MyLoginState createState() => MyLoginState();
}

class MyLoginState extends State<MyLogin> {
  TextEditingController loginmobileEmailController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 135,
              bottom: 20),
              child: const Text(
                'Welcome Back',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          MyTextField(
                            hintText: 'Enter Mobile/Email',
                            myController: loginmobileEmailController,
                            lblText: 'Mobile/Email',
                            kebrdTyp: TextInputType.emailAddress,
                            inputData: loginmobileEmailController.text,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          MyTextField(
                            hintText: 'Enter Password',
                            myController: loginpasswordController,
                            lblText: 'Password',
                            inputData: loginpasswordController.text,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.pushNamed(context, HomePage.routeName);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, MyRegister.routeName);
                                },
                                style: const ButtonStyle(),
                                child: const Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
