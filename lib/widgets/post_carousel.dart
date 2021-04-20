import 'package:flutter/material.dart';
import 'package:social_media_app/constants.dart';
import 'package:social_media_app/models/post_model.dart';

class PostCarousel extends StatelessWidget {

  final String title;
  final PageController pageController;
  final List<Post> posts;

  PostCarousel({this.title, this.pageController, this.posts});

  _postCarousel(BuildContext context, int index){
    Post post = posts[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget widget){
        double value = 1;

        // TODO 1: Find ways to improve the animation & read more about it

        if(pageController.position.haveDimensions){
          value = pageController.page-index;
          value=(1-value.abs()*0.30).clamp(0.0, 1.0);
        }
          return Center(
            child: SizedBox(
              height: Curves.easeInOutCubic.transform(value)*380,
              child: widget,
            ),
          );
      },
      child: Stack(
        children:<Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0,2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image(
                height: 380,
                width: 350,
                image: AssetImage(post.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right:10,
            child: Container(
              padding : EdgeInsets.all(12.0),
              height:100,
              decoration: BoxDecoration(color:Colors.white54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                )
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  Text(post.title, style: kPostCardTitle, overflow: TextOverflow.ellipsis,),
                  Text(post.location, style: kPostCardLocation,),
                  SizedBox(height:10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget>[
                      Row(
                        children:<Widget>[
                          Icon(Icons.favorite, color: Colors.red, size: 25.0,),
                          SizedBox(width:5.0),
                          Text(post.likes.toString(), style: kPostCardGestures,),
                        ]
                      ),
                      Row(
                          children:<Widget>[
                            Icon(Icons.comment, color: Colors.black87 ,size: 25.0,),
                            SizedBox(width:5.0),
                            Text(post.comments.toString(), style: kPostCardGestures,),
                          ]
                      ),
                    ]
                  ),
                ]
              ),
            ),
          ),
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0,),
          child: Text(
              title,
              style: kHomePageStyle
          ),
        ),
        Container(
          height: 380,
          child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: pageController,
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index){
                return _postCarousel(context, index);
              },),
        ),
      ],
    );
  }
}
