import 'package:flutter/material.dart';
import 'package:insuram_pf/provider/add_policy_provider.dart';
import 'package:insuram_pf/provider/doc_image_name_provider.dart';
import 'package:insuram_pf/screens/add_documents_screen.dart';
import 'package:insuram_pf/screens/notification_page.dart';
import 'package:insuram_pf/screens/setting_Screen.dart';
import 'package:insuram_pf/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'auth_screen/login_screen.dart';
import 'auth_screen/resister_screen.dart';
import 'screens/add_policy_screen.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<MyDocsProvider>(create: (_) => MyDocsProvider()),
        ChangeNotifierProvider<AddPolicyProvider>(create: (_) => AddPolicyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:  HomePage.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          MyRegister.routeName: (context) => const MyRegister(),
          MyLogin.routeName: (context) => const MyLogin(),
          HomePage.routeName :(context) =>  HomePage(),
          EnterPolicyData.routeName :(context)=> const EnterPolicyData(),
          SettingScreen.routeName :(context)=> SettingScreen(),
          NotificationPage.routeName :(context)=> const NotificationPage(),
          UploadEditDocScreen.routeName :(context)=> const UploadEditDocScreen(),
        },
      ),
    );
  }
}
