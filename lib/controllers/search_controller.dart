import 'package:get/get.dart';
import 'package:shop_app/models/search.dart';

class SearchController extends GetxController {
  Rxn<SearchModel> _search = Rxn<SearchModel>();

  SearchModel? get search => this._search.value;

  set search(SearchModel? search) => this._search.value = search;
  RxBool init = RxBool(false);

  SearchController();

  @override
  void onInit() {
    super.onInit();
    search = SearchModel(name: "", categories: []);
  }

  Future setSearchData({required SearchModel newSearch}) async {
    search = newSearch;
    update();
  }
}
