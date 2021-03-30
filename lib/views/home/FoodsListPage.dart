import 'package:flutter/material.dart';
import 'package:quovantis_assignment/extensions/color_extension.dart';
import 'package:quovantis_assignment/extensions/string_extension.dart';
import 'package:quovantis_assignment/models/food_menu.dart';
import 'package:quovantis_assignment/resources/app_colors.dart';
import 'package:quovantis_assignment/resources/strings.dart';
import 'package:quovantis_assignment/resources/styles.dart';
import 'package:quovantis_assignment/views/home/food_search_bloc.dart';
import 'package:quovantis_assignment/views/home/sub_category_listview.dart';
import 'package:rxdart/rxdart.dart';

import '../../utils.dart';

//Created by Nimish Nandwana on 28/03/2021.

class FoodsListPage extends StatefulWidget {
  const FoodsListPage({
    @required this.menu,
    Key key,
  }) : super(key: key);
  final FoodMenu menu;

  @override
  _FoodsListPageState createState() => _FoodsListPageState();
}

class _FoodsListPageState extends State<FoodsListPage> {
  TextEditingController _foodsTextController;

  // Input stream (search terms)
  final _searchTerms = BehaviorSubject<String>();

  Stream<String> get searchStream => _searchTerms.stream;
  FoodSearchBloc _foodSearchBloc;

  @override
  void initState() {
    super.initState();
    _foodsTextController = TextEditingController();
    _foodsTextController.addListener(onTextChange);
    _foodSearchBloc = FoodSearchBloc(menu: modifyMenu());
    observeStream();
  }

  @override
  void dispose() {
    _searchTerms.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: colorLightGrey,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            InkWell(
                onTap: () {
                  _foodSearchBloc.clearFilteredSearch();
                  _foodsTextController.text = "";
                },
                child: Icon(Icons.close)),
            SizedBox(height: 30),
            Text(approvedFoodsList, style: tsAppBlackSemiBold24),
            SizedBox(height: 25),
            searchFoodTextField,
            SizedBox(height: 25),
            foodsListView,
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget get searchFoodTextField {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(color: colorBlueShade),
      child: TextFormField(
        controller: _foodsTextController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        style: tsMediumHeadingDarkGrey,
        decoration: const InputDecoration(
          hintText: hintSearch,
          hintStyle: tsMediumHintDarkGrey,
          fillColor: Colors.transparent,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget get foodsListView {
    return StreamBuilder<FoodMenu>(
        stream: _foodSearchBloc.foodListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final menu = snapshot.data;
            if (menu.categories.isEmpty) {
              return Center(
                  child: Text(
                'Not found, please search another term',
                style: tsAppBlackRegular14.copyWith(fontSize: 15),
              ));
            }
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: menu.categories.length,
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                return FoodCategoryItem(
                  category: menu.categories[index].category,
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void onTextChange() {
    _searchTerms.value = _foodsTextController.text.orEmpty;
    _searchTerms.add(_searchTerms.value);
  }

  void observeStream() {
    searchStream.distinct().debounceTime(const Duration(milliseconds: 300)).listen(searchTeacher);
  }

  //******* Teacher **************//
  void searchTeacher(String query) {
    _foodSearchBloc.searchFood(query);
  }

  FoodMenu modifyMenu() {
    var menu = widget.menu;
    for (int i = 0; i < menu.categories.length; i++) {
      final category = menu.categories[i].category;
      //adding all the subcategories and it's subcategories in same list for demo
      //i.e flatening the response
      final newList = category.subcategories
          .where((element) => element.subCategoryname.isNotEmpty)
          .map((e) => e.subCategoryname)
          .toList();

      for (int j = 0; j < category.subcategories.length; j++) {
        newList.addAll(category.subcategories[j].items);
      }
      menu.categories[i].category = menu.categories[i].category.copyWith(allSubcategories: newList);
    }

    return menu;
  }
}

class FoodCategoryItem extends StatelessWidget {
  FoodCategoryItem({
    Key key,
    this.category,
  }) : super(key: key) {
    isExpanded = ValueNotifier(category.isSearched);
  }

  final Category category;

  ValueNotifier<bool> isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              isExpanded.value = !isExpanded.value;
              Utils.hideKeyBoard();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    categoryImage,
                    SizedBox(width: 12),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: category.categoryName,
                        style: tsAppBlackRegular14.copyWith(
                            color: HexColor.fromHex(category.colorCode)),
                      ),
                      if (category.servingSize.isNotNullOrEmpty)
                        TextSpan(
                          text: ' (${category.servingSize})',
                          style: tsAppBlackRegular14,
                        )
                    ])),
                  ],
                ),
                Visibility(
                  visible: category.subcategories != null && category.subcategories.isNotEmpty,
                  child: Icon(
                    Icons.arrow_drop_down_sharp,
                    color: AppColors.slate,
                  ),
                )
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: isExpanded,
            builder: (context, value, child) {
              if (!value) {
                return Container();
              }
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: SubCategoryListView(
                  subcategories: category.allSubcategories,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget get categoryImage {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: HexColor.fromHex(category.colorCode),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Icon(Icons.food_bank),
    );
  }
}
