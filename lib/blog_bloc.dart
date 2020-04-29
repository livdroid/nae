import 'package:flutter/services.dart';
import 'package:nae/res.dart';

var bloc = Blogbloc();

class Blogbloc {
  Future<List<String>> getProjectDetails() async {
    var list = List<String>();
    list.add(await rootBundle.loadString(Res.post_1));
    list.add(await rootBundle.loadString(Res.post_2));
    list.add(await rootBundle.loadString(Res.post_3));
    return list;
  }
}
