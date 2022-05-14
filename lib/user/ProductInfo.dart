

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter3/Model/Product.dart';

import 'package:provider/provider.dart';

import '../constants.dart';



class ProductInfo extends StatefulWidget {

  static String id = 'ProductInfo';

  @override

  _ProductInfoState createState() => _ProductInfoState();

}



class _ProductInfoState extends State<ProductInfo> {

  int _quantity = 1;

  @override

  Widget build(BuildContext context) {

    Product product = ModalRoute.of(context).settings.arguments;

    return Scaffold(

      body: Stack(

        children: <Widget>[

          Container(

            height: MediaQuery.of(context).size.height,

            width: MediaQuery.of(context).size.width,

            child:  CachedNetworkImage(
              imageUrl: product.pimage,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),

          Padding(

            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),

            child: Container(

              height: MediaQuery.of(context).size.height * .1,

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[

                  GestureDetector(

                      onTap: () {

                        Navigator.pop(context);

                      },

                      child: Icon(Icons.arrow_back_ios)),



                ],

              ),

            ),

          ),

          Positioned(

            bottom: 0,

            child: Column(

              children: <Widget>[

                Opacity(

                  child: Container(

                    color: Colors.white,

                    width: MediaQuery.of(context).size.width,

                    height: MediaQuery.of(context).size.height * .3,

                    child: Padding(

                      padding: const EdgeInsets.all(20),

                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[

                          Text(

                            product.pName,

                            style: TextStyle(

                                fontSize: 20, fontWeight: FontWeight.bold),

                          ),

                          SizedBox(

                            height: 10,

                          ),

                          Text(

                            product.pDescription,

                            style: TextStyle(

                                fontSize: 16, fontWeight: FontWeight.w800),

                          ),

                          SizedBox(

                            height: 10,

                          ),

                          Text(

                            '\$${product.pPrice}',

                            style: TextStyle(

                                fontSize: 20, fontWeight: FontWeight.bold),

                          ),

                          SizedBox(

                            height: 10,

                          ),

                          Row(

                            mainAxisAlignment: MainAxisAlignment.center,

                            children: <Widget>[





                            ],

                          )

                        ],

                      ),

                    ),

                  ),

                  opacity: .5,

                ),



              ],

            ),

          )

        ],

      ),

    );

  }








}