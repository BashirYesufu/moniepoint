import 'package:fade_out_particle/fade_out_particle.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint/features/landing/landing_tab.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  static const routeName = "/splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          padding: const EdgeInsets.all(0.0),
          margin: const EdgeInsets.all(0.0),
          child: Center(
            child: FadeOutParticle(
              disappear: true,
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 1500),
              child: Text(
                'Move Mate',
                style: TextStyle(
                  fontSize: 50,
                  color: Theme.of(context).primaryColor
                ),
              ),
              onAnimationEnd: (){
                Navigator.of(context).pushReplacementNamed(LandingTab.routeName);
              },
            ),
          )
      ),
    );
  }
}
