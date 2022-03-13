import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/models/Product.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

abstract class IProductRepository {
  Future<List<Product>> allProducts();

  Future<Product> productByUuid({required String uuid});

  Future addProduct({required Product product});

  Future setProduct({required Product product});
}

class ProductRepository extends IProductRepository {
  static CollectionReference _productsRef =
      FirebaseFirestore.instance.collection('products');

  @override
  Future<List<Product>> allProducts() async {
    QuerySnapshot ref = await _productsRef.get();

    List<Product> list = ref.docs.map((e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      return Product.fromMap(data);
    }).toList();
    return list;
  }

  @override
  Future<Product> productByUuid({required String uuid}) async {
    DocumentSnapshot snapshot = await _productsRef.doc(uuid).get();
    if (snapshot.exists) {
      return Product.fromMap(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception('No Product exists by that id');
    }
  }

  @override
  Future setProduct({required Product product}) async {
    await _productsRef.doc(product.uuid).set(product.toMap());
  }

  @override
  Future addProduct({required Product product}) async {
    // add photos
    for (String curAsset in product.images) {
      File _imageFile = await getImageFileFromAssets(curAsset);
      curAsset = await uploadImageToFirebase(_imageFile);
    }
    // add pproduct
    setProduct(product: product);
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  Future<String> uploadImageToFirebase(File _imageFile) async {
    String refLink = "";
    String fileName = _imageFile.path;
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('uploads')
        .child('/$fileName');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/png',
        customMetadata: {'picked-file-path': fileName});
    firebase_storage.UploadTask uploadTask;
    //late StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    uploadTask = ref.putFile(File(_imageFile!.path)!, metadata);

    firebase_storage.UploadTask task = await Future.value(uploadTask);
    Future.value(uploadTask).then((value) {
      refLink = value.ref.fullPath;
      print("Upload file path ${value.ref.fullPath}");
    }).onError((error, stackTrace) {
      print("Upload file path error ${error.toString()} ");
    });
    return refLink;
  }
}
