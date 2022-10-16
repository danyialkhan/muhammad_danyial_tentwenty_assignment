import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muhammad_danyial_tentwenty_assignment/services/errors/failures.dart';
import 'package:muhammad_danyial_tentwenty_assignment/src/features/movie_list/usecases/get_upcoming_movies_list.dart';
import 'package:muhammad_danyial_tentwenty_assignment/utils/globals.dart';

part 'upcomming_movies_event.dart';
part 'upcomming_movies_state.dart';

class UpComingMoviesBloc extends Bloc<UpComingMoviesEvent, UpComingMoviesState> {
  final GetUpComingMoviesList _getUpComingMoviesList;

  UpComingMoviesBloc({required GetUpComingMoviesList getUpComingMoviesList})
      : _getUpComingMoviesList = getUpComingMoviesList,
        super(UpComingMoviesState.initial()) {
    on<GetUpComingMoviesEvent>(_onGetUpComingMovies);
    on<GetNextUpComingMoviesPageEvent>(_onGetNextPage);
  }

  FutureOr<void> _onGetUpComingMovies(GetUpComingMoviesEvent event, Emitter<UpComingMoviesState> emit) async {
    emit(state.copyWith(fetching: true, failureEither: right(unit)));
    GetUpComingMoviesListParams params = GetUpComingMoviesListParams(
      page: state.currentPage,
      language: Localizations.localeOf(navigatorKeyGlobal.currentState!.context).languageCode,
    );
    final resultEither = await _getUpComingMoviesList(params);

    if (resultEither.isLeft()) {
      final failure = handleFailure(resultEither);
      emit(state.copyWith(fetching: false, failureEither: left(failure)));
      return;
    }

    final response = resultEither.getOrElse(() => MoviesList.empty());

    state.results.addAll(response.results);
    final totalPages = response.totalPages;
    final results = [...state.results];
    final currentPage = state.currentPage + 1;

    emit(state.copyWith(
      fetching: false,
      failureEither: right(unit),
      moviesList: response,
      currentPage: currentPage,
      results: results,
      totalPages: totalPages,
    ));
  }

  FutureOr<void> _onGetNextPage(GetNextUpComingMoviesPageEvent event, Emitter<UpComingMoviesState> emit) async {
    if (state.currentPage > state.totalPages || state.fetchingNextPage) {
      return;
    }
    emit(state.copyWith(fetchingNextPage: true, failureEither: right(unit)));
    GetUpComingMoviesListParams params = GetUpComingMoviesListParams(
      page: state.currentPage,
      language: Localizations.localeOf(navigatorKeyGlobal.currentState!.context).languageCode,
    );
    final resultEither = await _getUpComingMoviesList(params);

    if (resultEither.isLeft()) {
      final failure = handleFailure(resultEither);
      emit(state.copyWith(fetchingNextPage: false, failureEither: left(failure)));
      return;
    }

    final response = resultEither.getOrElse(() => MoviesList.empty());

    state.results.addAll(response.results);
    final totalPages = response.totalPages;
    final results = [...state.results];
    final currentPage = state.currentPage + 1;

    emit(state.copyWith(
      fetchingNextPage: false,
      failureEither: right(unit),
      moviesList: response,
      currentPage: currentPage,
      results: results,
      totalPages: totalPages,
    ));
  }
}
