import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final BoxDecoration boxDecoration = BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
             BoxShadow(
              color: Colors.black38,
              blurRadius: 15,
              offset: Offset(0, 5)
              
            )
          ]
        );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: boxDecoration,
        child: child,
      ),
    );
  }
}