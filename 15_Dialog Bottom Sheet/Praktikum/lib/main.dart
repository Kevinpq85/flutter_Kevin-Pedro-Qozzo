import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gallery Dialog Bottom Sheet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int data = 30;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Gallery Dialog Bottom Sheet'),
      ),
      body: GridView.builder(
        itemCount: data,
        padding: const EdgeInsets.all(1),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                barrierColor: Colors.black54,
                elevation: 10,
                backgroundColor: Colors.white,
                useRootNavigator: true,
                builder: (context) {
                  return _MyBottomSheet(index: index, data: data);
                },
              );
            },
            child: Stack(
              children: <Widget>[
                Image(
                  image: NetworkImage(
                      'https://picsum.photos/300/250?image=$index'),
                ),
                Positioned(
                  bottom: 15,
                  left: 5,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black54,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Picsum image $index',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MyBottomSheet extends StatelessWidget {
  final int index, data;
  const _MyBottomSheet({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                image:
                    NetworkImage('https://picsum.photos/350/250?image=$index'),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.black54,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Image $index',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: const Text('Close'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                child: const Text('Back'),
                onPressed: () {
                  Navigator.pop(context);
                  showModalBottomSheet<void>(
                    context: context,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    barrierColor: Colors.black54,
                    elevation: 10,
                    backgroundColor: Colors.white,
                    useRootNavigator: true,
                    builder: (context) {
                      int v = index == 0 ? data - 1 : index - 1;
                      return _MyBottomSheet(index: v, data: data);
                    },
                  );
                },
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                child: const Text('Next'),
                onPressed: () {
                  Navigator.pop(context);
                  showModalBottomSheet<void>(
                    context: context,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    barrierColor: Colors.black54,
                    elevation: 10,
                    backgroundColor: Colors.white,
                    useRootNavigator: true,
                    builder: (context) {
                      int v = index == data - 1 ? 0 : index + 1;
                      return _MyBottomSheet(index: v, data: data);
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
