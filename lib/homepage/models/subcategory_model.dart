import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class SubCategoryModel {
  SubCategoryModel({
    this.status,
    this.message,
    this.result,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        status: asT<int?>(json['Status']),
        message: asT<String?>(json['Message']),
        result: json['Result'] == null
            ? null
            : Result.fromJson(asT<Map<String, dynamic>>(json['Result'])!),
      );

  int? status;
  String? message;
  Result? result;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Status': status,
        'Message': message,
        'Result': result,
      };
}

class Result {
  Result({
    this.category,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    final List<Category>? category =
        json['Category'] is List ? <Category>[] : null;
    if (category != null) {
      for (final dynamic item in json['Category']!) {
        if (item != null) {
          category.add(Category.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return Result(
      category: category,
    );
  }

  List<Category>? category;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Category': category,
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.isAuthorize,
    this.update080819,
    this.update130919,
    this.subCategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    final List<SubCategories>? subCategories =
        json['SubCategories'] is List ? <SubCategories>[] : null;
    if (subCategories != null) {
      for (final dynamic item in json['SubCategories']!) {
        if (item != null) {
          subCategories
              .add(SubCategories.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return Category(
      id: asT<int?>(json['Id']),
      name: asT<String?>(json['Name']),
      isAuthorize: asT<int?>(json['IsAuthorize']),
      update080819: asT<int?>(json['Update080819']),
      update130919: asT<int?>(json['Update130919']),
      subCategories: subCategories,
    );
  }

  int? id;
  String? name;
  int? isAuthorize;
  int? update080819;
  int? update130919;
  List<SubCategories>? subCategories;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Id': id,
        'Name': name,
        'IsAuthorize': isAuthorize,
        'Update080819': update080819,
        'Update130919': update130919,
        'SubCategories': subCategories,
      };
}

class SubCategories {
  SubCategories({
    this.id,
    this.name,
    this.product,
  });

  factory SubCategories.fromJson(Map<String, dynamic> json) {
    final List<Product>? product = json['Product'] is List ? <Product>[] : null;
    if (product != null) {
      for (final dynamic item in json['Product']!) {
        if (item != null) {
          product.add(Product.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return SubCategories(
      id: asT<int?>(json['Id']),
      name: asT<String?>(json['Name']),
      product: product,
    );
  }

  int? id;
  String? name;
  List<Product>? product;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Id': id,
        'Name': name,
        'Product': product,
      };
}

class Product {
  Product({
    this.name,
    this.priceCode,
    this.imageName,
    this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: asT<String?>(json['Name']),
        priceCode: asT<String?>(json['PriceCode']),
        imageName: asT<String?>(json['ImageName']),
        id: asT<int?>(json['Id']),
      );

  String? name;
  String? priceCode;
  String? imageName;
  int? id;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'Name': name,
        'PriceCode': priceCode,
        'ImageName': imageName,
        'Id': id,
      };
}
