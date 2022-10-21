import 'package:my_wallet/add_wallet/card_number_value_object.dart.dart';

class Card {
  CardNumber number;
  int expirationMonth;
  int expirationYear;
  int cvv;

  Card({
    required this.number,
    required this.expirationMonth,
    required this.expirationYear,
    required this.cvv,
  });
}
