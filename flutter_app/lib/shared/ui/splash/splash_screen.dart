import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_app/features/chat/presentation/views/chat_list/chats_list_screen.dart';
import 'package:flutter_app/features/user/presentation/providers/auth_user_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  static const String routeName = 'splash';
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await ref.read(authUserProvider.future);
        final authState = ref.read(authUserProvider);
        await Future.delayed(const Duration(seconds: 1));
        if (authState.hasValue) {
          if (context.mounted) context.goNamed(ChatListScreen.routeName);
        } else {
          ref.invalidate(authUserProvider);
        }
      });
      return null;
    }, []);

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
