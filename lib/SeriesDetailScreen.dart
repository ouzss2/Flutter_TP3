import 'package:flutter/material.dart';
import 'Series.dart'; 

class SeriesDetailScreen extends StatelessWidget {
  final Series series;

  SeriesDetailScreen({required this.series});

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
            margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0), // Margins for the image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0), 
              child: Image.asset(
                series.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centered title
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              series.title,
              style: TextStyle(
                fontSize: 24, // Larger font size for the title
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Center the text
            ),
          ),
          // Centered description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
            child: Text(
              series.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700], // Softer color for the text
                height: 1.5, // Adjust line spacing
              ),
              textAlign: TextAlign.center, // Center the description
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
