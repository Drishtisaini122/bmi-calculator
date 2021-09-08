import 'package:flutter/material.dart';

void main() => runApp(BMIPage());

class BMIPage extends StatefulWidget {
  BMIPage({Key? key}) : super(key: key);

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  TextEditingController heightincm = TextEditingController();
  TextEditingController weightinkg = TextEditingController();
  double bmical = 0.00;
  String status = "";

  void calBmi(double height, double weight){
    setState(() {
    bmical = (weight * 10000 )/ (height * height);
    if(bmical < 10){
      status = "Eat more you are very thin";
    }
    else if(bmical > 28){
      status = "Eat less you are overweight ";
    }
    });
    // String a = "34345353.8758";
    // double b = double.parse(a);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        
        body: Center(
          child: Container(
            decoration:BoxDecoration(
          gradient:LinearGradient(
            colors:[Colors.blue,Colors.green]

          )
        ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("BMI Calculator", style:TextStyle(color:Colors.black,fontSize:50,
                fontFamily:"Merriweather"),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100 ,
                      child: TextField(
                        controller: heightincm,
                        decoration: InputDecoration(
                          hintText: "Height (in cm)",
                          hintStyle: TextStyle(color:Colors.black,fontSize:20,
                fontFamily:"Merriweather"),
                        ),
                      )),
                    Container(
                      width: 100 ,
                      child: TextField(
                        controller: weightinkg,
                         decoration: InputDecoration(
                          hintText: "Weight (in kg)",
                          hintStyle: TextStyle(color:Colors.black,fontSize:20,
                fontFamily:"Merriweather"),
                        ),
                      )),
                  ],
                ),
                RaisedButton( onPressed: (){
                  calBmi(double.parse(heightincm.text),double.parse(weightinkg.text));
                  
                } ,
                color:Colors.green,
                 child: Text("Calculate BMI", style:TextStyle(color:Colors.black,fontSize:20,
                fontFamily:"Merriweather"),)
                 ),
                Text(bmical.toString()),
                Text(status)
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
