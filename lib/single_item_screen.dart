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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              FutureBuilder<Product>(
                future: DioConnection.getProductsById(productId),
                builder: (c, snapshot) {
                  return snapshot.hasData
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("you selected:"),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              snapshot.data!.title!,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 200,
                              width: 200,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(snapshot.data!.image!),
                                        fit: BoxFit.contain)),
                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  snapshot.data!.description!,
                                  style: TextStyle(fontSize: 15),
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
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      '|',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      "remain : ${snapshot.data!.rating!.count} ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
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
                                        fontSize: 30),
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
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
