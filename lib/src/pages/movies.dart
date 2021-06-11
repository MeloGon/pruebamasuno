import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:pruebamasuno/src/constants/utilites.dart';
import 'package:pruebamasuno/src/controllers/movie_controller.dart';

class Movies extends StatelessWidget {
  final MovieController movieCtr = Get.put(MovieController());
  TextStyle styleHeader = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (movieCtr.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          height: Get.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Trending',
                style: styleHeader,
              ),
              getTrendingMovies(),
              SizedBox(
                height: 40,
              ),
              Text(
                'Popular',
                style: styleHeader,
              ),
              getPopularMovies(),
            ],
          ),
        ),
      );
    });
  }

  //swiper de peliculas trending
  getTrendingMovies() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Swiper(
        autoplay: true,
        fade: 10,
        layout: SwiperLayout.STACK,
        itemWidth: Get.width * 0.7,
        itemHeight: Get.height * 0.4,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: GestureDetector(
              onTap: () => Get.toNamed('contentpage', arguments: {
                'name_mov':
                    movieCtr.allTrendingData[index].movie.title.toString(),
                'year_mov':
                    movieCtr.allTrendingData[index].movie.year.toString(),
              }),
              child: Stack(
                children: [
                  Container(
                    width: Get.width * 0.7,
                    height: Get.height * 0.4,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/images/cinema.png'),
                      fadeInCurve: Curves.easeInCirc,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/bg-netflix.jpg'),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          ' ${movieCtr.allTrendingData[index].watchers.toString()} watchers',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          ' ${movieCtr.allTrendingData[index].movie.title.toString()}',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: movieCtr.allTrendingData.length,
        //pagination: new SwiperPagination(),
      ),
    );
  }

  //toda la grilla de peliculas populares
  getPopularMovies() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieCtr.allPopularData.length,
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () => Get.toNamed('contentpage', arguments: {
              'name_mov': movieCtr.allPopularData[index].title.toString(),
            }),
            child: Container(
              decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: new ExactAssetImage('assets/images/grid-bg.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: primaryColor,
                  border: Border.all(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              margin: EdgeInsets.only(right: 20),
              height: Get.height * .3,
              width: Get.width * .3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      '${movieCtr.allPopularData[index].title.toString()} \n ${movieCtr.allPopularData[index].year.toString()}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
