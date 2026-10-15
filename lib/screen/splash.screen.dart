import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nightoutadmin/extensions/context.extension.dart';
import 'package:nightoutadmin/router/app.router.dart';
import 'package:nightoutadmin/style/app.color.dart';
import 'package:nightoutadmin/style/app.theme.dart';
import 'package:nightoutadmin/widgets/app/load.widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(Duration(seconds: 2), () {
      if (!mounted) return;
      context.go(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [colors.titleFrom, colors.titleTo],
                ).createShader(bounds);
              },
              child: Text(
                'NightOut',
                style: nightOutDisplay(
                  context.textTheme.headlineMedium,
                  colors,
                ).copyWith(color: AppColor.white),
              ),
            ),
            const SizedBox(height: 32),
            LoadWidget(colors: [colors.gold]),
          ],
        ),
      ),
    );
  }
}
