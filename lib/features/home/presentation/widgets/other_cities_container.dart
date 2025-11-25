import 'package:flutter/material.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/app_gradient_container.dart';
import 'package:lottie/lottie.dart';

class OtherCitiesContainer extends StatelessWidget {
  const OtherCitiesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: Container(
          //color: Colors.red,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                Container(/*color: Colors.red*/),
                Align(
                  alignment: Alignment.centerRight,
                  child: FractionallySizedBox(
                    //heightFactor: 0.8,
                    widthFactor: .90,
                    child: AspectRatio(aspectRatio: 16 / 9, child: AppGradientContainer()),
                  ),
                ),
                /*Align(
                    alignment: Alignment.centerLeft,
                    child: FractionallySizedBox(widthFactor: 0.3, child: Lottie.asset('lib/core/assets/weather_lottie/clear_sky_n.json', fit: BoxFit.cover)),
                  ),*/
                //Lottie.asset('lib/core/assets/weather_lottie/clear_sky_n.json', fit: BoxFit.cover),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(children: [Icon(Icons.place, color: Colors.white)]),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [Text('Location', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white))],
                              ),
                              Text('Mostly Cloudy'),
                            ],
                          ),
                          SizedBox(width: 8.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('20°', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white))],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
