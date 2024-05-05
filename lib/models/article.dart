class Article {
  String name;
  String image;
  String link;
 

  Article({
    required this.name,
    required this.image,
    required this.link,
 
  });
}

final List<Article> article = [
  Article(
    name: "Kopi Arabica",
    image: "assets/images/artikel5.jpg",
    link: "Lihat Selengkapnya",
   
  ),
  Article(
    name: "Kopi Arabica",
    image: "assets/images/artikel4.jpg",
    link: "Lihat Selengkapnya",
  ),
  // Article(
  //   name: "Kopi Arabica",
  //   image: "assets/images/logokopi.png",
  //   link: "https",
  // ),
  // Article(
  //   name: "Kopi Arabica",
  //   image: "assets/images/logokopi.png",
  //   link: "https",
  // ),
  // Article(
  // name: "Kopi Arabica",
  //   image: "assets/images/logokopi.png",
  //   link: "https",
  // ),
  // Article(
  //  name: "Kopi Arabica",
  //   image: "assets/images/logokopi.png",
  //   link: "https",
  // ),
];
