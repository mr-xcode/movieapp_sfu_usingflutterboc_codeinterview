import 'package:flutter/material.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/my_constant.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyConstant.pri_color,
      child: const Center(
        child: Text(
          "Downloaded Items will list here",
          style: TextStyle(
            color: Colors.cyan,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
