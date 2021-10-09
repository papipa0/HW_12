import 'package:flutter/material.dart';
import 'package:work_9/models/food.dart';
import 'package:work_9/pages/food/detail.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var items = [
    Food(id: 1, name: "ข้าวไข่เจียว", price: 25, image: "kao_kai_jeaw.jpg"),
    Food(id: 2, name: "ข้าวหมูแดง", price: 30, image: "kao_moo_dang.jpg"),
    Food(id: 3, name: "ข้าวมันไก่", price: 30, image: "kao_mun_kai.jpg"),
    Food(id: 4, name: "ข้าวหน้าเป็ด", price: 40, image: "kao_na_ped.jpg"),
    Food(id: 5, name: "ข้าวผัด", price: 30, image: "kao_pad.jpg"),
    Food(id: 6, name: "ผัดซีอิ๊ว", price: 30, image: "pad_sie_eew.jpg"),
    Food(id: 7, name: "ผัดไทย", price: 50, image: "pad_thai.jpg"),
    Food(id: 8, name: "ราดหน้า", price: 35, image: "rad_na.jpg"),
    Food(id: 9, name: "ส้มตำไก่ย่าง", price: 120, image: "som_tum_kai_yang.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context,int index) {
          Food item = items[index];

          return Container(

            decoration: new BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset(
                    10.0, // Move to right 10  horizontally
                    0.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),

            child: Card(
              margin: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () {
                  print(item);
                  Navigator.pushNamed(
                    context,
                    Detail.routeName,
                    arguments: item,
                  );

                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/${item.image}',
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                            ),
                            Text(
                              "${item.price.toString()} บาท",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}