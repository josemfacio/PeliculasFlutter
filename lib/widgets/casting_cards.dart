import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards({required this.movieId});
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
        future: moviesProvider.getMovieCast(movieId),
        builder: ((_, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              constraints: BoxConstraints(maxWidth: 150),
              height: 180,
              child: CupertinoActivityIndicator(),
            );
          }
          final List<Cast> cast = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 180,
            margin: EdgeInsets.only(bottom: 30),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => _CastCard(
                actor: cast[index],
              ),
              itemCount: 10,
            ),
          );
        }));
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;

  const _CastCard({required this.actor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            image: NetworkImage(actor.fulProfilePath),
            height: 140,
            width: 100,
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/no-image.jpg'),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          actor.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
