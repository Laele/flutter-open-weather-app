import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/theme/app_pallete.dart';

class AppGradientContainer extends StatelessWidget {
  //final double height;
  //final double width;
  final Widget? child;
  const AppGradientContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [BoxShadow(color: Theme.of(context).extension<AppPallete>()!.primaryBoxShadowContainerColor!, blurRadius: 12, offset: Offset(0, 10))],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color.fromARGB(255, 98, 185, 255), const Color.fromARGB(255, 3, 72, 184)],
        ),
      ),
      child: child,
    );
  }
}
