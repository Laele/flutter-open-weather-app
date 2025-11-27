import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:flutter_weather_app/core/theme/app_text_theme_extensions.dart';
import 'package:flutter_weather_app/features/home/presentation/current_weather_bloc/current_weather_bloc.dart';
import 'package:flutter_weather_app/features/home/presentation/widgets/shimmer_container.dart';
import 'package:shimmer/shimmer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.place)),
        ),
        Expanded(
          child: Center(
            child: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
              builder: (context, state) {
                if (state is CurrentWeatherSuccess) {
                  return Text(
                    '${state.weather.city}, ${state.weather.country} ',
                    style: Theme.of(context).textTheme.titleLargeBold(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                } else if (state is CurrentWeatherInitial || state is CurrentWeatherLoading) {
                  return ShimmerContainer(height: 12, width: 200);
                }
                return Text('No available Data', style: Theme.of(context).textTheme.titleLargeBold(context), maxLines: 1, overflow: TextOverflow.ellipsis);
              },
            ),
          ),
        ),
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) => IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            icon: state.themeMode == ThemeMode.light ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
          ),
        ),
      ],
    );
  }
}
