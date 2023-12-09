// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

enum ButtonType { Zoom, Decrease }

class MapControllerButton extends StatelessWidget {
  final void Function() onPressed;
  final ButtonType buttonType;
  const MapControllerButton({Key? key, required this.onPressed, required this.buttonType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Icon(
            buttonType == ButtonType.Zoom ? Icons.add : Icons.remove,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
