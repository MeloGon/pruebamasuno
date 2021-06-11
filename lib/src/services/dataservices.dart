import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pruebamasuno/src/models/movies_trending_model.dart';

//clase donde consumo la api de Trakt.tv

class DataServices {
  //definiendo variables estaticas que nunca cambian como el key de la api y parte de la url
  static var client = http.Client();
  static String apiKey =
      '68b1d05dc5d9e54dacee8879ce9c66b0de92e90a01d8c8263987fe5d59f78792';
  static String url = 'https://api.trakt.tv/movies/';

  //metodo que obtiene toda la lista Trending de la api
  static Future<List<Trending>> getTrendingMovies() async {
    final List<Trending> listTrending = new List();
    //estructura obligatoria segun la documentacion de la api
    var response = await client.get(Uri.parse(url + 'trending'), headers: {
      "Content-Type": "application/json",
      "trakt-api-version": "2",
      "trakt-api-key": apiKey
    });
    //respuesta en json
    final decodeResp = json.decode(response.body);
    //organizando dicha respuesta en torno al modelo Trendin en la carptea models
    (decodeResp as List)
        .map((e) => Trending.fromJson(e))
        .toList()
        .forEach((element) {
      listTrending.add(element);
    });
    return listTrending;
  }

  //metodo que obtiene toda la lista popular de la api
  static Future<List<Movie>> getPopularMovies() async {
    final List<Movie> listPopular = new List();
    var response = await client.get(Uri.parse(url + 'popular'), headers: {
      "Content-Type": "application/json",
      "trakt-api-version": "2",
      "trakt-api-key": apiKey
    });

    final decodeResp = json.decode(response.body);
    (decodeResp as List)
        .map((e) => Movie.fromJson(e))
        .toList()
        .forEach((element) {
      listPopular.add(element);
    });
    return listPopular;
  }
}
