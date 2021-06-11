import 'package:get/get.dart';
import 'package:pruebamasuno/src/models/movies_trending_model.dart';
import 'package:pruebamasuno/src/services/dataservices.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  var allTrendingData = List<Trending>().obs;
  var allPopularData = List<Movie>().obs;

  @override
  void onInit() {
    loadTrendingList();
    super.onInit();
  }

  void loadTrendingList() async {
    isLoading(true);
    try {
      var trending = await DataServices.getTrendingMovies();
      var popular = await DataServices.getPopularMovies();
      if (trending != null && popular != null) {
        allTrendingData.value = trending;
        allPopularData.value = popular;
      }
    } finally {
      isLoading(false);
    }
  }
}
