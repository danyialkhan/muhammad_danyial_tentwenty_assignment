import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/usecases/usecase.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/generes/usecases/get_generes.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/home/bottom_tab_routes.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/search_movies/usecases/search_movie.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/message_helper/snachbar_helper.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final GetMovieGenre _getMovieGenre;
  final SearchMovies _searchMovies;
  GenreBloc({
    required GetMovieGenre getMovieGenre,
    required SearchMovies searchMovies,
  })  : _getMovieGenre = getMovieGenre,
        _searchMovies = searchMovies,
        super(GenreState.initial()) {
    on<GetAllGenresEvent>(_onGetAllGenres);
    on<OnSearchChangedEvent>(_onSearchChangedEvent);
    on<OnTapCrossEvent>(_onTapCross);
    on<SetCurrentRouteEvent>((event, emit) => emit(state.copyWith(currentScreen: event.route)));
    on<GetNextSearchPageEvent>(_onGetNextSearchPage);
  }

  TextEditingController controller = TextEditingController();

  FutureOr<void> _onGetAllGenres(GetAllGenresEvent event, Emitter<GenreState> emit) async {
    if(state.fetching) return;
    emit(state.copyWith(fetching: true, failureEither: right(unit)));

    final resultEither = await _getMovieGenre(NoParams());

    if (resultEither.isLeft()) {
      final failure = handleFailure(resultEither);
      emit(state.copyWith(fetching: false, failureEither: left(failure)));
      return;
    }

    final response = resultEither.getOrElse(() => const Genres(genres: []));

    emit(state.copyWith(fetching: false, failureEither: right(unit), genres: [...response.genres]));
  }

  FutureOr<void> _onSearchChangedEvent(OnSearchChangedEvent event, Emitter<GenreState> emit) async {
    emit(GoToSearchScreenState(state: state.copyWith(searchingMovies: true, failureEither: right(unit), currentQuery: event.query)));
    if(event.fromPage == WatchTabRoutes.searchScreen) {
      final resultEither = await _searchMovies.call(SearchMoviesParams(query: state.currentQuery, page: 1));

      if (resultEither.isLeft()) {
        final failure = handleFailure(resultEither);
        if (failure is! SearchResultsNotFound) {
          SnackbarHelper.show(message: failure.message);
        }
        emit(state.copyWith(searchingMovies: false, failureEither: left(failure), movies: []));
        return;
      }

      final response = resultEither.getOrElse(() => MoviesList.empty());
      final totalPages = response.totalPages;

      emit(state.copyWith(
        searchingMovies: true,
        failureEither: right(unit),
        movies: [...response.results],
        totalPages: totalPages,
        currentPage: 1,
        totalResults: response.totalResults,
      ));
    }
  }

  FutureOr<void> _onTapCross(OnTapCrossEvent event, Emitter<GenreState> emit) async {
    controller.clear();
    emit(GoBackState(state: state.copyWith(movies: [])));
  }

  FutureOr<void> _onGetNextSearchPage(GetNextSearchPageEvent event, Emitter<GenreState> emit) async {
    print('CURRENT PAGE: ${state.currentPage}');
    if (state.currentPage > state.totalPages || state.searchingMoviesNextPage) {
      return;
    }
    emit(state.copyWith(searchingMoviesNextPage: true, failureEither: right(unit)));
    final resultEither = await _searchMovies.call(SearchMoviesParams(query: state.currentQuery, page: state.currentPage + 1));

    if (resultEither.isLeft()) {
      final failure = handleFailure(resultEither);
      if (failure is! SearchResultsNotFound) {
        SnackbarHelper.show(message: failure.message);
      }
      emit(state.copyWith(searchingMoviesNextPage: false, failureEither: left(failure)));
      return;
    }

    final response = resultEither.getOrElse(() => MoviesList.empty());
    state.movies.addAll(response.results);
    final currentPage = state.currentPage + 1;
    final totalPages = response.totalPages;
    print('CURRENT PAGE INCREMENT: ${state.currentPage}');

    emit(state.copyWith(
      searchingMoviesNextPage: false,
      failureEither: right(unit),
      movies: [...state.movies],
      totalPages: totalPages,
      currentPage: currentPage,
    ));
  }
}
