class EpiModel {
  final String? id;
  final String title;
  final String category;
  final String? description;
  final int minDays;
  final int? maxDays;
  final List<String> images;
  final int stock;
  final int availables;
  final bool? status;
  final double pricePerDay;
  final String? userId; // Adicionado para referência ao usuário que favoritou
  final DateTime? createdAt;
  final DateTime? updatedAt;

  EpiModel({
    this.id,
    required this.title,
    required this.category,
    this.description,
    required this.minDays,
    this.maxDays,
    required this.images,
    required this.stock,
    required this.availables,
    required this.pricePerDay,
    this.status,
    this.userId, // Adicionado
    this.createdAt,
    this.updatedAt,
  });

  factory EpiModel.fromJson(Map<String, dynamic> json) {
    return EpiModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      minDays: json['minDays'],
      maxDays: json['maxDays'],
      images: List<String>.from(json['images']),
      stock: json['stock'],
      availables: json['availables'],
      pricePerDay: (json['pricePerDay'] as num).toDouble(),
      status: json['status'],
      userId: json['userid'], // Adicionado
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'minDays': minDays,
      'maxDays': maxDays,
      'images': images,
      'stock': stock,
      'availables': availables,
      'status': status,
      'pricePerDay': pricePerDay,
      'userid': userId, // Adicionado
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
