import 'package:flutter/material.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/widgets/helper_widgets.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Spider-Man No Way..',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        actions: const [
          Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),

              // Image
              Container(
                width: 205,
                height: 287,
                child: Image.asset(
                  'assets/images/spider_man.png',
                  fit: BoxFit.fill,
                ),
              ),

              // year, time, action
              const SizedBox(
                height: 10,
              ),
              yearMinuteAction(),

              // play, download, share
              const SizedBox(
                height: 10,
              ),
              playDownloadShare(),

              // Action row
              const SizedBox(
                height: 20,
              ),
              actionRow(),

              // Story Line
              const SizedBox(
                height: 20,
              ),
              storyLine(),

              // Cast and Crew
              const SizedBox(
                height: 10,
              ),
              castAndCrew(),

              //TestintCode

              //EndHere
            ],
          ),
        ),
      ),
    );
  }
}
