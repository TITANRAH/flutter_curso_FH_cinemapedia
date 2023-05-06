import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {

  // esto regresara false o true
  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.watch(popularMoviesProvider).isEmpty;
  final step3 = ref.watch(topRateMoviesProvider).isEmpty;
  final step4 = ref.watch(upcommingMoviesProvider).isEmpty;

  // aqui digo que si no estan vacios 
  if ( step1 || step2 || step3 || step4 )return true;

  return false;
});
