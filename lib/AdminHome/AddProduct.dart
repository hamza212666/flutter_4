import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter3/Model/Product.dart';
import 'package:flutter3/Screen/services/Store.dart';
import 'package:flutter3/widgets/CustomTextField.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  static String id = 'AddProduct';

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String _name, _price, _description;
  File _image;
  String _url;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: ListView(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomTextField(
                hint: 'Book Name',
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
                hint: 'Book Price',
                icon: null,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                onClick: (value) {
                  _description = value;
                },
                hint: 'Book Description',
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                      onTap: pickImage, child: Icon(Icons.camera_alt)),
                  CircleAvatar(
                    backgroundImage: _image == null ? null : FileImage(_image),
                    radius: 80,
                  ),
                  GestureDetector(
                      onTap: getImageGallery, child: Icon(Icons.get_app)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Builder(
                    builder: (context) => RaisedButton(
                      onPressed: () {
                        uploadImage(context);
                      },
                      child: Text('Upload Image'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  if (_globalKey.currentState.validate()) {
                    _globalKey.currentState.save();

                    _store.addProduct(Product(
                      pName: _name,
                      pPrice: _price,
                      pimage: _url,
                      pDescription: _description,
                    ));
                  }
                },
                child: Text('Add Book'),
              )
            ],
          ),
        ]),
      ),
    );
  }

  void loadImage() async {
    var imageId = await ImageDownloader.downloadImage(_url);
    var path = await ImageDownloader.findPath(imageId);
    File image = File(path);
    setState(() {
      _image = image;
    });
  }

  Future getImageGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  void uploadImage(context) async {
    try {
      FirebaseStorage storage =
          FirebaseStorage(storageBucket: 'gs://swwet1-c37cc.appspot.com');
      StorageReference ref = storage.ref().child(_image.path);
      StorageUploadTask storageUploadTask = ref.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('success'),
      ));
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url $url');
      setState(() {
        _url = url;
      });
    } catch (ex) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(ex.message),
      ));
    }
  }
}
