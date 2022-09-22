import 'package:flutter/material.dart';
import 'package:javasript_api/services.dart';
import 'posts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Posts>? posts;

  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    posts = await Services().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: Visibility(
        visible: isLoaded,
        // ignore: sort_child_properties_last
        child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              return Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title:${posts![index].title}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "ID: ${posts![index].id}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "USERID: ${posts![index].userId}",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Body: ${posts![index].body}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ));
            }),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
