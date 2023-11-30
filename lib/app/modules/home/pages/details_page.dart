import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../_export_home.dart';

class DetailsPage extends StatefulWidget {
  final int id;
  const DetailsPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late HomeStore _homeStore;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: const Text(
            "Character",
            style: TextStyle(color: Colors.green),
          ),
        ),
        body: Observer(
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_homeStore.characterModelObservable.isNotEmpty)
                  Image.network(
                    _homeStore.characterModelObservable.elementAt(widget.id)!.image,
                  ),
                Column(
                  children: [
                    Text("Nome: ${_homeStore.characterModelObservable.elementAt(widget.id)!.name}"),
                  ],
                ),
              ],
            );
          },
        ));
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

  @override
  void dispose() {
    super.dispose();
  }
}
