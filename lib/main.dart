import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double val1 = 0;
    double val2 = 0;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text("test title"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Calcul",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 36,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.5),
                    borderRadius: BorderRadius.circular(36)
                  ),
                  child: TextField(
                    onChanged: (String valeur) {
                      val1 = double.tryParse(valeur)!;
                    },
                  )),
              SizedBox(
                height: 40,
              ),
              TextField(
                style: TextStyle(fontSize: 26),
                onChanged: (String valeur) {
                  val2 = double.tryParse(valeur)!;
                },

                decoration: InputDecoration(
                  icon: Icon(Icons.phone)      ,
                  fillColor: Colors.white70 ,
                  filled: true,
                  hintText: "Valeur2"    ,
                  prefixIcon: Icon(Icons.access_time),
                  suffixIcon: Icon(Icons.add_business)


                ),
              ),
              SizedBox(
                height: 36,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 18,
                  maximumSize: Size(250,66),
                  backgroundColor: Colors.red
                ),
                onPressed: () {
                  print(val1 + val2);
                },
                child: Row(
                  children: [
                    Icon(Icons.print),
                    Text("Calculate")
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Test");
          },
          child: Icon(Icons.home),
        ),
      ),
    );
  }
}
