import 'package:javasript_api/posts.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<List<Posts>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postsFromJson(json);
    }
  }
}
