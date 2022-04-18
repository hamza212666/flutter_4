

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter3/AdminHome/AddProduct.dart';
import 'package:flutter3/AdminHome/ManageProducts.dart';
import 'package:flutter3/AdminHome/OrderDetails.dart';
import 'package:flutter3/AdminHome/OrdersScreen.dart';
import 'package:flutter3/Screen/LogInScreen.dart';
import 'package:flutter3/Screen/provider/Adminmod.dart';
import 'package:flutter3/Screen/provider/CartItem.dart';
import 'package:flutter3/Screen/provider/modelHud.dart';
import 'package:flutter3/Screen/services/ProductInfo.dart';
import 'package:flutter3/constants.dart';
import 'package:flutter3/user/CartScreen.dart';
import 'package:flutter3/user/HomePage.dart';

import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'AdminHome/EditProduct.dart';
import 'AdminHome/adminHome.dart';
import 'Screen/signupScreen.dart';



main() => runApp(Flutter003());



class Flutter003 extends StatelessWidget {

  bool isUserLoggedIn = false;

  @override

  Widget build(BuildContext context) {

    return FutureBuilder<SharedPreferences>(

      future: SharedPreferences.getInstance(),

      builder: (context, snapshot) {

        if (!snapshot.hasData) {

          return MaterialApp(

            home: Scaffold(

              body: Center(

                child: Text('Loading....'),

              ),

            ),

          );

        } else {

          isUserLoggedIn = snapshot.data.getBool(kKeepMeLoggedIn) ?? false;

          return MultiProvider(

            providers: [

              ChangeNotifierProvider<ModelHud>(

                create: (context) => ModelHud(),

              ),

              ChangeNotifierProvider<CartItem>(

                create: (context) => CartItem(),

              ),

              ChangeNotifierProvider<AdminMode>(

                create: (context) => AdminMode(),

              )

            ],

            child: MaterialApp(

              debugShowCheckedModeBanner: false,

              initialRoute: isUserLoggedIn ? LoginScreen.id :HomePage .id,

              routes: {

                OrderDetails.id: (context) => OrderDetails(),

                OrdersScreen.id: (context) => OrdersScreen(),

                CartScreen.id: (context) => CartScreen(),

                ProductInfo.id: (context) => ProductInfo(),

                EditProduct.id: (context) => EditProduct(),

                ManageProducts.id: (context) => ManageProducts(),

                LoginScreen.id: (context) => LoginScreen(),

                SignupScreen.id: (context) => SignupScreen(),

                HomePage.id: (context) => HomePage(),

                AdminHome.id: (context) => AdminHome(),

                AddProduct.id: (context) => AddProduct(),

              },

            ),

          );

        }

      },

    );

  }

}