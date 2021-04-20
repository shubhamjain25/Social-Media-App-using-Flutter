import 'package:flutter/material.dart';
import 'package:social_media_app/constants.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/widgets/custom_drawer.dart';
import 'package:social_media_app/widgets/following_list.dart';
import 'package:social_media_app/widgets/post_carousel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  PageController _pageController;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage:0, viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Center(
          child: Text('SOCIAL MEDIA', style: kHomePageTitleStyle),
        ),
        backgroundColor: Colors.blue,
        bottom: TabBar(
          controller: _controller,
          labelColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 20.0,
          ),
          indicatorWeight: 3.0,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(text: 'Trending'),
            Tab(text: 'Latest'),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0,),
            child: Text(
              'Following',
              style: kHomePageStyle
            ),
          ),
          FollowingList(),
          PostCarousel(
            title: 'Posts',
            pageController: _pageController,
            posts: posts,
          )
        ],
      ),
    );
  }
}
