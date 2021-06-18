import 'package:flutter/material.dart';
import 'package:flutter_facebook_clone/config/palette.dart';

class CircleButton extends StatelessWidget {

  final IconData icon;
  final double iconSize;
  final Function() onPressed;

  const CircleButton({Key? key, required this.icon, required this.iconSize, required this.onPressed}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Palette.scaffold,
      ),
      child: IconButton(
        icon: Icon(icon,
          color: Colors.black,
        size: iconSize,),
        onPressed: onPressed,
      ),
    );
  }
}
