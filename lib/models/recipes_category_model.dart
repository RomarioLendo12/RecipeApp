class RecipesCategoryModel {
  RecipesCategoryModel({
    this.method,
    this.status,
    this.results,
  });

  String? method;
  bool? status;
  dynamic results;

  factory RecipesCategoryModel.fromJson(Map<String, dynamic> json) =>
      RecipesCategoryModel(
        method: json["method"],
        status: json["status"],
        results: List<CatergoryRecipeResult>.from(
            json["results"].map((x) => CatergoryRecipeResult.fromJson(x))),
      );
}

class CatergoryRecipeResult {
  CatergoryRecipeResult({
    this.category,
    this.url,
    this.key,
  });

  String? category;
  String? url;
  String? key;

  factory CatergoryRecipeResult.fromJson(Map<String, dynamic> json) =>
      CatergoryRecipeResult(
        category: json["category"],
        url: json["url"],
        key: json["key"],
      );
}
