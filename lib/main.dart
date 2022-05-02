import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(), body: MappingList()),
    );
  }
}

// utils
class FillWidget extends StatelessWidget {
  final double width, height;
  final Color color;

  FillWidget({Key? key, this.width = 0, this.height = 0, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}

// video 4 - 5 Khuldi project Text widget
class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Test",
          style: TextStyle(backgroundColor: Colors.amber, color: Colors.blue)),
    );
  }
}

// video 6 Khuldi project Row, Column, Stack
class VisibleInvisible extends StatelessWidget {
  const VisibleInvisible({Key? key}) : super(key: key);

  Widget rowExamples(
      {mainAxisAlignment = MainAxisAlignment.start,
      crossAxisAlignment = CrossAxisAlignment.start}) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        FillWidget(width: 100, height: 30, color: Colors.blue),
        FillWidget(width: 150, height: 100, color: Colors.amberAccent),
        FillWidget(width: 200, height: 50, color: Colors.red),
      ],
    );
  }

  Widget columnExamples(
      {mainAxisAlignment = MainAxisAlignment.start,
      crossAxisAlignment = CrossAxisAlignment.start}) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        FillWidget(width: 100, height: 30, color: Colors.blue),
        FillWidget(width: 150, height: 100, color: Colors.amberAccent),
        FillWidget(width: 200, height: 50, color: Colors.red),
      ],
    );
  }

  Widget stackExamples() {
    return Stack(
      children: [
        FillWidget(width: 200, height: 200, color: Colors.blue),
        FillWidget(width: 100, height: 100, color: Colors.amberAccent),
        FillWidget(width: 50, height: 50, color: Colors.red),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return stackExamples();
  }
}

// video 7 Khuldi project List View
class ListViewWidget extends StatelessWidget {
  final Axis direction;

  ListViewWidget({Key? key, this.direction = Axis.vertical}) : super(key: key);

  final List<Color> myColor = [
    Colors.black87,
    Colors.blue,
    Colors.red,
    Colors.green
  ];

  Widget listView() {
    List<Widget> myList = [
      FillWidget(width: 200, height: 200, color: Colors.red),
      FillWidget(width: 200, height: 200, color: Colors.black87),
      FillWidget(width: 200, height: 200, color: Colors.yellow),
    ];
    return ListView(
      scrollDirection: direction,
      children: myList,
    );
  }

  Widget listViewBuilder() => ListView.builder(
      itemCount: myColor.length,
      itemBuilder: (context, index) {
        return FillWidget(width: 200, height: 200, color: myColor[index]);
      });

  Widget listViewSeparated() {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Text("${index + 1}. Test List ${index + 1}");
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return listViewSeparated();
  }
}

// video 8 - 10 Khuldi project List Tile, Widget image, Extract widget
class ItemWidget extends StatelessWidget {
  final String imageUrl, title, subtitle, timeStamp;

  const ItemWidget(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.timeStamp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Text(timeStamp),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final Faker faker = Faker();

  ListTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ItemWidget(
        imageUrl: "https://picsum.photos/id/$index/200/300",
        title: "${faker.person.firstName()} ${faker.person.lastName()}",
        subtitle: faker.lorem.sentence(),
        timeStamp: faker.date.time(),
      ),
      itemCount: 100,
      separatorBuilder: (context, index) => const Divider(
        color: Colors.black,
      ),
    );
  }
}

// video 11 Khuldi project statefull
class CounterNumber extends StatefulWidget {
  const CounterNumber({Key? key}) : super(key: key);

  @override
  _CounterNumberState createState() => _CounterNumberState();
}

class _CounterNumberState extends State<CounterNumber> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          counter.toString(),
          style: TextStyle(fontSize: counter.toDouble() + 30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (counter > 1) counter--;
                });
              },
              child: const Icon(Icons.remove),
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20)),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: const Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20)),
            )
          ],
        )
      ],
    );
  }
}

// video 12 Khuldi project mapping list
class MappingList extends StatelessWidget {
  final List<Map<String, dynamic>> listData = [
    {
      "nama": "Baco",
      "age": 30,
      "favoriteColor": [
        {"nameColor": "blue", "color": Colors.blue},
        {"nameColor": "pink", "color": Colors.pink}
      ],
    },
    {
      "nama": "Bacce",
      "age": 30,
      "favoriteColor": [
        {"nameColor": "blue", "color": Colors.blue},
        {"nameColor": "pink", "color": Colors.pink},
        {"nameColor": "pink", "color": Colors.pink},
        {"nameColor": "pink", "color": Colors.pink},
        {"nameColor": "pink", "color": Colors.pink},
        {"nameColor": "pink", "color": Colors.pink},
        {"nameColor": "pink", "color": Colors.pink},
        {"nameColor": "blue", "color": Colors.blue}
      ],
    }
  ];

  MappingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listData.map((data) {
        List<Map<String, dynamic>> favoriteColor = data["favoriteColor"];
        print(data["nama"]);
        return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data["nama"]),
                          const SizedBox(
                            height: 4,
                          ),
                          Text("${data["age"]}")
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: favoriteColor.map((color) {
                          return Container(
                              color: color["color"],
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  color["nameColor"],
                                ),
                              ));
                        }).toList(),
                      ))
                ],
              ),
            ));
      }).toList(),
    );
  }
}

// video 13 Khuldi project next time

// Test soal bebas asistensi
class ColorChar extends StatelessWidget {
  final String test = "Test";
  final List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.yellow
  ];
  final List<double> fontSizes = [20, 40, 60, 80];

  ColorChar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < test.length; i++)
          Text(test[i],
              style: TextStyle(color: colors[i], fontSize: fontSizes[i]))
      ],
    );
  }
}
