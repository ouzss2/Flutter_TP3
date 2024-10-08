import 'package:flutter/material.dart';
import 'Series.dart'; 

class SeriesDetailScreen extends StatelessWidget {
  final Series series;

  const SeriesDetailScreen({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(series.title),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0), 
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0), 
              child: Image.network(
                series.imageUrl, 
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Text('Image not found'));
                },
              ),
            ),
          ),
          // Centered title
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              series.title,
              style: const TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, 
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
            child: Text(
              series.description ?? 'No description available', 
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700], 
                height: 1.5, 
              ),
              textAlign: TextAlign.center, 
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
