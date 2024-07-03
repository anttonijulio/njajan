import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final String id;
  final String cardNumber;
  final String cardHolderName;
  final String? expiryDate;
  final String? cvv;

  const Account({
    required this.id,
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvv,
  });

  @override
  List<Object?> get props => [
        id,
        cardHolderName,
        cardNumber,
        expiryDate,
        cvv,
      ];
}
