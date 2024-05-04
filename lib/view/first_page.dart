


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/post.dart';
import '../modelview/service_modelview.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  List<String> myList = [
    "test1",
    "test2",
    "test3",
    "test4",
    "test5",
    "test6",
    "test7",

  ];

  ServiceMV service=ServiceMV();

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:  AppBar(
         title: Text("Posts Page"),
         centerTitle: true,
       ),
      body:Container(
        color: Colors.white,

        child:FutureBuilder(
          future: service.fetchPosts(),
            builder: (BuildContext context, AsyncSnapshot<List<Post>?> snapshot) {


            if(snapshot.connectionState == ConnectionState.done) {

              if(snapshot.hasError) return Text("problem with fetching data");
              List<Post>? listPost = snapshot.data;

              return Container(
                color: Colors.green,
                child: Column(
                  children: [
                    Text("Posts"),
                    Container(
                      color: Colors.black,
                      width: 350,
                      height: 450,
                      child: ListView.builder(
                        itemCount: listPost?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              color: Colors.cyan,
                              margin: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(listPost?[index].title ??
                                          "no title")),
                                  SizedBox(height: 8,),
                                  Container(
                                    color: Colors.orange,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        listPost?[index].body ?? "no title"),
                                  )
                                ],
                              )

                          );
                        },
                      ),
                    ),

                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );






            }, )

      ) ,
    );
  }
}
