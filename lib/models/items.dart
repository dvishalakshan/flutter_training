import 'dart:math';

class Items {
  String? imageUrl;
  String title;
  String subtitle;
  String amount;

  Items(
      {this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.amount});

  static List<Items> listModelItems() {
    return List<Items>.generate(
        15,
        (index) => Items(
            title: "Lorem Ipsum $index",
            imageUrl: "https://picsum.photos/200/250",
            amount: "\$${Random().nextInt(100).toString()}",
            subtitle:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"));
  }

  static List<Items> gridModelItems() {
    return List<Items>.generate(
        15,
        (index) => Items(
            title: "Lorem Ipsum $index",
            imageUrl: "https://picsum.photos/200/250",
            amount: "\$${Random().nextInt(100).toString()}",
            subtitle:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"));
  }
}
