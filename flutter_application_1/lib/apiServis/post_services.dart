
import 'package:http/http.dart' as http;

import 'post.dart';

class postServices {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    //bu kısıma kendi url yapını entegere etmen gerekiyor
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    var responsive = await client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (responsive.statusCode == 200) {
      var json = responsive.body;
      return postFromJson(json);
    }
  }
}