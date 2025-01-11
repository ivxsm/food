import 'package:flutter/material.dart';
import 'package:food/models/recipe.dart';
import 'package:food/pages/bookmarks.dart';
import 'package:food/pages/profile.dart';
import 'package:food/services/api.dart';
import 'package:food/widgets/List_Food_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes of Pasta'),
      ),
      body: FutureBuilder<List<Recipe>>(
        future: Api().getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: Colors.purple,
                rightDotColor: Colors.blue,
                size: 48,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Recipe item = snapshot.data![index];
                  return ListFoodWidget(recipe: item);
                },
              );
            } else {
              return const Center(
                child: Text("No recipes found."),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return const Center(
              child: Text("Something went wrong."),
            );
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text('where to go?'),
            ),
            ListTile(
              title: const Text('home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            ListTile(
              title: const Text('BookMark'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Bookmarks()));
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));

              },
            ),
          ],
        ),
      ),
    );
  }
}
