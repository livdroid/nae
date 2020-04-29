import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

import 'blog_bloc.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.getProjectDetails();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dimsun, du Flutter et des trucs',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Container(
        child: StreamBuilder(
          stream: bloc.stream,
          builder: (context, AsyncSnapshot<List<String>> projectSnap) {
            if (!projectSnap.hasData) {
              return Center(
                child: SpinKitRotatingCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: projectSnap.data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * 0.60,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: MarkdownBody(
                          onTapLink: (url) {
                            launch(url);
                          },
                          styleSheet: MarkdownStyleSheet(
                              codeblockDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      style: BorderStyle.solid,
                                      width: 1,
                                      color: Colors.black12),
                                  shape: BoxShape.rectangle),
                              codeblockPadding: const EdgeInsets.all(20),
                              code: TextStyle(color: Colors.teal),
                              h1: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 28),
                              h2: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 22),
                              h3: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 18)),
                          fitContent: true,
                          data: projectSnap.data[index]),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
