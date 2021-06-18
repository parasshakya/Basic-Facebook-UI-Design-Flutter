import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/Custom%20Widgets/ProfileAvatar.dart';
import 'package:flutter_facebook_clone/config/palette.dart';
import 'package:flutter_facebook_clone/models/models.dart';
import 'package:flutter_facebook_clone/Custom Widgets/widgets.dart';

class CreateRoom extends StatelessWidget {

  final List<User> onlineUsers;
  CreateRoom({required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    final bool _isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: _isDesktop ? 5.0 : 0.0),
      elevation: _isDesktop ? 1.0 : 0.0,
      shape: _isDesktop ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ) : null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0,
        vertical: 10.0),
        color: Colors.white,
        height: 70.0,
        child: ListView.builder(
          padding: EdgeInsets.all(5.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
          if(index == 0){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: OutlineButton(onPressed: (){},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),

                  ),
                  textColor: Palette.facebookBlue,
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Colors.blueAccent.shade100,
                  ),
                  child: Row(
                    children: [
                      ShaderMask(
                        shaderCallback: (rect){
                          return Palette.createRoomGradient.createShader(rect);
                        },
                        child: Icon(Icons.video_call,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(width: 4.0,),
                      Text('Create\nRoom')
                    ],
                  )),
            );
          }
          final User onlineUser =  onlineUsers[index-1];
          return ProfileAvatar(onlineUser: onlineUser,
          isActive: true,);
        },
        itemCount: 1 + onlineUsers.length,


        )

      ),
    );
  }
}
