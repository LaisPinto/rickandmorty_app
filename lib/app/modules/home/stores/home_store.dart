import 'package:mobx/mobx.dart';
import 'package:rm_app/app/modules/home/interfaces/home_servise_interface.dart';
import 'package:rm_app/app/modules/home/services/home_service.dart';

import '../models/character_model.dart';

part 'home_store.g.dart';

class HomeStore = BaseHomeStore with _$HomeStore;

abstract class BaseHomeStore with Store {
  HomeServiseInterface characterServiceInterface = HomeService();

  @observable
  CharacterModel? characterModel;

  @observable
  List<CharacterModel?> characterModelObservable = ObservableList<CharacterModel?>.of([]);

  @observable
  bool isHomeLoading = true;

  @action
  Future<void> getCharacter() async {
    isHomeLoading = true;
    try {
      characterModelObservable = await characterServiceInterface.getCharacter();
      print('Tamanho da lista: ${characterModelObservable.length}');
    } catch (error) {
      print('Erro ao buscar personagens: $error');
      rethrow;
    } finally {
      isHomeLoading = false;
    }
  }
}
