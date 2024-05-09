import 'package:flutter/material.dart';
import 'package:login_signup/widgets/home_search.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key});

  final List<Map<String, dynamic>> dashboardData = [
    {
      "id": 1,
      "title": "Arabica",
      "image": "assets/images/artikel4.jpg",
      "detail": "Full wash",
    },
    {
      "id": 2,
      "title": "Arabica",
      "image": "assets/images/artikel4.jpg",
      "detail": "Natural",
    },
    {
      "id": 3,
      "title": "Arabica",
      "image": "assets/images/artikel4.jpg",
      "detail": "Blue Mountain",
    },
    {
      "id": 4,
      "title": "Robusta",
      "image": "assets/images/artikel4.jpg",
      "detail": "Full wash",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Data Product",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.green,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Row(
              children: [
                Icon(Icons.search),
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
              ...dashboardData.map(
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
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            data['image'],
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['title'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 0),
                              Text(
                                data['detail'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ).toList()
            ],
          )
        ],
      ),
    );
  }
}
