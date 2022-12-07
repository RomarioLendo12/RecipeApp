import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resep_app/controllers/categories_recipes_controller.dart';
import 'package:resep_app/theme.dart';
import 'package:resep_app/views/widgets/category_recipe_widget.dart';
import 'package:resep_app/views/widgets/recipes_container_widget.dart';

class HomePage extends GetView<CatergoriesRecipesController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: controller.obx(
          (state) => SafeArea(
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
                  SizedBox(
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
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.recipes.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.7),
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => RecipesContainerWidget(
                        title: '${controller.recipes[index].title}',
                        thumb: '${controller.recipes[index].thumb}',
                        recipeKey: '${controller.recipes[index].key}',
                        times: '${controller.recipes[index].times}',
                        serving: '${controller.recipes[index].serving}',
                        difficulty: '${controller.recipes[index].difficulty}'),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
