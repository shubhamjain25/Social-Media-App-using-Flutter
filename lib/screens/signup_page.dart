import 'package:flutter/material.dart';
import 'package:social_media_app/screens/home_page.dart';
import 'package:social_media_app/screens/login_page.dart';
import 'package:social_media_app/widgets/circular_curve.dart';
import 'package:social_media_app/widgets/circular_textfield.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(children: <Widget>[
            ClipPath(
              clipper: ClipperCurve(),
              child: Image(
                image: AssetImage('assets/images/login_background.jpg'),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.4,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'SOCIAL MEDIA',
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: InputField(
                isObscureText: false,
                hintText: 'Username',
              ),
            ),
            SizedBox(height: 7.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: InputField(
                isObscureText: true,
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomePage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                // Along with Expanded pushes the container to the bottom
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginPage()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 70.0,
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Already have an account? Log In.',
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}




