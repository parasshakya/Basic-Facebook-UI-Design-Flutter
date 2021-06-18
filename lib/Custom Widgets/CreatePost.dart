import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/Custom%20Widgets/ProfileAvatar.dart';
import 'package:flutter_facebook_clone/models/user_model.dart';
import 'package:flutter_facebook_clone/Custom Widgets/widgets.dart';
class CreatePost extends StatelessWidget {
  
  final User currentUser;

  const CreatePost({Key? key, required this.currentUser}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final bool _isDesktop = Responsive.isDesktop(context);
    return  Card(
      margin: EdgeInsets.symmetric(horizontal: _isDesktop ? 5.0 : 0.0),
      elevation: _isDesktop ? 1.0 : 0.0,
      shape: _isDesktop ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ) : null,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: Row(
                children: [
                 ProfileAvatar(onlineUser: currentUser),
                  SizedBox(width: 15.0,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(hintText: 'What\'s on your mind'),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 10,),
            Container(
              height: 30.0,
              padding: EdgeInsets.only(bottom: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    icon: Icon(Icons.videocam, color: Colors.redAccent,),
                    onPressed: (){},
                    label: Text('Live'),
                  ),
                  VerticalDivider(width: 5.0,),
                  FlatButton.icon(
                    icon: Icon(Icons.photo_library, color: Colors.green,),
                    onPressed: (){},
                    label: Text('Photo'),
                  ),
                  VerticalDivider(width: 5.0,),
                  FlatButton.icon(
                    icon: Icon(Icons.video_call, color: Colors.purpleAccent,),
                    onPressed: (){},
                    label: Text('Room'),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
