import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/data/modal/Equipament.dart';
import 'package:project/features/admin_ui/controller/create_epi_controller.dart';
import 'package:project/features/client_ui/model/categories.dart';
import 'package:project/utils/helpers/function_helpers.dart';

class CreateApisScreen extends StatelessWidget {
  CreateApisScreen({super.key});

  final EpisController controller = Get.put(EpisController());
  final _createController = Get.put(CreateEpiController());
  final _formKey = GlobalKey<FormState>();

  EpiModel? get _epi {
    final args = Get.arguments;
    if (args != null && args.containsKey('epi')) {
      return args["epi"] as EpiModel;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // Preenche os controladores se estiver em modo de edição
    if (_epi != null) {
      _createController.title.text = _epi!.title;
      _createController.minDays.text = _epi!.minDays.toString();
      _createController.maxDays.text = _epi!.maxDays.toString();
      _createController.description.text = _epi!.description.toString();
      _createController.stock.text = _epi!.stock.toString();
      _createController.pricePerDay.text = _epi!.pricePerDay.toString();

      // Para a categoria, você precisará encontrar no seu lista de categorias
      final category = _createController.categories.firstWhere(
        (cat) => cat.label == _epi!.category,
        orElse: () => _createController.categories.first,
      );
      _createController.selectedCategory.value = category;
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:
            _epi == null
                ? const Text("Novo Equipamento")
                : Text("Editar Equipamento"),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Iconsax.arrow_left),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(children: [_buildForm(context)]),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 40),
          // ... outros campos do formulário permanecem iguais ...
          TextFormField(
            controller: _createController.title,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor insira o nome do equipemnto';
              }

              return null;
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.designtools),
              labelText: "Nome do equipamento",
              prefixText: "| ",
            ),
          ),
          const SizedBox(height: 16),
          Obx(
            () => DropdownButtonFormField<Category>(
              validator: (value) {
                if (value == null) {
                  return "Por favor selecione uma caetegoria";
                }
                return null;
              },
              value: _createController.selectedCategory.value,
              onChanged: (value) => _createController.selectedCategory(value),
              isExpanded: true,
              hint: const Text("Categoria"),
              icon: const Icon(Iconsax.arrow_square_down),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.filter),
                labelText: "Selcione  a categoria",
              ),
              items:
                  _createController.categories
                      .map(
                        (item) => DropdownMenuItem<Category>(
                          value: item,
                          child: Text(
                            item.label,
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _createController.minDays,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Insira o numero minimo de dias";
                    }

                    if (!value.isNum) {
                      return "Insira o valor valido";
                    }
                    return null;
                  },
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
                  controller: _createController.maxDays,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Insira o numero maximo de dias";
                    }

                    if (!value.isNum) {
                      return "Insira o valor valido";
                    }
                    return null;
                  },

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
            controller: _createController.description,
            maxLines: null,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Insira a descricao do equipamento";
              }

              return null;
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.designtools),
              labelText: "Descrição",
              prefixText: "| ",
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _createController.stock,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null) {
                return "Por favor insira uma quantidade valida";
              }

              if (!value.isNum) {
                return "Insira um valor valido";
              }

              return null;
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.money_2),
              labelText: "Quantidade de equipamentos",
              prefixText: "| ",
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _createController.pricePerDay,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null) {
                return "Por favor insira preco";
              }

              if (!value.isNum) {
                return "Insira um valor valido";
              }

              return null;
            },
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
            child: ElevatedButton(
              onPressed:
                  _epi == null
                      ? () => _handleCreateEpi()
                      : () => _handleUpdateEpi(),
              child: _epi == null ? Text("Criar") : Text("Salvar alteracoes"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreview() {
    return Obx(
      () =>
          _createController.selectedImages.isEmpty
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
                    'Imagens Selecionadas (${_createController.selectedImages.length}/${controller.maxImages})',
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
                    itemCount: _createController.selectedImages.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              _createController.selectedImages[index],
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

  Future<void> _handleCreateEpi() async {
    if (_formKey.currentState!.validate()) {
      await _createController.createEpi();
    } else {
      Helpers.warnigSnackbar(
        title: 'Campos inválidos',
        message: 'Por favor preencha todos os campos corretamente',
      );
    }
  }

  Future<void> _handleUpdateEpi() async {
    if (_formKey.currentState!.validate()) {
      await _createController.updateEpi(_epi!.id.toString());
    } else {
      Helpers.warnigSnackbar(
        title: 'Campos inválidos',
        message: 'Por favor preencha todos os campos corretamente',
      );
    }
  }
}

class EpisController extends GetxController {
  final controller = Get.put(CreateEpiController());
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
    if (controller.selectedImages.length + files.length > maxImages) {
      _showError('Limite de $maxImages imagens atingido');
      return;
    }

    final newImages =
        files
            .map((file) => File(file.path))
            .where(
              (file) =>
                  !controller.selectedImages.any((f) => f.path == file.path),
            )
            .toList();

    if (newImages.isNotEmpty) {
      controller.selectedImages.addAll(newImages);
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
    if (index >= 0 && index < controller.selectedImages.length) {
      controller.selectedImages.removeAt(index);
    }
  }

  void clearImages() {
    controller.selectedImages.clear();
  }
}
