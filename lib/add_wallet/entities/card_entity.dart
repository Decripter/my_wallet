import 'package:my_wallet/add_wallet/value_objects/card_number_value_object.dart.dart';

/// this class represents a card complete, with all your infos
class CardEntity {
  /// this identify a unique card
  String id;

  /// this is a value object that has own validation
  CardNumber number;

  ///  it's the expiration month
  int expirationMonth;

  /// it's the expiration year
  int expirationYear;

  /// it's the cvv
  int cvv;

  /// this construct theobject
  CardEntity({
    required this.id,
    required this.number,
    required this.expirationMonth,
    required this.expirationYear,
    required this.cvv,
  });
}
