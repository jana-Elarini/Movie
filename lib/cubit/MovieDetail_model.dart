import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api.manger.dart';
import '../response/MovieDetailResponse.dart';
import 'MovieDetails_states.dart';

class MovieDetailModel extends Cubit<MovieDetailsStates> {
  MovieDetailModel() : super(InitialState());
  List<Genres>? detail;

  void getMovieDetail(int id) async {
    try {
      var response = await ApiManager.getMovieDetails(id);
      if (response.success == 'false') {
        emit(ErrorState(errorMessage: response.statusMessage!));
      } else {
        detail = response.genres;
        emit(SuccessState(response: response));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
