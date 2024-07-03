import '../../domain/entity/account.dart';

class AccountModel extends Account {
  const AccountModel({
    required super.id,
    required super.cardNumber,
    required super.expiryDate,
    required super.cardHolderName,
    required super.cvv,
  });

  factory AccountModel.fromRemote(Map<String, dynamic>? data) {
    return AccountModel(
      id: data?['id'] ?? '-',
      cardNumber: data?['cardNumber'] ?? '-',
      expiryDate: data?['expiryDate'] ?? '-',
      cardHolderName: data?['cardHolderName'] ?? '-',
      cvv: data?['cvv'] ?? '-',
    );
  }
}
