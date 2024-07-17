import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/models/views/screen/HomePage/Provider/todoprovider.dart';
import 'controllers/models/views/screen/HomePage/SplashScreen/AddtoScreen/SplashScren.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
