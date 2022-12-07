import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resep_app/controllers/categories_recipes_controller.dart';
import 'package:resep_app/views/home_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(ResepApp());

class ResepApp extends StatelessWidget {
  ResepApp({super.key});

  final rController = Get.put(CatergoriesRecipesController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
