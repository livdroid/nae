import 'dart:async';

import 'package:flutter/services.dart';

var bloc = Blogbloc();

class Blogbloc {
  StreamController<List<String>> _controller =
      StreamController<List<String>>.broadcast();

  Stream<List<String>> get stream => _controller.stream;

  getProjectDetails() async {
    var list = List<String>();
    for (int i = 1; i < 100; i++) {
      var post = await rootBundle.loadString('assets/posts/post_$i.md');
      if (post != null) {
        list.add(post);
        _controller.add(list);
      }
    }
  }
}
