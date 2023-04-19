import 'dart:math';

import 'package:akshar_ecommerce_app/homepage.dart';
import 'package:akshar_ecommerce_app/splashscreen.dart';
import 'package:akshar_ecommerce_app/viewproductpage.dart';
import 'package:flutter/material.dart';

class Cartpage extends StatefulWidget {
  final String pagename;
  Cartpage(this.pagename);

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  var cartdata = [];
  num price=0;
  @override
  void initState() {
    super.initState();

setState(() {
  cartdata = Viewproductpage.addingcart;
});

//
for(int i=0;i<cartdata.length;i++){
  setState(() {
    price= price+ cartdata[i]['price'];
  });
}
print("cartdata page=====$cartdata");
print("price page=====$price");

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child:   Scaffold(
          appBar: AppBar(
            actions: [
              GestureDetector(onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return Homepage();
                },));
              },child: Icon(Icons.home,color: Colors.black,size: 28)),
              SizedBox(width: 20,)
            ],
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return Homepage();
                  },
                ));
              },
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 28,
              ),
            ),
            title: Text(
              "Shopping Cart",
            ),
            foregroundColor: Colors.black,
            centerTitle: true,
          ),
            bottomNavigationBar: cartdata.isNotEmpty? SafeArea(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "\$$price",
                        style:
                        TextStyle(fontSize: 38, fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 120,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          height: 50,
                          width: 190,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_cart_checkout_rounded,
                                    color: Colors.white),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Checkout",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ): Text(""),
          body:
              cartdata.isNotEmpty?
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 175, crossAxisCount: 1),
                  padding: EdgeInsets.all(5),
                  itemCount: cartdata.length,
                  physics: BouncingScrollPhysics(),
                  // itemCount: Temp.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 5.0,
                        clipBehavior: Clip.antiAlias,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        "${cartdata[index]['thumbnail']}",
                                        fit: BoxFit.fill,
                                        height: 120,
                                        width: double.infinity,
                                      ),
                                    ),
                                    VerticalDivider(),
                                    Expanded(
                                      child: Image.network(
                                        "${cartdata[index]['images'][index]}",
                                        fit: BoxFit.fill,
                                        height: 120,
                                        width: double.infinity,
                                      )
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 02,
                              ),
                              Container(
                                // padding: EdgeInsets.only(left: 8,right: 8,),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      height: 25,
                                      width: double.infinity,
                                      child: Text("${cartdata[index]['title']}",
                                          softWrap: true,
                                          style: TextStyle(fontSize: 18),
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      color: Colors.white,
                                      height: 25,
                                      width: double.infinity,
                                      child: Text("\$${cartdata[index]['price']}",
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                ) : Center(child: Text("no data"),)
        ),
        onWillPop: backpagecall);
  }

  Future<bool> backpagecall() {
    if (widget.pagename == "home") {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Homepage();
        },
      ));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Homepage();
        },
      ));
    }
    return Future.value(true);
  }
}
