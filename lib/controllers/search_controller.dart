import 'package:get/get.dart';
import 'package:shop_app/models/search.dart';

class SearchController extends GetxController {
  Rxn<SearchModel> _search = Rxn<SearchModel>();
  RxBool clientLoading = true.obs;
  RxBool noClient = true.obs;

  SearchModel? get client => this._search.value;

  Rxn<SearchModel> get clientStream => this._search;

  set client(SearchModel? client) => this._search.value = client;
  RxBool init = RxBool(false);

  SearchController();

  @override
  void onInit() {
    super.onInit();
    /*for (Product product in demoProducts) {
      ProductRepository().addProduct(product: product);
    }*/
  }

  Future setSearchData({required SearchModel newClient}) async {
    /*if (client is SearchModel) {
      await clientRepository.setClient(
          client:
              newClient.copyWith(authid: client!.authid, uuid: client!.uuid));
      client = newClient.copyWith(authid: client!.authid, uuid: client!.uuid);
    } else {
      clientBlank = newClient;
    }*/
    update();
  }
}
