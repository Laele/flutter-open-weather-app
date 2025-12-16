import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/common/constants/other_cities.dart';
import 'package:flutter_weather_app/core/theme/app_pallete.dart';
import 'package:flutter_weather_app/features/home/presentation/current_weather_bloc/current_weather_bloc.dart';
import 'package:flutter_weather_app/features/home/presentation/hourly_weather_bloc/hourly_weather_bloc.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/date_row.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/hourly_weather_section.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/other_cities_section.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/shimmer_container.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/weather_animation_section.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/weather_info_section.dart';
import 'package:flutter_weather_app/init_dependencies.dart';

class HomeResponsiveScreen extends StatefulWidget {
  const HomeResponsiveScreen({super.key});

  @override
  State<HomeResponsiveScreen> createState() => _HomeResponsiveScreenState();
}

class _HomeResponsiveScreenState extends State<HomeResponsiveScreen> {
  late List<CurrentWeatherBloc> otherCitiesBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    otherCitiesBloc = OtherCities.otherCities.entries
        .map((city) => serviceLocator<CurrentWeatherBloc>()..add(GetCurrentWeatherWithLocation(latitude: city.value[0], longitude: city.value[1])))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<CurrentWeatherBloc>().add(GetCurrentWeather());
            context.read<HourlyWeatherBloc>().add(GetHourlyWeather());
            for (int i = 0; i < OtherCities.otherCities.length; i++) {
              final city = OtherCities.otherCities.values.elementAt(i);
              otherCitiesBloc[i].add(GetCurrentWeatherWithLocation(latitude: city[0], longitude: city[1]));
            }
          },
          child: CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                child: Column(
                  children: [
                    Column(
                      children: [
                        // Top App Bar
                        CustomAppBar(),
                        // Date Row
                        DateRow(),
                      ],
                    ),
                    SizedBox(height: 12.0),

                    // Weather Animation Section
                    Flexible(flex: 5, child: WeatherAnimationSection()),

                    SizedBox(height: 12.0),

                    // Weather Info Section
                    WeatherInfoSection(),

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
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 300),
                          child: OtherCitiesSection(otherCitiesBloc: otherCitiesBloc),
                        ),
                      ),
                    ),
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
