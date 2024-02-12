import 'package:flutter/material.dart';

class CityInfo extends StatelessWidget {
  const CityInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ИНФОРМАЦИЯ'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
          Navigator.of(context).pop();
        }
        ),
      ),
      body: FutureBuilder(
        future: weather.getWeather(),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else{
            return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text('BLYAT SUKA')
          ],
          )
        
        )
      
          }
          }
          ),
    ));
  }
}

class _CityInfo extends State<StatefulWidget>{

}