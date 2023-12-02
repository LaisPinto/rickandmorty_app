import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rm_app/translations/locale_keys.g.dart';

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

  Widget _detailPerson(Size mediaSize) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            SizedBox(
              height: mediaSize.height * 0.35,
              width: double.infinity,
              child: Hero(
                tag: _homeStore.characterModelObservable.elementAt(widget.id)!.id,
                child: Image.network(_homeStore.characterModelObservable.elementAt(widget.id)!.image),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: mediaSize.height * 0.14,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _cardData(LocaleKeys.Screens_detail_name.tr(), _homeStore.characterModelObservable.elementAt(widget.id)!.name),
                  _cardData(LocaleKeys.Screens_detail_status.tr(), _homeStore.characterModelObservable.elementAt(widget.id)!.status),
                  _cardData(LocaleKeys.Screens_detail_species.tr(), _homeStore.characterModelObservable.elementAt(widget.id)!.species),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardData(String title, String result) {
    return Expanded(
      child: Card(
        color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              result,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Text(
            LocaleKeys.Screens_detail_title.tr(),
            style: const TextStyle(color: Colors.green),
          ),
        ),
        body: Observer(
          builder: (context) {
            return _homeStore.characterModelObservable.isEmpty
                ? CircularProgressComponent(
                    label: LocaleKeys.Screens_detail_loading.tr(),
                  )
                : _detailPerson(mediaSize);
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
