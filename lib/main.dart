import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListViewWidget(
          direction: Axis.vertical,
        ),
      ),
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

  Widget rowExamples({mainAxisAlignment = MainAxisAlignment.start,
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

  Widget columnExamples({mainAxisAlignment = MainAxisAlignment.start,
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

  Widget listViewBuilder() =>
      ListView.builder(
          itemCount: myColor.length,
          itemBuilder: (context, index) {
            return FillWidget(width: 200, height: 200, color: myColor[index]);
          });


  Widget listViewSeparated() {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Text(
          "${index + 1}. Test List ${index + 1}"
        );
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

// video 8 Khuldi project List Tile
// next hari
