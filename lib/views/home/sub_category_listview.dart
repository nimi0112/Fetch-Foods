import 'package:flutter/material.dart';
import 'package:quovantis_assignment/models/models.dart';
import 'package:quovantis_assignment/resources/app_colors.dart';

//Created by Nimish Nandwana on 30/03/2021.

class SubCategoryListView extends StatelessWidget {
  const SubCategoryListView({
    Key key,
    this.subcategories,
  }) : super(key: key);
  final List<String> subcategories;

  @override
  Widget build(BuildContext context) {


    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: subcategories.length,
      separatorBuilder: (context, index) => Divider(color: colorBlueShade, thickness: 1),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child: Text(subcategories[index]),
        );
      },
    );
  }
}
