import 'package:mobx/mobx.dart';
import 'package:rm_app/app/modules/home/interfaces/home_servise_interface.dart';
import 'package:rm_app/app/modules/home/services/home_service.dart';

import '../models/character_model.dart';

part 'home_store.g.dart';

class HomeStore = BaseHomeStore with _$HomeStore;

abstract class BaseHomeStore with Store {
  HomeServiseInterface characterServiseInterface = HomeService();

  @observable
  CharacterModel? characterModel;

  @observable
  List<CharacterModel?> characterModelObservable = ObservableList();

  @observable
  bool isHomeLoading = false;

  @action
  Future<void> getCharacter() async {
    isHomeLoading = false;
    try {
      characterModelObservable = await characterServiseInterface.getCharacter();
    } catch (error) {
      rethrow;
    } finally {
      isHomeLoading = true;
    }
  }
}
