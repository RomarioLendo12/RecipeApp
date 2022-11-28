import 'package:get/get.dart';
import 'package:resep_app/models/new_recipes_model.dart';
import 'package:resep_app/services/providers/recipes_providers.dart';

class RecipesController extends GetxController {
  final _recipeProviders = RecipesProviders();

  List<RecipesResult> recipes = <RecipesResult>[].obs;

  getRecipes() async {
    recipes = await _recipeProviders.getRecipes();
  }

  @override
  void onInit() {
    getRecipes();
    super.onInit();
  }
}
