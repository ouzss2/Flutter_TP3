import 'package:flutter/material.dart';
import 'Series.dart';
import 'SeriesDetailScreen.dart';

void main() {
  runApp(TvSeriesApp());
}

class TvSeriesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SeriesListScreen(),
      },
    );
  }
}



class SeriesListScreen extends StatelessWidget {

  final List<Series> seriesList = [
    Series(
      title: 'Breaking Bad',
      imageUrl: 'images/bd.jpg',
      description: 'Breaking Bad is a show about ...',
    ),
    Series(
      title: 'Stranger Things',
      imageUrl: 'images/st.jpg',
      description: 'Stranger Things is a show about ...',
    ),
    Series(
      title: 'Game of Thrones',
      imageUrl: 'images/got.jpg',
      description: 'Game of Thrones is a show about ...',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular TV Series'),
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

  SeriesCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Coins arrondis pour la carte
      ),
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Column(
        children: [
          // Section image avec coins arrondis
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15), // Coins supérieurs arrondis
            ),
            child: Container(
              height: 200,
              width: double.infinity,
              child: Image.asset(
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
              style: TextStyle(
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
