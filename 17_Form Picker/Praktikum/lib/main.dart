import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Post Create Update Delete',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Post'),
    );
  }
}

class Post {
  String? title;
  String? createdAt;
  String? body;
  String? rate;
  Color? color;
  String? file;
  int? id;
  Post(
    this.title,
    this.createdAt,
    this.body,
    this.rate,
    this.color,
    this.file,
    this.id,
  );
}

List<Post> posts = [
  Post('Postingan 1', 'March 29, 2022', 'This', '10', Colors.redAccent,
      'https://picsum.photos/id/1/200/200', 1),
  Post('Postingan 2', 'March 30, 2022', 'This', '10', Colors.orangeAccent,
      'https://picsum.photos/id/1/200/200', 2),
];

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key? key, required String this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreatePostPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          Widget lead = CircleAvatar(
            child: Image.network('https://picsum.photos/id/1/200/200'),
          );
          ;
          if (posts[index].file == 'https://picsum.photos/id/1/200/200') {
            lead = CircleAvatar(
                backgroundImage: Image(
              image: NetworkImage('https://picsum.photos/id/1/200/200'),
            ).image);
          } else {
            lead = CircleAvatar(
              backgroundImage: FileImage(
                File('${posts[index].file}'),
              ),
            );
          }
          return ListTile(
            leading: lead,
            title: Text('${posts[index].title}'),
            subtitle: Text('${posts[index].createdAt}'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailPage(
                    postId: index,
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}

class PostDetailPage extends StatelessWidget {
  final int postId;
  PostDetailPage({Key? key, required int this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget mage;
    if (posts[postId].file == 'https://picsum.photos/id/1/200/200') {
      mage = Image(
        image: NetworkImage('https://picsum.photos/id/1/200/200'),
      );
    } else {
      mage = Image(
        image: FileImage(File('${posts[postId].file}')),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Post Detail'),
        backgroundColor: posts[postId].color,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            child: Container(
              height: 200,
              width: double.infinity,
              color: posts[postId].color,
              child: mage,
            ),
          ),
          titleSection(),
          buttonAction(),
          articleSection(),
        ],
      ),
    );
  }

  Widget titleSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${posts[postId].title}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${posts[postId].createdAt}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.yellow[800],
          ),
          Text('${posts[postId].rate}'),
        ],
      ),
    );
  }

  Widget buttonAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonBuilderAction(Icons.edit, 'Edit'),
        buttonBuilderAction(Icons.delete, 'Delete'),
        buttonBuilderAction(Icons.share, 'Share'),
      ],
    );
  }

  Widget buttonBuilderAction(IconData icon, String label) {
    return Column(children: [
      Icon(icon, color: posts[postId].color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(color: posts[postId].color),
        ),
      ),
    ]);
  }

  Widget articleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        '''${posts[postId].body}
        ${posts[postId].file}
        ''',
        softWrap: true,
      ),
    );
  }
}

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  DateTime _dueDate = DateTime.now();
  DateTime currentDate = DateTime.now();
  Color _curentColor = Colors.blue;
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _rateController = TextEditingController();
  File file = File(
    '',
  );
  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildFilePicker(context),
              Divider(
                height: 1,
              ),
              buildDatePicker(context),
              SizedBox(height: 16),
              Divider(
                height: 1,
              ),
              SizedBox(height: 16),
              buildColorPicker(context),
              SizedBox(height: 16),
              Divider(
                height: 1,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _rateController,
                decoration: InputDecoration(
                  labelText: 'Rate',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: 'Content',
                  border: OutlineInputBorder(),
                ),
                minLines: 1,
                maxLines: 10,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    String title = _titleController.text;
                    String content = _contentController.text;
                    String rate = _rateController.text;
                    if (_formKey.currentState!.validate()) {
                      posts.add(
                        Post(
                          title,
                          currentDate.toString(),
                          content,
                          rate,
                          _curentColor,
                          file.path,
                          posts.length,
                        ),
                      );
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(title: 'Home'),
                        ),
                      );
                    }
                  },
                  child: Text('Save')),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFilePicker(BuildContext context) {
    Widget roooow;
    if (file.path.isNotEmpty) {
      roooow = Image(
        image: FileImage(file),
        height: 200,
      );
    } else {
      roooow = Text('No file selected');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        roooow,
        SizedBox(height: 16),
        Text('File ${file.path}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Cover'),
            ElevatedButton(
              onPressed: () {
                Future<File> afile = _addFile(file);
                afile.then((value) {
                  setState(
                    () {
                      file = value;
                    },
                  );
                });
              },
              child: Text('Select Cover'),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Publish At'),
            ElevatedButton(
              onPressed: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(2015, 8),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != _dueDate) {
                  setState(
                    () {
                      _dueDate = picked;
                    },
                  );
                }
              },
              child: Text('Select'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Current Date'),
            Text(
              DateFormat().format(_dueDate),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Color Theme'),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Select Color'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: _curentColor,
                            onColorChanged: (color) {
                              setState(() {
                                _curentColor = color;
                              });
                            },
                            pickerAreaHeightPercent: 0.8,
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            child: Text('Select'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Text('Select'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Current Color'),
            Text(
              '#${_curentColor.value.toRadixString(16).padLeft(6, '0')}',
              style: TextStyle(color: _curentColor),
            ),
          ],
        ),
      ],
    );
  }
}

Future<File> _addFile(File file) async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['jpg', 'png'],
  );
  if (result == null) {
    return file;
  }
  final filee = result.files.first;
  print(filee.path);
  print(filee.name);
  print(filee.bytes);
  print(filee.extension);
  print(filee.size);
  file = File(
    '${filee.path}',
  );
  return file;
  // _openFile(filee);
}

void _openFile(PlatformFile file) {
  OpenFile.open(file.path);
}
