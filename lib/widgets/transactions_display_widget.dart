import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class TransactionDisplayWidget extends StatefulWidget {
  const TransactionDisplayWidget({super.key});

  @override
  State<TransactionDisplayWidget> createState() => _TransactionDisplayWidgetState();
}

class _TransactionDisplayWidgetState extends State<TransactionDisplayWidget> {
  // final List<Transaction> transactions = transactionList;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        DateTime.now().day.toString(),
                        style: const TextStyle(fontSize: 24), // Adjust the font size
                      ),
                      const SizedBox(width: 5),
                      Container(
                        color: Colors.blueGrey,
                        padding: const EdgeInsets.all(8), // Add some padding
                        child: Text(
                          getWeekdayName(DateTime.now()
                              .weekday), // Use a function to get the weekday name
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Income'),
                      SizedBox(width: 15),
                      Text('Expenses'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Expanded(
              child:ValueListenableBuilder(
                valueListenable: transactionList,
                builder: (context,_,widget){
                  return ListView.builder(
                    itemCount: transactionList.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      // TransactionType transactionType = transactions[index].type!;



                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 100.0,
                                  child: Row(
                                    children: [
                                      if(transactionList.value[index].selectedCategory.icon!=null)...[
                                        Icon(
                                          transactionList.value[index].selectedCategory.icon,
                                          size: 15.0,
                                          color: Colors.black,
                                        ),
                                      ],
                                      SizedBox(width: 5),
                                      Text(
                                        transactionList.value[index].selectedCategory.label,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                    '${transactionList.value[index].selectedAccount.label}'
                                ),
                              ],
                            ),
                            Text(
                              '\u20A6${transactionList.value[index].amount}',
                              style: TextStyle(
                                color: transactionList.value[index].type?.color??Colors.black
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String getWeekdayName(int weekday) {
  switch (weekday) {
    case 1:
      return 'Mon';
    case 2:
      return 'Tue';
    case 3:
      return 'Wed';
    case 4:
      return 'Thur';
    case 5:
      return 'Fri';
    case 6:
      return 'Sat';
    case 7:
      return 'Sun';
    default:
      return ''; // Handle any unexpected values
  }
}