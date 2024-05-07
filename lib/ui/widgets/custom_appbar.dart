import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GFListTile(
      margin: const EdgeInsets.all(0),
      radius: 0.0,
      avatar: GFAvatar(
        child: Image.asset(
          'assets/images/profile.png',
          width: 40,
          height: 40,
        ),
      ),
      title: const Text(
        'Hello, Smith',
        style: TextStyle(color: Colors.white),
      ),
      subTitle: const Text(
        "Let’s stream your favorite movie",
        style: TextStyle(
          color: Color(0xff92929D),
        ),
      ),
      icon: const Icon(
        Icons.favorite,
        color: Colors.red,
      ),
      color: Theme.of(context).primaryColor,
    );
  }
}
