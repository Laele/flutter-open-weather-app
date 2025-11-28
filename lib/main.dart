import 'dart:ui';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:flutter_weather_app/core/theme/app_theme.dart';
import 'package:flutter_weather_app/features/home/presentation/current_weather_bloc/current_weather_bloc.dart';
import 'package:flutter_weather_app/features/home/presentation/hourly_weather_bloc/hourly_weather_bloc.dart';
import 'package:flutter_weather_app/features/home/presentation/screens/home_responsive_screen.dart';
import 'package:flutter_weather_app/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<ThemeCubit>()),
        BlocProvider(create: (context) => serviceLocator<CurrentWeatherBloc>()..add(GetCurrentWeather())),
        BlocProvider(create: (context) => serviceLocator<HourlyWeatherBloc>()..add(GetHourlyWeather())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) => DevicePreview(
        enabled: true,
        builder: (BuildContext context) {
          return MaterialApp(
            useInheritedMediaQuery: true,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: state.themeMode,
            home: const HomeResponsiveScreen(),
            scrollBehavior: MyScrollBehavior(),
          );
        },
      ),
    );*/

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) =>
          MaterialApp(theme: AppTheme.light(), darkTheme: AppTheme.dark(), themeMode: state.themeMode, home: const HomeResponsiveScreen()),
    );
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.trackpad};
}
