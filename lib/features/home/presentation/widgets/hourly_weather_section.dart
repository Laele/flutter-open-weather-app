import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/common/utils/get_weather_animation.dart';
import 'package:flutter_weather_app/features/home/presentation/hourly_weather_bloc/hourly_weather_bloc.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/app_gradient_container.dart';
import 'package:lottie/lottie.dart';

class HourlyWeatherSection extends StatelessWidget {
  const HourlyWeatherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Hourly Weather',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 12.0),
        Expanded(
          child: Container(
            //color: Colors.red,
            child: BlocBuilder<HourlyWeatherBloc, HourlyWeatherState>(
              builder: (context, state) {
                if (state is HourlyWeatherSuccess) {
                  return ListView.builder(
                    clipBehavior: Clip.hardEdge,
                    itemCount: state.hourlyWeather.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: AspectRatio(
                        aspectRatio: 8 / 15,
                        child: AppGradientContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                  child: Text(
                                    state.hourlyWeather[index].dt,
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    state.hourlyWeather[index].hour,
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(child: Lottie.asset(getWeatherAsset(state.hourlyWeather[index].weatherList[0].icon), fit: BoxFit.contain)),
                                FittedBox(
                                  child: Text(
                                    state.hourlyWeather[index].mainTemp.temp.toString(),
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ).animate().fadeIn(delay: Duration(milliseconds: 400)),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ],
    );
  }
}
