import 'package:flutter/material.dart';
import 'package:flutter3/AdminHome/AddProduct.dart';
import 'package:flutter3/AdminHome/ManageProducts.dart';
import 'package:flutter3/AdminHome/OrdersScreen.dart';
import 'package:flutter3/Screen/LogInScreen.dart';
import 'package:flutter3/Screen/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class AdminHome extends StatelessWidget {
  final _auth = Auth();

  static String id = 'AdminHome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       actions: [
         Padding(
           padding: const EdgeInsets.all(1.0),
           child: Expanded(
             child: Container(
                 color: Colors.amber,
                 child: RaisedButton(
                   child: Text("out"),
                   onPressed: () async {
                     SharedPreferences pref = await SharedPreferences.getInstance();

                     pref.clear();

                     _auth.signOut();
                     Navigator.pushNamed(context, LoginScreen.id);
                   },
             ),
           ),
         ),
         )
       ]
      ),
      backgroundColor: kMainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProduct.id);
            },
            child: Text('Add Product'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, ManageProducts.id);
            },
            child: Text('Edit Product'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, OrdersScreen.id);
            },
            child: Text('View orders'),
          )
        ],
      ),
    );
  }
}
