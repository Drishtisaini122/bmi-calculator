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

  void calBmi(double height, double weight) {
    setState(() {
      bmical = (weight * 10000) / (height * height);
      if (bmical < 18.5) {
        status = "Underweight ";
      } else if (bmical >= 18.5 && bmical <= 24.9) {
        status = "Healthy :)";
      } else if (bmical >= 25.0 && bmical <= 29.9)
        status = "Overweight ";
      else {
        status = "Obese ";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.green])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "BMI Calculator",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Height in cm",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "Weight in Kg",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      width: 100,
                      child: TextField(
                        controller: heightincm,
                        decoration: InputDecoration(
                          hintText: "Height (in cm)",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: "Merriweather"),
                        ),
                      )),
                  Container(
                      width: 100,
                      child: TextField(
                        controller: weightinkg,
                        decoration: InputDecoration(
                          hintText: "Weight (in kg)",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: "Merriweather"),
                        ),
                      )),
                ],
              ),
              RaisedButton(
                  onPressed: () {
                    calBmi(double.parse(heightincm.text),
                        double.parse(weightinkg.text));
                  },
                  color: Colors.green,
                  child: Text(
                    "Calculate BMI",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )),
              Text(bmical.toStringAsFixed(2), style: TextStyle(fontSize: 40)),
              Text(
                status,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
