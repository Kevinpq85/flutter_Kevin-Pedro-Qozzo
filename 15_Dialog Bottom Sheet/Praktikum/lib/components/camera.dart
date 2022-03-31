import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  const Camera({
    Key? key,
    this.appBarColor = Colors.transparent,
    this.appBarTitle = "",
  }) : super(key: key);

  final String appBarTitle;
  final Color appBarColor;

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<String> imageLinks = [
    'https://st.depositphotos.com/1428083/2946/i/600/depositphotos_29460297-stock-photo-bird-cage.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwclY3q-sh2CLuA47kocKqEBdOYikeqP1iEA&usqp=CAU',
    'https://images.squarespace-cdn.com/content/v1/5d4c6077a7991a0001837faa/1594306925872-RQME9AO7XM0OQKT5QIHN/summer+family+photos+Fishers%2C+Indiana',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4Wb-7EToIARk9bmqIWvbjno1tMC-V0ZIBiw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ66gziccnFsOF8DVIh99EnJUT8PYXApFe-gg&usqp=CAU',
    'https://farm6.staticflickr.com/5066/5893395540_af1965d474_o.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWKhGPeUU-iNE5AwCyqGKjdfOQdgyJqokrPQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwclY3q-sh2CLuA47kocKqEBdOYikeqP1iEA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-jafaH7At1qgj8nhAhW3_XAhaQDphVhis3A&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ66gziccnFsOF8DVIh99EnJUT8PYXApFe-gg&usqp=CAU',
    'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-jafaH7At1qgj8nhAhW3_XAhaQDphVhis3A&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK04XEn-fVgRAhUvQ6azT62_kXW1emhBHVuw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQg45jUi84SYeCf4uNAaprS7aoKzS8AohaLwQ&usqp=CAU',
    'https://hindutrend.com/wp-content/uploads/2020/01/good-night-romantic-images-hd.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3QFIumFYWQXDbwJ-A_5h_i2KpuiRjAOkURg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWKhGPeUU-iNE5AwCyqGKjdfOQdgyJqokrPQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwclY3q-sh2CLuA47kocKqEBdOYikeqP1iEA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK04XEn-fVgRAhUvQ6azT62_kXW1emhBHVuw&usqp=CAU',
    'https://farm6.staticflickr.com/5066/5893395540_af1965d474_o.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ66gziccnFsOF8DVIh99EnJUT8PYXApFe-gg&usqp=CAU',
    'https://farm6.staticflickr.com/5066/5893395540_af1965d474_o.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWKhGPeUU-iNE5AwCyqGKjdfOQdgyJqokrPQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwclY3q-sh2CLuA47kocKqEBdOYikeqP1iEA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-jafaH7At1qgj8nhAhW3_XAhaQDphVhis3A&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK04XEn-fVgRAhUvQ6azT62_kXW1emhBHVuw&usqp=CAU',
    'https://images.squarespace-cdn.com/content/v1/5d4c6077a7991a0001837faa/1594306925872-RQME9AO7XM0OQKT5QIHN/summer+family+photos+Fishers%2C+Indiana',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.appBarColor,
        title: Text(
          widget.appBarTitle,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(50),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                for (var i = 0; i < imageLinks.length; i++)
                  InkWell(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            imageLinks[i],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: () => {},
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
