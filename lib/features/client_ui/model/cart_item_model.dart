class CartItemModel {
  final String name;
  final String period;
  final double total;
  final String imageAsset;

  CartItemModel({
    required this.name,
    required this.period,
    required this.total,
    required this.imageAsset,
  });
}

// Exemplo de lista de itens do carrinho
class CartitemList {
  static final List<CartItemModel> cartItems = [
    CartItemModel(
      name: "Parafuso chave estrela",
      period: "3 dias",
      total: 200.0,
      imageAsset: "assets/images/item.jpg",
    ),
    CartItemModel(
      name: "Martelo de borracha",
      period: "2 dias",
      total: 150.0,
      imageAsset: "assets/images/item.jpg",
    ),
    CartItemModel(
      name: "Chave de fenda Phillips",
      period: "5 dias",
      total: 180.0,
      imageAsset: "assets/images/item.jpg",
    ),
    CartItemModel(
      name: "Serrote de poda",
      period: "4 dias",
      total: 220.0,
      imageAsset: "assets/images/item.jpg",
    ),
    CartItemModel(
      name: "Broca para concreto",
      period: "1 dia",
      total: 90.0,
      imageAsset: "assets/images/item.jpg",
    ),
    CartItemModel(
      name: "Trena a laser",
      period: "3 dias",
      total: 250.0,
      imageAsset: "assets/images/item.jpg",
    ),
    CartItemModel(
      name: "Furadeira elétrica",
      period: "7 dias",
      total: 350.0,
      imageAsset: "assets/images/item.jpg",
    ),
    CartItemModel(
      name: "Alicate universal",
      period: "2 dias",
      total: 130.0,
      imageAsset: "assets/images/item.jpg",
    ),
  ];
}
