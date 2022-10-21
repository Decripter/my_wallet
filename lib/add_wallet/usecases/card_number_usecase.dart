// ignore_for_file: comment_references

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
      final lastDigit = takeLastDigit(card);
      var result = 0;
      result = getSumOfNumbersOfCard(card);
      result = result % 10;
      if (result != 0) {
        result = 10 - result;
      }
      return result == lastDigit;
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

  /// This will take a [CardNumber] and return the last digit
  int takeLastDigit(CardNumber card) {
    final cardNumber = removeMask(card);
    final lastDigit = cardNumber[cardNumber.length - 1];
    return int.parse(lastDigit);
  }

  /// This will make the multiplication process
  int multiplyDigits({required int digit, required int multiply}) {
    return digit * multiply;
  }

  /// This will take a [int] number and sum if it has more than one digit
  int getSumOfNumber(int number) {
    if (number.toString().length > 1) {
      var numberCalculated = 0;
      final numberAsString = number.toString();
      for (var digit = 0; digit < numberAsString.length; digit++) {
        numberCalculated = numberCalculated + int.parse(numberAsString[digit]);
      }
      return numberCalculated;
    } else {
      return number;
    }
  }

  /// This will througth of digits and get the sum of all these
  int getSumOfNumbersOfCard(CardNumber card) {
    final numbers = removeMask(card);
    var result = 0;
    for (var digit = 0; digit < numbers.length; digit++) {
      final value = int.parse(numbers[digit]);
      final digitValue = getSumOfNumber(
        multiplyDigits(
          digit: value,
          multiply: getMultiplyProperty(digit),
        ),
      );
      result = result + digitValue;
    }

    return result;
  }

  /// Take a digit and return the multiply property correctly
  /// 1 for [digit.isEven],
  /// and 0 for [digit.isOdd]
  int getMultiplyProperty(int digit) {
    if (digit.isEven) {
      return 2;
    } else {
      return 1;
    }
  }

  ///
}
