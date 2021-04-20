import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/constants.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/widgets/circular_curve.dart';
import 'package:social_media_app/widgets/custom_drawer.dart';
import 'package:social_media_app/widgets/post_carousel.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage({this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _myPosts;
  PageController _favouritePosts;


  @override
  void initState() {
    _myPosts = PageController(
      viewportFraction: 0.8, initialPage: 0
    );
    _favouritePosts = PageController(
        viewportFraction: 0.8, initialPage: 0
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: ClipPath(
                  clipper: ClipperCurve2(),
                  child: Image(
                    image: AssetImage(widget.user.backgroundImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(widget.user.profileImageUrl),
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30.0,
                left: 20.0,
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Theme.of(context).primaryColor,
                    size: 30.0,
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, bottom:15.0),
            child: Text('Rebecca', style: TextStyle(fontSize: 25.0, fontWeight:FontWeight.w700),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget>[
              Column(
                children:<Widget>[
                  Text('Followers', style: kProfileStatHead),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(widget.user.followers.toString(), style: kProfileStatValue),
                ]
              ),
              Column(
                  children:<Widget>[
                    Text('Following', style: kProfileStatHead),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(widget.user.following.toString(), style: kProfileStatValue),
                  ]
              ),
            ]
          ),
          PostCarousel(
            title: 'Your Posts' ,
            pageController: _myPosts,
            posts: widget.user.posts,
          ),
          PostCarousel(
            title: 'Favourite Posts',
            pageController: _favouritePosts,
            posts: widget.user.favorites,
          ),
        ]),
      ),
    );
  }
}
