import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  static const String routeName = 'splash';
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      // backgroundColor: colorScheme.primary,
      body: Container(
            color: colorScheme.secondary,
            child: Center(child: SvgPicture.asset('assets/logo.svg')),
          )
          .animate(onComplete: (controller) => controller.repeat(reverse: true))
          .shimmer(
            duration: 1000.ms,
            color: colorScheme.primary,
            blendMode: BlendMode.softLight,
          ),
    );
  }
}
