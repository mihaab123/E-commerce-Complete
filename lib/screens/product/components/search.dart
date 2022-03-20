import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/controllers/category_controller.dart';
import 'package:shop_app/controllers/search_controller.dart';
import 'package:shop_app/screens/details/components/top_rounded_container.dart';
import 'package:shop_app/screens/home/components/search_field.dart';
import 'package:shop_app/screens/product/components/search_item.dart';
import 'package:shop_app/size_config.dart';

import '../../../utils.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchEditController = TextEditingController();

  final CategoryController _categoriesController =
      Get.find<CategoryController>();

  final SearchController _searchController = Get.find<SearchController>();

  List<String> selectedCategories = [];
  @override
  void initState() {
    super.initState();
    for (String curCat in _searchController.search!.categories) {
      selectedCategories.add(curCat);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Positioned(
            right: 0,
            bottom: 0,
            left: SizeConfig.screenWidth * 0.05,
            top: SizeConfig.screenWidth * 0.1,
            child: Container(
              width: SizeConfig.screenWidth * .85,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(0),
                      topRight: Radius.circular(0))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            bottom: 15,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("HS_search_product".tr,
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(22),
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold)),
                                IconButton(
                                    onPressed: () => Navigator.pop(context),
                                    icon: Icon(Icons.arrow_forward_ios,
                                        color: kPrimaryColor,
                                        size: getProportionateScreenWidth(20)))
                              ]),
                        ),
                        SearchField(
                          onChange: (_) {},
                          controller: searchEditController,
                          widthPercent: 0.9,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            bottom: 15,
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text("PR_categories_title".tr,
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(16),
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold)),
                            subtitle: Container(
                              height: getProportionateScreenWidth(40),
                              child: Obx(() {
                                return ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      _categoriesController.categories.length,
                                  itemBuilder: (context, index) {
                                    return SearchItem(
                                        _categoriesController
                                            .categories[index].title,
                                        selectedCategories.contains(
                                            _categoriesController
                                                .categories[index].uuid), () {
                                      selectCategory(_categoriesController
                                          .categories[index].uuid as String);
                                    });
                                  },
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "BTN_apply".tr,
                          press: () async {
                            _searchController.setSearchData(
                                newSearch: _searchController.search!.copyWith(
                                    name: searchEditController.text.toString(),
                                    categories: selectedCategories));
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    )
                  ]),
            ))
      ]),
    );
  }

  void selectCategory(String categoryId) {
    if (selectedCategories.contains(categoryId))
      selectedCategories.remove(categoryId);
    else
      selectedCategories.add(categoryId);
    setState(() {});
  }
}
