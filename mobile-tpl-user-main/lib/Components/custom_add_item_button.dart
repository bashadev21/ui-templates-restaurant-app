import 'package:flutter/material.dart';
import 'package:doctoworld_user/Routes/routes.dart';

class CustomAddItemButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PageRoutes.myCartPage);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
          color: Theme.of(context).primaryColor,
        ),
        height: 30,
        width: 30,
        child: Icon(
          Icons.add,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
