import 'dart:convert';

import 'package:flutter/material.dart';

class NumericButton extends StatelessWidget{
  
    final String text;
    final GestureTapCallback onPressed;
    final Color backgroundColor;
    final Color borderColor;
    NumericButton({this.text,this.onPressed, this.backgroundColor=Colors.black12, this.borderColor=Colors.lightBlue } );


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: this.backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(20) ,
         child: Text(
          this.text,
          style:TextStyle(fontSize: 26, color: Colors.white),
      ),),
      shape: CircleBorder(side: BorderSide(color: this.borderColor)),
      onPressed: this.onPressed);
  }
 
}



class Keypad extends StatefulWidget{


  @override
  KeypadState createState() {
    return KeypadState();
  }

}
 

class KeypadState extends State<Keypad>{
    
    String operatorSign;
    String displayText = "0";
    String clearButtonText = "C";
    double rowSpace = 5;
    double secondNumber;
    double ans;
    

    void pressed(String text){
      
      setState(() {

        if(displayText=="0"){
          displayText = text;
        } else{
          displayText += text;
        }
        
      });
    }

    void clearDisplay(){
      ans = 0;
      operatorSign = null;
      setState(() {
        displayText = "0";
      });
    }
    

  void operatorPressed(String sign){
      
      calculateAnswer();
      

      operatorSign = sign;
      ans = double.parse(displayText);
      setState(() {
        displayText = "";
      });
      
    }


  void pecentagePressed(){
    ans = double.parse(displayText)/ 100;
    finalAnswer = ans.toString().substring(0,9);
    setState(() {
      displayText = finalAnswer;
    });
  }

  void calculateAnswer(){
       if(operatorSign == "+"){
        ans += double.parse(displayText);
      }else if(operatorSign == "-"){
        ans -= double.parse(displayText);
      }else if(operatorSign == "*"){
        ans *= double.parse(displayText);
      }else if(operatorSign == "/"){
        ans /= double.parse(displayText);
      }else if(operatorSign =="%"){
        ans /= 100;
      }
  }


    String finalAnswer;
    void equaltoPressed(){
      
      calculateAnswer();

      if(ans % 1 == 0.0){
        finalAnswer = ans.floor().toString();
      }else{
        finalAnswer = ans.toString().substring(0,9);
      }

      setState(() {
        
        displayText = finalAnswer;
      });
    }

    @override
    Widget build(BuildContext context) {
      return Container(
        color: Colors.black,
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Container( 
              alignment: Alignment.centerRight,
              height: 150,
              child:Text(
                displayText,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 64, color: Colors.white),
                textAlign: TextAlign.right,)),
           
            Column(
          
              children:[
                Padding(
                  padding: EdgeInsets.only(top:rowSpace, bottom:rowSpace),  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    NumericButton(text: clearButtonText, onPressed: clearDisplay, backgroundColor:Colors.grey ),
                    NumericButton(text: "/", onPressed: (){}, backgroundColor: Colors.grey),
                    NumericButton(text: "%", onPressed:pecentagePressed, backgroundColor: Colors.grey),
                    NumericButton(text: "/",onPressed: (){operatorPressed("/");}, backgroundColor: Colors.orange, )
                  ])),

                Padding(
                  padding: EdgeInsets.only(top:rowSpace, bottom:rowSpace),  
                  child: Row(children: [
                    NumericButton(text: "7", onPressed: (){pressed("7");}, ),
                    NumericButton(text: "8", onPressed: (){pressed("8");}),
                    NumericButton(text: "9", onPressed: (){pressed("9");}),
                    NumericButton(text: "x", onPressed: (){operatorPressed("*");},backgroundColor: Colors.orange )
                  ])),
              
                Padding(
                  padding:EdgeInsets.only(top:rowSpace, bottom:rowSpace),
                  child:Row(children: [
                      NumericButton(text: "4", onPressed: (){pressed("4");}, ),
                      NumericButton(text: "5", onPressed: (){pressed("5");}),
                      NumericButton(text: "6", onPressed: (){pressed("6");}),
                      NumericButton(text: "-", onPressed: (){operatorPressed("-");},backgroundColor: Colors.orange),
                    ])),
                
                Padding(
                  padding:EdgeInsets.only(top:rowSpace, bottom:rowSpace),
                  child: Row(children: [
                    NumericButton(text: "1", onPressed: (){pressed("1");}, ),
                    NumericButton(text: "2", onPressed: (){pressed("2");}),
                    NumericButton(text: "3", onPressed: (){pressed("3");}),
                    NumericButton(text: "+", onPressed: (){operatorPressed("+");},backgroundColor: Colors.orange),
                  ])),
              
               Padding(
                  padding:EdgeInsets.only(top:rowSpace, bottom:rowSpace),
                  child: Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color:Colors.blue),
                        
                        ),
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: NumericButton(text:"0", onPressed: (){pressed("0");}, borderColor: Colors.black, ),
                    ),
                    NumericButton(text: ".", onPressed: (){pressed(".");}),
                    NumericButton(text: "=", onPressed: equaltoPressed,backgroundColor: Colors.orange),
                  ]))
               ])
            ]
            ));
           
    }    
}