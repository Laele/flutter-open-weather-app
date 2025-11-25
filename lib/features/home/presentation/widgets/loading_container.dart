import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final Widget child;
  const LoadingContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(24.0)),
      child: child,
    );
  }
}
