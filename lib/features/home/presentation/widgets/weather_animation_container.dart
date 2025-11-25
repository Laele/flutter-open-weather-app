import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_weather_app/core/common/utils/get_weather_animation.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/app_gradient_container.dart';

import 'package:lottie/lottie.dart';

class WeatherAnimationContainer extends StatelessWidget {
  final String weatherCode;
  final double temp;
  final double minTemp;
  final double maxTemp;

  const WeatherAnimationContainer({super.key, required this.weatherCode, required this.temp, required this.minTemp, required this.maxTemp});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      constraints: BoxConstraints(maxWidth: 600),
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) => Stack(
                  children: [
                    Center(
                      child: FractionallySizedBox(
                        widthFactor: 0.8,
                        heightFactor: 0.8,
                        child: AppGradientContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: TweenAnimationBuilder<int>(
                                              tween: IntTween(begin: 0, end: temp.toInt()),
                                              duration: Duration(seconds: 1),
                                              curve: Curves.easeOut,
                                              builder: (context, value, child) => Text(
                                                '${value.toInt()}',
                                                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                                              ),
                                            ).animate().fade(duration: Duration(seconds: 3)),
                                          ),
                                        ),
                                        /*Expanded(
                                          flex: 3,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              '°C',
                                              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                                            ).animate().fade(duration: Duration(seconds: 3)),
                                          ),
                                        ),*/
                                      ],
                                    ),
                                  ),
                                  // Extra Info
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: FractionallySizedBox(
                                      widthFactor: 0.5,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: FittedBox(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'L: ${minTemp.toInt()} °C',
                                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                                  ).animate().fade(duration: Duration(seconds: 4)),
                                                  SizedBox(width: 8.0),
                                                  Text(
                                                    'H: ${maxTemp.toInt()} °C',
                                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                                  ).animate().fade(duration: Duration(seconds: 4)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ).animate().fade(duration: 1.seconds),
                      ),
                    ),
                    Container(
                      child:
                          Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  height: constraints.maxHeight * .5,
                                  child: LottieBuilder.asset(getWeatherAsset(weatherCode)),
                                  //child: Lottie.asset('lib/core/assets/weather_lottie/clear_sky_n.json', fit: BoxFit.contain),
                                ),
                              )
                              .animate(onPlay: (controller) => controller.repeat(reverse: true))
                              .move(duration: 0.5.seconds, begin: Offset(0, -4), end: Offset(0, -9), curve: Curves.easeInOutSine)
                              .then()
                              .move(duration: 0.5.seconds, begin: Offset(0, -2), end: Offset(0, -4), curve: Curves.easeOutSine),
                    ).animate().fade(duration: 1.50.seconds),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
