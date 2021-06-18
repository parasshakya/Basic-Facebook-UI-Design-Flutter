import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/config/palette.dart';
import 'package:flutter_facebook_clone/models/user_model.dart';

class ProfileAvatar extends StatelessWidget {
  final User onlineUser;
  final bool isActive;
  final double? profileSize;
  ProfileAvatar({ this.profileSize,required this.onlineUser,this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CircleAvatar(
            radius: profileSize == null ? 22.0 : profileSize,
            backgroundImage: CachedNetworkImageProvider(
                onlineUser.imageUrl
            ),
          ),
         isActive ? Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 14,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.online,
                border: Border.all(width: 2.0,
                    color: Colors.white),
              ),
            ),
          ) : SizedBox.shrink(),
        ],
      ),
    );
  }
}
