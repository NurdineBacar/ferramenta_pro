import 'package:project/data/modal/Equipament.dart';

class CartModel {
  final int index;
  final EpiModel epi;
  final int days;
  final double total;

  CartModel({
    required this.index,
    required this.epi,
    required this.days,
    required this.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      index: json["index"],
      epi: json["epi"],
      days: json["days"],
      total: (json["total"] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {"index": index, "epi": epi, "days": days, "total": total};
  }
}
