import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resep_app/controllers/categories_recipes_controller.dart';
import 'package:resep_app/controllers/recipes_controller.dart';
import 'package:resep_app/theme.dart';
import 'package:resep_app/views/widgets/category_recipe_widget.dart';
import 'package:resep_app/views/widgets/recipes_container_widget.dart';

class HomePage extends GetView<CatergoriesRecipesController> {
  HomePage({super.key});

  final allRecipesController = Get.find<RecipesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                                text: 'Hallo, ',
                                style: mainTextStyle.copyWith(
                                    fontSize: 22, color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: 'Romario',
                                    style: mainTextStyle.copyWith(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: secondaryColor,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Tangerang Selatan, ID',
                                style: mainTextStyle.copyWith(
                                    color: subTextColor, fontSize: 15),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.blue,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              controller.obx(
                (state) => SizedBox(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: state?.length ?? 0,
                    itemBuilder: (context, index) => CategoryRecipeWidget(
                        imageUrl: state?[index].url ?? '',
                        keyRecipes: state?[index].key ?? '',
                        name: state?[index].category ?? ''),
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'New Recipes',
                  style: mainTextStyle.copyWith(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              SizedBox(
                height: 305,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: allRecipesController.recipes
                      .map(
                        (e) => RecipesContainerWidget(
                            title: '${e.title}',
                            thumb: '${e.thumb}',
                            recipeKey: '${e.key}',
                            times: '${e.times}',
                            serving: '${e.serving}',
                            difficulty: '${e.difficulty}'),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
