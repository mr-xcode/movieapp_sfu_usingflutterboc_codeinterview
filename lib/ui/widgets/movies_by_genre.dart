import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/genre_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/moviebygenre_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/moviedetails_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/model/movie.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/pages/movie_details_page.dart';
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
            return Center(
              child: Text('Error Loding'),
            );
          }),
          const SizedBox(
            height: 5,
          ),
          BlocBuilder<MoviebygenreBloc, MoviebygenreState>(
            builder: (context, state) {
              if (state is MoviesByGenreInitial) {
                print('movie by genre initial');
                return GFLoader();
              }
              if (state is MoviesByGenreLoading) {
                print('movie by genre loading');
                return GFLoader();
              }
              if (state is MoviesByGenreLoaded) {
                print('movie by genre loaded');
                List<Movie> moviesList = state.movies;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 231,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: moviesList.length,
                    itemBuilder: (context, index) {
                      var movie = moviesList[index];
                      return GestureDetector(
                        onTap: () {
                          // Handle onTap for the manually created item
                          // Trigger new Bloc event and navigate to a new page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailsPage(),
                            ),
                          );
                          // Trigger new Bloc event
                          BlocProvider.of<MoviedetailsBloc>(context)
                              .add(MyMoviesDeailsEvent());
                        },
                        child: singleCardView(
                          getMoviePosterUrl(movie.posterPath),
                          getTitleStringLimit(movie.title),
                          getGenreNameById(movie.genreIds[0]),
                        ),
                      );
                    },
                  ),
                );
              }
              if (state is MoviesByGenreError) {
                print('movie by genre Error');
                return const Center(
                  child: Text("Error Movie By Genre"),
                );
              }

              return Container(
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
              );
            },
          )
        ],
      ),
    );
  }
}

String getTitleStringLimit(String s) {
  String result = '';
  if (s.length < 10) {
    result = s;
  } else {
    result = s.substring(0, 10) + '...';
  }
  print(result);
  return result;
}

String getMoviePosterUrl(String s) {
  String result = 'https://image.tmdb.org/t/p/original${s}';
  return result;
}

String getGenreNameById(int id) {
  List<Map<String, dynamic>> genres = [
    {"id": 28, "name": "Action"},
    {"id": 12, "name": "Adventure"},
    {"id": 16, "name": "Animation"},
    {"id": 35, "name": "Comedy"},
    {"id": 80, "name": "Crime"},
    {"id": 99, "name": "Documentary"},
    {"id": 18, "name": "Drama"},
    {"id": 10751, "name": "Family"},
    {"id": 14, "name": "Fantasy"},
    {"id": 36, "name": "History"},
    {"id": 27, "name": "Horror"},
    {"id": 10402, "name": "Music"},
    {"id": 9648, "name": "Mystery"},
    {"id": 10749, "name": "Romance"},
    {"id": 878, "name": "Science Fiction"},
    {"id": 10770, "name": "TV Movie"},
    {"id": 53, "name": "Thriller"},
    {"id": 10752, "name": "War"},
    {"id": 37, "name": "Western"}
  ];
  for (var genre in genres) {
    if (genre['id'] == id) {
      return genre['name'];
    }
  }
  return ''; // Return null if genre with given ID is not found
}
