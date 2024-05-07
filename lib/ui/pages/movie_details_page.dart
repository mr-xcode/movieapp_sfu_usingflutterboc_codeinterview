import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/moviedetails_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/id_data.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/model/movie.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/widgets/helper_widgets.dart';

class MovieDetailsPage extends StatelessWidget {
  final IdData movieId;
  const MovieDetailsPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MoviedetailsBloc>(context)
        .add(UpdateDataEvent(idData: movieId));
    return Scaffold(
      body: BlocBuilder<MoviedetailsBloc, MoviedetailsState>(
          builder: (context, state) {
        if (state is MoviedetailsInitial) {
          return const GFLoader();
        }
        if (state is MovieDetailLoading) {
          return const GFLoader();
        }
        if (state is MovieDetailLoaded) {
          Movie m = state.movies;
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 63,
                    color: Theme.of(context).primaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          m.title.toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  // Image
                  Container(
                    width: 205,
                    height: 287,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/original' + m.posterPath,
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
          );
        }
        if (state is MovieDetailError) {
          return const Center(
            child: Text('Error'),
          );
        }
        return Container();
      }),
    );
  }
}
