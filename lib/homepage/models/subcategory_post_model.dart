import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class SubCategoriesPostModel {
  SubCategoriesPostModel({
    required this.categoryId,
    this.deviceManufacturer,
    this.deviceModel,
    this.deviceToken,
    required this.pageIndex,
  });

  factory SubCategoriesPostModel.fromJson(Map<String, dynamic> json) =>
      SubCategoriesPostModel(
        categoryId: asT<int>(json['CategoryId'])!,
        deviceManufacturer: asT<String>(json['DeviceManufacturer'])!,
        deviceModel: asT<String>(json['DeviceModel'])!,
        deviceToken: asT<String>(json['DeviceToken'])!,
        pageIndex: asT<int>(json['PageIndex'])!,
      );

  int categoryId;
  String? deviceManufacturer;
  String? deviceModel;
  String? deviceToken;
  int pageIndex;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'CategoryId': categoryId,
        'DeviceManufacturer': deviceManufacturer,
        'DeviceModel': deviceModel,
        'DeviceToken': deviceToken,
        'PageIndex': pageIndex,
      };
}
