import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/Custom%20Widgets/ProfileAvatar.dart';
import 'package:flutter_facebook_clone/Custom%20Widgets/Responsive.dart';
import 'package:flutter_facebook_clone/config/palette.dart';
import 'package:flutter_facebook_clone/data/data.dart';
import 'package:flutter_facebook_clone/models/models.dart';

class Stories extends StatelessWidget {
final User currentUser;

Stories({required this.currentUser });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 10.0,top: 10.0, bottom: 10.0),
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (context,index){
        if(index == 0){
          return Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: _StoryCard(
              user: currentUser,
              imageUrl: currentUser.imageUrl,
              isViewed : false,
              isAddStory: true
            ),
          );
        }
        final Story story = stories[index - 1];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: _StoryCard(
            user: story.user,
            imageUrl: story.imageUrl,
            isViewed: story.isViewed,
          ),
        );
      })
    );
  }
}

class _StoryCard extends StatelessWidget {
  final User user;
  final bool isViewed;
  final bool isAddStory;
  final String imageUrl;
  _StoryCard({  required this.user,this.isViewed = false,this.isAddStory = false,
  required this.imageUrl});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: 110,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imageUrl
            ),
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12),
            boxShadow: Responsive.isDesktop(context) ? const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0,2),
                blurRadius: 1.7,

              ),
            ] : null,
          ),
        ),
       isAddStory ? Positioned(
          top: 8.0,
          left: 8.0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Icons.add,
              size: 29.0,
              color: Palette.facebookBlue,
            ),
          ),
        ) : Container(
         padding: EdgeInsets.all(3.0),
         decoration: BoxDecoration(
           shape: BoxShape.circle,
           color: !isViewed ? Colors.blue : Colors.grey.shade400,
         ),
           child: ProfileAvatar(onlineUser: user)),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text( isAddStory ?
           'Add to Story' : user.name ,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

