import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRateMoviesProvider.notifier).loadNextPage();
    ref.read(upcommingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialiLoading = ref.watch(initialLoadingProvider);

    if (initialiLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlidesShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topMovies = ref.watch(topRateMoviesProvider);
    final nextMovies = ref.watch(upcommingMoviesProvider);


    // para otro tipo de appbar
    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.zero,
          centerTitle: false,
          title: CustomAppbar(),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlideShow(movies: slideShowMovies),
              MovieHorizontalListView(
                movies: nowPlayingMovies,
                title: 'En cines',
                subTitle: 'Lunes 20',
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              ),

              MovieHorizontalListView(
                movies: nextMovies,
                title: 'Proximamente',
                subTitle: 'Este mes',
                loadNextPage: () =>
                    ref.read(upcommingMoviesProvider.notifier).loadNextPage(),
              ),

              MovieHorizontalListView(
                movies: popularMovies,
                title: 'Populares',
                // subTitle: 'Lunes 20',
                loadNextPage: () =>
                    ref.read(popularMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListView(
                movies: topMovies,
                title: 'Mejor calificadas',
                subTitle: 'Desde siempre',
                loadNextPage: () =>
                    ref.read(topRateMoviesProvider.notifier).loadNextPage(),
              ),

              const SizedBox(
                height: 10,
              ) // Expanded(
              //   child: ListView.builder(
              //     itemCount: nowPlayingMovies.length,
              //     itemBuilder: (context, index) {
              //       final movie = nowPlayingMovies[index];
              //       return ListTile(
              //         title: Text(movie.title),
              //       );
              //     },
              //   ),
              // ),
            ],
          );
        }, childCount: 1),
      ),
    ]);
  }
}
