import 'package:flutter_bloc/flutter_bloc.dart';
part 'event.dart';
part 'state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchInitialize>(_initialize);
  }
  _initialize(SearchInitialize event, Emitter<SearchState> emit) {}
}
