import 'package:book_ur_book/screens/login.dart';
import 'package:book_ur_book/session/session_management.dart';
import 'package:book_ur_book/storage/local_data.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  static const ROUTE_NEXT = '/route-dashboard';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalData.bottomNavList[_selectedIndex]['title']),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: TextButton.icon(
                  icon: Icon(Icons.remove_circle),
                  label: Text('Logout'),
                  onPressed: () => showAlertDialog(context),
                ),
              ),
            ],
          ),
        ],
      ),
      body: LocalData.bottomNavList[_selectedIndex]['Screen'],
      bottomNavigationBar: createBottomNav(),
    );
  }

  Widget createBottomNav() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: LocalData.bottomNavList[0]['title'],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: LocalData.bottomNavList[1]['title'],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: LocalData.bottomNavList[2]['title'],
        ),
      ],
      backgroundColor: Colors.amber[700],
      selectedItemColor: Colors.white,
      currentIndex: _selectedIndex,
      onTap: (int cIndex) {
        setState(() {
          _selectedIndex = cIndex;
        });
      },
    );
  }

  void showAlertDialog(
      BuildContext ctx,
      ) {
    showDialog(
        context: ctx,
        barrierDismissible: false,
        builder: (BuildContext con) => AlertDialog(
          title: Text('Logout Dialog'),
          content: Text('Dou you really want to sign out?'),
          actions: [
            IconButton(
              icon: Icon(Icons.cancel,color:Colors.purple),
              onPressed: () => Navigator.pop(ctx),
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app_sharp,color: Colors.purple),
              onPressed: () {
                SessionManagement.removeUser().then((value) =>
                    Navigator.pushNamedAndRemoveUntil(context,
                        LoginScreen.ROUTE_LOGIN, (route) => false));
              },
            ),
          ],
        ));
  }
}