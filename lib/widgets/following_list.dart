import 'package:flutter/material.dart';
import 'package:social_media_app/data/data.dart';
import 'package:social_media_app/models/user_model.dart';

class FollowingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 10),
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          User currentUser = users[index];
          return Container(
            margin: EdgeInsets.all(10.0),
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
                border: Border.all(
                    width: 2.0,
                    color: Theme
                        .of(context)
                        .primaryColor
                )
            ),
            child: ClipOval(
              child: Image(
                image: AssetImage(currentUser.profileImageUrl),
                height: 60.0,
                width: 60.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        },),
    );
  }
}
