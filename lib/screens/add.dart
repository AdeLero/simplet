import 'package:flutter/material.dart';
import 'package:simple_app/models/transaction_model.dart';
import 'package:simple_app/widgets/account_button.dart';
import 'package:simple_app/widgets/category_button.dart';
import 'package:simple_app/widgets/transaction_type_selector.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final _amountController = TextEditingController();
  final _accountController = TextEditingController();
  final _categoryController = TextEditingController();
  TransactionType? _selectedType;
  final List<Transaction> transactions = transactionList.value;

  void _showCategoryBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: CategoryButton(
              categories: Category.categories,
              onCategorySelected: (String label) {
                setState(() {
                  _categoryController.text = label;
                });
            }
          ),
        );
      }
    );
  }

  void _showAccountBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AccountButton(
          accounts: Account.accounts,
          onAccountSelected: (String label) {
            setState(() {
              _accountController.text = label;
            });
          },
        );
      }
    );
  }

  void _addTransaction() {
    final selectedCategoryLabel = _categoryController.text;
    IconData? selectedCategoryIcon;
    final selectedCategory = Category.categories.firstWhere(
          (category) {
        if (category.label == selectedCategoryLabel) {
          selectedCategoryIcon = category.icon;
          return true;
        }
        return false;
      },
      orElse: () => Category(label: selectedCategoryLabel, icon: Icons.category),
    );

    final newTransaction = Transaction(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: _selectedType,
        amount: _amountController.text,
        selectedCategory: Category(label: selectedCategoryLabel, icon: selectedCategoryIcon),
        selectedAccount: Account(label: _accountController.text)
    );


    transactionList.value.add(newTransaction);

    transactionList.value = List.from(transactionList.value);


    _amountController.clear();
    _categoryController.clear();
    _accountController.clear();
    _selectedType = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TransactionTypeSelector(
            types: TransactionType.types,
            onTap: (type) {
              setState(() {
                _selectedType = type;
              });
            },
          ),
          Row(
            children: [
              const Text('Amount'),
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('Account'),
              Expanded(
                child: GestureDetector(
                  child: TextField(
                    onTap: () {
                      _showAccountBottomSheet();
                    },
                    controller: _accountController,
                    readOnly: true,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('Category'),
              Expanded(
                child: GestureDetector(
                  child: TextField(
                    onTap: () {
                      _showCategoryBottomSheet();
                    },
                    controller: _categoryController,
                    readOnly: true,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: IconButton(
              onPressed: () {
                _addTransaction();
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.save_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
