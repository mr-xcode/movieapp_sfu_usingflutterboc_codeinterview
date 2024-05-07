import 'package:dio/dio.dart';
import 'package:movieapp_sfu_usingflutterboc_codeinterview/data/model/movie.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

  @GET(
      '3/movie/now_playing?api_key=19d6149f34738ec93c495cd0527246ae&language=en-US&page=1')
  Future<List<Movie>> getNowPlaying();

  @GET(
      '3/movie/464052?api_key=19d6149f34738ec93c495cd0527246ae&language=en-US&page=1')
  Future<Movie> getMovieDetaild();
}
