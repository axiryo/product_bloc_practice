part of 'pagination_bloc.dart';

@immutable
sealed class PaginationState {}

final class PaginationInitial extends PaginationState {}

final class PaginationActionState extends PaginationState {
  final int currentPage;

  PaginationActionState({required this.currentPage});
}
