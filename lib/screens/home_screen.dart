import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/serch/serch.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas en cines'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSerchDelegate()),
                icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Card Swiper o tarjetas principales
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              // slider de peliculas
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Otro',
                onNextPage: () {},
              ),
              MovieSlider(
                movies: moviesProvider.popularMovies,
                onNextPage: () {},
              ),
              //MovieSlider(),
              //MovieSlider()

              //Listado Horizontal de peliculas
            ],
          ),
        ));
  }
}
