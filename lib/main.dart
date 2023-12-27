import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String operatsia = "+";
  dynamic result = "";

  dynamic textbuttonColor = Colors.blue.withOpacity(0.5);

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller1,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (controller1.text.isEmpty || controller2.text.isEmpty) {
                  textbuttonColor = Colors.blue.withOpacity(0.5);
                } else {
                  textbuttonColor = Colors.blue;
                }
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: "1-число",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 200,
              child: Text(
                "$operatsia",
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controller2,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (controller1.text.isEmpty || controller2.text.isEmpty) {
                  textbuttonColor = Colors.blue.withOpacity(0.5);
                } else {
                  textbuttonColor = Colors.blue;
                }
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: "2-число",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                if (controller1.text.isEmpty || controller2.text.isEmpty) {
                  result = "Введите и второе число";
                } else {
                  setState(() {});
                  switch (operatsia) {
                    case "-":
                      result = (num.parse(controller1.text) -
                          num.parse(controller2.text));
                      break;
                    case "*":
                      result = (num.parse(controller1.text) *
                          num.parse(controller2.text));
                      break;
                    case "/":
                      result = (num.parse(controller1.text) /
                          num.parse(controller2.text));
                      break;
                    default:
                      result = (num.parse(controller1.text) +
                          num.parse(controller2.text));
                  }
                }
                setState(() {});
              },
              child: Text(
                "Result",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(textbuttonColor),
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 380,
              child: Text(
                "$result",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              operatsia = "+";
              result = "";
              setState(() {});
            },
            child: Text(
              "+",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              operatsia = "-";
              result = "";
              setState(() {});
            },
            child: Text(
              "-",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              operatsia = "*";
              result = "";
              setState(() {});
            },
            child: Text(
              "*",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              operatsia = "/";
              result = "";
              setState(() {});
            },
            child: Text(
              "/",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
