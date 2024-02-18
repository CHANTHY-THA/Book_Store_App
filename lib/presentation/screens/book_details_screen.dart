import 'package:flutter/material.dart';
import 'package:test/presentation/widgets/bottom_navigation.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super. key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text('Book Detail'),
              ),
            ),
            Icon(
              Icons.favorite_border_outlined,
              color: Colors.blueGrey,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: _buildBookCard(
        'The Picture of Dorian Gray',
        'Author 1',
        'Toy',
        'https://booklistqueen.com/wp-content/uploads/i-know-why-the-caged-birds-sing-maya-angelou.jpg',
        4.5,
        '\$20',
        'The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.',
        context,
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  Widget _buildBookCard(
    String title,
    String author,
    String category,
    String imageUrl,
    double rating,
    String price,
    String description,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                 padding: const EdgeInsets.only(bottom:25),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF14181B),
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Row(
                children: [
                  SizedBox(
                    width: 120,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl,
                        width: 120,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                              'Author: $author',
                              style: const TextStyle(
                                color: Color(0xFF14181B),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3.0),
                              child: Text(
                                'Cateogry: $category',
                                style: const TextStyle(
                                  color: Color(0xFF14181B),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                           
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3.0),
                              child: Text(
                                'Rating: $rating',
                                style: const TextStyle(
                                  color: Color(0xFF14181B),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3.0),
                              child: Text(
                                'Price: $price',
                                style: const TextStyle(
                                  color: Color(0xFF14181B),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10), // Add space between price and button
                            ElevatedButton(
                              onPressed: () {
                                // Handle add to cart functionality here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor : const Color(0xFF0C8A7B),
                                foregroundColor : Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                'Add to Cart',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF57636C),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}