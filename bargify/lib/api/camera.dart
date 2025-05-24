import 'dart:io';
import 'package:uuid/uuid.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Camera {

    final ImagePicker _picker = ImagePicker();


Future<File?> pickImage(ImageSource source) async { 

  
  final image = await _picker.pickImage(source: source);

  if (image == null){
    return null;
  }


  final file = File(image.path);
  final maxFile = 5 * 1024 * 1024; // 5MB

  final fileSize = await file.length();

  if (fileSize > maxFile){
    return null;
  }
  return file;


}





Future<String?> uploadFile(File file) async {
  try {
  final uuid = Uuid();
  final storageRef = FirebaseStorage.instance.ref();

  final uploadTask = storageRef.child('deal_image/${uuid.v4()}.jpg').putFile(file);

  final snapshot = await uploadTask;

  return await snapshot.ref.getDownloadURL();

  } catch(e){
    return "Upload failed. Please try again";
  }


 



}




}