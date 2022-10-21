import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return a valid card', () {});
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
// 
