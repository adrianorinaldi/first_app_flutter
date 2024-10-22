import 'package:flutter/material.dart';
import 'package:todo/models/item.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  var items = <Item>[];
  HomePage({super.key}) {
   items = []; 
   items.add(Item(title: "Item 1", done: false));
   items.add(Item(title: "Item 2", done: true));
   items.add(Item(title: "Item 3", done: false));
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          keyboardType: TextInputType.text,
        ),
        backgroundColor:  Colors.green,
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctx, int index) {
          final item = widget.items[index];
          return CheckboxListTile(title: Text(item.title), 
          key: Key(item.title),
          value: item.done,
          onChanged: (value){
            setState((){
              item.done = value ?? false;
            });
          },
          );
        },
      )
    );
  }
}