part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

final class SubcategoriesLoading extends HomePageState {}

final class SubcategoriesPaginationLoading extends HomePageState {
  final List<Category>? subCategorydata;

  SubcategoriesPaginationLoading({required this.subCategorydata});
}

final class SubcategoriesLoaded extends HomePageState {
  final SubCategoryModelResponse subCategorydata;

  SubcategoriesLoaded({required this.subCategorydata});
}

final class SubcategoriesFailed extends HomePageState {}
