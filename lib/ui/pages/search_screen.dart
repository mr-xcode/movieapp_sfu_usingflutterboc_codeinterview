import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: const Center(
        child: Text(
          "Search Screen",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.cyan,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
