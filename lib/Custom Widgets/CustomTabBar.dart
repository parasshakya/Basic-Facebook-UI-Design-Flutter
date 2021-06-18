import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/config/palette.dart';
import 'package:flutter_facebook_clone/Custom Widgets/widgets.dart';
class CustomTabBar extends StatelessWidget {
final List<IconData> icons;
final int selectedIndex;
final Function(int) onTap;
final bool isBottomIndicator;

CustomTabBar({required this.icons, required this.onTap, required this.selectedIndex, this.isBottomIndicator = false});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs:
        icons.asMap().map((i,e) => MapEntry(i,Tab(icon: Icon(e,color: i == selectedIndex ? Palette.facebookBlue : Colors.black45, size: 30.0,),))).values.toList(),
      indicator: BoxDecoration(
        border: Responsive.isDesktop(context) ?  Border(
          bottom: BorderSide(
            color: Palette.facebookBlue,
            width: 3.0,
          )
        ) :  Border(
            top: BorderSide(
              color: Palette.facebookBlue,
              width: 3.0,
            )
        )
      ),
      indicatorPadding: EdgeInsets.zero,
      onTap: onTap,
    );
  }
}
