import 'package:flutter/material.dart';
import 'package:flutter_practice_api/src/models/character_response.dart';
import 'package:flutter_practice_api/src/utils/api_character.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ApiCharacter api = ApiCharacter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<CharacterResponse>(
            future: api.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.results.isEmpty) {
                return Center(child: Text("No se encontraron personajes"));
              } else {
                final results = snapshot.data!.results;
                return ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(results[index].image),
                        title: Text(results[index].name),
                        subtitle: Text(
                            "${results[index].status} - ${results[index].species}"),
                      );
                    });
              }
            }));
  }
}
