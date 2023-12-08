import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class transaction_item extends StatefulWidget {
  const transaction_item({
    Key? key,
    required this.transaction,
    required this.deleteElement,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteElement;

  @override
  State<transaction_item> createState() => _transaction_itemState();
}

class _transaction_itemState extends State<transaction_item> {
  Color? _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FittedBox(
              child: Text('\$${widget.transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(widget.transaction.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? ElevatedButton.icon(
                onPressed: () {
                  widget.deleteElement(widget.transaction.id);
                },
                icon: Icon(Icons.delete),
                label: Text(
                  "Delete",
                ),
                style: ButtonStyle(
                    textStyle: MaterialStatePropertyAll(
                        TextStyle(color: Theme.of(context).errorColor))),
              )
            : IconButton(
                onPressed: () {
                  widget.deleteElement(widget.transaction.id);
                },
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
