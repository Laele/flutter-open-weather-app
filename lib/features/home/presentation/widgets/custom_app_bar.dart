import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:flutter_weather_app/core/theme/app_text_theme_extensions.dart';

class CustomAppBar extends StatelessWidget {
  final String location;
  const CustomAppBar({super.key, required this.location});

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
            child: Text(location, style: Theme.of(context).textTheme.titleLargeBold(context), maxLines: 1, overflow: TextOverflow.ellipsis),
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
