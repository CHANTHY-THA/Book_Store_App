import 'package:flutter/material.dart';
import 'package:test/presentation/widgets/bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
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
                  hintText: 'Search for books...',
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
            _buildBookCardList(), 

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
            _buildTrendingCardList(),
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

  Widget _buildBookCardList() {
    // Dummy book data
    final List<Map<String, dynamic>> books = [
      {'title': 'Book 1 testing testing testing', 'author': 'Author 1', 'imageUrl': 'https://booklistqueen.com/wp-content/uploads/i-know-why-the-caged-birds-sing-maya-angelou.jpg', 'rating': 4.5, 'price': '\$20'},
      {'title': 'Book 2', 'author': 'Author 2', 'imageUrl': 'https://www.listchallenges.com/f/items-dl/b96e75c8-aca6-4aad-9531-1d03bc3cecf5.jpg', 'rating': 3.8, 'price': '\$15'},
      {'title': 'Book 3', 'author': 'Author 3', 'imageUrl': 'https://marydrover.files.wordpress.com/2020/10/martinez.jpg', 'rating': 4.2, 'price': '\$18'},
    ];

    // Build book card list
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, 
      child: Row(
        children: books.map((book) {
          return _buildBookCard(book['title'], book['author'], book['imageUrl'], book['rating'], book['price']);
        }).toList(),
      ),
    );
  }

  Widget _buildTrendingCardList() {
  // Dummy trending data
  final List<Map<String, dynamic>> trendingBooks = [
    {'title': 'Trending 1 sdfsd fsdfsdf sdfsdfsf', 'author': 'Author A', 'imageUrl': 'https://images.penguinrandomhouse.com/cover/9780735211247'},
    {'title': 'Trending 2', 'author': 'Author B', 'imageUrl': 'https://i.pinimg.com/474x/34/94/49/349449e0d5de052f6c34fe0f089c568d.jpg'},
    {'title': 'Trending 3', 'author': 'Author C', 'imageUrl': 'https://i.pinimg.com/736x/85/8d/c5/858dc52ccdf8e2bc9deff1cb352c3033.jpg'},
  ];

  // Build trending card list
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal, 
    child: Row(
      children: [
        for (final book in trendingBooks)
          _buildBookCard(book['title'], book['author'], book['imageUrl'], 0, ''), 
      ],
    ),
  );
}

 Widget _buildBookCard(String title, String author, String imageUrl, double rating, String price) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    elevation: 0, 
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Book Image with border radius
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
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(author, style: const TextStyle(fontSize: 14.0)),
        ),
        // Price
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(price, style: const TextStyle(fontSize: 14.0)),
        ),
      ],
    ),
  );
}


}
