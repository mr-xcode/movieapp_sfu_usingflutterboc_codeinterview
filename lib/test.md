 emit(MovieDetailLoading());
      Map<String, Movie> moviesList = {};
      var url;
      var response;

      try {
        url = Uri.parse(
            'https://api.themoviedb.org/3/movie/now_playing?api_key=19d6149f34738ec93c495cd0527246ae&language=en-US&page=1');

        var response = await http.get(url);

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          List<dynamic> results = jsonData['results'];

          List<Movie> moviesList =
              results.map((movieData) => Movie.fromJson(movieData)).toList();
          print(moviesList.length);
          emit(MovieDetailLoaded(moviesList[0]));
          //yield MovieLoaded(movies);
        } else {
          print("Cannot load data");
          //yield MovieError('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        emit(MovieDetailError());
        print(e.toString());
      }