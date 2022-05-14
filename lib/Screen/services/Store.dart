

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter3/Model/Product.dart';

import '../../constants.dart';



class Store {

  final Firestore _firestore = Firestore.instance;



  addProduct(Product product) {

    _firestore.collection(kProductsCollection).add({

      kProductName: product.pName,

      kProductDescription: product.pDescription,

      kProductimage: product.pimage,


      kProductPrice: product.pPrice

    });

  }



  Stream<QuerySnapshot> loadProducts() {

    return _firestore.collection(kProductsCollection).snapshots();

  }







  deleteProduct(documentId) {

    _firestore.collection(kProductsCollection).document(documentId).delete();

  }



  editProduct(data, documentId) {

    _firestore

        .collection(kProductsCollection)

        .document(documentId)

        .updateData(data);

  }





}