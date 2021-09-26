import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
void main(List<String> args) {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Paym(),
      
    );
  }
}
class Paym extends StatefulWidget {
  const Paym({ Key? key }) : super(key: key);

  @override
  _PaymState createState() => _PaymState();
}

class _PaymState extends State<Paym> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        gradient: LinearGradient(colors: [Colors.blue.shade900,Colors.black12,Colors.lightBlue]
        ),
        centerTitle: true,
        title: Text("GIVE AND SUPPORT",style: TextStyle(fontWeight: FontWeight.bold),),
        bottomOpacity: 0.5,
        ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        
        decoration: BoxDecoration(
          
          image: DecorationImage(
            image:AssetImage("ngo.jpg"),
            fit: BoxFit.cover,
            colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
          )
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome,",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 42,fontFamily: 'Comic-Sans' 
              ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text("please click below to share your warmth",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
               Padding(padding: EdgeInsets.all(10)),
               ElevatedButton(
                 onPressed: launchURL, child: Text("Donate"),
                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow.withOpacity(0.5)),
                 visualDensity: VisualDensity.adaptivePlatformDensity),
                 )
            ],
            

          )
        ),
      );
      


      
      
    
  }
}

launchURL() async {
  const url = 'https://pages.razorpay.com/pl_I0V9pjE4fONvWw/view';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}