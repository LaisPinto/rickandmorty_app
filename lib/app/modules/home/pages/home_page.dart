import 'package:flutter/material.dart';
import 'package:rm_app/app/modules/home/_export_home.dart';
import 'package:rm_app/app/modules/home/stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore _homeStore;
  late ScrollController _controller;

  Widget _listGrid() {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        controller: _controller,
        itemCount: _homeStore.characterModelObservable!.length,
        itemBuilder: (context, index) {
          CharacterModel? characterModel = _homeStore.characterModelObservable!.elementAt(index);
          return Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          _homeStore.characterModelObservable!.elementAt(index).image,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      characterModel.name,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
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
            Text("MERDAAAA: ${_homeStore.characterModelObservable!.length}"),
            //_listGrid(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initPage();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  void _initPage() {
    _homeStore = HomeStore();
    _homeStore.getCharacter();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent && !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent && !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
