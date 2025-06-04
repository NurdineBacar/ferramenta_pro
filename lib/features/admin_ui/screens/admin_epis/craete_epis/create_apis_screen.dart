import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class CreateApisScreen extends StatelessWidget {
  CreateApisScreen({super.key});

  final EpisController controller = Get.put(EpisController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Novo Equipamento"),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Iconsax.arrow_left),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [const SizedBox(height: 40), _buildForm(context)],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // ... outros campos do formulário permanecem iguais ...
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.designtools),
              labelText: "Nome do equipamento",
              prefixText: "| ",
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.calendar_1),
                    labelText: "Minimo de dias",
                    prefixText: "| ",
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.calendar_1),
                    labelText: "Maximo de dias",
                    prefixText: "| ",
                    hintText: "Insira numero maximo dias",
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            maxLines: null,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.designtools),
              labelText: "Descrição",
              prefixText: "| ",
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.money_2),
              labelText: "Preço",
              prefixText: "| ",
            ),
          ),
          const SizedBox(height: 20),
          _buildImagePreview(),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: controller.pickImages,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Iconsax.document_upload, size: 25),
                      const SizedBox(width: 10),
                      Text(
                        "Carregar imagens",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 55,
                child: ElevatedButton(
                  onPressed: () => controller.takeSinglePhoto(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [const Icon(Iconsax.camera, size: 20)],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 75),
          SizedBox(
            width: Helpers.screenWidth(context),
            child: ElevatedButton(onPressed: () {}, child: Text("Criar")),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreview() {
    return Obx(
      () =>
          controller.selectedImages.isEmpty
              ? Center(
                child: Text(
                  "Nenhuma Imagem carregada",
                  style: Theme.of(Get.context!).textTheme.titleSmall,
                ),
              )
              : Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Imagens Selecionadas (${controller.selectedImages.length}/${controller.maxImages})',
                    style: Get.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemCount: controller.selectedImages.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              controller.selectedImages[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 6,
                            right: 6,
                            child: GestureDetector(
                              onTap: () => controller.removeImage(index),
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                padding: const EdgeInsets.all(4),
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
    );
  }
}

class EpisController extends GetxController {
  final RxList<File> selectedImages = <File>[].obs;
  final int maxImages = 10;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImages() async {
    try {
      final List<XFile>? images = await _picker.pickMultiImage();
      if (images != null) {
        _addImages(images);
      }
    } catch (e) {
      _showError('Erro ao selecionar imagens: ${e.toString()}');
    }
  }

  Future<void> takeSinglePhoto() async {
    try {
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 85,
      );
      if (photo != null) {
        _addImages([photo]);
      }
    } catch (e) {
      _showError('Erro ao tirar foto: ${e.toString()}');
    }
  }

  void _addImages(List<XFile> files) {
    if (selectedImages.length + files.length > maxImages) {
      _showError('Limite de $maxImages imagens atingido');
      return;
    }

    final newImages =
        files
            .map((file) => File(file.path))
            .where((file) => !selectedImages.any((f) => f.path == file.path))
            .toList();

    if (newImages.isNotEmpty) {
      selectedImages.addAll(newImages);
    }
  }

  void _showError(String message) {
    Get.snackbar(
      'Erro',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red[400],
      colorText: Colors.white,
    );
  }

  void removeImage(int index) {
    if (index >= 0 && index < selectedImages.length) {
      selectedImages.removeAt(index);
    }
  }

  void clearImages() {
    selectedImages.clear();
  }
}
