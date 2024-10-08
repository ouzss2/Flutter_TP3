import 'dart:convert';

import 'package:flutter/material.dart';
import 'Series.dart';
import 'SeriesDetailScreen.dart';
import 'package:http/http.dart' as http ;

void main() async {
  List<Series> myList = await GetdataFromAPi();
  runApp(TvSeriesApp(list:myList));
}

Future<List<Series>> GetdataFromAPi() async{
  String url ="https://imdb-top-100-movies.p.rapidapi.com";

  final header = {
    'X-Rapidapi-Key': '75cf39f115msh5e1388559e7e8fap1b360fjsn8f1509e8c0ea',
    'X-Rapidapi-Host': 'imdb-top-100-movies.p.rapidapi.com',
    'Accept':'application/json'
  };

  try{
    dynamic result = await http.get(Uri.parse(url),headers: header);

    if (result.statusCode == 200){
       List<dynamic> movies = json.decode(result.body);

       return movies.map((movie)=>Series(title: movie['title'], imageUrl: movie['image'], description: movie['description'])).toList();
    }else{
      return [];
    }
  }catch(error) {
   print(error);
   return [];
  }
}


class TvSeriesApp extends StatelessWidget {
   List<Series> list;

   TvSeriesApp({super.key, required this.list});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SeriesListScreen(seriesList: list,),
      },
    );
  }
}



class SeriesListScreen extends StatelessWidget {

   List<Series> seriesList ;
   SeriesListScreen({super.key, required this.seriesList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular TV Series'),
      ),
      body: ListView.builder(
        itemCount: seriesList.length,
        itemBuilder: (context, index) {
          final series = seriesList[index];
          return GestureDetector(
            onTap: () {
             Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SeriesDetailScreen(series: seriesList[index]),
  ),
);

            },
            child: SeriesCard(
              title: series.title,
              imageUrl: series.imageUrl,
            ),
          );
        },
      ),
    );
  }
}

// Widget personnalisé pour la carte des séries
class SeriesCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const SeriesCard({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Coins arrondis pour la carte
      ),
      margin: const EdgeInsets.all(10),
      elevation: 5,
      child: Column(
        children: [
          // Section image avec coins arrondis
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(15), // Coins supérieurs arrondis
            ),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover, // Assurez-vous que l'image couvre bien l'espace
              ),
            ),
          ),
          // Section titre
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}