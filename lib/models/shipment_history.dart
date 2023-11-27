import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../constants/app_color.dart';

class ShipmentHistory {
  final ShipmentStatus status;
  final double amount;
  final DateTime date;
  final String location;
  final String id;

  ShipmentHistory(
      {required this.status,
        required this.id,
        required this.amount,
        required this.date,
        required this.location});

  static List<ShipmentHistory> shipmentHistory = [
    ShipmentHistory(
        status: ShipmentStatus.completed,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistory(
        status: ShipmentStatus.pending,
        id: "NEJ20089934122231",
        amount: 650,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistory(
        status: ShipmentStatus.pending,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistory(
        status: ShipmentStatus.completed,
        id: "NEJ20089934122231",
        amount: 100,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistory(
        status: ShipmentStatus.pending,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistory(
        status: ShipmentStatus.completed,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistory(
        status: ShipmentStatus.progress,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistory(
        status: ShipmentStatus.pending,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistory(
        status: ShipmentStatus.completed,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta"),
    ShipmentHistory(
        status: ShipmentStatus.progress,
        id: "NEJ20089934122231",
        amount: 1400,
        date: DateTime(2023, 9, 20),
        location: "Atlanta")
  ];
}

enum ShipmentStatus {
  progress,
  pending,
  completed,
  all;
}

extension SelectedShipmentStatus on ShipmentStatus {
  String get name => describeEnum(this);
  String get title {
    switch (this) {
      case ShipmentStatus.progress:
        return "In-progress";
      case ShipmentStatus.pending:
        return "Pending";
      case ShipmentStatus.completed:
        return "Completed";
      default:
        return "All";
    }
  }

  Color get color {
    switch (this) {
      case ShipmentStatus.progress:
        return AppColor.success;
      case ShipmentStatus.pending:
        return AppColor.pending;
      case ShipmentStatus.completed:
        return AppColor.primary;
      default:
        return AppColor.primary;
    }
  }
}
