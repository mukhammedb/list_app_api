import 'package:flutter/material.dart';
import 'package:list_app_api/models/recipe_api.dart';
import 'package:list_app_api/views/widgets/recipe_card.dart';

import '../models/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe>? _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipe();
  }

  Future<void> getRecipe() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text('Food Recipe')
          ],
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _recipes?.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                    title: _recipes![index].name,
                    cookTime: _recipes![index].totalTime,
                    rating: _recipes![index].rating.toString(),
                    thumbnailUrl: _recipes![index].image);
              },
            ),
    );
  }
}
