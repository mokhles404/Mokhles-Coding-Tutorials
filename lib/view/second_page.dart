
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class SecondPage extends StatelessWidget {
  
  
  String urlImage= "https://images.unsplash.com/photo-1542397284385-6010376c5337?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title:Text("Swiar Page"),),

      body: Container(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {

            return Container(
              color: Colors.cyan,
              margin:EdgeInsets.symmetric(vertical: 16,horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(urlImage,width: 80,height: 80,),
                  ),

                  Expanded(
                    flex: 3,
                    child: Container(
                      // color: Colors.orange,
                      child: Column(
                        children: [
                          Text("Title product" ,style: GoogleFonts.lato(fontSize:12),),
                            SizedBox(height: 32,),
                          Text("25\$")
                        ],
                      ),
                    ),
                  ),
                  
                  Expanded(
                    child: Container(
                      height: 88,
                      // color: Colors.green,
                        child: Icon(Icons.add_business,color: Colors.white,)),
                  )




                ],
              ),

            );

          },



        ),
      ),
    );
  }
}
