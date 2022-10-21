import 'package:my_wallet/add_wallet/value_objects/card_number_value_object.dart.dart';

/// this will suport all validations and methods that a [CardNumber] needs
class CardNumerUsecase {
  /// this it's responsable to remove anything
  /// that not a number and return string to use on copyWith
  String removeMask(CardNumber card) {
    final valueClear = card.value.replaceAll(RegExp(r'\D'), '');
    return valueClear;
  }

  /// this check if a card is valid
  bool validateCard(CardNumber card) {
    final isCorrectlyLength = checkCorrectlyLength(card);
    if (isCorrectlyLength) {
      return true;
    } else {
      return isCorrectlyLength;
    }
  }

  /// verify if the number has a correctly length
  bool checkCorrectlyLength(CardNumber card) {
    final cardNumber = removeMask(card);
    if (cardNumber.length != 16) {
      return false;
    } else {
      return true;
    }
  }
}
