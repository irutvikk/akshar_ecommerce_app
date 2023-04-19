import 'dart:async';
import 'dart:convert';
import 'package:akshar_ecommerce_app/cartpage.dart';
import 'package:akshar_ecommerce_app/homepage.dart';
import 'package:akshar_ecommerce_app/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:photo_view/photo_view.dart';

class Viewproductpage extends StatefulWidget {
  Products products;
  static List addingcart=[];
  Viewproductpage(this.products);

  @override
  State<Viewproductpage> createState() => _ViewproductpageState();
}

class _ViewproductpageState extends State<Viewproductpage> {
  var trating;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(
        "this page data ======== ${widget.products.toJson().toString()}==========");
    setState(() {
      trating = widget.products.rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    double tw = MediaQuery.of(context).size.width;
    double th = MediaQuery.of(context).size.height;
    double ah = kToolbarHeight;
    // double bodyh = th - ah - statusbarh;

    return WillPopScope(
        child: Scaffold(
          extendBody: true, // very important as noted

          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
                size: 28,
              ),
            ),
            foregroundColor: Colors.black,
            actions: [
              GestureDetector(
                onTap: () {
                  Future.delayed(Duration(milliseconds: 500)).then((value){
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return Cartpage("product");
                      },
                    ));
                  });
                },
                child: Center(
                  child: Stack(
                    children: [
                      Icon(Icons.shopping_cart_checkout_rounded,
                          color: Colors.black, size: 28),
                      Positioned(
                        right: 0,
                        child: Container(
                          height: 13,
                          width: 13,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
            backgroundColor: Colors.white,
            title: Text(
              "${widget.products.title}",
              style: TextStyle(color: Colors.black),
              softWrap: true,
            ),
            centerTitle: true,
          ),

          bottomNavigationBar: SafeArea(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "\$${(widget.products.price! - (widget.products.discountPercentage! / 100) * widget.products.price!).toStringAsFixed(2)}",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 120,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          print(
                              "before new data added to Cartlist ====${Splashscreenpage.pref!.getStringList('cartlist')}===");

                          Map<String, dynamic> newMap = {
                            'id': widget.products.id,
                            'title': '${widget.products.title}',
                            'description': '${widget.products.description}',
                            'price': widget.products.price,
                            'discountPercentage': widget.products.discountPercentage,
                            'rating': widget.products.rating,
                            'stock': widget.products.stock,
                            'brand': '${widget.products.brand}',
                            'category': '${widget.products.category}',
                            'thumbnail': '${widget.products.thumbnail}',
                            'images': widget.products.images
                          };
                          Viewproductpage.addingcart.add(newMap);
                          print("adding cart======${Viewproductpage.addingcart}");
                        });
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
                              Icon(Icons.add_shopping_cart_rounded,
                                  color: Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Add to Cart",
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
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: th+ah,
                child: Stack(
                  clipBehavior: Clip.none,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                       Container(
                         decoration: BoxDecoration(
                           color: Colors.blueGrey.shade50,
                           borderRadius: BorderRadius.circular(5),
                         ),
                         // padding: EdgeInsets.all(10),
                         height: (th - ah) / 2,
                         width: double.infinity,
                         alignment: Alignment.center,
                         child: PageView.builder(
                           physics: ScrollPhysics(),
                           itemCount: widget.products.images!.length,
                           itemBuilder: (context, index) {
                             return PhotoView(
                               imageProvider: NetworkImage(
                                 widget.products.images![index],
                               ),
                             );
                           },
                         ),
                       ),
                         Positioned(
                           top: th * .48,
                           height: 50,
                           width: tw,
                           child: Container(
                             margin: EdgeInsets.only(left: 5, right: 5),
                             color: Colors.grey.shade100,
                             child: Row(
                               children: [
                                 Expanded(
                                   child: Container(
                                     margin: EdgeInsets.only(left: 5, right: 5),
                                     child: Text(
                                       "Brand",
                                       style: TextStyle(
                                         fontSize: 24,
                                       ),
                                     ),
                                   ),
                                 ),
                                 VerticalDivider(),
                                 Expanded(
                                   child: Container(
                                     margin: EdgeInsets.only(left: 5, right: 5),
                                     child: Text(
                                       "${widget.products.brand}",
                                       maxLines: 1,
                                       style: TextStyle(fontSize: 24),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Positioned(
                           top: th * .55,
                           height: 50,
                           width: tw,
                           child: Container(
                             margin: EdgeInsets.only(left: 5, right: 5),
                             color: Colors.grey.shade100,
                             child: Row(
                               children: [
                                 Expanded(
                                   child: Container(
                                     margin: EdgeInsets.only(left: 5, right: 5),
                                     child: Text(
                                       "Price",
                                       style: TextStyle(
                                         fontSize: 24,
                                       ),
                                     ),
                                   ),
                                 ),
                                 VerticalDivider(),
                                 Expanded(
                                   child: Container(
                                     margin: EdgeInsets.only(left: 5, right: 5),
                                     child: Text(
                                       "\$${widget.products.price}",
                                       style: TextStyle(fontSize: 24),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Positioned(
                           top: th * .62,
                           height: 50,
                           width: tw,
                           child: Container(
                             margin: EdgeInsets.only(left: 5, right: 5),
                             color: Colors.grey.shade100,
                             child: Row(
                               children: [
                                 Expanded(
                                   child: Container(
                                     margin: EdgeInsets.only(left: 5, right: 5),
                                     child: Text(
                                       "Discount",
                                       style: TextStyle(
                                         fontSize: 24,
                                       ),
                                     ),
                                   ),
                                 ),
                                 VerticalDivider(),
                                 Expanded(
                                   child: Container(
                                     margin: EdgeInsets.only(left: 5, right: 5),
                                     child: RichText(
                                       text: TextSpan(children: [
                                         TextSpan(
                                           text:
                                           "${widget.products.discountPercentage}%  ",
                                           style: TextStyle(
                                               fontSize: 24, color: Colors.black87),
                                         ),
                                         TextSpan(
                                           text:
                                           "${widget.products.discountPercentage! - 2}%",
                                           style: TextStyle(
                                               decoration:
                                               TextDecoration.lineThrough,
                                               fontSize: 16,
                                               color:
                                               Colors.black87.withOpacity(0.8)),
                                         ),
                                       ]),
                                     ),
                                     // Text("${widget.products.discountPercentage}%",style: TextStyle(fontSize: 24),)
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Positioned(
                           top: th * .69,
                           height: 50,
                           width: tw,
                           child: Container(
                             margin: EdgeInsets.only(left: 5, right: 5),
                             color: Colors.grey.shade100,
                             child: Row(
                               children: [
                                 Expanded(
                                   child: Container(
                                     margin: EdgeInsets.only(left: 5, right: 5),
                                     child: Text(
                                       "Rating",
                                       style: TextStyle(
                                         fontSize: 24,
                                       ),
                                     ),
                                   ),
                                 ),
                                 VerticalDivider(),
                                 Expanded(
                                   child: Container(
                                     margin: EdgeInsets.only(left: 5, right: 5),
                                     child: IgnorePointer(
                                       child: RatingBar(
                                           initialRating: trating,
                                           direction: Axis.horizontal,
                                           allowHalfRating: true,
                                           itemCount: 5,
                                           itemSize: 30,
                                           ratingWidget: RatingWidget(
                                               full: Icon(Icons.star,
                                                   color: Colors.orange),
                                               half: Icon(
                                                 Icons.star_half,
                                                 color: Colors.orange,
                                               ),
                                               empty: const Icon(
                                                 Icons.star_outline,
                                                 color: Colors.orange,
                                               )),
                                           onRatingUpdate: (value) {

                                           }),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),

                         Positioned(
                           top: th * .76,
                           width: tw,
                           child: LayoutBuilder(
                             builder:
                                 (BuildContext context, BoxConstraints constraints) {
                               return Container(
                                 margin: EdgeInsets.only(left: 5, right: 5),
                                 color: Colors.grey.shade100,
                                 child: IntrinsicHeight(
                                   child: Row(
                                     children: [
                                       Expanded(
                                         child: Container(
                                           margin:
                                           EdgeInsets.only(left: 5, right: 5),
                                           child: Text(
                                             "Details",
                                             style: TextStyle(
                                               fontSize: 24,
                                             ),
                                           ),
                                         ),
                                       ),
                                       VerticalDivider(),
                                       Expanded(
                                         child: Container(
                                           margin:
                                           EdgeInsets.only(left: 5, right: 5),
                                           child: Text(
                                             "${widget.products.description}",
                                             style: TextStyle(fontSize: 24),
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               );
                             },
                           ),
                         )

                  ],
                ),
              ),
            ),
          ),
        ),
        onWillPop: backpagecall);
  }

  Future<bool> backpagecall() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage(),));
    return Future.value(true);
  }
}
