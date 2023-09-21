import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthNavigator extends StatefulWidget {
  @override
  _MonthNavigatorState createState() => _MonthNavigatorState();
}

class _MonthNavigatorState extends State<MonthNavigator> {
  DateTime currentDate = DateTime.now();

  void _navigateToPreviousMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month - 1);
    });
  }

  void _navigateToNextMonth() {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = '${DateFormat.MMM().format(currentDate)} ${currentDate.year}';

    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: IconButton(
              onPressed: _navigateToPreviousMonth,
              icon: Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
          Container(
            child: Text(
              formattedDate,
            ),
          ),
          Container(
            child: IconButton(
              onPressed: _navigateToNextMonth,
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ],
      ),
    );
  }
}