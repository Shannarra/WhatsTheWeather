import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_course_2022/application/providers/theme_provider.dart';
import 'package:flutter_course_2022/gen/strings.g.dart';
import 'package:flutter_course_2022/presentation/routes.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _buttonOpacityAnimation;
  late Animation<double> _titleScaleAnimation;
  late Animation<AlignmentDirectional> _titleAlignmentAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _titleScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.7, curve: Curves.elasticOut),
      ),
    );

    _titleAlignmentAnimation = Tween<AlignmentDirectional>(
      begin: const AlignmentDirectional(0, 0),
      end: const AlignmentDirectional(0, -0.75),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.7, 1.0, curve: Curves.easeOut),
      ),
    );

    _buttonOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.7, 1.0, curve: Curves.easeIn),
      ),
    );
    
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: SvgPicture.asset(
              context.watch<ThemeProvider>().theme.backgroundImage,
              fit: BoxFit.cover,
              width: double.maxFinite,
              height: double.maxFinite,
            ),
          ),
          AlignTransition(
            alignment: _titleAlignmentAnimation,
            child: ScaleTransition(
              scale: _titleScaleAnimation,
              child: Text(
                t.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.displayLarge,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.35),
            child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 16,),
            child:   FadeTransition(
          opacity: _buttonOpacityAnimation,
             child: ElevatedButton(
              onPressed: () async {
                final Object? result =
                await context.navigator.pushNamed(Routes.citySelect);
                if (result != null) {
                  context.navigator.pushReplacementNamed(Routes.home);
                }
              },
              child: Text(
                t.splash.button_title,
              ),
            ),
           ),
          ),)
        ],
      ),
    );
  }
}
