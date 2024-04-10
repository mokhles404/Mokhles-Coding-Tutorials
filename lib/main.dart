import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Page1(),
    );
  }
}









class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override

  int count =0;


  Widget build(BuildContext context) {
    double width =MediaQuery.sizeOf(context).width;
    double height =MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.cyan,
        appBar: AppBar(
          title: Text("Count"),
          centerTitle: true,
        ),
      body: Container(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(count.toString(),style: TextStyle(fontSize: 36),),




            ElevatedButton(onPressed: (){

                  setState(() {
                    count++;
                  });


            }, child: Icon(Icons.add)),
            ElevatedButton(onPressed: (){



              setState(() {
                count--;
              });

            }, child: Icon(Icons.minimize)),


            ElevatedButton(onPressed: (){
           Navigator.pop(context);

            }, child: Text("Back")),


          ],
        ),
      ),
    );
  }
}
















class Page1 extends StatefulWidget {
   Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
   TextEditingController text1 =TextEditingController();

   TextEditingController text2 =TextEditingController();

    String error="";
    int count =0;
    bool show=true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Login",style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold),),

            TextField(
              controller: text1,
              decoration: InputDecoration(
                labelText: "Login",
                fillColor: Colors.grey,
                filled: true
              ),

            ),
            SizedBox(height: 16,),
            TextField(
              obscureText: show,
              controller: text2,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(fontSize: 22),
                fillColor: Colors.grey,
                filled: true,
                suffixIcon: IconButton(onPressed: () {

                  show=!show;
                  setState(() {

                  });

                }, icon: Icon(Icons.remove_red_eye),

                )
              ),

            ),
            SizedBox(height: 16,),

            Text(error,style: TextStyle(fontSize: 18,color: Colors.red),),

            ElevatedButton(onPressed: (){
              setState(() {
                error="";
              });
              if(!text1.text.contains("@")){
                print("this not  correct email");

                setState(() {
                  error="this not correct email";
              });
                return;
              }

              if(text1.text!="login@gmail.com"){
                setState(() {
                  error="login Incorrect";
                });
                return;
              }
              if(text2.text!="12345"){
                setState(() {
                  error="Password Incorrect";
                });
                return;
              }


              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Page2()),
              );




            }, child: Text("Login")),

          SizedBox(height: 16,),

            ElevatedButton(onPressed: (){
              print("***********");
              print(error);
              print("***********");

            }, child: Text("Clear")),




          ],
        ),
      ),
    );
  }
}





