class ShipmentVehicle {
  final String icon;
  final String title;
  final String subTitle;

  ShipmentVehicle(
      {required this.icon, required this.title, required this.subTitle});
  static List<ShipmentVehicle> shipmentVehicles = [
    ShipmentVehicle(
        icon: "asset/icon/icon_ship.jpeg",
        title: "Ocean freight",
        subTitle: "International"),
    ShipmentVehicle(
        icon: "asset/icon/icon_truck.png",
        title: "Cargo freight",
        subTitle: "Reliable"),
    ShipmentVehicle(
        icon: "asset/icon/icon_ship.jpeg",
        title: "Air freight",
        subTitle: "International"),
  ];
}
