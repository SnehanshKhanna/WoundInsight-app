import 'package:image_picker/image_picker.dart';

class ImageCaptureService {
  final ImagePicker _picker;

  ImageCaptureService({ImagePicker? picker}) : _picker = picker ?? ImagePicker();

  Future<String?> pickFromCamera() async {
    final XFile? file = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 2048,
      maxHeight: 2048,
      imageQuality: 95,
    );
    return file?.path;
  }

  Future<String?> pickFromGallery() async {
    final XFile? file = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 2048,
      maxHeight: 2048,
      imageQuality: 95,
    );
    return file?.path;
  }
}
