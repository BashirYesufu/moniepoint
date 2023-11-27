class ShipmentItem {
  final String itemName;
  final String itemId;
  final String fromLocation;
  final String toLocation;

  ShipmentItem(
      {required this.itemName,
        required this.itemId,
        required this.fromLocation,
        required this.toLocation});
  static List<ShipmentItem> shipmentItems = [
    ShipmentItem(
        itemName: "Summer linen jacket",
        itemId: "NEJ21089934122231",
        fromLocation: "Barcelona",
        toLocation: "Paris"),
    ShipmentItem(
        itemName: "Tapered-fit jeans AW",
        itemId: "NEJ22089934122231",
        fromLocation: "Columbia",
        toLocation: "Paris"),
    ShipmentItem(
        itemName: "Macbook pro M2",
        itemId: "NEJ20189934122231",
        fromLocation: "Paris",
        toLocation: "Morocco"),
    ShipmentItem(
        itemName: "Office setup dest",
        itemId: "NEJ1089934122231",
        fromLocation: "France",
        toLocation: "German"),
  ];
}
