import 'package:flutter/material.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/widgets/banner_section.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/widgets/custom_appbar.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/widgets/custom_search_bar.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/widgets/movies_by_genre.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/ui/widgets/recommends_for_you.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Custom AppBar Section
          CustomAppbar(),

          // Search Bar Section
          const CustomSearchBar(),

          // Banner Section Get Now Playing API
          const BannerSection(),

          // Recommands For You Section Get Popular
          const RecommednsForYou(),

          // Recommands For You Section Get Top Rated
          //const RecommednsForYou(),

          // Movies by Genre Section
          const MoviesByGenere(),
        ],
      ),
    );
  }
}
