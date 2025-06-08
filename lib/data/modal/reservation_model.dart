import 'package:project/data/modal/Equipament.dart';

class ReservationModel {
  final String? id;
  final int reservedDays;
  final int remainDays;
  final int numEpis;
  final double total;
  final String status;
  final String? epiid;
  final EpiModel? epi;
  final String userId;
  // Se você tiver um model User, pode importar e usar aqui:
  // final UserModel? user;

  ReservationModel({
    this.id,
    required this.reservedDays,
    required this.remainDays,
    required this.numEpis,
    required this.total,
    required this.status,
    this.epiid,
    this.epi,
    required this.userId,
    // this.user,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['_id'] ?? json['id'],
      reservedDays: json['reservedDays'],
      remainDays: json['remainDays'],
      numEpis: json['numEpis'] ?? 0,
      total: (json['total'] as num).toDouble(),
      status: json['status'],
      epiid: json['epiid'],
      epi: json['epi'] != null ? EpiModel.fromJson(json['epi']) : null,
      userId: json['userId'],
      // user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'reservedDays': reservedDays,
      'remainDays': remainDays,
      'numEpis': numEpis,
      'total': total,
      'status': status,
      'epiid': epiid,
      'epi': epi?.toJson(),
      'userId': userId,
      // 'user': user?.toJson(),
    };
  }
}
