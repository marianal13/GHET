import 'package:flutter/material.dart';

class GroceryPage extends StatefulWidget{
  const GroceryPage({super.key, required this.title});
  final String title;

  @override
  State<GroceryPage> createState() => _GroceryPageState();

}

class _GroceryPageState extends State<GroceryPage>{
List<String> groceries = [];
final TextEditingController _itemController = TextEditingController();

void add(String item){
  setState(() {
    groceries.add(item);
  });
  _itemController.clear();
}

void remove(String item) {
    setState(() {
      groceries.remove(item);
    });
  }

  void clear() {
    setState(() {
      groceries.clear();
    });
  }

@override
Widget build (BuildContext context){
  return Scaffold(
body: Column(
    children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15,20,0,0),
            child: Text('Grocery List:', style: TextStyle(fontSize: 30),),
          ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            child: Text('Add Item', style: TextStyle(fontSize: 20),),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Add Item'),
                  content: TextField(
                    controller: _itemController,
                    decoration: const InputDecoration(
                      hintText: 'Enter an item to add',
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Add'),
                      onPressed: () {
                        add(_itemController.text);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 105, 174, 135),)

          ),
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: groceries.length,
          itemBuilder: (context, index) {
            final item = groceries[index];
            return ListTile(
              title: Text(item),
              trailing: IconButton(
                icon: Icon(Icons.check_box_outline_blank_rounded),
                onPressed: () {
                  remove(item);
                },
              ),
            );
          },
        ),
      ),
    ],
  ),
  persistentFooterButtons: [
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width:150, 
        height: 50,
        child: ElevatedButton(
          child: Text('Clear List', style: TextStyle(fontSize: 20),),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Clear List'),
                content: Text('Do you want to clear your grocery list'),
                actions: [
                  TextButton(
                    child: Text('Go Back'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Yes'),
                    onPressed: () {
                      clear();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 105, 174, 135),)
        ),
      ),
    ),
  ],
  );
}
}