class ShipmentCategory {
  final int categoryId;
  final String categoryName;

  ShipmentCategory({required this.categoryId, required this.categoryName});

  static List<ShipmentCategory> categories = [
    ShipmentCategory(categoryId: 1, categoryName: "Documents"),
    ShipmentCategory(categoryId: 2, categoryName: "Glass"),
    ShipmentCategory(categoryId: 3, categoryName: "Liquid"),
    ShipmentCategory(categoryId: 4, categoryName: "Food"),
    ShipmentCategory(categoryId: 5, categoryName: "Electronic"),
    ShipmentCategory(categoryId: 6, categoryName: "Products"),
    ShipmentCategory(categoryId: 7, categoryName: "others"),
  ];
}
