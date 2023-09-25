
import 'package:flutter/material.dart';

class Transaction {
  String? id;
  TransactionType? type;
  String? amount;
  Category selectedCategory;
  Account selectedAccount;
  String? note;
  String? description;



  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.selectedCategory,
    required this.selectedAccount,
    this.description,
    this.note,
  });


}

  ValueNotifier<List<Transaction>> transactionList = ValueNotifier<List<Transaction>>([
    Transaction(id: '01', amount: '500.0', type: TransactionType(label: 'Income'), selectedCategory: Category(label: 'Food', icon: Icons.fastfood), selectedAccount: Account(label: 'Cash')),
    Transaction(id: '02', amount: '400.0', type: TransactionType(label: 'Expense'), selectedCategory: Category(label: 'Transport', icon: Icons.directions_car), selectedAccount: Account(label: 'Bank Accounts')),
  ]);



class Category {
  final String label;
  final IconData? icon;

  Category({
    required this.label,
    this.icon,
});

 static List<Category> categories = [
   Category(label: 'Food', icon: Icons.fastfood),
   Category(label: 'Social Life', icon: Icons.people_outline_sharp),
   Category(label: 'Pets', icon: Icons.pets),
   Category(label: 'Transportation', icon: Icons.directions_car),
   Category(label: 'Culture', icon: Icons.filter_frames),
   Category(label: 'Household', icon: Icons.chair_alt),
   Category(label: 'Apparel', icon: Icons.shopping_bag_rounded),
   Category(label: 'Beauty', icon: Icons.shop_2_sharp),
   Category(label: 'Education', icon: Icons.laptop_chromebook),
   Category(label: 'Add'),
 ];
}


class Account {
  final String label;

  Account({required this.label});

  static List<Account> accounts = [
    Account(label: 'Cash'),
    Account(label: 'Bank Accounts'),
    Account(label: 'Card'),
    Account(label: 'Add'),
  ];
}

class TransactionType {
  final String label;
  final Color? color;
  bool isSelected;

  TransactionType({required this.label, this.color, this.isSelected = false});

  static List<TransactionType> types = [
    TransactionType(label: 'Income', color: Colors.blueAccent),
    TransactionType(label: 'Expense', color: Colors.redAccent),
    TransactionType(label: 'Transfer', color: Colors.black87)
  ];
}