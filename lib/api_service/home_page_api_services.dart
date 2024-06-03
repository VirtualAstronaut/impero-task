import 'dart:developer';

import 'package:impero_task/api_service/dio_service.dart';
import 'package:impero_task/api_service/endpoints.dart';
import 'package:impero_task/homepage/models/model.dart';

class HomePageAPIServices {
  static Future<SubCategoryModelResponse?>? getSubcatories(
    int pageIndex,
  ) async {
    try {
      final dio = DioService.dio;
      final data = SubCategoriesPostModel(categoryId: 56, pageIndex: pageIndex);
      final response = await dio.post(
        EndPoints.productDashBoard,
        data: data.toJson(),
      );
      return SubCategoryModelResponse.fromJson(response.data);
    } catch (e) {
      log('Error $e');
      return null;
    }
  }
}
