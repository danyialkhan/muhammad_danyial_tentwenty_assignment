import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_tab_bloc_state.dart';
part 'home_tab_bloc_event.dart';

class HomeTabBloc extends Bloc<HomeTabEvent, HomeTabState> {
  HomeTabBloc() : super(HomeTabState.initial());
}
