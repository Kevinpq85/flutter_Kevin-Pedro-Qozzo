import 'package:flutter/material.dart';
import 'package:s_21/task_2/Bloc/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterBloc bloc = CounterBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task 2"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: bloc.output,
            initialData: bloc.counter,
            builder: (context, snapshot) => Text(
              "Angka sekarang adalah : ${snapshot.data}",
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    bloc.inputan.add("Kurang");
                  },
                  icon: Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    bloc.inputan.add("Tambah");
                  },
                  icon: Icon(Icons.add))
            ],
          )
        ],
      )),
    );
  }
}
