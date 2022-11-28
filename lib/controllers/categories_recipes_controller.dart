import 'package:get/get.dart';
import 'package:resep_app/models/recipes_category_model.dart';
import 'package:resep_app/services/providers/recipes_providers.dart';

class CatergoriesRecipesController extends GetxController
    with StateMixin<List<CatergoryRecipeResult>> {
  final _recipesProvider = RecipesProviders();

  getRecipesCategories() async {
    try {
      final data = await _recipesProvider.getAllCategories();
      change(data, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error('Failed fetching data'));
    }
  }

  @override
  void onInit() {
    getRecipesCategories();
    super.onInit();
  }
}
