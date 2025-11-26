import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/common/utils/format_date.dart';
import 'package:flutter_weather_app/core/theme/app_pallete.dart';
import 'package:flutter_weather_app/features/home/presentation/current_weather_bloc/current_weather_bloc.dart';
import 'package:flutter_weather_app/features/home/presentation/hourly_weather_bloc/hourly_weather_bloc.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/hourly_weather_section.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/other_cities_section.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/shimmer_container.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/weather_animation_container.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/weather_info_section.dart';
import 'package:flutter_weather_app/init_dependencies.dart';
import 'package:shimmer/shimmer.dart';

class HomeResponsiveScreen extends StatelessWidget {
  const HomeResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // AppBar
            // Current Weather Info
            Column(
              children: [
                CustomAppBar(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
                        builder: (context, state) {
                          if (state is CurrentWeatherSuccess) {
                            return Text(
                              state.weather.dt,
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge!.copyWith(color: Theme.of(context).extension<AppPallete>()!.primaryTextColor!.withAlpha(150)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          } else if (state is CurrentWeatherInitial || state is CurrentWeatherLoading) {
                            return ShimmerContainer(height: 12, width: 200);
                          }
                          return Text(
                            'No available Data',
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge!.copyWith(color: Theme.of(context).extension<AppPallete>()!.primaryTextColor!.withAlpha(150)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.0),

            // Weather Animation Section
            Flexible(
              flex: 5,
              child: WeatherAnimationContainer(
                /*weatherCode: state.weather.mainWeather.icon,
                temp: state.weather.mainTemp.temp,
                maxTemp: state.weather.mainTemp.tempMax,
                minTemp: state.weather.mainTemp.tempMin,*/
              ),
            ),

            SizedBox(height: 12.0),

            // Weather Info Section
            WeatherInfoSection(
              /*tempFeelLike: state.weather.mainTemp.feelsLike.toString(),
              humidty: state.weather.mainTemp.humidity.toString(),
              pressure: state.weather.mainTemp.pressure.toString(),*/
            ),
            SizedBox(height: 12.0),

            // Hourly Weather Section
            Flexible(
              flex: 3,
              child: Center(
                child: ConstrainedBox(constraints: BoxConstraints(maxHeight: 300), child: HourlyWeatherSection()),
              ),
            ),

            SizedBox(height: 12.0),

            // Other Cities Section
            Flexible(
              flex: 3,
              child: Center(
                child: ConstrainedBox(constraints: BoxConstraints(maxHeight: 300), child: OtherCitiesSection()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
