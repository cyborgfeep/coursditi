import 'package:coursditi/screens/home_page.dart';
import 'package:coursditi/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          const MyHomePage(),
          Container(color: Colors.grey,),
          Container(color: Colors.green,),
          Container(color: Colors.purple,),
          Container(color: Colors.orange,),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        fixedColor: primaryColor,
        onTap: (val){
          currentIndex=val;
          setState(() {
            
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.chart_pie),label: "Conso"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.arrow_right_arrow_left),label: "O.M"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bag),label: "Services"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.helm),label: "Assistance"),
        ],
      ),
    );
  }
}
