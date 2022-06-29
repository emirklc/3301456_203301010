import 'package:flutter/material.dart';

import 'post.dart';
import 'post_services.dart';

class postModel extends StatefulWidget {
  postModel({Key? key}) : super(key: key);

  @override
  State<postModel> createState() => _postModelState();
}

class _postModelState extends State<postModel> {
  List<Post>? posts;
  var isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    posts = await postServices().getPosts();

    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
    print(posts?.length);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade500,
        title: Text(
          "Kullanıcı Verileri",
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: MaterialButton(
                  color: Colors.deepPurple.shade500,
                  onPressed: () {},
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    textColor: Colors.white,
                    title: Text(
                      posts![index].name,
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      "${posts![index].body}",
                      maxLines: 1,
                    ),
                    hoverColor: Colors.red,
                  ),
                ),
              ),
            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
