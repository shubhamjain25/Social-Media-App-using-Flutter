import 'package:flutter/material.dart';
import 'package:social_media_app/constants.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/screens/home_page.dart';
import 'package:social_media_app/screens/login_page.dart';
import 'package:social_media_app/screens/profile_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              child: Image(
                image: AssetImage('assets/images/user_background.jpg'),
                fit: BoxFit.cover,
              ),
              height: 250,
              width: double.infinity,
            ),
            Positioned(
              bottom:15,
              left:10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height:90,
                    width: 90,
//                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2.0,
                        color: Colors.blue,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0,2),
                          blurRadius: 6.0
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        height:90,
                        width: 90,
                        image: AssetImage('assets/images/user.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text('Rebecca', style:kDrawerName ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            DrawerCard(
              btnPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
              title: 'Home',
              displayIcon: Icon(
                Icons.border_all,
                size: 22.0,
                color: Colors.black54,
              ),
            ),
            DrawerCard(
              title: 'Chats',
              displayIcon: Icon(
                Icons.message,
                size: 22.0,
                color: Colors.black54,
              ),
            ),
            DrawerCard(
              title: 'Map',
              displayIcon: Icon(
                Icons.location_on,
                size: 22.0,
                color: Colors.black54,
              ),
            ),
            DrawerCard(
              btnPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfilePage(
                 user : currentUser,
                )));
              },
              title: 'Your Profile',
              displayIcon: Icon(
                Icons.account_circle,
                size: 22.0,
                color: Colors.black54,
              ),
            ),
            DrawerCard(
              title: 'Settings',
              displayIcon: Icon(
                Icons.settings,
                size: 22.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(bottom: 10.0),
              child: DrawerCard(
                btnPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                },
                title: 'Logout',
                displayIcon: Icon(
                  Icons.directions_run,
                  size: 22.0,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class DrawerCard extends StatelessWidget {
  final String title;
  final Icon displayIcon;
  final Function btnPressed;

  DrawerCard({this.title, this.displayIcon, this.btnPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btnPressed,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          displayIcon,
          SizedBox(
            width: 30,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                textBaseline: TextBaseline.alphabetic),
          ),
        ]),
      ),
    );
  }
}
