import 'package:flutter/material.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/my_constant.dart';
import 'package:profile/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyConstant.pri_color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Profile(
                imageUrl:
                    "https://avatars.githubusercontent.com/u/150790730?s=400&u=1d8b8baf9ea065e462d37376fbb3b9c0cd3e9c2d&v=4",
                name: "Mr Xcode",
                website: "https://www.tech4mm.com",
                designation: "Flutter & Blockchain Developer",
                email: "mrxcode@tech4mm.com",
                phone_number: "959 777 56 22 56",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
