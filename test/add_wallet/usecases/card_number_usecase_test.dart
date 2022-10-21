import 'package:flutter_test/flutter_test.dart';
import 'package:my_wallet/add_wallet/usecases/card_number_usecase.dart';
import 'package:my_wallet/add_wallet/value_objects/card_number_value_object.dart.dart';

void main() {
  final usecase = CardNumerUsecase();
  group('REMOVE_MASK -> ', () {
    test('should return empty string', () {
      var cardWithText = CardNumber(value: 'its not a number');
      cardWithText = cardWithText.copyWith(
        value: usecase.removeMask(cardWithText),
      );
      expect(cardWithText.value, '');
    });
    test('should return string with "0000"', () {
      var dirtyCard = CardNumber(value: '*this txt will be removed0 0.0 --0');
      dirtyCard = dirtyCard.copyWith(
        value: usecase.removeMask(dirtyCard),
      );

      expect(dirtyCard.value, '0000');
    });
  });

  group('CHECK_LENGTH -> ', () {
    test('should return false on 4 digits card', () {
      final cardWith4Digits = CardNumber(value: '1 2 3 -4 ');
      final result = usecase.checkCorrectlyLength(cardWith4Digits);
      expect(result, false);
    });
    test('should return false on 24 digits card', () {
      final cardWith4Digits = CardNumber(value: '12222 000011112212000023 -4 ');
      final result = usecase.checkCorrectlyLength(cardWith4Digits);
      expect(result, false);
    });
    test('should return true on 16 digits card', () {
      final cardWith16Digits = CardNumber(value: '1111 2232 4431 0110');
      final usecase = CardNumerUsecase();
      final result = usecase.checkCorrectlyLength(cardWith16Digits);
      expect(result, true);
    });
    test('should return true on 16 digits card even dirty', () {
      final cardWith16DigitsDirty = CardNumber(value: '111q1q q2q2q3244310110');
      final usecase = CardNumerUsecase();
      final result = usecase.checkCorrectlyLength(cardWith16DigitsDirty);
      expect(result, true);
    });
  });

  group('TAKE_LAST_DIGIT -> ', () {
    test('should return 4 on the last digit', () {
      final cardEndWithDigit4 = CardNumber(value: '1111 2222 3333 4444');
      final result = usecase.takeLastDigit(cardEndWithDigit4);
      expect(result, 4);
    });
    test('should return 4 on the last digit even dirty', () {
      final cardEndWithDigit4Dirty = CardNumber(value: '1111 22292 3333s4444a');
      final result = usecase.takeLastDigit(cardEndWithDigit4Dirty);
      expect(result, 4);
    });
    test('should return 0 on the last digit', () {
      final cardEndWithDigit0 = CardNumber(value: '1111 2232 4431 0110');
      final result = usecase.takeLastDigit(cardEndWithDigit0);
      expect(result, 0);
    });
    test('should return 0 on the last digit even dirty', () {
      final cardEndWithDigit0Dirty = CardNumber(value: '1111 2232w4431 0110ww');
      final result = usecase.takeLastDigit(cardEndWithDigit0Dirty);
      expect(result, 0);
    });
  });

  group('MULTIPLY_DIGITS -> ', () {
    test('should return 8 to the digit 4 * 2', () {
      final result = usecase.multiplyDigits(digit: 4, multiply: 2);
      expect(result, 8);
    });
    test('should return 4 to the digit 4 * 1', () {
      final result = usecase.multiplyDigits(digit: 4, multiply: 1);
      expect(result, 4);
    });
    test('should return 0 to the digit 0 * 2', () {
      final result = usecase.multiplyDigits(digit: 0, multiply: 2);
      expect(result, 0);
    });
    test('should return 0 to the digit 8 * 1', () {
      final result = usecase.multiplyDigits(digit: 0, multiply: 1);
      expect(result, 0);
    });
  });

  group('SUM_OF_NUMBERS -> ', () {
    test('should return 6 to the number 15', () {
      final result = usecase.getSumOfNumber(15);
      expect(result, 6);
    });
    test('should return 1 to the number 10', () {
      final result = usecase.getSumOfNumber(10);
      expect(result, 1);
    });
    test('should return 1 to the number 1', () {
      final result = usecase.getSumOfNumber(1);
      expect(result, 1);
    });
    test('should return 10 to the number 19', () {
      final result = usecase.getSumOfNumber(19);
      expect(result, 10);
    });
    test('should return 3 to the number 111', () {
      final result = usecase.getSumOfNumber(111);
      expect(result, 3);
    });
  });

  group('GET_MULTIPLY_PROPERTY -> ', () {
    test('should return 2 to the number 10 [even]', () {
      final result = usecase.getMultiplyProperty(10);
      expect(result, 2);
    });
    test('should return 2 to the number 18 [even]', () {
      final result = usecase.getMultiplyProperty(18);
      expect(result, 2);
    });
    test('should return 1 to the number 00 [even]', () {
      final result = usecase.getMultiplyProperty(0);
      expect(result, 2);
    });

    test('should return 1 to the number 11 [odd]', () {
      final result = usecase.getMultiplyProperty(1);
      expect(result, 1);
    });
    test('should return 1 to the number 05 [odd]', () {
      final result = usecase.getMultiplyProperty(5);
      expect(result, 1);
    });
  });

  group('SUM_OF_NUMBERS_CARD -> ', () {
    test('should return 24 to the card 1111 1111 1111 1111', () {
      final card = CardNumber(value: '1111 1111 1111 1111');
      final result = usecase.getSumOfNumbersOfCard(card);
      expect(result, 24);
    });
    test('should return 16 to the card 1010 1010 1010 1010', () {
      final card = CardNumber(value: '1010 1010 1010 1010');
      final result = usecase.getSumOfNumbersOfCard(card);
      expect(result, 16);
    });
    test('should return 8 to the card 0101 0101 0101 0101', () {
      final card = CardNumber(value: '0101 0101 0101 0101');
      final result = usecase.getSumOfNumbersOfCard(card);
      expect(result, 8);
    });
    test('should return 0 to the card 0000 0000 0000 0000', () {
      final card = CardNumber(value: '0000 0000 0000 0000');
      final result = usecase.getSumOfNumbersOfCard(card);
      expect(result, 0);
    });
    test('should return 1 to the card 0000 0000 0000 0001', () {
      final card = CardNumber(value: '0000 0000 0000 0001');
      final result = usecase.getSumOfNumbersOfCard(card);
      expect(result, 1);
    });
    test('should return 2 to the card 0000 0000 0000 0010', () {
      final card = CardNumber(value: '0000 0000 0000 0010');
      final result = usecase.getSumOfNumbersOfCard(card);
      expect(result, 2);
    });
    test('should return 80 to the card 4916 6418 5936 9080', () {
      final card = CardNumber(value: '4916 6418 5936 9080');
      final result = usecase.getSumOfNumbersOfCard(card);
      expect(result, 80);
    });
  });

  group('VALIDATE_CARD -> ', () {
    test('should return false to the card 5419 8250 0346 1210', () {
      final card = CardNumber(value: '5419 8250 0346 1210');
      final result = usecase.validateCard(card);
      expect(result, false);
    });
    test('should return true to the card 4916 6418 5936 9080', () {
      final card = CardNumber(value: '4916 6418 5936 9080');
      final result = usecase.validateCard(card);
      expect(result, true);
    });
  });
  // END OF TEST SUIT
}


// O Mod 10 é um algoritmo para validação de cartões que é utilizado pela 
// maioria das bandeiras em todo o mundo. A seguir mostro como utilizar 
// o algoritmo para validar a numeração do cartão.

// Para validar o cartão de crédito siga esses passos:

// 1. Separe o último dígito do cartão. Neste caso é o zero.

// 2. Multiplique a numeração do cartão, número por número sendo a 
//    coluna ímpar por 1 e a coluna par por 2, levando em conta que 
//    a primeira coluna inicia-se por 0 (zero). 
//    Se o valor da multiplicação tiver dois dígitos, 
//    separe e some cada unidade. 
//    Em seguida, some todos os valores.

// 3. Com o resultado anterior, faça uma divisão por 10 para obter o
//    resto da divisão:

// 4. Subtraia o resto da divisão por 10:

// 5. Faça a verificação do número que foi separado no item 1
//    com o resultado do item 4. Se os números forem iguais, o cartão é valido,
//    e se forem diferentes, é invalido.


// Para testes, segue dois  números de cartão:

// Cartão inválido: 5419 8250 0346 1210.
// Cartão válido:   4916 6418 5936 9080.
