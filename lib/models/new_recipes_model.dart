class NewRecipesModel {
  NewRecipesModel({
    this.method,
    this.status,
    this.results,
  });

  String? method;
  bool? status;
  dynamic results;

  factory NewRecipesModel.fromJson(Map<String, dynamic> json) =>
      NewRecipesModel(
        method: json["method"],
        status: json["status"],
        results: List<RecipesResult>.from(
            json["results"].map((x) => RecipesResult.fromJson(x))),
      );
}

class RecipesResult {
  RecipesResult({
    this.title,
    this.thumb,
    this.key,
    this.times,
    this.serving,
    this.difficulty,
  });

  String? title;
  String? thumb;
  String? key;
  String? times;
  String? serving;
  String? difficulty;

  factory RecipesResult.fromJson(Map<String, dynamic> json) => RecipesResult(
        title: json["title"],
        thumb: json["thumb"],
        key: json["key"],
        times: json["times"],
        serving: json["serving"],
        difficulty: json["difficulty"],
      );
}
