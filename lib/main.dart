import 'package:flutter/material.dart';
import 'package:social_media_app/screens/login_page.dart';

void main() {
  runApp(SocialMediaApp());
}

class SocialMediaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

