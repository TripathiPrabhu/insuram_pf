import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insuram_pf/provider/add_policy_provider.dart';
import 'package:insuram_pf/screens/get_a_quote.dart';
import 'package:insuram_pf/screens/setting_Screen.dart';
import 'package:provider/provider.dart';
import 'package:test/expect.dart';
import '../home_Screen_helpers/view_add_home_screen_existing_policies.dart';
import 'notification_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/HomePage';
  const HomePage({Key? key}) : super(key: key);

  // Future<bool> showExitPopup(mycontext) async {
  //   return await showDialog(
  //     context: mycontext,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Exit App'),
  //       content: const Text('Do you want to LogOut?'),
  //       actions: [
  //         ElevatedButton(
  //           onPressed: () => Navigator.of(context).pop(false),
  //           //return false when click on "NO"
  //           child: const Text('No'),
  //         ),
  //
  //         ElevatedButton(
  //           onPressed: () {
  //             Future.delayed(const Duration(milliseconds: 200), () {
  //               SystemChannels.platform
  //                   .invokeMethod('SystemNavigator.pop');
  //             });
  //
  //           },
  //           child: const Text('Yes'),
  //         ),
  //       ],
  //     ),
  //   ) ??
  //       false; //if showDialouge had returned null, then return false
  // }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddPolicyProvider>(context, listen: false);
    print('building.......');
    return  WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Do you want to Exit?'),
              actionsAlignment: MainAxisAlignment.end,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Yes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
        // extendBodyBehindAppBar: true,
        appBar: PreferredSize(

          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            //backgroundColor: Colors.indigo.withOpacity(0.034),
             backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            // iconTheme: IconThemeData(color: Colors.red),
            elevation: 0.0,
            toolbarHeight: 80, // Set this height
            flexibleSpace: Padding(
              padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // //#############################ADD POLICY BUTTON
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Container(
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
                      ),
                      Flexible(child: Container()),
                      IconButton(
                        padding: const EdgeInsets.only(top: 12),
                        onPressed: () {
                          Navigator.pushNamed(context, NotificationPage.routeName);
                        },
                        icon: Center(
                            child: Icon(
                              Icons.notifications,
                              size: 35,
                              // color: Colors.black,
                              color: Colors.indigo.withOpacity(0.8),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        padding: const EdgeInsets.only(top: 12),
                        onPressed: () {
                          Navigator.pushNamed(context, SettingScreen.routeName);
                        },
                        icon: Icon(
                          Icons.settings,
                          size: 35,
                          color: Colors.indigo.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //////////// Existing Policies Start here &&& Documents  /////////////
                

                homeScreenExistingPoliciesSection(context,0),


             // ListView.builder(
             //   physics: ScrollPhysics(),
             //     itemBuilder: (context, index){
             //       return homeScreenExistingPoliciesSection(context,index);
             //
             //     },
             //     shrinkWrap: true,
             //     itemCount:  provider.existingPolicies['Health Insurance'].isNotEmpty?
             //     provider.existingPolicies['Health Insurance'].length:1
             //
             //
             // ),


              //////////// Devider Start here /////////////
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
////////////////////Available policies Start here

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Available Policies',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.purple.withOpacity(0.8)),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const GetAQuote(withIcons: true,
                            destinationEmail: 'prabhuveramasa1@gmail.com')));
                      },
                      color: Colors.indigo,
                      splashColor: Colors.teal,
                      hoverColor: Colors.purple,

                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Get A Quote',
                        style: TextStyle(fontSize: 16,color: Colors.white,
                          fontWeight: FontWeight.w600,),

                      ),
                    ),
                  ),
                ),
              ],
            )

              // Padding(
              //   padding:
              //   const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              //   child: GridView.builder(
              //     // scrollDirection: Axis.vertical,
              //       itemCount: 6,
              //       //provider.AvailablePliciesList.length,
              //       shrinkWrap: true,
              //       physics: const NeverScrollableScrollPhysics(),
              //       gridDelegate:
              //       const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         mainAxisSpacing: 5,
              //         crossAxisSpacing: 5,
              //         childAspectRatio: 2.5,
              //       ),
              //       itemBuilder: (context, index) {
              //         return Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: InkWell(
              //             highlightColor: Colors.purple,
              //             splashColor: Colors.indigo,
              //             onTap: (){
              //              // provider.launchURL(index);
              //             },
              //             child: GridTile(
              //               child: Container(
              //                 height: 150,
              //                 width: 100,
              //                 decoration: BoxDecoration(
              //
              //                     color: Colors.indigo.withOpacity(0.1),
              //                     borderRadius: BorderRadius.circular(12),
              //                     border: Border.all(
              //                         color: Colors.indigo.withOpacity(0.2))),
              //                 child: const Center(
              //                     child: Text('hii'
              //                         //provider.AvailablePliciesList[index]
              //         )),
              //               ),
              //             ),
              //           ),
              //         );
              //       }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
