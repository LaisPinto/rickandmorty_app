import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rm_app/app/modules/home/stores/home_store.dart';

import '../models/character_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore _homeStore;

  Widget _listGrid() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: _homeStore.characterModelObservable.length,
        itemBuilder: (context, index) {
          final character = _homeStore.characterModelObservable.elementAt(index);
          return Card(
            child: Column(
              children: [
                Image.network(character!.image),
                Text(character.image),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _listGrid(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initPage();
  }

  void _initPage() {
    _homeStore = HomeStore();
    _homeStore.getCharacter();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
