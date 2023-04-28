import 'package:flutter/material.dart';
import '../models/app_bar.dart';

class NotificationPage extends StatelessWidget {
  static const routeName = '/NotificationPage';

  const NotificationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        elvtn: 0,
        automaticallyImplyLeading: true,
        bakgrndclr:  Colors.transparent,
        preferredSize: const Size.fromHeight(50.0),
        tlbarht: 100,
         flxblSpx: const Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 35),
          child: Icon(
            Icons.circle_notifications_sharp,
            color: Colors.indigo,
            size: 35,
          ),
        ),
      ),



        ),
      // AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.1,
      //   iconTheme: IconThemeData(
      //     color: Colors.indigo, // <-- SEE HERE
      //   ),
      //   title: Transform(
      //     transform:  Matrix4.translationValues(-10.0, 0.0, 0.0),
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(12),
      //       child: Container(
      //           width: 100,
      //           color: Colors.teal,
      //
      //
      //           child: Image(image: AssetImage('images/insugo_logo.png'),)),
      //     ),
      //   ),
      //   centerTitle:false,
      //   // actions: [IconButton(onPressed: () {}, icon:  Icon(Icons.settings))],
      // ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              elevation: 4.0,
              child: ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notification Title'),
                subtitle: const Text('Notification Description'),
                trailing: const Text('10m ago'),
                onTap: () {
                  // Handle notification tap
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
