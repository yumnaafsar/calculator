import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {


  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  
  var result="";

Widget btn(var text){
  return ElevatedButton(onPressed: (){
    setState(() {
      result=result+text;
    });
  }, child:Text(text),style: ElevatedButton.styleFrom(primary:Color(0xff6c6e70) ,shape:CircleBorder(),padding:EdgeInsets.all(20)), );}

 clear(){
    setState(() {
      result=" ";
    });
 }

output(){
  Parser p=Parser();
  Expression exp=p.parse(result);
  ContextModel cm= ContextModel();
  double eval=exp.evaluate(EvaluationType.REAL,cm);
  setState(() {
    result=eval.toString();
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Center(child: Text("CALCULATOR",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.black, )))
      ),
      body:
      Center(
        child:
            Container(
              color:Color(0xff242526) ,
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Container(
                child: 
                Text(result,style:TextStyle(fontSize: 30,color:Colors.white,fontWeight:FontWeight.bold))),
                SizedBox(height: 100,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 btn("1"),
                 btn("2"),
                 btn("3"),
                 btn("+"),
               ],),
               SizedBox(height: 10,),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 btn("4"),
                 btn("5"),
                 btn("6"),
                 btn("-"),
               ],),
               SizedBox(height: 10,),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 btn("7"),
                 btn("8"),
                 btn("9"),
                 btn("*"),
               ],),
               SizedBox(height: 10,),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                 btn("0"),
                 ElevatedButton(onPressed:clear, child:Text('clear'),style: ElevatedButton.styleFrom(primary:Color(0xff6c6e70)  ,shape:CircleBorder(),padding:EdgeInsets.all(20)), ),
                 ElevatedButton(onPressed:output, child:Text('=') ,style: ElevatedButton.styleFrom(primary:Color(0xff6c6e70) ,shape:CircleBorder(),padding:EdgeInsets.all(20)), ),
                 btn("/"),
               ],)
              ]
            ),
          ),
      )
    );
  }
}
