import 'package:app/models/item_data.dart';
import 'package:app/screens/item_adder.dart';
import 'package:app/screens/them_settings_page.dart';
import 'package:app/widgets/item_cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.settings,
                size: 25,
                color: Colors.white,
              ),
            ),
          )
        ],
        title: Text(
          "Get It Done",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                textAlign: TextAlign.center,
                "${Provider.of<ItemData>(context).items.length} items",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: Provider.of<ItemData>(context).items.length,
                      itemBuilder: (context, index) => ItemCard(
                        title:
                            Provider.of<ItemData>(context).items[index].title,
                        isDone:
                            Provider.of<ItemData>(context).items[index].isDone,
                        toggleChanged: (_) {
                          Provider.of<ItemData>(context, listen: false)
                              .toggleChanged(index);
                        },
                        delete: (_) {
                          Provider.of<ItemData>(context, listen: false)
                              .delete(index);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              context: context,
              builder: (conext) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(child: ItemAdder()),
                  ));
        },
      ),
    );
  }
}
