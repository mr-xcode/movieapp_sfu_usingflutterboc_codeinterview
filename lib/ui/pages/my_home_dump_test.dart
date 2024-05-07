import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/bloc/movie_bloc.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie App"),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: BlocBuilder<MovieBloc, MovieState>(
                    builder: (context, state) {
                  if (state is PopularInitial) {
                    return Center(
                      child: Text("Initial "),
                    );
                  }
                  if (state is PopularLoading) {
                    return Center(
                      child: GFLoader(),
                    );
                  }
                  if (state is PopularError) {
                    return Center(
                      child: Text("Error "),
                    );
                  }
                  if (state is GenresLoaded) {
                    return ListView.builder(
                        itemCount: state.genre.length,
                        itemBuilder: (contxt, index) {
                          return ListTile(
                            title: Text(state.genre[index].name),
                          );
                        });
                  }
                  return Container();
                }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              GFButton(
                padding: EdgeInsets.only(
                    top: 15.0, right: 40.0, bottom: 15.0, left: 40.0),
                color: Colors.green,
                onPressed: () {
                  BlocProvider.of<MovieBloc>(context).add(GenresEvent());
                },
                child: Text(
                  "LOAD DATA!",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}
