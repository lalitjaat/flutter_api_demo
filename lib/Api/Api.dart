import 'package:api_example/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model.dart';

class ecommerceApi extends StatefulWidget {
  const ecommerceApi({Key? key}) : super(key: key);

  @override
  State<ecommerceApi> createState() => _ecommerceApiState();
}

class _ecommerceApiState extends State<ecommerceApi> {
  List<SamplePosts> samplePosts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: app_Bar("Ecommerce API"),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: samplePosts.length,
              itemBuilder: (context, index) {
                return productCard(
                    category: samplePosts[index].category,
                    imageUrl: samplePosts[index].image,
                    price: samplePosts[index].price,
                    productTitle: samplePosts[index].title);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<SamplePosts>> getData() async {
    final response = await http.get(
      Uri.parse(
        'https://fakestoreapi.com/products',
      ),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        samplePosts.add(SamplePosts.fromJson(index));
      }
      return samplePosts;
    } else {
      return samplePosts;
    }
  }
}
