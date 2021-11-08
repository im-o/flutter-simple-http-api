import 'package:flutter/material.dart';
import 'package:simple_http/data/model/album.dart';
import 'package:simple_http/data/repository/remote_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Album> listAlbum = [];
  RemoteRepository remoteRepository = RemoteRepository();

  fetchAlbumAPI() async {
    listAlbum = await remoteRepository.fetchAlbumAPI();
    setState(() {});
  }

  @override
  void initState() {
    fetchAlbumAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              child: Text(listAlbum[index].title),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: listAlbum.length),
    );
  }
}
