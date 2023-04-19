import 'package:akshar_ecommerce_app/homepage.dart';
import 'package:akshar_ecommerce_app/signuppage.dart';
import 'package:flutter/material.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({Key? key}) : super(key: key);

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double th = MediaQuery.of(context).size.height;
    double tw = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              SizedBox(
                height: th * 0.06,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign In.",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
              ),
              SizedBox(
                height: th * 0.01,
              ),
              Container(
                height: th * 0.27,
                width: double.infinity,
                child:
                    Image.asset("images/splashimageup.jpg", fit: BoxFit.fill),
              ),
              SizedBox(height: th*0.05,),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: th * 0.01),
              TextFormField(
                controller: email,
                cursorColor: Colors.black,
                //textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  prefixIconColor: Colors.black,
                  hintText: "abc@gmail.com",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: th * 0.02),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: th * 0.01),
              TextFormField(
                controller: password,
                cursorColor: Colors.black,
                obscureText: true,
                //textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.password,
                  ),
                  prefixIconColor: Colors.black,
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: th*0.01,),
              GestureDetector(
                onTap: () {
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: th * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => Homepage(),));
                },
                child: Container(
                  height: 55,
                  width: tw,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                      child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              ),
              SizedBox(
                height: th * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return Signuppage();
                  },));
                },
                child: Container(
                  height: 55,
                  width: tw,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
