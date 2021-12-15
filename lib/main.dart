import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hotel Admin"),
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.brown,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                //child: Text("My container"),
              ),
              Text("My column"),
              Text("My second column"),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(20),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    Card(
                      color: Colors.black,
                    ),
                    Card(
                      color: Colors.green,
                    ),
                    Card(
                      color: Colors.black,
                    ),
                    Card(
                      color: Colors.green,
                    ),
                    Card(
                      child: InkWell(
                        onTap: () {
                          print("Pressed");
                        },
                        child: Container(
                          width: 10,
                          height: 10,
                        ),
                      ),
                      color: Colors.black,
                    ),
                    Card(
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
