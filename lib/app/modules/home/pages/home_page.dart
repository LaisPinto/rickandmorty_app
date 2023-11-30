import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rm_app/app/modules/home/_export_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore _homeStore;

  Widget _listGrid() {
    return Observer(
      builder: (context) {
        return GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            childAspectRatio: 0.87,
            crossAxisSpacing: 10,
          ),
          itemCount: _homeStore.characterModelObservable.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(id: index),
                ),
              ),
              child: Card(
                  child: Column(
                children: [
                  FadeInImage(
                    placeholder: const AssetImage('assets/portal.gif'),
                    image: NetworkImage(
                      _homeStore.characterModelObservable.elementAt(index)!.image,
                    ),
                  ),
                  Text(
                    _homeStore.characterModelObservable.elementAt(index)!.name,
                  ),
                ],
              )),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Rick and Morty",
          style: TextStyle(color: Colors.green),
          textAlign: TextAlign.center,
        ),
      ),
      body: _listGrid(),
    );
  }

  @override
  void initState() {
    super.initState();
    _initPage();
  }

  Future<void> _initPage() async {
    _homeStore = HomeStore();
    await _homeStore.getCharacter();
  }

  //
  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
