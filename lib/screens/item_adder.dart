import 'package:app/models/item_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemAdder extends StatelessWidget {
  final textController = TextEditingController();

  ItemAdder({super.key});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: textController,
                  minLines: 1,
                  maxLines: 3,
                  onChanged: (value) {},
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Add Item',
                    hintText: "Item Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Provider.of<ItemData>(context, listen: false)
                        .addItem(textController.text);
                    Navigator.pop(context);
                  },
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Text(
                    "ADD",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
