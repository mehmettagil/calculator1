import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class InputPage extends StatefulWidget {

  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String result = '0';
  String input = '0';
  String expression = '';

  buttonPrint(String ButtonText){
    setState(() {
      if(ButtonText == 'C'){
        input = '0';
        result = '0';

      }
      else if(ButtonText == '⌧'){
        input = input.substring(0, input.length -1);

      }else if (ButtonText == '='){
        expression = input;
        expression =expression.replaceAll('×', '*');
        expression =expression.replaceAll('÷', '/');
        expression =expression.replaceAll('√x', '^1/2');
        expression =expression.replaceAll('x^2', '^2');
        expression =expression.replaceAll('1/x', '1/x');
        expression =expression.replaceAll('%', '%');






        try{
          Parser p = new Parser();
          Expression exp = p.parse(expression);
          ContextModel cm =ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';

        }catch(e){
          result = 'Error';
        }

      }

      else {
        if(input == '0'){
          input = ButtonText;

        }else {
          input = input +ButtonText;
        }
      }

    });

  }
  Widget buildGestureButton(context, String ButtonText, Color ButtonColor) {


    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      color: ButtonColor,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: BorderSide(
                  color: Colors.white, width: 1, style: BorderStyle.solid)),
          onPressed: () => buttonPrint(ButtonText),
          child: Text(
            ButtonText,
            style: TextStyle(fontSize: 18, color: Colors.white),
          )),
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(15.0),
            child: Text(
              input,
              style: TextStyle(fontSize: 32),
            ),
          ),
          Divider(
            height: 20,
            thickness: 10,
          ),
          Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(15.0),
              child: Text(
                result,
                style: TextStyle(fontSize: 45),
              )),
          SizedBox(height: MediaQuery.of(context).size.height*0.15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.98,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildGestureButton(context, '.', Colors.lightBlue),
                      buildGestureButton(context, 'CE', Colors.lightBlue),
                      buildGestureButton(context, 'C', Colors.lightBlue),
                      buildGestureButton(context, '⌧', Colors.lightBlue),
                    ]),
                    TableRow(children: [
                      buildGestureButton(context, '1/x', Colors.lightBlue),
                      buildGestureButton(context, 'x^2', Colors.lightBlue),
                      buildGestureButton(context, '√x', Colors.lightBlue),
                      buildGestureButton(context, '÷', Colors.lightBlue),
                    ]),
                    TableRow(children: [
                      buildGestureButton(context, '7', Colors.lightBlue),
                      buildGestureButton(context, '8', Colors.lightBlue),
                      buildGestureButton(context, '9', Colors.lightBlue),
                      buildGestureButton(context, '×', Colors.lightBlue),
                    ]),
                    TableRow(children: [
                      buildGestureButton(context, '4', Colors.lightBlue),
                      buildGestureButton(context, '5', Colors.lightBlue),
                      buildGestureButton(context, '6', Colors.lightBlue),
                      buildGestureButton(context, '-', Colors.lightBlue),
                    ]),
                    TableRow(children: [
                      buildGestureButton(context, '1', Colors.lightBlue),
                      buildGestureButton(context, '2', Colors.lightBlue),
                      buildGestureButton(context, '3', Colors.lightBlue),
                      buildGestureButton(context, '+', Colors.lightBlue),
                    ]),
                    TableRow(children: [
                      buildGestureButton(context, '%', Colors.lightBlue),
                      buildGestureButton(context, '0', Colors.lightBlue),
                      buildGestureButton(context, ',', Colors.lightBlue),
                      buildGestureButton(context, '=', Colors.lightBlue),
                    ])
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

