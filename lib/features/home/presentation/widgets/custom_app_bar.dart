import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:flutter_weather_app/core/theme/app_pallete.dart';
import 'package:flutter_weather_app/core/theme/app_text_theme_extensions.dart';
import 'package:flutter_weather_app/features/home/presentation/current_weather_bloc/current_weather_bloc.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.place, color: Theme.of(context).extension<AppPallete>()!.primaryTextColor!),
          ),
        ),
        Expanded(
          child: Center(
            child: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
              builder: (context, state) {
                if (state is CurrentWeatherSuccess) {
                  return TitleCityText(text: '${state.weather.city}, ${state.weather.country}');
                } else if (state is CurrentWeatherInitial || state is CurrentWeatherLoading) {
                  return TitleCityText(text: '');
                }
                return TitleCityText(text: '-');
              },
            ),
          ),
        ),
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) => IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            icon: state.themeMode == ThemeMode.light
                ? Icon(Icons.dark_mode, color: Theme.of(context).extension<AppPallete>()!.primaryTextColor!)
                : Icon(Icons.light_mode, color: Theme.of(context).extension<AppPallete>()!.primaryTextColor!),
          ),
        ),
      ],
    );
  }
}

class TitleCityText extends StatelessWidget {
  final String text;
  const TitleCityText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleLargeBold(context), maxLines: 1, overflow: TextOverflow.ellipsis);
  }
}
