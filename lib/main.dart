import 'package:flutter/material.dart';
import 'package:http_training/city.dart';
import 'package:http_training/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String? appButtonMoscow;
  String? appButtonTolyatti;

  Future<void> navigateToCityScreen() async {
    final res = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const CityInfo();
        },
      ),
    );
    setState(() {
      appButtonMoscow = res;
    });
  }
  

    late final Weather weather;

  @override
  void initState(){
    weather = Weather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Темпаратура в Москве'),
        centerTitle: true,
      ),
      body:    Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                    width: 50,
                  ),
                  const Text('Выберите город'),
                  ElevatedButton(onPressed: navigateToCityScreen, child: const Text('Перейти к погоде')),
                  
                ],
              ),
            ));
          }
        }
