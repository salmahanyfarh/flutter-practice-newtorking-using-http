import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:networking_app/post.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  //1
  late Future<post> postData;

  @override
  //2
  initState() {
    super.initState();
    postData = getPostById();
  }

//*******************************************************
  //4
  Future<post> getPostById() async {
    http.Response FuturePost = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (FuturePost.statusCode == 200) {
      print(FuturePost.body);
      //success
      return post.fromJson(json.decode(FuturePost.body));
    } else {
      throw Exception('can not load data');
    }
  }
//**********************************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Networking Lesson 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //5***************************************************
            Container(
              height: 50.0,
              color: Colors.red,
              child: FutureBuilder<post>(
                  future: postData,
                  builder: (context, snapshot) { // snapshot dah elly feh el data elly fe el api
                    if (snapshot.hasData){
                      return Text(snapshot.data!.title);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }),
            ),
            SizedBox(
              height: 20.0,
            ),
            //6*********************************************************
            Container(
              height: 50.0,
              color: Colors.red[200],
              child: FutureBuilder<post>(
                  future: postData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!.body);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
