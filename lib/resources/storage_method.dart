import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<String> uploadeImageToStorage(String childName,Uint8List file , bool isPost )
  async{
    Reference ref = _storage.ref().child(childName).child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}


























// import 'dart:typed_data';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class StorageMethods {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   Future<String> uploadImageToStorage(
//       String childName, Uint8List file, bool isPost) async {
//     Reference ref = _storage.ref().child(childName).child(
//         _auth.currentUser!.uid
//     );
//     UploadTask uploadTask = ref.putData(file);
//     TaskSnapshot snapshot = await uploadTask;
//     String downloadUrl = await snapshot.ref.getDownloadURL();
//     return downloadUrl;
//   }
// }
