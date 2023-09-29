import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Feed'),
          centerTitle: true,
        ),
        body: ImageFeed(),
      ),
    );
  }
}

class ImageFeed extends StatelessWidget {
  ImageFeed({super.key});

  final List<String> images = List.generate(
    10,
    (index) => 'https://via.placeholder.com/150',
  );

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return orientation == Orientation.portrait
        ? ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  height: 150,
                  child: Image.network(images[index]),
                ),
              );
            },
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  height: 150,
                  child: Image.network(images[index]),
                ),
              );
            },
          );
  }
}
