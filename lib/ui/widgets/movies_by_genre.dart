import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/genre_bloc.dart';
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
          BlocBuilder<GenreBloc, GenreState>(builder: (context, state) {
            if (state is GenreInitial) {
              print("Genre init");
              return GFLoader();
            }
            if (state is GenresLoading) {
              print("Genre loading");
              return GFLoader();
            }
            if (state is GenresLoaded) {
              print("Genre loaded");
              return Container(
                height: 39,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.genre.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // Manually created item
                        return GFButton(
                          onPressed: () {},
                          text: 'All',
                          shape: GFButtonShape.pills,
                          color: Theme.of(context).primaryColor,
                          highlightColor: Colors.red,
                          textColor: Colors.white,
                        );
                      } else {
                        final genreInde = index - 1;
                        return GFButton(
                          onPressed: () {},
                          text: state.genre[genreInde].name,
                          shape: GFButtonShape.pills,
                          color: Theme.of(context).primaryColor,
                          highlightColor: Colors.red,
                          textColor: isPressed ? Colors.cyan : Colors.white,
                        );
                      }
                    }),
              );
            }
            if (state is GenresError) {}
            print("Genre GenreError");
            return Center(
              child: Text('Error Loding'),
            );
          }),
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
