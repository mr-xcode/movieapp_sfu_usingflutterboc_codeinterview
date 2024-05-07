import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/nowplaying_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/model/movie.dart';

class BannerSection extends StatefulWidget {
  const BannerSection({super.key});

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowplayingBloc, NowplayingState>(
      builder: (context, state) {
        if (state is NowPlayingInitial) {
          return GFLoader();
        }
        if (state is NowPlayingLoading) {
          return GFLoader();
        }
        if (state is NowPlayingError) {
          return GFLoader();
        }
        if (state is NowPlayingLoaded) {
          final List<String> imageList = getImageList(state.movies);
          int count = 0;

          return Container(
            color: Theme.of(context).primaryColor,
            margin: const EdgeInsets.all(0),
            child: GFCarousel(
              items: [
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    String url = imageList[index];
                    Movie movie = state.movies[index];
                    return Container(
                      key: ValueKey(index), // Add a unique key for each item
                      width: 909,
                      height: 174,
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Title
                          Positioned(
                            left: 10,
                            bottom: 30,
                            child: Text(
                              movie.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          Positioned(
                            left: 10,
                            bottom: 10,
                            child: Text(
                              getPrettyDate(movie.releaseDate),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

List<String> getImageList(List<Movie> movieList) {
  List<String> imageList = [];
  movieList.forEach((element) {
    imageList.add('https://image.tmdb.org/t/p/original' + element.posterPath);
  });
  return imageList;
}

String getPrettyDate(String s) {
  String r = '';
  List<String> result = s.split('-');
  switch (result[1]) {
    case '01':
      r += 'On January';
      break;
    case '02':
      r += 'On February';
      break;
    case '03':
      r += 'On March';
      break;
    case '04':
      r += 'On April';
      break;
    case '05':
      r += 'On May';
      break;
    case '06':
      r += 'On June';
      break;
    case '07':
      r += 'On July';
      break;
    case '08':
      r += 'On August';
      break;
    case '09':
      r += 'On September';
      break;
    case '10':
      r += 'On October';
      break;
    case '11':
      r += 'On November';
      break;
    case '12':
      r += 'On December';
      break;
  }
  r += ' ${result[2]}, ${result[0]}';
  return r;
}
