import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:login_signup/widgets/home_search.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  final List dashboardData = const [
    {
      "id": 1,
      "title": "Kopi 1",
      "icon": Icons.coffee,
      "background_color": Colors.deepOrange,
    },
    {
      "id": 2,
      "title": "Kopi 2",
      "icon": Icons.coffee,
      "background_color": Colors.pink,
    },
    {
      "id": 3,
      "title": "Kopi 3",
      "icon": Icons.coffee,
      "background_color": Colors.purple,
    },
    {
      "id": 4,
      "title": "Kopi 4",
      "icon": Icons.coffee,
      "background_color": Colors.blue,
    },
    {
      "id": 5,
      "title": "Kopi 5",
      "icon": Icons.coffee_maker,
      "background_color": Colors.deepOrange,
    },
    {
      "id": 6,
      "title": "Kopi 6",
      "icon": Icons.coffee,
      "background_color": Colors.pink,
    },
     {
      "id": 7,
      "title": "Kopi 6",
      "icon": Icons.coffee,
      "background_color": Colors.pink,
    },
     {
      "id": 8,
      "title": "Kopi 6",
      "icon": Icons.coffee,
      "background_color": Colors.pink,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Data Product", style: TextStyle( color: Colors.green,fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: ListView(children: [
        Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
         border: Border.all(
          color: Colors.green, 
          width: 1, 
        )
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: const Row(
        children: [
          Icon(Iconsax.search_normal),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search for..",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          padding: EdgeInsets.all(30),
          children: [
            ...dashboardData
                .map(
                  (data) => InkWell(
                    onTap: () {
                      print(data['id']);
                      print(data['title']);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 5)
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: data['background_color'],
                                shape: BoxShape.circle),
                            child: Icon(
                              data['icon'],
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            data['title'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList()
          ],
        )
      ]),
    );
  }
}
