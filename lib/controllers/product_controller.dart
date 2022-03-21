import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_app/controllers/product_repository.dart';
import 'package:shop_app/controllers/search_controller.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/models/search.dart';

class AllProducts extends GetxController {
  final IProductRepository productsRepo;
  RxList<Product> products = RxList([]);
  RxList<Product> foundedProducts = RxList([]);
  RxBool loading = false.obs;
  RxBool loadingError = false.obs;
  RxBool loadingMore = false.obs;
  RxBool loadingMoreError = false.obs;
  int productsPerPage = 5;
  SearchController _searchController = Get.put(SearchController());
  Rxn<SearchModel> searchModel = Rxn<SearchModel>();

  AllProducts({
    required this.productsRepo,
  });

  @override
  void onInit() {
    super.onInit();
    /*for (Product product in demoProducts) {
      ProductRepository().addProduct(product: product);
    }*/
    searchModel.value = _searchController.search;
    _searchController.addListener(() {
      searchModel.value = _searchController.search;
    });
    initialLoad();
    searchModel.listenAndPump((event) {
      loadFoundedProducts(event!);
    });
  }

  initialLoad() async {
    loading.value = true;
    loadingError.value = false;
    try {
      List<Product> _products = await productsRepo.allProducts();
      products.value = _products;
      foundedProducts.value = _products;
      print("load all products");
      loading.value = false;
    } catch (e) {
      print('all products load error > $e');
      loadingError.value = true;
      loading.value = false;
    }
  }

  loadMore() async {
    if (products.isEmpty) return;
    loadingMore.value = true;
    loadingMoreError.value = false;
    try {
      List<Product> _products = await productsRepo.allProducts();
      products.addAll(_products);
      print("load all products");
      loadingMore.value = false;
    } catch (e) {
      print('all products more load error > $e');
      loadingMoreError.value = true;
      loadingMore.value = false;
    }
  }

  loadFoundedProducts(SearchModel searchModel) {
    debugPrint(searchModel.toString());
    foundedProducts.value = products.where((element) =>
        //      (element.title.contains(searchModel.name)) &&
        (searchModel.categories.contains(element.categoryId))).toList();
  }
}
