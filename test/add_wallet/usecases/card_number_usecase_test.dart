import 'package:flutter_test/flutter_test.dart';
import 'package:my_wallet/add_wallet/usecases/card_number_usecase.dart';
import 'package:my_wallet/add_wallet/value_objects/card_number_value_object.dart.dart';

void main() {
  group('REMOVE_MASK -> ', () {
    test('should return empty string', () {
      var cardWithText = CardNumber(value: 'its not a number');
      final usecase = CardNumerUsecase(card: cardWithText);
      cardWithText = cardWithText.copyWith(
        value: usecase.removeMask(cardWithText),
      );
      expect(cardWithText.value, '');
    });
    test('should return string with "0000"', () {
      var dirtyCard = CardNumber(value: '*this txt will be removed0 0.0 --0');
      final usecase = CardNumerUsecase(card: dirtyCard);
      dirtyCard = dirtyCard.copyWith(
        value: usecase.removeMask(dirtyCard),
      );

      expect(dirtyCard.value, '0000');
    });
  });
}
