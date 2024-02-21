import 'package:flutter/material.dart';

class BookDetailScreen extends StatefulWidget {
  final String title;
  final String author;
  final String imageUrl;
  final double rating;
  final String price;

  const BookDetailScreen({
    Key? key,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.rating,
    required this.price,
  }) : super(key: key);

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  int _quantity = 1;


  void _addToCart() {
   
    print('Added to cart: ${widget.title}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Color(0xFFF9F9F9),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Book Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: widget.imageUrl.isNotEmpty
                    ? Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      )
                    : const SizedBox.shrink(),
              ),
              SizedBox(height: 16),
              // Title and Favorite icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Implement favorite functionality
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                ],
              ),
              SizedBox(height: 8),
              // Author and Rating
              Row(
                children: [
                  Text('Author: ${widget.author}'),
                  SizedBox(width: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18.0),
                      SizedBox(width: 4.0),
                      Text('${widget.rating}'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              // Description
              Text(
                'Description: Add description here s simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              // Plus/Minus Buttons
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (_quantity > 1) _quantity--;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ),
                  SizedBox(width: 16),
                  Text('$_quantity'),
                  SizedBox(width: 16),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _quantity++;
                        });
                      },
                      icon: Icon(Icons.add, color: Color(0xFF0C8A7B)), 
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
             
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF0C8A7B),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _addToCart();
                    },
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
