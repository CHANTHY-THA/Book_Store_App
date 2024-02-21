import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final double rating;
  final String price;

  const BookDetailScreen({super.key, 
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Author: $author'),
            Text('Rating: $rating'),
            Text('Price: $price'),
            imageUrl.isNotEmpty
                ? Image.network(
                    imageUrl,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
