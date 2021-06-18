import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/config/palette.dart';
import 'package:flutter_facebook_clone/models/models.dart';
import 'package:flutter_facebook_clone/Custom Widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class CustomAppBar extends StatelessWidget {

  final User  currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar({Key? key, required this.currentUser, required this.icons, required this.selectedIndex,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(color: Colors.white,
      boxShadow: const [
        BoxShadow(color: Colors.black12,
        offset: Offset(0,2),
        blurRadius: 4.0),
      ]),
      child: Row(
        children: [
        Expanded(
          child: Text(
            'facebook',
            style: TextStyle(
              color: Palette.facebookBlue,
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
              letterSpacing: -1.2,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: double.infinity,
            width: 600.0,
            child: CustomTabBar(
              icons:icons ,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator: true
            ),
          ),
        ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UserCard(
                    user: currentUser,
                  ),
                  SizedBox(width: 24.0,),
                  CircleButton(
                    icon: Icons.search,
                    onPressed: () => print('Search button pressed'),
                    iconSize: 20,
                  ),
                  SizedBox(width: 6.0,),
                  CircleButton(
                    icon: MdiIcons.facebookMessenger,
                    onPressed: () => print('Messenger button pressed'),
                    iconSize: 20,
                  ),
                ],
              ),
            ),
          )
      ],),
    );
  }
}
