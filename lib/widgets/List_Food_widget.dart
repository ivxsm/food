import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/models/recipe.dart';

class ListFoodWidget extends StatelessWidget {
  final Recipe recipe;
  const ListFoodWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and Title Section
            Column(
              children: [
                CachedNetworkImage(
                  width: 100,
                  height: 100,
                  imageUrl: recipe.image.toString(),
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.broken_image, size: 100),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 100, // Match image width
                  child: Text(
                    recipe.title.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16), // Space between image and details
            // Details Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Calories: ${recipe.nutrition!.calories.toString()}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Protein: ${recipe.nutrition!.protein.toString()} g',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Fat: ${recipe.nutrition!.fat.toString()} g',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
