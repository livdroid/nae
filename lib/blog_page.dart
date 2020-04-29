import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'blog_bloc.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon super blog trop cool tu peux pas test'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        child: FutureBuilder(
          future: bloc.getProjectDetails(),
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
                  child: MarkdownBody(
                      fitContent: true, data: projectSnap.data[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
