import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({ Key? key }):
      super( key: key );

  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ??
        'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _OverView(),
              _OverView(),
              _OverView(),
              const CastingCards()
            ])
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

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
          padding: const EdgeInsets.only( bottom: 10 ),
          width: double.infinity,
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          child: const Text(
            'movie.title',
            style: TextStyle( fontSize: 16 )
          )
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only( top: 20 ),
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              height: 150,
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
            ),
          ),

          const SizedBox( width: 20 ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie-title',
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie-original-title',
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
              ),

              Row(
                children: <Widget>[
                  const Icon( Icons.star_outline, size: 15, color: Colors.grey ),
                  const SizedBox( width: 5 ),
                  Text(
                    'movie-vote-average',
                    style: textTheme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

}

class _OverView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30, vertical: 10 ),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam rutrum faucibus neque, in viverra elit porttitor sed. Maecenas rutrum nulla neque, nec aliquet mi euismod at. Nulla facilisi. In maximus, nisi sit amet fermentum interdum, felis nunc volutpat magna, at finibus enim ex in nulla. Mauris posuere lacinia finibus. Aenean ex est, sodales vestibulum posuere at, iaculis et ex. Aliquam ligula odio, ullamcorper ac pretium quis, molestie id sem.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}