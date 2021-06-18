import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/Custom%20Widgets/ProfileAvatar.dart';
import 'package:flutter_facebook_clone/config/palette.dart';
import 'package:flutter_facebook_clone/models/models.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_facebook_clone/Custom Widgets/widgets.dart';

class PostContainer extends StatelessWidget {

  final Post post;
  PostContainer({required this.post});

  @override
  Widget build(BuildContext context) {
    final bool _isDesktop = Responsive.isDesktop(context);
    return _isDesktop ? Card(
      elevation: 1.0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(
                    post: post,
                  ),
                  SizedBox(height: 12.0,),
                  Text(post.caption),
                  post.imageUrl != 'null' ? SizedBox.shrink() : SizedBox(height: 8.0,)
                ],
              ),
            ),
            post.imageUrl != 'null' ?
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: CachedNetworkImage(imageUrl: post.imageUrl),
            ) : SizedBox.shrink(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: _PostStats(post: post),
            )
          ],
        ),
      ),
    ) : Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(
                  post: post,
                ),
                SizedBox(height: 12.0,),
                Text(post.caption),
                post.imageUrl != 'null' ? SizedBox.shrink() : SizedBox(height: 8.0,)
              ],
            ),
          ),
          post.imageUrl != 'null' ?
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CachedNetworkImage(imageUrl: post.imageUrl),
          ) : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
 final Post post;
 _PostHeader({required this.post});
 
  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
      ProfileAvatar(onlineUser: post.user,),
      const SizedBox(width: 8.0,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.user.name, style: TextStyle(
              fontWeight: FontWeight.w600,
            ),),
            Row(children: [
              Text('${post.timeAgo} * ', style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12.0,
              ),),
              Icon(Icons.public,color: Colors.grey.shade600,
              size: 12.0,)
            ],)
          ],
        ),
      ),
      IconButton(
        icon: Icon(Icons.more_horiz),
        onPressed: (){ print('MORE');}
      )
    ],
    );
  }
}

class _PostStats extends StatelessWidget {
final Post post;
_PostStats({ required this.post});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.facebookBlue,
                ),
                child: Icon(
                  Icons.thumb_up,
                  size: 10.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 5.0,),
              Expanded(child: Text('${post.likes}')),
              Text('${post.comments} Comments'),
              SizedBox(width: 5.0,),
              Text('${post.shares} Shares'),
            ],
          ),
        ),
        const Divider(),
        Container(
          child: Row(
            children: [
              _PostButton(
              onTap: () => print('Like'),
                label: 'Like',
                icon: Icon(MdiIcons.thumbUpOutline, size: 20.0)
              ),
              _PostButton(
                  onTap: () => print('Comment'),
                  label: 'Comment',
                  icon: Icon(MdiIcons.commentOutline, size: 20.0)
              ),
              _PostButton(
                  onTap: () => print('Share'),
                  label: 'Share',
                  icon: Icon(MdiIcons.shareOutline, size: 20.0)
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
 final String label;
 final Icon icon;
 final  Function ()  onTap ;

  const _PostButton({Key? key, required this.label,required this.icon, required this.onTap}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
            child: Container(
              height: 25.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 icon,
                  SizedBox(width: 2.0,),
                  Text(label, style: TextStyle(
                    color: Colors.grey[600],
                  ),)
                ],
              ),
            )),
      ),
    );
  }
}


