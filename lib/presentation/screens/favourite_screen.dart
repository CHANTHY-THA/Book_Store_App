import 'package:flutter/material.dart';
import 'package:test/presentation/widgets/bottom_navigation.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy book data
    final List<Map<String, dynamic>> books = [
      {'title': 'Book 1', 'author': 'Author 1', 'imageUrl': 'https://booklistqueen.com/wp-content/uploads/i-know-why-the-caged-birds-sing-maya-angelou.jpg', 'rating': 4.5, 'price': '\$20'},
      {'title': 'Book 2', 'author': 'Author 2', 'imageUrl': 'https://www.listchallenges.com/f/items-dl/b96e75c8-aca6-4aad-9531-1d03bc3cecf5.jpg', 'rating': 3.8, 'price': '\$15'},
      {'title': 'Book 3', 'author': 'Author 3', 'imageUrl': 'https://marydrover.files.wordpress.com/2020/10/martinez.jpg', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Book 4', 'author': 'Author 3', 'imageUrl': 'https://marydrover.files.wordpress.com/2020/10/martinez.jpg', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Book 5', 'author': 'Author 3', 'imageUrl': 'https://marydrover.files.wordpress.com/2020/10/martinez.jpg', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Book 6', 'author': 'Author 3', 'imageUrl': 'https://marydrover.files.wordpress.com/2020/10/martinez.jpg', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Book 7', 'author': 'Author 3', 'imageUrl': 'https://marydrover.files.wordpress.com/2020/10/martinez.jpg', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Book 8', 'author': 'Author 3', 'imageUrl': 'https://marydrover.files.wordpress.com/2020/10/martinez.jpg', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Book 9', 'author': 'Author 3', 'imageUrl': 'https://marydrover.files.wordpress.com/2020/10/martinez.jpg', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Book 10', 'author': 'Author 3', 'imageUrl': 'https://marydrover.files.wordpress.com/2020/10/martinez.jpg', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Book 11', 'author': 'Author 3', 'imageUrl': 'https://marydrover.files.wordpress.com/2020/10/martinez.jpg', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Book 12', 'author': 'Author 3', 'imageUrl': 'https://marydrover.files.wordpress.com/2020/10/martinez.jpg', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Book 13', 'author': 'Author 3', 'imageUrl': 'https://marydrover.files.wordpress.com/2020/10/martinez.jpg', 'rating': 4.2, 'price': '\$18'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 350.0,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return _buildBookCard(
            books[index]['title'],
            books[index]['author'],
            books[index]['imageUrl'],
            books[index]['rating'],
            books[index]['price'],
          );
        },
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  Widget _buildBookCard(String title, String author, String imageUrl, double rating, String price) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(8),
      // ),
        child: Column(
          children: [
            // Book Image with border radius
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: SizedBox(
                child: imageUrl.isNotEmpty 
                  ? Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox.shrink(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18.0),
                  const SizedBox(width: 4.0),
                  Text(rating.toString(), style: const TextStyle(fontSize: 14.0)),
                ],
              ),
            ),
            Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 120), 
              child: Text(
                title,
                style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1, 
              ),
            ),
          ),
            // Author
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(author, style: const TextStyle(fontSize: 14.0)),
            ),
            // Price
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(price, style: const TextStyle(fontSize: 14.0)),
            ),
            // Generated code for this Container Widget...
          
          ],
      ),
    );
  }
}
