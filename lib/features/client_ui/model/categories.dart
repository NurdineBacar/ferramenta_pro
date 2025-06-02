import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Category {
  final String label;
  final String value;
  final IconData icon;

  Category({required this.label, required this.value, required this.icon});
}

class CategoriesList {
  CategoriesList._();

  static List<Category> listOfCategories = [
    Category(
      label: 'Ferramentas',
      value: 'ferramentas',
      icon: Iconsax.activity,
    ),
    Category(label: 'Elétricas', value: 'eletricas', icon: Iconsax.flash),
    Category(
      label: 'Proteção',
      value: 'protecao',
      icon: Iconsax.shield_security,
    ),
    Category(label: 'Fixação', value: 'fixacao', icon: Iconsax.box),
    Category(label: 'Tintas', value: 'tintas', icon: Iconsax.paintbucket),
    Category(label: 'Elétrica', value: 'eletrica', icon: Iconsax.activity),
    Category(label: 'Hidráulica', value: 'hidraulica', icon: Iconsax.drop),
    Category(label: 'Parafusos', value: 'parafusos', icon: Iconsax.driver),
    Category(label: 'Ferragens', value: 'ferragens', icon: Iconsax.setting_2),
    Category(label: 'Máquinas', value: 'maquinas', icon: Iconsax.activity3),
    Category(label: 'Jardim', value: 'jardim', icon: Iconsax.tree),
    Category(label: 'Construção', value: 'construcao', icon: Iconsax.buildings),
    Category(
      label: 'Lubrificantes',
      value: 'lubrificantes',
      icon: Iconsax.activity,
    ),
    Category(label: 'Tubos', value: 'tubos', icon: Iconsax.activity),
    Category(label: 'Trancas', value: 'trancas', icon: Iconsax.lock),
  ];
}
