import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/models/category.dart';

abstract class ICategoryRepository {
  Future<List<CategoryModel>> allCategories();

  Future<CategoryModel> categoryByUuid({required String uuid});

  Future addCategory({required CategoryModel category});

  Future setCategory({required CategoryModel category});
}

class CategoryRepository extends ICategoryRepository {
  static CollectionReference _productsRef =
      FirebaseFirestore.instance.collection('categories');

  @override
  Future<List<CategoryModel>> allCategories() async {
    QuerySnapshot ref = await _productsRef.get();

    List<CategoryModel> list = ref.docs.map((e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      return CategoryModel.fromMap(data);
    }).toList();
    return list;
  }

  @override
  Future<CategoryModel> categoryByUuid({required String uuid}) async {
    DocumentSnapshot snapshot = await _productsRef.doc(uuid).get();
    if (snapshot.exists) {
      return CategoryModel.fromMap(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception('No CategoryModel exists by that id');
    }
  }

  @override
  Future setCategory({required CategoryModel category}) async {
    await _productsRef.doc(category.uuid).set(category.toMap());
  }

  @override
  Future addCategory({required CategoryModel category}) async {
    // add photos
    /*for (String curAsset in product.images) {
      File _imageFile = await getImageFileFromAssets(curAsset);
      curAsset = await uploadImageToFirebase(_imageFile);
    }*/
    // add pproduct
    setCategory(category: category);
  }
}
