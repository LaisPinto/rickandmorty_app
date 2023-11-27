import 'package:rm_app/app/modules/home/_export_home.dart';

abstract class HomeServiseInterface {
  Future<List<CharacterModel>> getCharacter();
}
