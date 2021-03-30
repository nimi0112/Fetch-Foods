import 'dart:convert';

import 'package:equatable/equatable.dart';

// To parse this JSON data, do
//
//     final foodMenu = foodMenuFromJson(jsonString);

FoodMenu foodMenuFromJson(String str) => FoodMenu.fromJson(json.decode(str));

String foodMenuToJson(FoodMenu data) => json.encode(data.toJson());

class FoodMenu extends Equatable {
  final List<CategoryElement> categories;

  const FoodMenu({this.categories});

  @override
  List<Object> get props => [categories];

  static FoodMenu fromJson(Map<String, dynamic> json) {
    return FoodMenu(
      categories: json["categories"] == null
          ? null
          : List<CategoryElement>.from(json["categories"].map((x) => CategoryElement.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "categories":
            categories == null ? null : List<dynamic>.from(categories.map((x) => x.toJson())),
      };

  FoodMenu copyWith({
    List<CategoryElement> categories,
  }) =>
      FoodMenu(
        categories: categories ?? this.categories,
      );

  @override
  String toString() => categories.toString();
}

class CategoryElement extends Equatable {
  CategoryElement({
    this.category,
  });

  Category category;

  @override
  List<Object> get props => [category];

  CategoryElement copyWith({
    Category category,
  }) =>
      CategoryElement(
        category: category ?? this.category,
      );

  factory CategoryElement.fromJson(Map<String, dynamic> json) => CategoryElement(
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "category": category == null ? null : category.toJson(),
      };

  @override
  String toString() => 'CategoryElement { category: $category }';
}

class Category extends Equatable {
  Category({
    this.subcategories,
    this.quote,
    this.protip,
    this.imagePath,
    this.localImagePath,
    this.categoryName,
    this.colorCode,
    this.servingSize,
    this.allSubcategories,
    this.isSearched = false,
  });

  final List<Subcategory> subcategories;
  final String quote;
  final String protip;
  final String imagePath;
  final String localImagePath;
  final String categoryName;
  final String colorCode;
  final String servingSize;
  List<String> allSubcategories;
  final bool isSearched;

  @override
  List<Object> get props => [
        subcategories,
        quote,
        protip,
        imagePath,
        localImagePath,
        categoryName,
        colorCode,
        servingSize,
      ];

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        subcategories: json["subcategories"] == null
            ? null
            : List<Subcategory>.from(json["subcategories"].map((x) => Subcategory.fromJson(x))),
        quote: json["quote"] == null ? null : json["quote"],
        protip: json["protip"] == null ? null : json["protip"],
        imagePath: json["imagePath"] == null ? null : json["imagePath"],
        localImagePath: json["localImagePath"] == null ? null : json["localImagePath"],
        categoryName: json["categoryName"] == null ? null : json["categoryName"],
        colorCode: json["colorCode"] == null ? null : json["colorCode"],
        servingSize: json["servingSize"] == null ? null : json["servingSize"],
      );

  Map<String, dynamic> toJson() => {
        "subcategories":
            subcategories == null ? null : List<dynamic>.from(subcategories.map((x) => x.toJson())),
        "quote": quote == null ? null : quote,
        "protip": protip == null ? null : protip,
        "imagePath": imagePath == null ? null : imagePath,
        "localImagePath": localImagePath == null ? null : localImagePath,
        "categoryName": categoryName == null ? null : categoryName,
        "colorCode": colorCode == null ? null : colorCode,
        "servingSize": servingSize == null ? null : servingSize,
      };

  @override
  String toString() {
    return 'CategoryCategory{subcategories: $subcategories, quote: $quote, protip: $protip, imagePath: $imagePath, localImagePath: $localImagePath, categoryName: $categoryName, colorCode: $colorCode, servingSize: $servingSize}';
  }

  Category copyWith({
    List<Subcategory> subcategories,
    String quote,
    String protip,
    String imagePath,
    String localImagePath,
    String categoryName,
    String colorCode,
    String servingSize,
    List<String> allSubcategories,
    bool isSearched,
  }) =>
      Category(
        subcategories: subcategories ?? this.subcategories,
        quote: quote ?? this.quote,
        protip: protip ?? this.protip,
        imagePath: imagePath ?? this.imagePath,
        localImagePath: localImagePath ?? this.localImagePath,
        categoryName: categoryName ?? this.categoryName,
        colorCode: colorCode ?? this.colorCode,
        servingSize: servingSize ?? this.servingSize,
        allSubcategories: allSubcategories ?? this.allSubcategories,
        isSearched: isSearched ?? this.isSearched,
      );
}

class Subcategory extends Equatable {
  Subcategory({
    this.items,
    this.subCategoryname,
    this.servingSize,
  });

  final List<String> items;
  final String subCategoryname;
  final String servingSize;

  @override
  List<Object> get props => [
        items,
        subCategoryname,
        servingSize,
      ];

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        items: json["items"] == null ? null : List<String>.from(json["items"].map((x) => x)),
        subCategoryname: json["subCategoryname"] == null ? null : json["subCategoryname"],
        servingSize: json["servingSize"] == null ? null : json["servingSize"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x)),
        "subCategoryname": subCategoryname == null ? null : subCategoryname,
        "servingSize": servingSize == null ? null : servingSize,
      };

  @override
  String toString() {
    return 'Subcategory{items: $items, subCategoryname: $subCategoryname, servingSize: $servingSize}';
  }

  Subcategory copyWith({
    List<String> items,
    String subCategoryname,
    String servingSize,
  }) =>
      Subcategory(
        items: items ?? this.items,
        subCategoryname: subCategoryname ?? this.subCategoryname,
        servingSize: servingSize ?? this.servingSize,
      );
}
