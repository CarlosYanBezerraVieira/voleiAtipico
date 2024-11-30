import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin ImagePickerNotifierMixin {
  final ValueNotifier<XFile?> imageNotifier = ValueNotifier<XFile?>(null);
  final ImagePicker _picker = ImagePicker();

  /// Método para selecionar imagem da galeria
  Future<void> pickImageFromGallery() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      imageNotifier.value = image; // Notifica mudança
    } catch (e) {
      debugPrint('Erro ao selecionar imagem da galeria: $e');
    }
  }

  /// Método para capturar imagem com a câmera
  Future<void> pickImageFromCamera() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.camera);
      imageNotifier.value = image; // Notifica mudança
    } catch (e) {
      debugPrint('Erro ao capturar imagem com a câmera: $e');
    }
  }
}
