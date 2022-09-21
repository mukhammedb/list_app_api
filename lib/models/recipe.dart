class Recipe {
  final String name;
  final String image;
  final double? rating;
  final String totalTime;

  Recipe(
      {required this.name,
      required this.image,
      this.rating,
      required this.totalTime});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        name: json['name'] as String,
        image: json['image'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe{name: $name, image: $image, rating: $rating, totalTime: $totalTime}';
  }
}
