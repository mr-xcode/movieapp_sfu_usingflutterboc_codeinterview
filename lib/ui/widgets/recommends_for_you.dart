import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/movie_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/moviedetails_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/model/movie.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/pages/movie_details_page.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/widgets/helper_widgets.dart';

class RecommednsForYou extends StatefulWidget {
  const RecommednsForYou({super.key});

  @override
  State<RecommednsForYou> createState() => _RecommednsForYouState();
}

class _RecommednsForYouState extends State<RecommednsForYou> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Recommend for you",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    color: Color(0xff12CDD9),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is PopularInitial) {
                return GFLoader();
              }
              if (state is PopularLoading) {
                return GFLoader();
              }
              if (state is PopularLoaded) {
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
              if (state is PopularError) {
                return const Center(
                  child: Text("Loading Error"),
                );
              }

              return Container();
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
