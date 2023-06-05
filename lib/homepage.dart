// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:o_store/Controller/api_controller.dart';
import 'package:o_store/Model/product.dart';
import 'package:o_store/cat_items.dart';
import 'navigation_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _value = 0;

  List<String> cateogriesNames = [
    "All",
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
/* 
App bar of the app 
it's simple till now
it just OStore in the middle of the screen 
not more  than thant <3
 */

      appBar: AppBar(
        //centerTitle: true,
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
        title: Text(
          'O Store',
          style: TextStyle(
            color: Color.fromARGB(255, 202, 7, 17),
            fontWeight: FontWeight.w800,
            fontSize: 30,
          ),
        ),
      ),
// end of App Bar

// UI Body ...
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 15),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  cateogriesNames.length,
                  (index) {
                    return MyRadioListTile(
                      value: index,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      },
                      leading: cateogriesNames[index],
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          FutureBuilder<List<Product>>(
            future: _value == 0
                ? DioConnection.getAllProducts()
                : DioConnection.getProductsByCategory(
                    cateogriesNames[_value].toString(),
                  ),
            builder: (c, snapshot) {
              return snapshot.hasData
                  ? Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                          ),
                          itemBuilder: (c, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                snapshot.data![index].image!),
                                            fit: BoxFit.contain)),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  snapshot.data![index].title!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  snapshot.data![index].price.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 129, 101, 101),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  : Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
            },
          ),
        ],
      ),

      /* the body of the project - the screen content. */

/* 
Navigation Bar 
here we used Google  navigation custom bar
 to give our project more beauty so  
*/
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black.withOpacity(.5),
            ),
          ],
        ),
        child: const SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: my_nav_bar()),
        ),
      ),
    );
  }
}
