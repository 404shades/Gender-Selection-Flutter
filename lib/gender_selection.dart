library gender_selection;

import 'package:flutter/material.dart';
import 'package:gender_selection/utils/gradients.dart';

enum Gender { Male, Female, ThirdGender }

// ignore: must_be_immutable
class GenderSelection extends StatefulWidget {
  Gender selectedGender;
  final LinearGradient linearGradient;
  final ImageProvider maleImage;
  final ImageProvider femaleImage;
  final ImageProvider thirdGenderImage;
  final ValueChanged<Gender> onChanged;
  final String maleText;
  final bool equallyAligned;
  final String femaleText;
  final String thirdGenderText;
  final IconData selectedGenderCheckIcon;
  final double size;
  final bool isCircular;
  final EdgeInsetsGeometry padding;
  final Duration animationDuration;
  final double opacityOfGradient;
  final double selectedGenderIconSize;
  final bool isSelectedGenderIconCircular;
  final Color selectedGenderIconColor;
  final Color selectedGenderIconBackgroundColor;
  final TextStyle selectedGenderTextStyle;
  final TextStyle unSelectedGenderTextStyle;
  final Alignment checkIconAlignment;
  final bool enableThirdGender;

  GenderSelection({
    Key key,
    this.selectedGenderTextStyle = const TextStyle(
      fontSize: 19,
      color: Colors.redAccent,
      fontWeight: FontWeight.w600,
    ),
    this.unSelectedGenderTextStyle = const TextStyle(
      fontSize: 19,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    this.selectedGenderIconBackgroundColor = Colors.red,
    this.selectedGenderIconColor = Colors.white,
    this.selectedGenderIconSize = 20.0,
    this.isSelectedGenderIconCircular = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.opacityOfGradient = 0.6,
    this.padding = const EdgeInsets.all(10),
    this.isCircular = true,
    this.size = 120.0,
    this.selectedGenderCheckIcon = Icons.check,
    this.equallyAligned = true,
    this.selectedGender,
    this.checkIconAlignment = Alignment.bottomCenter,
    @required this.onChanged,
    this.linearGradient = balbirGradient,
    this.maleImage = const AssetImage("assets/images/boy.png", package: 'gender_selection'),
    this.femaleImage = const AssetImage("assets/images/girl.png", package: 'gender_selection'),
    this.thirdGenderImage = const AssetImage("assets/images/third_gender.png", package: 'gender_selection'),
    this.maleText = "Male",
    this.femaleText = "Female",
    this.thirdGenderText = "Third Gender",
    this.enableThirdGender = false,
  }) : super(key: key);
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Padding(
        padding: widget.padding,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: widget.equallyAligned ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
            children: <Widget>[
              _genderBuilder(Gender.Male),
              _genderBuilder(Gender.Female),
              if (widget.enableThirdGender) _genderBuilder(Gender.ThirdGender),
            ],
          ),
        ),
      ),
    );
  }

  Widget _genderBuilder(Gender _gender) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selectedGender = _gender;
          if (widget.onChanged != null) {
            widget.onChanged(widget.selectedGender);
          } else {
            return;
          }
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            fit: StackFit.loose,
            alignment: widget.checkIconAlignment,
            children: <Widget>[
              Container(
                height: widget.size,
                width: widget.size,
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                decoration: BoxDecoration(
                  shape: widget.isCircular ? BoxShape.circle : BoxShape.rectangle,
                  image: DecorationImage(
                    image: _getGenderImage(_gender),
                    fit: BoxFit.cover,
                  ),
                ),
                child: AnimatedOpacity(
                  opacity: widget.selectedGender == _gender ? widget.opacityOfGradient : 0.0,
                  duration: widget.animationDuration,
                  child: widget.selectedGender == _gender
                      ? Container(
                          decoration: BoxDecoration(
                              gradient: widget.linearGradient,
                              shape: widget.isCircular ? BoxShape.circle : BoxShape.rectangle),
                        )
                      : null,
                ),
              ),
              Positioned(
                child: widget.selectedGenderCheckIcon != null
                    ? AnimatedContainer(
                        duration: widget.animationDuration,
                        height: widget.selectedGender == _gender ? widget.selectedGenderIconSize : 0.0,
                        width: widget.selectedGender == _gender ? widget.selectedGenderIconSize : 0.0,
                        padding: const EdgeInsets.all(1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        decoration: BoxDecoration(
                            shape: widget.isSelectedGenderIconCircular ? BoxShape.circle : BoxShape.rectangle,
                            color: widget.selectedGenderIconBackgroundColor),
                        child: widget.selectedGender == _gender
                            ? LayoutBuilder(
                                builder: (context, constraints) {
                                  return Icon(
                                    widget.selectedGenderCheckIcon,
                                    color: widget.selectedGenderIconColor,
                                    size: constraints.maxHeight,
                                  );
                                },
                              )
                            : null)
                    : Container(
                        height: 0,
                        width: 0,
                      ),
              )
            ],
          ),
          Text(_getGenderText(_gender),
              style:
                  widget.selectedGender == _gender ? widget.selectedGenderTextStyle : widget.unSelectedGenderTextStyle)
        ],
      ),
    );
  }

  _getGenderText(Gender gender) {
    switch (gender) {
      case Gender.Male:
        return widget.maleText;
      case Gender.Female:
        return widget.femaleText;
      case Gender.ThirdGender:
        return widget.thirdGenderText;
    }
  }

  _getGenderImage(Gender gender) {
    switch (gender) {
      case Gender.Male:
        return widget.maleImage;
      case Gender.Female:
        return widget.femaleImage;
      case Gender.ThirdGender:
        return widget.thirdGenderImage;
    }
  }
}
