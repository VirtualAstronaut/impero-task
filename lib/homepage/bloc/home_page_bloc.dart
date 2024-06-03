import 'package:bloc/bloc.dart';
import 'package:impero_task/api_service/api_service.dart';
import 'package:impero_task/homepage/models/model.dart';
import 'package:impero_task/homepage/models/subcategory_model.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  int subcategoryIndex = 1;
  int producIndex = 1;
  HomePageBloc() : super(HomePageInitial()) {
    on<HomeDataFetched>((event, emit) async {
      emit(SubcategoriesLoading());

      final response = await HomePageAPIServices.getSubcatories(
        subcategoryIndex,
      );

      if (response == null) {
        emit(SubcategoriesFailed());
        return;
      }

      emit(SubcategoriesLoaded(subCategorydata: response));
    });

    on<HomeDataPaginatedFetched>((event, emit) async {
      late SubcategoriesLoaded? data;

      if (state is SubcategoriesLoaded) {
        data = state as SubcategoriesLoaded;
      }
      emit(
        SubcategoriesPaginationLoading(
          subCategorydata: event.category,
        ),
      );
      final response = await HomePageAPIServices.getSubcatories(
        ++subcategoryIndex,
      );

      if (response == null) {
        emit(SubcategoriesFailed());
        return;
      }
      if (data != null) {
        final updatedData = response.copyWith(
          result: response.result?.copyWith(
            category: [
              ...?response.result?.category,
            ],
          ),
        );
        emit(SubcategoriesLoaded(subCategorydata: updatedData));
      }
    });
  }
}
