import 'package:flutter/material.dart';
import 'package:resep_app/theme.dart';

class CategoryRecipeWidget extends StatelessWidget {
  const CategoryRecipeWidget(
      {super.key,
      required this.imageUrl,
      required this.keyRecipes,
      required this.name});

  final String imageUrl, keyRecipes, name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: secondaryColor),
      child: Text(
        name,
        style: mainTextStyle.copyWith(color: Colors.white),
      ),
    );
  }
}
