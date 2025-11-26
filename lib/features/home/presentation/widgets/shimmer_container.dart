import 'package:flutter/material.dart';
import 'package:flutter_weather_app/core/theme/app_pallete.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const ShimmerContainer({super.key, this.height, this.width, this.child})
    : assert(!((height == null || width == null) && child == null), 'ShimmerContainer: child is needed if height and width are not defined.');

  @override
  Widget build(BuildContext context) {
    final isCustomSize = height != null && width != null;

    return Shimmer.fromColors(
      baseColor: Theme.of(context).extension<AppPallete>()!.shimmerBoxColor!,
      highlightColor: Theme.of(context).extension<AppPallete>()!.highlightShimmerColor!,
      child: isCustomSize
          ? Container(
              height: Theme.of(context).textTheme.titleLarge!.fontSize! * 1.2,
              //width: width,
              constraints: BoxConstraints(maxWidth: width!, minWidth: 50),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            )
          : child!,
    );
  }
}
