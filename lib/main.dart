import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/movie_bloc.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/my_constant.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/movie_observer.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/pages/home_page.dart';

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
    return BlocProvider(
      create: (_) => MovieBloc()
        ..add(NowPlayingEvent())
        ..add(PopularEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Movie App",
        home: HomePage(),
        theme: ThemeData(
            primaryColor: MyConstant.pri_color,
            highlightColor: MyConstant.highlight_color),
      ),
    );
  }
}
