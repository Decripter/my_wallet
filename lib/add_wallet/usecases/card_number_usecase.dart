import 'package:my_wallet/add_wallet/value_objects/card_number_value_object.dart.dart';

/// this will suport all validations and methods that a [CardNumber] needs
class CardNumerUsecase {
  /// define a [CardNumber] to apply the methods
  CardNumber card;

  /// this it's the constructor
  CardNumerUsecase({
    required this.card,
  });

  /// this it's responsable to remove anything
  /// that not a number and return string to use on copyWith
  String removeMask(CardNumber card) {
    final valueClear = card.value.replaceAll(RegExp(r'\D'), '');
    return valueClear;
  }
}
