class Equipament {
  final String name;
  final int minDays;
  final int maxDays;
  final String description;
  final List<String> images;
  final double pricePerDay; // Novo campo

  Equipament({
    required this.name,
    required this.minDays,
    required this.maxDays,
    required this.description,
    required this.images,
    required this.pricePerDay, // Adicionado ao construtor
  });
}

class EquipamentList {
  static final List<Equipament> equipments = [
    Equipament(
      name: 'Gerador de Energia',
      minDays: 3,
      maxDays: 15,
      description:
          'Gerador a diesel ideal para obras e eventos, com autonomia de 12 horas e potência de 10kVA.',
      images: ['assets/images/item.jpg', 'assets/images/item.jpg'],
      pricePerDay: 150.0,
    ),
    Equipament(
      name: 'Betoneira 400L',
      minDays: 2,
      maxDays: 10,
      description:
          'Betoneira profissional de 400 litros, ideal para pequenas e médias obras.',
      images: ['assets/images/item.jpg', 'assets/images/item.jpg'],
      pricePerDay: 90.0,
    ),
    Equipament(
      name: 'Compactador de Solo',
      minDays: 1,
      maxDays: 7,
      description:
          'Compactador tipo “sapo” ideal para fundações, valas e compactação de solo argiloso.',
      images: ['assets/images/item.jpg'],
      pricePerDay: 120.0,
    ),
    Equipament(
      name: 'Andaime Tubular',
      minDays: 3,
      maxDays: 20,
      description:
          'Andaime modular de montagem rápida, com até 4 metros de altura.',
      images: ['assets/images/item.jpg'],
      pricePerDay: 25.0,
    ),
    Equipament(
      name: 'Martelo Demolidor',
      minDays: 1,
      maxDays: 5,
      description:
          'Martelo elétrico de 10kg para demolição de concreto e alvenaria.',
      images: ['assets/images/item.jpg'],
      pricePerDay: 75.0,
    ),
    Equipament(
      name: 'Martelo comedor',
      minDays: 1,
      maxDays: 5,
      description:
          'Martelo elétrico de 10kg para demolição de concreto e alvenaria.',
      images: ['assets/images/item.jpg'],
      pricePerDay: 75.0,
    ),
  ];
}
