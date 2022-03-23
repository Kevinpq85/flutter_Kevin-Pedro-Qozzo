import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grid View'),
          ),
          body: const GridViewWidget(),
          ),
    );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
    //   padding: const EdgeInsets.all(8),
    // mainAxisSpacing: 10,
    // crossAxisSpacing: 20,
    // childAspectRatio: 0.8,
      crossAxisCount: 4,
      children: <Widget>[
      Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.mail_outline_rounded),
          onPressed: (){},
          ),
      ),
      Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.abc),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.safety_divider),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.ac_unit_sharp),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.kayaking),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.baby_changing_station),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.tab),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.e_mobiledata),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.adb_outlined),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.qr_code),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.h_mobiledata),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.face),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.fastfood),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.label),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.pages_outlined),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.umbrella),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.laptop_windows),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.facebook),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.transfer_within_a_station),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.wallet_travel_rounded),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.dark_mode_rounded),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.dangerous),
          onPressed: (){},
          ),
      ),Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.vaping_rooms),
          onPressed: (){},
          ),
      ),
      Container(padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.one_k_plus_sharp),
          onPressed: (){},
          ),
      )
    ],
    );
  }
}