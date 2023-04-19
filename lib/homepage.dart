import 'dart:convert';
import 'dart:math';

import 'package:akshar_ecommerce_app/cartpage.dart';
import 'package:akshar_ecommerce_app/signinpage.dart';
import 'package:akshar_ecommerce_app/viewproductpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

@override
  void initState() {

    super.initState();
    callingapi();
}
  myproducts? prodobj;
  bool check = false;

  Future<void> callingapi() async {
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // print(url);
    var call = jsonDecode(response.body);
    setState(() {
      prodobj = myproducts.fromJson(call);
      print("==${prodobj!.products!.length}");
      check = true;
    });
    Future.delayed(Duration(milliseconds: 1500)).then((value){
      setState(() {
        check=true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double th = MediaQuery.of(context).size.height;
    double tw = MediaQuery.of(context).size.width;
    return WillPopScope(child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black,),
            backgroundColor: Colors.white,
            title: Text(
                  "Home",
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
                actions: [
              GestureDetector(onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return Cartpage("home");
                },));
              },child: Icon(Icons.shopping_cart_checkout_rounded,color: Colors.black,size: 28)),
              SizedBox(width: 20,)
            ]),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  accountName: Text("accountName"),
                  accountEmail: Text("accountEmail"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return Signinpage();
                  },));
                },
                child: ListTile(
                  leading: Icon(Icons.logout_rounded),
                  tileColor: Colors.grey.shade300,
                  title: Text("Logout",style: TextStyle(fontSize: 20),),
                ),
              ),
            ],
          ),
        ),
        body: check ? GridView.builder(
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 230,crossAxisCount: 2),
          padding: EdgeInsets.all(5),
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Viewproductpage(prodobj!.products![index]);
                },
                ));
              },
              child: Card(
                  elevation: 5.0,
                clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      children: [
                        Expanded(
                            child: Image.network("${prodobj!.products![index].thumbnail!}",
                              fit: BoxFit.fill,
                              height: 120,
                              width: double.infinity,),
                        ),
                        SizedBox(height: 02,),
                        Container(
                          // padding: EdgeInsets.only(left: 8,right: 8,),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 25,
                                width: double.infinity,
                                child: Text("${prodobj!.products![index].title}",softWrap: true,style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis),),
                              Container(alignment: Alignment.centerLeft,
                                color: Colors.white,
                                height: 25,
                                width: double.infinity,
                                child: Text("\$${prodobj!.products![index].price}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            );
          },
        ) : Center()
    ), onWillPop: backpagecall);
  }
Future<bool> backpagecall() {
  return Future.value(true);
}
}


class myproducts {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  myproducts({this.products, this.total, this.skip, this.limit});

  myproducts.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Products {
  var id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  dynamic rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Products(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.brand,
        this.category,
        this.thumbnail,
        this.images});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    brand = json['brand'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
