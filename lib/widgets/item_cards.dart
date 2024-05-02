import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function(bool?) toggleChanged;
  final Function(DismissDirection?) delete;
  const ItemCard({
    super.key,
    required this.title,
    required this.isDone,
    required this.toggleChanged,
    required this.delete,
  });
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: delete,
      key: Key(title),
      child: Card(
        elevation: isDone ? 1 : 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: Theme.of(context).primaryColor,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                decoration: isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            onChanged: toggleChanged,
            value: isDone,
            activeColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
