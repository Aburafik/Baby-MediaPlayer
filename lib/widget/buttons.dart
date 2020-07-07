import 'package:flutter/material.dart';
class MediaButtons extends StatelessWidget {
  MediaButtons({this.onPressed,this.icon});
  final Function onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(icon: Icon(icon),
      color: Colors.white,
      iconSize: 30,
      onPressed: onPressed,);
  }
}