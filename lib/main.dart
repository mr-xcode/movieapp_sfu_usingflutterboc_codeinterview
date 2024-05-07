import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/genre_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/movie_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/moviebygenre_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/moviedetails_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/nowplaying_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/api_service.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/my_constant.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/movie_observer.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xff1F1D2B), // Set your desired color
    ),
  );
  Bloc.observer = MovieObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (context) => ApiService.create(),
      child: Consumer<ApiService>(
        builder: (context, apiService, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<MovieBloc>(
                  create: (_) => MovieBloc()..add(PopularEvent())),
              BlocProvider<NowplayingBloc>(
                create: (_) => NowplayingBloc()..add(MyNowPlayingEvent()),
              ),
              BlocProvider<GenreBloc>(
                create: (_) => GenreBloc()..add(MyGenresEvent()),
              ),
              BlocProvider<MoviebygenreBloc>(
                create: (_) => MoviebygenreBloc()..add(MyMoviebygenreEvent()),
              ),
              BlocProvider<MoviedetailsBloc>(
                create: (_) =>
                    MoviedetailsBloc(apiService)..add(MyMoviesDeailsEvent()),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Movie App",
              home: HomePage(),
              theme: ThemeData(
                  primaryColor: MyConstant.pri_color,
                  highlightColor: MyConstant.highlight_color),
            ),
          );
        },
      ),
    );
  }
}
