import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

class AddressTypeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onPressed;
  final bool isSelected;
  final Color selectedColor = Colors.white;
  final Color unSelectedColor = Colors.black;

  AddressTypeButton({this.label, this.icon, this.onPressed, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return FadedScaleAnimation(
      FlatButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: isSelected
              ? Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).primaryColor,
        ),
        label: Text(label),
        textColor: isSelected ? selectedColor : unSelectedColor,
        color: isSelected
            ? Theme.of(context).primaryColor
            : Theme.of(context).dividerColor,
      ),
      durationInMilliseconds: 400,
    );
  }
}
