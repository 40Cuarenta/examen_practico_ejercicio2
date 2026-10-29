import 'package:flutter/material.dart';

class FondoDegradado extends StatelessWidget {
  final Widget child;

  const FondoDegradado({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFD1EFF7),
                Color(0xFFA2DEED),
                Color(0xFF50B1D4),
              ],
            ),
          ),
        ),
        Positioned(
          top: -40,
          left: -40,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF50B1D4).withValues(alpha: 0.35),
            ),
          ),
        ),
        Positioned(
          top: 250,
          right: -60,
          child: Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF3375B1).withValues(alpha: 0.20),
            ),
          ),
        ),
        Positioned(
          bottom: -50,
          left: 30,
          child: Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF50B1D4).withValues(alpha: 0.30),
            ),
          ),
        ),
        SafeArea(
          child: child,
        ),
      ],
    );
  }
}
