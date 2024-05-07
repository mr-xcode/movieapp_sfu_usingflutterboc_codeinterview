import 'package:flutter/material.dart';
import 'package:profile/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Profile(
          imageUrl:
              "https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
          name: "Mr Xcode",
          website: "https://www.tech4mm.com",
          designation: "Flutter & Blockchain Developer",
          email: "mrxcode@tech4mm.com",
          phone_number: "959 777 56 22 56",
        ),
      ),
    );
  }
}
