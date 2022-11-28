import 'package:resep_app/models/new_recipes_model.dart';
import 'package:dio/dio.dart';
import 'package:resep_app/models/recipes_category_model.dart';

class RecipesProviders {
  @override
  // ignore: overridden_fields
  final baseUrl = 'https://masak-apa-tomorisakura.vercel.app/api';

  Future<List<RecipesResult>> getRecipes() async {
    try {
      var response = await Dio().get('$baseUrl/recipes');

      NewRecipesModel newRecipesModel = NewRecipesModel.fromJson(response.data);
      List<RecipesResult> result = newRecipesModel.results;

      return result;
      // print(response);
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<CatergoryRecipeResult>> getAllCategories() async {
    try {
      var response = await Dio().get('$baseUrl/category/recipes');

      RecipesCategoryModel recipesCategory =
          RecipesCategoryModel.fromJson(response.data);
      List<CatergoryRecipeResult> result = recipesCategory.results;
      print(result);

      return result;
    } catch (e) {
      print('Terjadi Error : $e');
    }

    return [];
  }
}
