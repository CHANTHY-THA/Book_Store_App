import 'package:flutter/material.dart';
import 'package:test/presentation/screens/book_details_screen.dart';
import 'package:test/presentation/widgets/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9), 
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9), 
        title: const Row(
          children: [
            Icon(Icons.book),
            SizedBox(width: 8), 
            Text('Fly Book'),
          ],
        ),
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for books',
                  suffixIcon: Icon(Icons.search), 
                  border: InputBorder.none, 
                ),
              ),
            ),
            // Best Selling Books Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionHeader('Best Selling Books'),
                TextButton(
                  onPressed: () {
                    // Handle See All button tap
                  },
                  child: const Text('See All'),
                ),
              ],
            ),
            // Dummy data for best selling books
            _buildBookCardList(context), 

            // Trending Now Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSectionHeader('Trending Now'),
                TextButton(
                  onPressed: () {
                    // Handle See All button tap
                  },
                  child: const Text('See All'),
                ),
              ],
            ),
            _buildTrendingCardList(context),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBookCardList(BuildContext context) {
    // Dummy book data
    final List<Map<String, dynamic>> books = [
      {
        'title': 'I Know Why the Caged Bird Sings',
        'author': 'Maya Angelou',
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMWSVBqMnwbMoAKO3_az2lEL3TCKFkutl2m44-AnA4k_c4Lh61OQPpIwIuoirQrnWWo6A&usqp=CAU',
        'rating': 4.5,
        'price': '\$20'
      },
      {
        'title': 'To Kill a Mockingbird',
        'author': 'Harper Lee',
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoSPV2sKfEiqp2UB9Ikb38zIZesRdbYEwIHvQbv9S8vFXoCm_X_IFL40iVOLKZjGMdh00&usqp=CAU',
        'rating': 3.8,
        'price': '\$15'
      },
      {
        'title': 'The Great Gatsby',
        'author': 'F. Scott Fitzgerald',
        'imageUrl': 'https://www.jasongurley.com/content/images/2023/11/64-Lusted---September-3.jpg',
        'rating': 4.2,
        'price': '\$18'
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, 
      child: Row(
        children: books.map((book) {
          return _buildBookCard(context, book['title'], book['author'], book['imageUrl'], book['rating'], book['price']);
        }).toList(),
      ),
    );
  }

  Widget _buildTrendingCardList(BuildContext context) {
    // Dummy trending data
    final List<Map<String, dynamic>> trendingBooks = [
      {
        'title': 'Where the Crawdads Sing',
        'author': 'Delia Owens',
        'imageUrl': 'https://www.jasongurley.com/content/images/2023/11/39-Elliot---Aberrated.jpg',
      },
      {
        'title': 'The Nightingale',
        'author': 'Kristin Hannah',
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn7um1Syha7xc6UIfu19gXkgXEMnaNJOx7AGuItcpTnEDY-NEt5SpVRG7aAi8DzT-Pkqo&usqp=CAU',
      },
      {
        'title': 'Educated: A Memoir',
        'author': 'Tara Westover',
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSYsrXKSOR6GVRl69sFLEhlInX1NNVyJ7xAoAPVfpWI3609uXpb5ArX6nLc5S5a7sdJ00&usqp=CAU',
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, 
      child: Row(
        children: [
          for (final book in trendingBooks)
            _buildBookCard(context, book['title'], book['author'], book['imageUrl'], 0, ''), 
        ],
      ),
    );
  }

  Widget _buildBookCard(BuildContext context, String title, String author, String imageUrl, double rating, String price) {
    return GestureDetector(
      onTap: () {
        // Navigate to book detail screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailScreen(
              title: title,
              author: author,
              imageUrl: imageUrl,
              rating: rating,
              price: price,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        elevation: 0,
        color: const Color(0xFFF9F9F9), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: SizedBox(
                width: 120,
                height: 160,
                child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox.shrink(),
              ),
            ),
            // Star Rating
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

            // Author
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(author, style: const TextStyle(fontSize: 14.0)),
            ),

            // Title
            SizedBox(
              width: 120,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
            ),
            
            // Price
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(price, style: const TextStyle(fontSize: 14.0, color: Colors.orange)),
            ),
          ],
        ),
      ),
    );
  }
}

// class BookDetailScreen extends StatelessWidget {
//   final String title;
//   final String author;
//   final String imageUrl;
//   final double rating;
//   final String price;

//   const BookDetailScreen({
//     required this.title,
//     required this.author,
//     required this.imageUrl,
//     required this.rating,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Author: $author'),
//             Text('Rating: $rating'),
//             Text('Price: $price'),
//             imageUrl.isNotEmpty
//                 ? Image.network(
//                     imageUrl,
//                     width: 200,
//                     height: 200,
//                     fit: BoxFit.cover,
//                   )
//                 : SizedBox.shrink(),
//           ],
//         ),
//       ),
//     );
//   }
// }
