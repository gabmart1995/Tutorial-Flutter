import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {

  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {

  final List<int> imagesId = List.generate( 10, (index) => index + 1);
  final ScrollController scrollController = ScrollController();

  bool isLoading = false;

  // evento que se crea por primera vez
  @override
  void initState() {
    super.initState();

    // events listeners
    scrollController.addListener(() {

      // pixels position
      // print('${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}' );

      if (
        ( scrollController.position.pixels + 500 ) >=
        scrollController.position.maxScrollExtent
      ) {
        fetchData();
      }

    });
  }

  // http requests
  Future fetchData() async {

    if ( isLoading ) {
      return;
    }

    // inicia la carga
    isLoading = true;
    setState(() {});

    await Future.delayed( const Duration( seconds: 3 ) );
    addImages( 5 );

    isLoading = false;
    setState(() {});
  }

  Future<void> onRefresh() async {
    final lastId = imagesId.last;

    await Future.delayed( const Duration( seconds: 2 ) );

    // limpia el listado
    imagesId.clear();
    imagesId.add( lastId + 1 );
    addImages( 5 );
  }

  void addImages( int quantity ) {
    final lastId = imagesId.last;
    List<int> values = List.generate( quantity, ( index ) => index + 1);

    imagesId.addAll(
      values.map(( value ) => lastId + value ),
    );

    setState(() {});

    // evita desplazar el scroll un poco mas abajo
    // cuando termina la carga si no esta al final
    // de la pantalla
    if (
        (scrollController.position.pixels + 100) <=
        scrollController.position.maxScrollExtent
    ) {
      return;
    }

    scrollController.animateTo(
      ( scrollController.position.pixels + 120 ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn
    );
  }

  @override
  Widget build(BuildContext context) {

    // obtenemos el tamaño total del dispositivo
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: onRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                // events
                controller: scrollController,
                itemCount: imagesId.length,
                itemBuilder: ( BuildContext context, int index ) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage('https://picsum.photos/500/300?image=${imagesId[index]}')
                  );
                },
              ),
            ),

            if ( isLoading )
              Positioned(
                bottom: 40,
                left: (size.width * 0.5) - 30,
                child: const _LoadingIcon()
              ),
          ],
        ),
      )
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({ Key? key, }):
      super( key: key );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all( 10 ),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity( 0.9 ),
        shape: BoxShape.circle
      ),
      child: const CircularProgressIndicator(
        color: AppTheme.primary
      ),
    );
  }
}