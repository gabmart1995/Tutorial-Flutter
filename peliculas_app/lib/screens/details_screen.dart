import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({ Key? key }):
      super( key: key );

  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(
            title: movie.title,
            posterImg: movie.fullBackdropPath
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle( movie: movie ),
              _OverView( overview: movie.overview ),
              CastingCards( movie.id )
            ]),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final String title, posterImg;

  const _CustomAppBar({
    required this.title,
    required this.posterImg
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all( 0 ),
        title: Container(
          padding: const EdgeInsets.only( bottom: 10, left: 10, right: 10 ),
          width: double.infinity,
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          child: Text(
            title,
            style: const TextStyle( fontSize: 16 ),
            textAlign: TextAlign.center,
          )
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage( posterImg ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle({ required this.movie });

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of( context ).size;

    return Container(
      margin: const EdgeInsets.only( top: 20 ),
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              height: 150,
              width: 110,
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage( movie.fullPosterImg ),
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox( width: 20 ),

          ConstrainedBox(
            constraints: BoxConstraints( maxWidth: size.width - 190 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),

                Row(
                  children: <Widget>[
                    const Icon( Icons.star_outline, size: 15, color: Colors.grey ),
                    const SizedBox( width: 5 ),
                    Text(
                      movie.voteAverage.toString(),
                      style: textTheme.caption,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}

class _OverView extends StatelessWidget {

  final String overview;

  const _OverView({ required this.overview });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30, vertical: 10 ),
      child: Text(
        overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}