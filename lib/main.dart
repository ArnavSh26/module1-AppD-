import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/services.dart';

//import 'button.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const Display());
}

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  onButtonClick(value) {
    if (value == 'DEL') {
      input = "";
      output = '';
    } else if (value == "=") {
      Parser p = Parser();
      Expression expression = p.parse(input);
      ContextModel cm = ContextModel();
      var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalvalue.toString();
    } else {
      input = input + value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 107, 104, 104),
        appBar: AppBar(
          title: const Text('CALCULATOR'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.black38,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  input,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  output,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
//                crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    flex: 3,
                    child: button(butText: "DEL", butColor: Colors.orange)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
//                crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: button(butText: "7")),
                Expanded(child: button(butText: "8")),
                Expanded(child: button(butText: "9")),
                Expanded(
                    child: button(butText: "/", butColor: Colors.blueAccent)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
//                crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: button(butText: "4")),
                Expanded(child: button(butText: "5")),
                Expanded(child: button(butText: "6")),
                Expanded(
                    child: button(butText: "*", butColor: Colors.blueAccent)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
//                crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: button(butText: "1")),
                Expanded(child: button(butText: "2")),
                Expanded(child: button(butText: "3")),
                Expanded(
                    child: button(butText: "-", butColor: Colors.blueAccent)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
//                crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: button(butText: ".")),
                Expanded(child: button(butText: "0")),
                Expanded(child: button(butText: "=", butColor: Colors.green)),
                Expanded(
                    child: button(butText: "+", butColor: Colors.blueAccent)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button(
      {butColor = Colors.grey, butText = " ", textColor = Colors.white}) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      color: butColor,
      child: TextButton(
        onPressed: () => onButtonClick(butText),
        child: Center(
          child: Text(
            butText as String,
            style: TextStyle(
                color: textColor, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
