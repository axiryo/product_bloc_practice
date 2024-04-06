part of 'pagination_bloc.dart';

@immutable
sealed class PaginationEvent {}

class PaginationActionEvent extends PaginationEvent {
  final int page;

  PaginationActionEvent({required this.page});
}
