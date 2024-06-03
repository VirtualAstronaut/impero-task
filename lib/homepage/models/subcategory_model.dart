class SubCategoryModelResponse {
  SubCategoryModelResponse({
    required this.status,
    required this.message,
    required this.result,
  });

  final int? status;
  final String? message;
  final Result? result;

  SubCategoryModelResponse copyWith({
    int? status,
    String? message,
    Result? result,
  }) {
    return SubCategoryModelResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      result: result ?? this.result,
    );
  }

  factory SubCategoryModelResponse.fromJson(Map<String, dynamic> json) {
    return SubCategoryModelResponse(
      status: json["Status"],
      message: json["Message"],
      result: json["Result"] == null ? null : Result.fromJson(json["Result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Result": result?.toJson(),
      };
}

class Result {
  Result({
    required this.category,
  });

  final List<Category> category;

  Result copyWith({
    List<Category>? category,
  }) {
    return Result(
      category: category ?? this.category,
    );
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      category: json["Category"] == null
          ? []
          : List<Category>.from(
              json["Category"]!.map((x) => Category.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "Category": category.map((x) => x?.toJson()).toList(),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.isAuthorize,
    required this.update080819,
    required this.update130919,
    required this.subCategories,
  });

  final int? id;
  final String? name;
  final int? isAuthorize;
  final int? update080819;
  final int? update130919;
  final List<SubCategory> subCategories;

  Category copyWith({
    int? id,
    String? name,
    int? isAuthorize,
    int? update080819,
    int? update130919,
    List<SubCategory>? subCategories,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      isAuthorize: isAuthorize ?? this.isAuthorize,
      update080819: update080819 ?? this.update080819,
      update130919: update130919 ?? this.update130919,
      subCategories: subCategories ?? this.subCategories,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["Id"],
      name: json["Name"],
      isAuthorize: json["IsAuthorize"],
      update080819: json["Update080819"],
      update130919: json["Update130919"],
      subCategories: json["SubCategories"] == null
          ? []
          : List<SubCategory>.from(
              json["SubCategories"]!.map((x) => SubCategory.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "IsAuthorize": isAuthorize,
        "Update080819": update080819,
        "Update130919": update130919,
        "SubCategories": subCategories.map((x) => x?.toJson()).toList(),
      };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.name,
    required this.product,
  });

  final int? id;
  final String? name;
  final List<Product> product;

  SubCategory copyWith({
    int? id,
    String? name,
    List<Product>? product,
  }) {
    return SubCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      product: product ?? this.product,
    );
  }

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json["Id"],
      name: json["Name"],
      product: json["Product"] == null
          ? []
          : List<Product>.from(
              json["Product"]!.map((x) => Product.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Product": product.map((x) => x?.toJson()).toList(),
      };
}

class Product {
  Product({
    required this.name,
    required this.priceCode,
    required this.imageName,
    required this.id,
  });

  final String? name;
  final String? priceCode;
  final String? imageName;
  final int? id;

  Product copyWith({
    String? name,
    String? priceCode,
    String? imageName,
    int? id,
  }) {
    return Product(
      name: name ?? this.name,
      priceCode: priceCode ?? this.priceCode,
      imageName: imageName ?? this.imageName,
      id: id ?? this.id,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json["Name"],
      priceCode: json["PriceCode"],
      imageName: json["ImageName"],
      id: json["Id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Name": name,
        "PriceCode": priceCode,
        "ImageName": imageName,
        "Id": id,
      };
}
