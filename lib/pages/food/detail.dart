import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_9/models/food.dart';


class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);
  static const routeName = '/food_details_page';

  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as Food;

    return Scaffold(
      appBar: AppBar(
        title: Text("${item.name}"),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Image.asset(
                "assets/images/${item.image}",
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: 10,
              ),
              Text(" ชื่อเมนู: ${item.name}",
                  style: TextStyle(fontSize: 20)),
              Text(" ราคา: ${item.price} บาท",
                  style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}