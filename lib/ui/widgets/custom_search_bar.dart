import 'package:flutter/material.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/my_constant.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0.0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyConstant.pri_color,
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: MyConstant.searchbar_background,
          hintText: 'Search a title',
          hintStyle: TextStyle(color: MyConstant.searchbar_items_color),
          prefixIcon:
              Icon(Icons.search, color: MyConstant.searchbar_items_color),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "|",
                style: TextStyle(color: MyConstant.searchbar_items_color),
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                icon: Icon(Icons.sort, color: Colors.white),
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
