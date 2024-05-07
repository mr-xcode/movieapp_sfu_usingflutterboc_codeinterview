import 'package:flutter/material.dart';

class ModernSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.filter_list, color: Colors.grey),
                onPressed: () {
                  // Perform filter action
                  print('Filter button pressed');
                },
              ),
              IconButton(
                icon: Icon(Icons.sort, color: Colors.grey),
                onPressed: () {
                  // Perform sort action
                  print('Sort button pressed');
                },
              ),
            ],
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        ),
        onChanged: (value) {
          // Handle search query changes
          print('Search query: $value');
        },
      ),
    );
  }
}