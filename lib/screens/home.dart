import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/screens/add.dart';
import 'package:simple_app/widgets/balance_widget.dart';
import 'package:simple_app/widgets/month_navigator.dart';
import 'package:simple_app/widgets/transactions_display_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Transaction',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.star,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.slider_horizontal_3,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          MonthNavigator(),
          BalanceWidget(),
          Expanded(child: TransactionDisplayWidget()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Add()),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}


