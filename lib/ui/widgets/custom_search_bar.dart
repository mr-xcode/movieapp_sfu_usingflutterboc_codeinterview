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
      margin: const EdgeInsets.all(0.0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyConstant.pri_color,
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
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
              const SizedBox(
                width: 5,
              ),
              IconButton(
                icon: const Icon(Icons.sort, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
