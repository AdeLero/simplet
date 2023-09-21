import 'package:flutter/material.dart';
import 'package:simple_app/models/transaction_model.dart';

class TransactionTypeSelector extends StatefulWidget {
  final List<TransactionType> types;
  const TransactionTypeSelector({Key? key, required this.types})
      : super(key: key);

  @override
  _TransactionTypeSelectorState createState() => _TransactionTypeSelectorState();
}

class _TransactionTypeSelectorState extends State<TransactionTypeSelector> {
  int selectedCategoryIndex = 1; // Initialize with the default index.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.types.length, (index) {
          final type = widget.types[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategoryIndex = index; // Update the selected index.
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 27.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: selectedCategoryIndex == index
                      ? type.color!
                      : Colors.grey,
                ),
              ),
              child: Text(
                type.label,
                style: TextStyle(
                  color: selectedCategoryIndex == index
                      ? type.color!
                      : Colors.grey,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
