import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_trainning/models/items.dart';
import 'package:flutter_trainning/models/movie_model.dart' as movie;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Items> _listItems = [];
  List<Items> _gridItems = [];

  @override
  void initState() {
    movie.MovieRepository().getListMovies("Life of pie");
    _listItems = Items.listModelItems();
    _gridItems = Items.gridModelItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text(
            "Flutter Training",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                color: Colors.black,
                icon: const Icon(Icons.card_travel))
          ],
          backgroundColor: Colors.white),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Trending Now",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .55,
                      ),
                      itemCount: gridItems.length > 3 ? 3 : gridItems.length,
                      itemBuilder: (context, index) {
                        return gridItems[index];
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Popular Products",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listItems.length > 3 ? 3 : listItems.length,
                    itemBuilder: (context, index) => listItems[index],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> get gridItems {
    List<Widget> _cards = [];
    for (int i = 0; i < 10; i++) {
      _cards.add(Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network("https://picsum.photos/200/250")),
            ),
            ListTile(
              title: Text("Title $i",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text("Desc $i"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("\$10.00",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Icon(Icons.card_travel)
                ],
              ),
            )
          ],
        ),
      ));
    }
    return _cards;
  }

  List<Widget> get listItems => List<Widget>.generate(
      _listItems.length,
      (i) => Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blue,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(_listItems[i].imageUrl ?? "")),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(_listItems[i].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_listItems[i].subtitle,
                              maxLines: 2, overflow: TextOverflow.ellipsis),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_listItems[i].amount,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18)),
                              const Icon(
                                Icons.card_travel,
                                color: Colors.green,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
}
/* ListTile(
                      title: Text("Title $i",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("\$10.00",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18)),
                              Icon(
                                Icons.card_travel,
                                color: Colors.green,
                              )
                            ],
                          )
                        ],
                      ),
                    ) */