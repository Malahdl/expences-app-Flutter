import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './transactionItem.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteElement;

  TransactionsList(this.transactions, this.deleteElement);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? LayoutBuilder(builder: ((context, constraints) {
                return Column(
                  children: [
                    Text(
                      'No transactions added yet!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset('images/waiting.png',
                            fit: BoxFit.cover))
                  ],
                );
              }))
            : ListView(
                children: transactions
                    .map((tx) => transaction_item(
                          key: ValueKey(tx.id),
                          transaction: tx,
                          deleteElement: deleteElement,
                        ))
                    .toList(),
              ));
  }
}
