import 'package:flutter_test/flutter_test.dart';
import 'package:my_wallet/add_wallet/usecases/card_number_usecase.dart';
import 'package:my_wallet/add_wallet/value_objects/card_number_value_object.dart.dart';

void main() {
  group('REMOVE_MASK -> ', () {
    test('should return empty string', () {
      var cardWithText = CardNumber(value: 'its not a number');
      final usecase = CardNumerUsecase();
      cardWithText = cardWithText.copyWith(
        value: usecase.removeMask(cardWithText),
      );
      expect(cardWithText.value, '');
    });
    test('should return string with "0000"', () {
      var dirtyCard = CardNumber(value: '*this txt will be removed0 0.0 --0');
      final usecase = CardNumerUsecase();
      dirtyCard = dirtyCard.copyWith(
        value: usecase.removeMask(dirtyCard),
      );

      expect(dirtyCard.value, '0000');
    });
  });

  group('CHECK_LENGTH -> ', () {
    test('should return false on 4 digits card', () {
      final cardWith4Digits = CardNumber(value: '1 2 3 -4 ');
      final usecase = CardNumerUsecase();
      final result = usecase.checkCorrectlyLength(cardWith4Digits);
      expect(result, false);
    });
    test('should return true on 16 digits card', () {
      final cardWith16Digits = CardNumber(value: '1111 2232 4431 0110');
      final usecase = CardNumerUsecase();
      final result = usecase.checkCorrectlyLength(cardWith16Digits);

      expect(result, true);
    });
  });
}
// O Mod 10 é um algoritmo para validação de cartões que é utilizado pela 
// maioria das bandeiras em todo o mundo. A seguir mostro como utilizar 
// o algoritmo para validar a numeração do cartão.

// Para validar o cartão de crédito siga esses passos:

// 1. Separe o último dígito do cartão. Neste caso é o zero.

// 2. Multiplique a numeração do cartão, número por número sendo a 
//    coluna ímpar por 1 e a coluna par por 2, levando em conta que 
//    a primeira coluna inicia-se por 0 (zero). 
//    Se o valor da multiplicação tiver dois dígitos, separe e some cada unidade. 
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

//   par => * 2
// impar => * 1

// 1 -> [0]

// 2 * [ 0 2 6 3 0 2 9 4 ] => 0 4 1 2 6 0 4 1 8 8 =>  34
// 1 * [ 1 1 4 0 5 8 1 5 ] => 1 1 4 0 5 8 1 5     =>  25
//                                                    59

//2 -> [59]


// 3 -> 9

// 10 - 9 = 1
// 4 -> 1

// 5 -> 1 != 0




//2 * [ 6 9 8 5 6 9    =>  32
//1 * [8 9 3 5 1 6 1 4 =>  38 
//                         70
//
//  70%10 => 0
//
//  0 == 0 
//