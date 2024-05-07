import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/widgets/helper_widgets.dart';

class MoviesByGenere extends StatefulWidget {
  const MoviesByGenere({super.key});

  @override
  State<MoviesByGenere> createState() => _MoviesByGenereState();
}

class _MoviesByGenereState extends State<MoviesByGenere> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Categories",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Container(
            height: 39,
            width: double.infinity,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                GFButton(
                  onPressed: () {
                    setState(() {
                      isPressed = !isPressed;
                    });
                  },
                  text: "All",
                  shape: GFButtonShape.pills,
                  color: Theme.of(context).primaryColor,
                  highlightColor: Colors.red,
                  textColor: isPressed ? Colors.cyan : Colors.white,
                ),
                GFButton(
                  onPressed: () {},
                  text: "Action",
                  shape: GFButtonShape.pills,
                  color: Theme.of(context).primaryColor,
                ),
                GFButton(
                  onPressed: () {},
                  text: "Adventure",
                  shape: GFButtonShape.pills,
                  color: Theme.of(context).primaryColor,
                ),
                GFButton(
                  onPressed: () {},
                  text: "Animation",
                  shape: GFButtonShape.pills,
                  color: Theme.of(context).primaryColor,
                ),
                GFButton(
                  onPressed: () {},
                  text: "Comedy",
                  shape: GFButtonShape.pills,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 231,
            width: double.infinity,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                //singleCardView('assets/images/spider_man.png',
                //  'The Jungle Wa..', 'Action'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
