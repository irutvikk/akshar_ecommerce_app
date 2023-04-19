import 'package:akshar_ecommerce_app/signinpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreenpage extends StatefulWidget {
  static SharedPreferences? pref;
  @override
  State<Splashscreenpage> createState() => _SplashscreenpageState();
}

class _SplashscreenpageState extends State<Splashscreenpage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forsharepref();
    Future.delayed(Duration(seconds: 2)).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Signinpage();
      },));
    });
  }
  forsharepref() async {
    Splashscreenpage.pref = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    double th = MediaQuery.of(context).size.height;
    double tw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Image.asset("images/splashimg.jpg",width: tw,height: th,fit: BoxFit.fill),
    );
  }
}
