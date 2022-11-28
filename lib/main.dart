import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resep_app/controllers/categories_recipes_controller.dart';
import 'package:resep_app/controllers/recipes_controller.dart';
import 'package:resep_app/views/home_page.dart';

void main() => runApp(ResepApp());

class ResepApp extends StatelessWidget {
  ResepApp({super.key});

  final rController = Get.put(CatergoriesRecipesController());
  final allRecipesController = Get.put(RecipesController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
