import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  int limit = Random().nextInt(100);
  
  increment(){
    setState(() {
      count++;
    });
  }

  decrement(){
    if(count.isNegative){
      count = 0;
      
    }else{
      count--;
    }

    setState(() {});
  }

  bool get isFull => count >= limit;
  bool get isEmpty => count == 0;

  Widget button( {required Function()? onPressed, required String title, required BuildContext context, required bool action}) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 235, 235, 235).withOpacity(!action ? 1 : 0.5),
        padding: const EdgeInsets.all(8),
        elevation: 2,
        maximumSize: Size(MediaQuery.of(context).size.width / 2, MediaQuery.of(context).size.height * .1),
        minimumSize: Size(MediaQuery.of(context).size.width / 3, MediaQuery.of(context).size.height * .08),
      ),
      child: Text(title,
        style: TextStyle(
          color: Colors.black.withOpacity(!action ? 1 : 0.5), 
          fontWeight: FontWeight.w500, 
          fontSize: 16
        )
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagens/background.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              isFull ? 'Lotado!' : 'Liberado!',
              style: TextStyle(
                color: Colors.black, 
                fontWeight: FontWeight.w500,
                fontSize: 50
              )
            ),
            Text(
              count.toString(),
              style: TextStyle(
                color: Colors.black, 
                fontWeight: FontWeight.w700,
                fontSize: 100
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button(context: context, onPressed: () => decrement(), title: 'Sair', action: isEmpty),
                SizedBox(width: 30),
                button(context: context, onPressed: () => isFull ? null : increment(), title: 'Entrar', action: isFull)
              ],
            )
          ],
        ),
      ),
    );
  }
}
