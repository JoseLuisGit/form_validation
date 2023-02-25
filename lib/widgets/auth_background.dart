import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),
          _HeaderIcon(), 
          child
        ],
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: _boxDecoration,
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 90, left: 30),
          Positioned(child: _Bubble(), top: -30, left: 50),
          Positioned(child: _Bubble(), bottom: 150, left: 150),
          Positioned(child: _Bubble(), bottom: -30, right: 20),
          Positioned(child: _Bubble(), bottom: 50, right: 60),
          Positioned(child: _Bubble(), top: -10, right: 25),
        ],
      ),
    );
  }

   final BoxDecoration _boxDecoration = const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(42, 42, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]
    )
  );
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration:  BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.1),
        borderRadius: BorderRadius.circular(100)
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(30),
        child: const Icon(
          Icons.people,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}