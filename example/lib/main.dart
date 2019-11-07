import 'package:flutter/material.dart';
import 'package:gender_selection/gender_selection.dart';
import 'package:example/utils/gradients.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gender Selection Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.red,
      ),
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gender Selection Demo"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GenderSelection(
                femaleImage: NetworkImage("https://cdn1.iconfinder.com/data/icons/website-internet/48/website_-_female_user-512.png"),
                maleImage: NetworkImage("https://icon-library.net/images/avatar-icon/avatar-icon-4.jpg"),
                selectedGenderIconBackgroundColor: Colors.amber,
                selectedGenderTextStyle: TextStyle(color: Colors.amber,fontSize: 19,fontWeight: FontWeight.bold),
              ),
              GenderSelection(
                maleText: "",
                femaleText: "",
                linearGradient: pinkRedGradient,
                selectedGenderIconBackgroundColor: Colors.indigo,
                checkIconAlignment: Alignment.centerRight,
                selectedGenderCheckIcon: null,
                onChanged: (Gender gender){
                  print(gender);
                },
                equallyAligned: true,
                animationDuration: Duration(milliseconds: 400),
                isCircular: true,
                isSelectedGenderIconCircular: true,
                opacityOfGradient: 0.6,
                padding: const EdgeInsets.all(3),
                size: 120,
                
              ),
              GenderSelection(
                maleImage: AssetImage("assets/images/male.png"),
                femaleImage: AssetImage("assets/images/female.png"),
                selectedGenderIconBackgroundColor: Colors.green,
                selectedGenderIconColor: Colors.white,
                linearGradient: greenSexyGradient,
                onChanged: (Gender gender){
                  print(gender);
                },

              ),
              GenderSelection(
                isCircular: false,
                selectedGenderIconBackgroundColor: Colors.indigo,
                linearGradient: skyBlueGradient,
                onChanged: (Gender gender){
                  print(gender);
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}




