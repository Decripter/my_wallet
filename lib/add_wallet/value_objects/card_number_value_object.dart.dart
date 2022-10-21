// ignore_for_file: public_member_api_docs, sort_constructors_first
/// represents a number on a card store
class CardNumber {
  /// its a strting becouse its can contains masks that
  /// will be added or removed on usecase layer
  String value;

  /// it's define te constructor method
  CardNumber({
    required this.value,
  });

  /// this return the value instead <InstanceOfCardNumber>
  @override
  String toString() {
    return value;
  }

  /// allows mutability on class
  CardNumber copyWith({
    String? value,
  }) {
    return CardNumber(
      value: value ?? this.value,
    );
  }
}
