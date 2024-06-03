part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class HomeDataFetched extends HomePageEvent {}

class HomeDataPaginatedFetched extends HomePageEvent {
  HomeDataPaginatedFetched(this.category);
  final List<Category>? category;
}
