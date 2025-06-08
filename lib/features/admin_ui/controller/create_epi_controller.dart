import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/data/modal/Equipament.dart';
import 'package:project/features/admin_ui/controller/epi_controller.dart';
import 'package:project/features/client_ui/model/categories.dart';
import 'package:project/utils/helpers/function_helpers.dart';
import 'package:project/utils/http/http_client.dart';
import 'package:project/utils/logging/logger.dart';

class CreateEpiController extends GetxController {
  // Form controllers
  final title = TextEditingController();
  final description = TextEditingController();
  final category = TextEditingController();
  final minDays = TextEditingController();
  final maxDays = TextEditingController();
  final pricePerDay = TextEditingController();
  final stock = TextEditingController();

  // State variables
  final selectedImages = <File>[].obs;
  final isLoading = false.obs;

  // Category selection
  final selectedCategory = Rx<dynamic>(null);
  final categories = CategoriesList.listOfCategories;

  @override
  void onClose() {
    title.dispose();
    description.dispose();
    category.dispose();
    minDays.dispose();
    maxDays.dispose();
    pricePerDay.dispose();
    super.onClose();
  }

  void selectCategory(dynamic value) {
    selectedCategory.value = value;
    category.text = value?.value ?? '';
  }

  void addImages(List<File> files) {
    selectedImages.addAll(files);
  }

  void removeImage(int index) {
    if (index >= 0 && index < selectedImages.length) {
      selectedImages.removeAt(index);
    }
  }

  Future<void> createEpi() async {
    try {
      isLoading.value = true;

      final epi = EpiModel(
        title: title.text.trim(),
        description: description.text.trim(),
        category: selectedCategory.value?.value ?? '',
        minDays: int.tryParse(minDays.text) ?? 0,
        maxDays: int.tryParse(maxDays.text) ?? 0,
        pricePerDay: double.tryParse(pricePerDay.text) ?? 0.0,
        stock: int.tryParse(stock.text) ?? 0,
        availables: int.tryParse(stock.text) ?? 0,
        images: [],
        // Add other necessary fields
      );

      // Add images to form data
      // for (var image in selectedImages) {
      //   formData.files.add(
      //     MapEntry(
      //       'images[]',
      //       MultipartFile(
      //         image,
      //         filename: 'epi_${DateTime.now().millisecondsSinceEpoch}.jpg',
      //       ),
      //     ),
      //   );
      // }

      final response = await HttpClient.post("epi/store", {
        "title": epi.title,
        "category": epi.category,
        "description": epi.description,
        "minDays": epi.minDays,
        "maxDays": epi.maxDays,
        "stock": epi.stock,
        "images": epi.images,
        "pricePerDay": epi.pricePerDay,
      });

      if (response.statusCode == 201) {
        await Get.put(EpiController()).getEpis(); // Return to previous screen
        Get.back();
        Helpers.successSnackbar(
          title: "Sucesso",
          message: "Equipamento criado com sucesso",
        );
      } else {
        throw Exception('Failed to create EPI');
      }
    } catch (e) {
      Helpers.errorSnackbar(title: "Erro", message: e.toString());
      AppLoggerHelper.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateEpi(String id) async {
    try {
      isLoading.value = true;

      final epi = EpiModel(
        title: title.text.trim(),
        description: description.text.trim(),
        category: selectedCategory.value?.value ?? '',
        minDays: int.tryParse(minDays.text) ?? 0,
        maxDays: int.tryParse(maxDays.text) ?? 0,
        pricePerDay: double.tryParse(pricePerDay.text) ?? 0.0,
        stock: int.tryParse(stock.text) ?? 0,
        availables: int.tryParse(stock.text) ?? 0,
        images: [],
        // Add other necessary fields
      );

      // Add images to form data
      // for (var image in selectedImages) {
      //   formData.files.add(
      //     MapEntry(
      //       'images[]',
      //       MultipartFile(
      //         image,
      //         filename: 'epi_${DateTime.now().millisecondsSinceEpoch}.jpg',
      //       ),
      //     ),
      //   );
      // }

      final response = await HttpClient.put("epi/$id", {
        "title": epi.title,
        "category": epi.category,
        "description": epi.description,
        "minDays": epi.minDays,
        "maxDays": epi.maxDays,
        "stock": epi.stock,
        "images": epi.images,
        "pricePerDay": epi.pricePerDay,
      });

      if (response.statusCode == 201 || response.statusCode == 200) {
        await Get.put(EpiController()).getEpis(); // Return to previous screen
        Get.back();
        Helpers.successSnackbar(
          title: "Sucesso",
          message: "Equipamento Atualizado com sucesso",
        );
        Get.back();
        AppLoggerHelper.warning(response.body);
      } else {
        throw "Fhala ao atualizar equipamento";
      }
    } catch (e) {
      Helpers.errorSnackbar(title: "Erro", message: e.toString());
      AppLoggerHelper.error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Validation methods
  String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? validateNumeric(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    if (double.tryParse(value) == null) {
      return 'Enter a valid number';
    }
    return null;
  }

  void fullTextField() {}
}
