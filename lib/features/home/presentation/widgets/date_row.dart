import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/theme/app_pallete.dart';
import 'package:flutter_weather_app/features/home/presentation/current_weather_bloc/current_weather_bloc.dart';

class DateRow extends StatelessWidget {
  const DateRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
            builder: (context, state) {
              if (state is CurrentWeatherSuccess) {
                return DateText(text: state.weather.dt);
              } else if (state is CurrentWeatherInitial || state is CurrentWeatherLoading) {
                return DateText(text: ' ');
              }
              return DateText(text: '-');
            },
          ),
        ),
      ],
    );
  }
}

class DateText extends StatelessWidget {
  final String text;
  const DateText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).extension<AppPallete>()!.primaryTextColor!.withAlpha(150)),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
