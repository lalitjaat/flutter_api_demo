import 'package:flutter/material.dart';

Color backgroundColor = Color.fromARGB(137, 93, 88, 88);
Color boxColor = Color.fromARGB(255, 255, 255, 255);

PreferredSizeWidget? app_Bar( String title){
    return  AppBar(
          backgroundColor: backgroundColor,
          title:  Text(title),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
        );
  }


 

TextStyle titleStyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);

TextStyle categoryStyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17);

TextStyle priceStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 15);


class productCard extends StatelessWidget {
  String imageUrl;
  String productTitle;
  String category;
    dynamic price;

  
   productCard({super.key, required this.category,required this.imageUrl,required this.price,required this.productTitle,});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: boxColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          height: 220,
                          width: 180,
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          )),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0, left: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: productTitle,
                                      style: titleStyle)),
                              RichText(
                                  text: TextSpan(
                                      text: 'Category: ',
                                      style: categoryStyle,
                                      children: [
                                    TextSpan(
                                        text: category,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15))
                                  ])),
                              Text("Price: \$ $price",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: priceStyle)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
;
  }
}
