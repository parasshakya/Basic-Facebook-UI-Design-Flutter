import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/Custom%20Widgets/ProfileAvatar.dart';
import 'package:flutter_facebook_clone/models/models.dart';

class UserCard extends StatelessWidget {
  final User user;
  final double? width;
  final double? profileSize;
  const UserCard({Key? key,this.profileSize, required this.user,this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(user.name),
      child: Row(
        children: [
          ProfileAvatar(onlineUser: user,
            profileSize: profileSize,
          ),
          SizedBox(
            width: width == null ? 6.0 : width,),
            Text(
              user.name,
              style: TextStyle(
              fontWeight: FontWeight.bold,
               color: Colors.black,
            )
          )
        ],
      ),
    );
  }
}
