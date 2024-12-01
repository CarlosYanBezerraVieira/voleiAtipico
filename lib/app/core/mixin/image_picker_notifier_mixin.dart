import 'dart:io';
import 'package:image_picker/image_picker.dart';

mixin ImagePickerNotifierMixin {
  final ImagePicker _picker = ImagePicker();

  /// Método para selecionar imagem da galeria
  Future<File> pickImageFromGallery() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      return File(image!.path); // Notifica mudança
    } catch (e) {
      throw Exception('Erro ao selecionar imagem da galeria: $e');
    }
  }

  /// Método para capturar imagem com a câmera
  Future<File?> pickImageFromCamera() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.camera);
      return image == null ? null : File(image.path); // Notifica mudança
    } catch (e) {
      throw Exception('Erro ao capturar imagem com a câmera: $e');
    }
  }
}
