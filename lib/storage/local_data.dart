import 'package:book_ur_book/custom_widget/homepage.dart';
import 'package:book_ur_book/custom_widget/profile.dart';

class LocalData {
  static const List<Map<String, String>> pagerList = [
    {'image': 'assets/images/bklogo.jpg', 'title': 'Send & Recieve Messages'},
    {'image': 'assets/images/bklogo.jpg', 'title': 'Be Connected'},
    {'image': 'assets/images/bklogo.jpg', 'title': 'Safe and Secure'},
  ];
  static List<Map<String, dynamic>> bottomNavList = [
    {
      'Screen': HomePage(),
      'title': 'Home',
    },
    {
      'Screen': '',//Contacts(),
      'title': 'Contacts',
    },
    {
      'Screen': Profile(),
      'title': 'Profile',
    },
  ];
}