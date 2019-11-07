# gender_selection

A Flutter package for gender selection. It is an aweome gender selection widget with cool gradients and animation effects

[![pub package](https://img.shields.io/badge/pub-0.5.0-orange.svg)](https://pub.dartlang.org/packages/gender_selection)
[![Awesome Flutter](https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square)](https://github.com/404shades)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/404shades)

## Demo
<img src="https://github.com/404shades/Gender-Selection-Flutter/blob/master/img/banner.jpg" />
<img height="300px" src="https://github.com/404shades/Gender-Selection-Flutter/blob/master/img/demo.png" />


## Installing
Add this to your package's pubspec.yaml file:
```dart
dependencies:
gender_selection: "^0.0.7"
```

## Simple Usage

```dart
import 'package:gender_selection/gender_selection.dart';

GenderSelection(
maleText: "", //default Male
femaleText: "", //default Female
linearGradient: pinkRedGradient,
selectedGenderIconBackgroundColor: Colors.indigo, // default red 
checkIconAlignment: Alignment.centerRight,   // default bottomRight
selectedGenderCheckIcon: null, // default Icons.check
onChanged: (Gender gender){
print(gender);
},
equallyAligned: true,
animationDuration: Duration(milliseconds: 400),
isCircular: true, // default : true,
isSelectedGenderIconCircular: true,
opacityOfGradient: 0.6,
padding: const EdgeInsets.all(3),
size: 120, //default : 120

),
```

## ✌️ Contribution
1. Fork the repositiry from [package](https://github.com/404shades/Gender-Selection-Flutter/)
2. Create your own branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -m 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request



## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.



