// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:o_store/Controller/api_controller.dart';
import 'package:o_store/Model/product.dart';

class SingleItemScreen extends StatelessWidget {
  const SingleItemScreen({Key? key, required this.productId}) : super(key: key);
  final int productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Product details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(8, 0, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 15),
            FutureBuilder<Product>(
              future: DioConnection.getProductsById(productId),
              builder: (c, snapshot) {
                return snapshot.hasData
                    ? SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("you selected the following product:"),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              snapshot.data!.title!,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(snapshot.data!.image!),
                                      fit: BoxFit.contain)),
                            ),
                            SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  snapshot.data!.description!,
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Rating : ${snapshot.data!.rating!.rate!.toString()}",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      '|',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      "remain : ${snapshot.data!.rating!.count} ",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  color: Color.fromARGB(209, 76, 0, 255),
                                  child: Text(
                                    "Price : ${snapshot.data!.price!} \$",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 166, 255, 0),
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(height: 40),
                                // ElevatedButton(

                                //   onPressed: () {},
                                //   child: Text("Add to Chart"),
                                // ),
                                IconButton(
                                  onPressed: () {
                                    // wht to do after touch add_shopping_cart icon
                                  },
                                  icon: Icon(Icons.add_shopping_cart),
                                  iconSize: 50,
                                  color: Colors.black,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
