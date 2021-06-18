import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/Custom%20Widgets/MoreOptionsList.dart';
import 'package:flutter_facebook_clone/config/palette.dart';
import 'package:flutter_facebook_clone/data/data.dart';
import 'package:flutter_facebook_clone/models/models.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_facebook_clone/Custom Widgets/widgets.dart';

class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TrackingScrollController _trackingScrollController = TrackingScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _trackingScrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: HomeScreenMobile(scrollController: _trackingScrollController) ,
          desktop: HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class HomeScreenMobile extends StatelessWidget {
final TrackingScrollController scrollController;

  const HomeScreenMobile({Key? key,required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          floating: false,
          backgroundColor: Colors.white,
          actions: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.scaffold,
              ),
              child: IconButton(
                icon: Icon(Icons.search,
                  color: Colors.black,),
                onPressed: (){},
              ),
            ),
            SizedBox(width: 10.0,),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.scaffold,
              ),
              child: IconButton(
                icon: Icon(MdiIcons.facebookMessenger,
                  color: Colors.black,
                ),
                onPressed: (){},
              ),
            ),
            SizedBox(width: 10.0,),
          ],
          title: Text('facebook', style: TextStyle(
            color: Palette.facebookBlue,
            letterSpacing: -1.2,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),),
        ),
        SliverToBoxAdapter(
          child: CreatePost( currentUser: currentUser,),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          sliver: SliverToBoxAdapter(
            child: CreateRoom(onlineUsers: onlineUsers,),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context,index){
              final Post post = posts[index];
              return PostContainer(post:post);
            },
            childCount: posts.length,

          ),
        )



      ],
    );
  }
}

class HomeScreenDesktop extends StatelessWidget {
final TrackingScrollController scrollController;

  const HomeScreenDesktop({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
           child: MoreOptionsList(
             currentUser: currentUser ,
           ),
          ),
        ),
        Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0,20.0,0.0,10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePost( currentUser: currentUser,),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                sliver: SliverToBoxAdapter(
                  child: CreateRoom(onlineUsers: onlineUsers,),
                ),
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context,index){
                    final Post post = posts[index];
                    return PostContainer(post:post);
                  },
                  childCount: posts.length,

                ),
              )



            ],
          ),
        ),
        Spacer(),
        Flexible(
          flex: 2,
          child: Container(
            child: Align(
              alignment: Alignment.centerRight,
              child: ContactsList(
                users: onlineUsers,
              ),
            ),
          ),
        )
      ],
    );
  }
}
