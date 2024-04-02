import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Splash.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "This is flutter",
      home: splashscreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var wt = TextEditingController();
  var hft = TextEditingController();
  var hinch = TextEditingController();
  var str_wt = "";
  var str_hft = "";
  var str_hinch = "";
  var result = 0.0;
  var bgColor = Colors.deepPurpleAccent.shade100;
  var messege = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              bgColor,
              Colors.white54,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "BMI",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 4,
                            sigmaY: 4,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                // color: Colors.white,
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.01)),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.10),
                                    Colors.black.withOpacity(0.05),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.line_weight,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Enter your weight: ",
                          ),
                          SizedBox(
                            width: 50,
                            child: TextField(
                              controller: wt,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              cursorColor: bgColor,
                              decoration: const InputDecoration(
                                hintText: "kg",
                                hintStyle: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                          const SizedBox(
                            child: Text("kg"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 4,
                            sigmaY: 4,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                // color: Colors.white,
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.01)),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.10),
                                    Colors.black.withOpacity(0.05),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.height,
                            size: 25,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Enter your height: "),
                          SizedBox(
                            width: 50,
                            child: TextField(
                              controller: hft,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              cursorColor: bgColor,
                              decoration: const InputDecoration(
                                hintText: "ft",
                                hintStyle: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                            child: Text("'",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            width: 50,
                            child: TextField(
                              controller: hinch,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              cursorColor: bgColor,
                              decoration: const InputDecoration(
                                hintText: "inch",
                                hintStyle: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                            child: Text("\"",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        str_wt = wt.text.toString();
                        str_hft = hft.text.toString();
                        str_hinch = hinch.text.toString();

                        if (str_wt == "" || str_hft == "" || str_hinch == "") {
                          Fluttertoast.showToast(
                            msg: "Please enter all value",
                          );
                          bgColor = Colors.deepPurpleAccent.shade100;
                        } else {
                          var iwt = int.parse(str_wt);
                          var ihft = int.parse(str_hft);
                          var ihinch = int.parse(str_hinch);

                          var tinch = (ihft * 12) + ihinch;

                          var tcm = tinch * 2.54;

                          var tm = tcm / 100;

                          var bmi = iwt / (tm * tm);

                          result = bmi;

                          if (result > 25) {
                            bgColor = Colors.red.shade200;
                            messege = "You are OverWeight!!";
                          } else if (result < 18) {
                            bgColor = Colors.blue.shade200;
                            messege = "You are UnderWeight!!";
                          } else {
                            bgColor = Colors.green.shade200;
                            messege = "You are Healthy!!";
                          }
                        }

                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bgColor,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Calculate"),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Your BMI is: ${result.toStringAsFixed(4)} \n $messege",
                    style: const TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
