import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pagination_event.dart';
part 'pagination_state.dart';

class PaginationBloc extends Bloc<PaginationEvent, PaginationState> {
  PaginationBloc() : super(PaginationInitial()) {
    on<PaginationActionEvent>(paginationActionEvent);
  }

  FutureOr<void> paginationActionEvent(
      PaginationActionEvent event, Emitter<PaginationState> emit) async {
    emit(PaginationActionState(currentPage: event.page));
  }
}
