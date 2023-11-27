// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on BaseHomeStore, Store {
  late final _$characterModelAtom =
      Atom(name: 'BaseHomeStore.characterModel', context: context);

  @override
  CharacterModel? get characterModel {
    _$characterModelAtom.reportRead();
    return super.characterModel;
  }

  @override
  set characterModel(CharacterModel? value) {
    _$characterModelAtom.reportWrite(value, super.characterModel, () {
      super.characterModel = value;
    });
  }

  late final _$characterModelObservableAtom =
      Atom(name: 'BaseHomeStore.characterModelObservable', context: context);

  @override
  List<CharacterModel>? get characterModelObservable {
    _$characterModelObservableAtom.reportRead();
    return super.characterModelObservable;
  }

  @override
  set characterModelObservable(List<CharacterModel>? value) {
    _$characterModelObservableAtom
        .reportWrite(value, super.characterModelObservable, () {
      super.characterModelObservable = value;
    });
  }

  late final _$isHomeLoadingAtom =
      Atom(name: 'BaseHomeStore.isHomeLoading', context: context);

  @override
  bool get isHomeLoading {
    _$isHomeLoadingAtom.reportRead();
    return super.isHomeLoading;
  }

  @override
  set isHomeLoading(bool value) {
    _$isHomeLoadingAtom.reportWrite(value, super.isHomeLoading, () {
      super.isHomeLoading = value;
    });
  }

  late final _$getCharacterAsyncAction =
      AsyncAction('BaseHomeStore.getCharacter', context: context);

  @override
  Future<void> getCharacter() {
    return _$getCharacterAsyncAction.run(() => super.getCharacter());
  }

  @override
  String toString() {
    return '''
characterModel: ${characterModel},
characterModelObservable: ${characterModelObservable},
isHomeLoading: ${isHomeLoading}
    ''';
  }
}
