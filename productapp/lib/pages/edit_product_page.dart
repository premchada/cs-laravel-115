import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:productapp/models/product_type.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EditProductPage extends StatefulWidget {
  const EditProductPage({Key? key}) : super(key: key);

  // Declare varible for product id

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final _editFormKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _price = TextEditingController();

  List<ListProductType> dropdownItems = ListProductType.getListProductType();
  late List<DropdownMenuItem<ListProductType>> dropdownMenuItems;
  late ListProductType _selectedType;

  @override
  void initState() {
    super.initState();
    dropdownMenuItems = createDropdownMenu(dropdownItems);
    _selectedType = dropdownMenuItems[0].value!;
  }

  List<DropdownMenuItem<ListProductType>> createDropdownMenu(
      List<ListProductType> dropdownItems) {
    List<DropdownMenuItem<ListProductType>> items = [];

    for (var item in dropdownItems) {
      items.add(DropdownMenuItem(
        child: Text(item.name!),
        value: item,
      ));
    }

    return items;
  }

  Future<String> getProductById() async {
    // Call SharedPreference to get Token

    // Define Laravel API for Retrieving Product

    // Request for editing product

    // return body of response
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
      ),
      body: Form(
        key: _editFormKey,
        child: mainInput(),
      ),
    );
  }

  Widget mainInput() {
    return FutureBuilder(
        future: getProductById(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                children: const [
                  SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('อยู่ระหว่างประมวลผล'),
                  )
                ],
              ),
            );
          } else {
            // Convert snapshot to jsonString

            // Find index of requsted product type

            // Initialize value of each textfield and dropdown

            return ListView(
              children: [
                inputName(),
                inputPrice(),
                dropdownType(),
                updateButton(),
              ],
            );
          }
        });
  }

  Container inputPrice() {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
      child: TextFormField(
        controller: _price,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Product Price';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          prefixIcon: Icon(
            Icons.sell,
            color: Colors.blue,
          ),
          label: Text(
            'Price',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Container inputName() {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 8),
      child: TextFormField(
        controller: _name,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Product Name';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          prefixIcon: Icon(
            Icons.emoji_objects,
            color: Colors.blue,
          ),
          label: Text(
            'Product Name',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget dropdownType() {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
      child: DropdownButton(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        value: _selectedType,
        items: dropdownMenuItems,
        onChanged: (value) {
          setState(() {
            _selectedType = value as ListProductType;
          });
        },
      ),
    );
  }

  Widget updateButton() {
    return Container(
      width: 150,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
        onPressed: updateProduct,
        child: const Text('บันทึกข้อมูล'),
      ),
    );
  }

  Future<void> updateProduct() async {
    // Call SharedPreference to get Token

    // Check Valid Form

    // Covert Values to Json

    // Define Laravel API for Updating Product

    // Request for updating product

    // Check Status Code, then pop to the previous
  }
}
