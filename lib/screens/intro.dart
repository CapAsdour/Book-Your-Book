import 'dart:ui';

import 'package:book_ur_book/screens/home.dart';
import 'package:book_ur_book/screens/login.dart';
import 'package:book_ur_book/session/session_management.dart';
import 'package:book_ur_book/storage/local_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: _initialization,
      builder: (BuildContext cxt, AsyncSnapshot snapshot) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                //Spacer(),
                Text(""),
                Text(
                  "Let's Chit Chat!",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                imageZone(),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      //based on the connection with server,
                      //trying to initiate routing
                      if (snapshot.connectionState == ConnectionState.done) {
                        //routing screens
                        performRouting(context);
                      } else {
                        // ignore: todo
                        //TODO:add widget
                        print('Network not connected');
                      }
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(fontFamily: 'Comfortaa'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget imageZone() {
    return Container(
      height: 400,
      child: PageView.builder(
        itemBuilder: (ctx, index) => Column(
          children: [
            Expanded(
              child: ClipRRect(
                child: Image.asset(LocalData.pagerList[index]['image']),
              ),
            ),
            Text(LocalData.pagerList[index]['title'])
          ],
        ),
        itemCount: LocalData.pagerList.length,
      ),
    );
  }

  void performRouting(BuildContext context) {
    SessionManagement.getLoginStatus().then((value) {
      if (value)
        Navigator.pushReplacementNamed(context, HomeScreen.ROUTE_NEXT);
      else
        Navigator.pushReplacementNamed(context, LoginScreen.ROUTE_LOGIN);
    }).catchError((onError) => print(onError));
  }
}