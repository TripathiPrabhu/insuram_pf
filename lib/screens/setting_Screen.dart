import 'package:flutter/material.dart';
import 'package:insuram_pf/screens/home_page.dart';

import '../models/app_bar.dart';


class SettingScreen extends StatefulWidget {
  static const routeName = 'SettingScreen';
  TextEditingController mobile1InputController = TextEditingController();

  SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool editButtonClicked = true;
  final List<TextEditingController> _controllers = [TextEditingController()];




  List<Widget> _textFields = [

    Padding(
      padding:  const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 47,
        child: TextFormField(
        controller: mobile1InputController,
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.phone_android,
                  size: 26,
                  color: Color(0XFF28527A),
                ),
                hintText: '      Enter Your Mobile Number -1',
                helperStyle: const TextStyle(
                  color: Colors.blueGrey,
                ),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 0),
                border: OutlineInputBorder(
                  gapPadding: 10,
                  // borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ))
  ),
      ),
    )];

  static get mobile1InputController => TextEditingController();

  void _addTextField() {
    setState(() {
      _textFields = List.from(_textFields)..add(
          SizedBox(
            height: 98,
            child: Padding(
        padding:  const EdgeInsets.symmetric(vertical: 4),
        child: TextFormField(
          controller: _controllers[0],
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.phone_android,
                  size: 26,
                  color: Color(0XFF28527A),
                ),
                hintText: '      Enter Your Phone Number - ${_textFields.length+1}',
                helperStyle: const TextStyle(
                  color: Colors.blueGrey,
                ),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 4),
                border: OutlineInputBorder(
                  gapPadding: 10,
                  // borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ))
        ),
      ),
          ));
      if (_textFields.length > 3) {
        _textFields.removeLast();
      }

    });
  }

  void _removeTextField() {
    setState(() {
      if (_textFields.length > 1) {
        _textFields.removeLast();
      }

    });
  }





  TextEditingController emailInputController = TextEditingController();
  TextEditingController nameInputController = TextEditingController();
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Save Data'),
            content: const Text('Your Data Has Been Saved !'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: const Text('Ok'),
              ),

              ElevatedButton(
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    Navigator.pushNamed(context, HomePage.routeName);
                  });
                  // if (Platform.isAndroid) {
                  // SystemNavigator.pop();
                  // } else if (Platform.isIOS) {
                  // exit(0);
                  // }
                },
                child: const Text('GO TO Home'),
              ),

              //return true when click on "Yes
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
  //  for(int i =0; i<_controllers.length; i++)
   //  print(mobile1InputController);
   // print(mobile1InputController.text);

    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: CustomAppBar(
                elvtn: 0,
                automaticallyImplyLeading: true,
                bakgrndclr: Colors.transparent,
                preferredSize: const Size.fromHeight(100.0),
                tlbarht: 0,
                flxblSpx: const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: Icon(
            Icons.settings_applications_sharp,
            color: Colors.indigo,
            size: 35,
          ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 0, left: 20),
                //   child: badges.Badge(
                //       position: badges.BadgePosition.topEnd(top: 6, end: 25),
                //       showBadge: true,
                //       ignorePointer: false,
                //       onTap: () {},
                //       badgeContent: const Icon(
                //         Icons.settings,
                //         color: Colors.white,
                //         size: 30,
                //       ),
                //       badgeAnimation: const badges.BadgeAnimation.rotation(
                //         animationDuration: Duration(seconds: 2),
                //         colorChangeAnimationDuration: Duration(seconds: 3),
                //         loopAnimation: false,
                //         curve: Curves.fastOutSlowIn,
                //         colorChangeAnimationCurve: Curves.easeInCubic,
                //       ),
                //       badgeStyle: badges.BadgeStyle(
                //         shape: badges.BadgeShape.square,
                //         //badgeColor: Colors.indigo,
                //         padding: const EdgeInsets.all(5),
                //         borderRadius: BorderRadius.circular(8),
                //         borderSide: BorderSide(
                //             color: Colors.white.withOpacity(0.90), width: 4),
                //         elevation: 0,
                //       ),
                //       child: const SizedBox(
                //         height: 50,
                //         width: 50,
                //       )),
                // ),
              ),
            ),

            //###################### Body goes here
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  ###################### EDIT Button goes here

                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         begin: Alignment.topRight,
                    //         end: Alignment.bottomLeft,
                    //         stops: const [
                    //           0.4,
                    //           0.9,
                    //         ],
                    //         colors: [
                    //           Colors.indigo.withOpacity(0.01),
                    //           Colors.purple.withOpacity(0.5),
                    //         ],
                    //       ),
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     height: 50,
                    //     width: 100,
                    //     child: FloatingActionButton(
                    //       backgroundColor: Colors.indigo.withOpacity(0.8),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(12)),
                    //       child: DefaultTextStyle(
                    //         style: const TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.w900),
                    //         child: Center(
                    //           child: AnimatedTextKit(
                    //             repeatForever: true,
                    //             isRepeatingAnimation: true,
                    //             animatedTexts: [
                    //               TypewriterAnimatedText('Edit'),
                    //               TypewriterAnimatedText('Edit'),
                    //               TypewriterAnimatedText('Edit'),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //       onPressed: () {
                    //         setState(() {
                    //           editButtonClicked == false;
                    //         });
                    //       },
                    //     ),
                    //   ),
                    // ),

                    ///####################  Input Fields Goes Here///////////////

                    // Column(
                    //   children: [
                    //     TextFormField(
                    //       keyboardType: TextInputType.phone,
                    //       controller: _controllers[0],
                    //       inputFormatters: [
                    //          FilteringTextInputFormatter.allow(RegExp(r'\d')),
                    //       LengthLimitingTextInputFormatter(10) // limit to 10 digits
                    //        ],
                    //       decoration: InputDecoration(
                    //
                    //         labelText: 'Phone Number-1',
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(12)
                    //         )
                    //       ),
                    //     ),
                    //
                    //     ..._controllers.asMap().entries.map(
                    //           (entry) => Padding(
                    //             padding: const EdgeInsets.only(top: 8.0),
                    //             child: Column(
                    //               children: [
                    //
                    //                  Padding(
                    //                   padding: EdgeInsets.all(8.0),
                    //                   child: Align(
                    //                     alignment: Alignment.topLeft,
                    //                     child: Text(
                    //                       'Phone Number-${entry.key + 2}',
                    //                       style: TextStyle(
                    //                         color: Colors.indigo,
                    //                         fontWeight: FontWeight.w700,
                    //                         fontSize: 14,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 TextFormField(
                    //                   controller: entry.value,
                    //                   decoration: InputDecoration(
                    //                     border: OutlineInputBorder(
                    //                       borderRadius: BorderRadius.circular(12)
                    //                     ),
                    //                     labelText: 'Enter Mobile Number- ${entry.key + 2}',
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.end,
                    //       children: [
                    //         IconButton(
                    //           icon: Icon(Icons.add),
                    //           onPressed: () {
                    //             setState(() {
                    //               _controllers.add(TextEditingController());
                    //             });
                    //           },
                    //         ),
                    //
                    //       ],
                    //     ),
                    //   ],
                    // ),

                    // TextFormField(
                    //     keyboardType: TextInputType.phone,
                    //   inputFormatters: [
                    //   FilteringTextInputFormatter.allow(RegExp(r'\d')),
                    //   LengthLimitingTextInputFormatter(10) // limit to 10 digits
                    //   ],
                    //     controller: mobile1InputController,
                    //     decoration: InputDecoration(
                    //         prefixIcon: const Icon(
                    //           Icons.phone,
                    //           size: 26,
                    //           color: Color(0XFF28527A),
                    //         ),
                    //         hintText: '      Mobile-1',
                    //         helperStyle: const TextStyle(
                    //           color: Colors.blueGrey,
                    //         ),
                    //         contentPadding:
                    //         const EdgeInsets.symmetric(
                    //             horizontal: 15),
                    //         border: OutlineInputBorder(
                    //           gapPadding: 10,
                    //          // borderSide: BorderSide.none,
                    //           borderRadius:
                    //           BorderRadius.circular(12),
                    //         ))),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Phone - 1',
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              ..._textFields,

                        ],),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.add_circle,size: 35,color: Colors.indigo,),
                              onPressed: _addTextField,
                            ),


                            IconButton(
                              icon: Icon(Icons.remove_circle_sharp,color:
                              _textFields.length>1?Colors.indigo:Colors.indigo.shade50,size: 35,),
                              onPressed: _removeTextField,
                            )
                          ],
                        ),
                      ],
                    ),



                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailInputController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                              size: 26,
                              color: Color(0XFF28527A),
                            ),
                            hintText: '      Enter Your Email Address',
                            helperStyle: const TextStyle(
                              color: Colors.blueGrey,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            border: OutlineInputBorder(
                              gapPadding: 10,
                              // borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12),
                            ))),

                    const SizedBox(
                      height: 10,
                    ),

                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        controller: nameInputController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.abc,
                              size: 26,
                              color: Color(0XFF28527A),
                            ),
                            hintText: '      Enter Your Name',
                            helperStyle: const TextStyle(
                              color: Colors.blueGrey,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            border: OutlineInputBorder(
                              gapPadding: 10,
                              // borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12),
                            ))),

                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: showExitPopup,
                            child: Container(
                              height: 40,
                              width: 120,

                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SizedBox(
                                      width: 15,
                                      child: Center(
                                          child: Icon(
                                        Icons.logout,
                                        size: 25,
                                        color: Colors.black,
                                      )),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Logout',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
