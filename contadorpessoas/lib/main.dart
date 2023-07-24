import 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);
  
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget button({required Function()? onPressed, required String title}){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: MaterialButton(
        minWidth: 120,
        height: 50,
        color: Colors.white,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500
          )
        ),
      ),
    );
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Pode entrar!',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 50
            )
          ),
          Text(
            '11',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 100
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button(onPressed: () => null, title: 'Sair'),
              button(onPressed: () => null, title: 'Entrar')
            ],
          )
        ],
      ),
    );
  }
}