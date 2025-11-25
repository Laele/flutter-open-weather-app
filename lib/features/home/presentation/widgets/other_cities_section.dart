import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/common/utils/get_weather_animation.dart';
import 'package:flutter_weather_app/features/home/presentation/current_weather_bloc/current_weather_bloc.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/app_gradient_container.dart';
import 'package:flutter_weather_app/init_dependencies.dart';
import 'package:lottie/lottie.dart';

class OtherCitiesSection extends StatelessWidget {
  const OtherCitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<double>> otherCities = {
      'Paris, France': [48.864716, 2.349014],
      'Bangkok, Thailand': [13.736717, 100.523186],
      'London, Unite Kingdom': [51.509865, -0.118092],
    };

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Other Cities',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 8),
        Expanded(
          child: Container(
            //color: Colors.red,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final maxCardWidth = 450;
                final cardWidth = constraints.maxWidth.clamp(250, maxCardWidth).toDouble();
                final bool cardFits = cardWidth < constraints.maxWidth;
                final viewportFraction = cardFits ? cardWidth / constraints.maxWidth : 0.8;
                final controller = PageController(viewportFraction: viewportFraction);

                return PageView.builder(
                  padEnds: cardFits ? false : true,
                  //clipBehavior: Clip.none,
                  controller: controller,
                  itemCount: otherCities.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: cardWidth,
                        child: _Card(
                          index: index,
                          cityName: otherCities.keys.elementAt(index),
                          lat: otherCities[otherCities.keys.elementAt(index)]![0],
                          lon: otherCities[otherCities.keys.elementAt(index)]![1],
                        ),
                      ),
                    );
                  },
                );
              },
            ).animate().fade(delay: Duration(milliseconds: 500)),
          ),
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  final int index;
  final String cityName;
  final double lat;
  final double lon;
  const _Card({required this.index, required this.cityName, required this.lat, required this.lon});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<CurrentWeatherBloc>()..add(GetCurrentWeather()),
      child: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
        builder: (context, state) {
          if (state is CurrentWeatherSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 16 / 6,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: FractionallySizedBox(widthFactor: 0.9, child: AppGradientContainer()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(flex: 2, child: Lottie.asset(getWeatherAsset(state.weather.mainWeather.icon), fit: BoxFit.contain)),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(
                                child: Text(
                                  '$cityName',
                                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  state.weather.mainWeather.main,
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white.withAlpha(155)),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 2,
                          child: FittedBox(
                            child: Text(
                              '${state.weather.mainTemp.temp.toInt()}°',
                              style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is CurrentWeatherFailure) {
            return Center(child: Icon(Icons.cancel));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
