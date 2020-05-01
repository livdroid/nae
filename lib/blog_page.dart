import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

import 'blog_bloc.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    bloc.getProjectDetails();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dimsun, du Flutter et des trucs',
          style: TextStyle(
              color: Color(0xFFD3465A),
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFFD8F2FE),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFFD8F2FE),
        child: Center(
          child: StreamBuilder(
            stream: bloc.stream,
            builder: (context, AsyncSnapshot<List<String>> projectSnap) {
              if (!projectSnap.hasData) {
                return _loadingWidget();
              }
              return buildPostWidget(projectSnap);
            },
          ),
        ),
      ),
    );
  }

  Container buildPostWidget(AsyncSnapshot<List<String>> projectSnap) {
    return Container(
      width: 900,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: projectSnap.data.length,
        itemBuilder: (context, index) {
          return buildItem(projectSnap, index);
        },
      ),
    );
  }

  Container buildItem(AsyncSnapshot<List<String>> projectSnap, int index) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Card(
        elevation: 1,
        shape: buildRoundedRectangleBorder(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: buildMarkdownBody(projectSnap, index),
        ),
      ),
    );
  }

  MarkdownBody buildMarkdownBody(
      AsyncSnapshot<List<String>> projectSnap, int index) {
    return MarkdownBody(
        onTapLink: (url) {
          launch(url);
        },
        selectable: true,
        styleSheet: buildMarkdownStyleSheet(),
        fitContent: true,
        data: projectSnap.data[index]);
  }

  RoundedRectangleBorder buildRoundedRectangleBorder() {
    return RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)));
  }

  MarkdownStyleSheet buildMarkdownStyleSheet() {
    return MarkdownStyleSheet(
        codeblockDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                style: BorderStyle.solid, width: 1, color: Colors.black12),
            shape: BoxShape.rectangle),
        codeblockPadding: const EdgeInsets.all(20),
        code: TextStyle(color: Colors.teal),
        a: TextStyle(
          color: Colors.blue,
        ),
        h1: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 26),
        h2: TextStyle(
            fontWeight: FontWeight.w600, color: Colors.black, fontSize: 22),
        h3: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.black, fontSize: 18));
  }

  Center _loadingWidget() {
    return Center(
      child: SpinKitRotatingCircle(
        color: Color(0xFFE8A2AC),
        size: 50.0,
      ),
    );
  }
}
