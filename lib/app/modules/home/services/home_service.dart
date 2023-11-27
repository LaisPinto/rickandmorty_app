import 'package:rm_app/app/modules/core/_export_core.dart';
import 'package:rm_app/app/modules/home/_export_home.dart';
import 'package:rm_app/app/modules/home/interfaces/home_servise_interface.dart';
import 'package:rm_app/app/modules/home/services/home_model_header.dart';

class HomeService implements HomeServiseInterface {
  @override
  Future<List<CharacterModel>> getCharacter() async {
    String url = AppConstant.homeURL;
    try {
      final response = await Network.internal().get(
        url: url,
        headers: HomeModelHeader.getHomeModelHeader(),
      );
      if (response is List) {
        return response.map<CharacterModel>((home) => CharacterModel.fromMap(home)).toList();
      } else {
        return [];
      }
    } catch (error) {
      rethrow;
    }
  }
}
