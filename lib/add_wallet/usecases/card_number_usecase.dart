import 'package:my_wallet/add_wallet/value_objects/card_number_value_object.dart.dart';

/// This will suport all validations and methods that a [CardNumber] needs
class CardNumerUsecase {
  /// This it's responsable to remove anything
  /// that not a number and return string with only numbers
  String removeMask(CardNumber card) {
    final valueClear = card.value.replaceAll(RegExp(r'\D'), '');
    return valueClear;
  }

  /// This check if a card is valid
  bool validateCard(CardNumber card) {
    final isCorrectlyLength = checkCorrectlyLength(card);
    if (isCorrectlyLength) {
      return true;
    } else {
      return isCorrectlyLength;
    }
  }

  /// Take [CardNumber] and verify if the number has a correctly length == 16
  bool checkCorrectlyLength(CardNumber card) {
    final cardNumber = removeMask(card);
    if (cardNumber.length != 16) {
      return false;
    } else {
      return true;
    }
  }

  /// This will teka a [CardNumber] and return the last digit
  String takeLastDigit(CardNumber card) {
    final cardNumber = removeMask(card);
    final lastDigit = cardNumber[cardNumber.length - 1];
    return lastDigit;
  }
}
