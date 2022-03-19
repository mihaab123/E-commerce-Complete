import 'package:get/get.dart';
import 'package:shop_app/controllers/category_repository.dart';
import 'package:shop_app/models/category.dart';

class CategoryController extends GetxController {
  final ICategoryRepository categoriesRepo;
  RxList<CategoryModel> categories = RxList([]);
  RxBool loading = false.obs;
  RxBool loadingError = false.obs;
  RxBool loadingMore = false.obs;
  RxBool loadingMoreError = false.obs;

  CategoryController({
    required this.categoriesRepo,
  });

  @override
  void onInit() {
    super.onInit();
    initialLoad();
  }

  initialLoad() async {
    loading.value = true;
    loadingError.value = false;
    try {
      List<CategoryModel> _categories = await categoriesRepo.allCategories();
      categories.value = _categories;
      print("load all Categories");
      loading.value = false;
    } catch (e) {
      print('all Categories load error > $e');
      loadingError.value = true;
      loading.value = false;
    }
  }

  loadMore() async {
    if (categories.isEmpty) return;
    loadingMore.value = true;
    loadingMoreError.value = false;
    try {
      List<CategoryModel> _categories = await categoriesRepo.allCategories();
      categories.addAll(_categories);
      print("load all Categories");
      loadingMore.value = false;
    } catch (e) {
      print('all Categories more load error > $e');
      loadingMoreError.value = true;
      loadingMore.value = false;
    }
  }
}
