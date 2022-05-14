
import 'package:flutter/material.dart';
import 'package:flutter3/Model/Product.dart';
import 'package:flutter3/Screen/services/Store.dart';
import 'package:flutter3/constants.dart';
import 'package:flutter3/widgets/CustomTextField.dart';



class EditProduct extends StatelessWidget {

  static String id = 'EditProduct';

  String _name, _price, _description;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _store = Store();

  @override

  Widget build(BuildContext context) {

    Product product = ModalRoute.of(context).settings.arguments;

    return Scaffold(

      body: Form(

        key: _globalKey,

        child: ListView(

          children: <Widget>[

            SizedBox(

              height: MediaQuery.of(context).size.height * .2,

            ),

            Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

                CustomTextField(

                  hint: 'Product Name',

                  onClick: (value) {

                    _name = value;

                  },

                ),

                SizedBox(

                  height: 10,

                ),

                CustomTextField(

                  onClick: (value) {

                    _price = value;

                  },

                  hint: 'Product Price',

                ),

                SizedBox(

                  height: 10,

                ),

                CustomTextField(

                  onClick: (value) {

                    _description = value;

                  },

                  hint: 'Product Description',

                ),

                SizedBox(

                  height: 10,

                ),



                SizedBox(

                  height: 10,

                ),



                SizedBox(

                  height: 20,

                ),

                RaisedButton(

                  onPressed: () {

                    if (_globalKey.currentState.validate()) {

                      _globalKey.currentState.save();



                      _store.editProduct({

                        kProductName: _name,



                        kProductDescription: _description,

                        kProductPrice: _price

                      }, product.pId);

                    }

                  },

                  child: Text('Edit Product'),

                )

              ],

            )

          ],

        ),

      ),

    );

  }

}