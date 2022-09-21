import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:list_app_api/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {'limit': '18', 'statr': '0', 'tag': 'list.recipe.popular'});
    final response = await http.get(uri, headers: {
      "x-rapidapi-key": '31d3c10b52mshd3c265cc5a668dcp1b353bjsn5b553',
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'useQuerySrting': 'true'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['Feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
