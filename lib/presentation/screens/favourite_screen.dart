import 'package:flutter/material.dart';
import 'package:test/presentation/screens/book_details_screen.dart';
import 'package:test/presentation/widgets/bottom_navigation.dart';
// import 'package:test/presentation/screens/book_detail_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy book data
    final List<Map<String, dynamic>> books = [
      {'title': 'To Kill a Mockingbird', 'author': 'Harper Lee', 'imageUrl': 'https://craig519809home.files.wordpress.com/2018/12/war-of-the-worlds.jpg?w=1088', 'rating': 4.5, 'price': '\$20'},
      {'title': '1984', 'author': 'George Orwell', 'imageUrl': 'https://fiverr-res.cloudinary.com/images/t_main1,q_auto,f_auto,q_auto,f_auto/gigs/176798931/original/38d9fab8b8c73b1299c35a2372d77243a45a6211/create-modern-minimalist-book-cover-design-or-kindle-cover.jpg', 'rating': 3.8, 'price': '\$15'},
      {'title': 'The Great Gatsby', 'author': 'F. Scott Fitzgerald', 'imageUrl': 'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs2/176798931/original/faafc7e14dca2e2ae5914f4b916a46b9f9451134/create-modern-minimalist-book-cover-design-or-kindle-cover.jpg', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Pride and Prejudice', 'author': 'Jane Austen', 'imageUrl': 'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/297771397/original/73df73a135a1f19125e41316d350c31a911a4397/design-minimalist-poetry-book-cover.jpg', 'rating': 4.2, 'price': '\$18'},
      {'title': 'The Catcher in the Rye', 'author': 'J.D. Salinger', 'imageUrl': 'https://5.imimg.com/data5/IU/SQ/GD/SELLER-43618059/book-cover-page-design.jpg', 'rating': 4.2, 'price': '\$18'},
      {'title': 'To Kill a Mockingbird', 'author': 'Harper Lee', 'imageUrl': 'https://dcassetcdn.com/design_img/3887659/123406/25274698/ccmdgg3qgz9gavf1k9r27ra5rc_image.png', 'rating': 4.2, 'price': '\$18'},
      {'title': 'The Hobbit', 'author': 'J.R.R. Tolkien', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS28IJQVmEycEIcNgiHdSZQtR1MIRN7pNgyBz2iNl-tUEFC5rGlcD9DDxkad37-PKLrE6g&usqp=CAU', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Animal Farm', 'author': 'George Orwell', 'imageUrl': 'https://cdn.dribbble.com/userupload/7448745/file/original-0ac72bf5df7bc32482fad9e30108d0bb.png?resize=752x', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Brave New World', 'author': 'Aldous Huxley', 'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAwMgj7iQjdtTd36DmLKbA0TmNRvev0drVfslUf-YjYA5VYyZ1FvvIEG6J3Fb1jox6n1Y&usqp=CAU', 'rating': 4.2, 'price': '\$18'},
      {'title': 'The Lord of the Rings', 'author': 'J.R.R. Tolkien', 'imageUrl': 'https://img.freepik.com/free-vector/orange-annual-report-template_1409-157.jpg?size=626&ext=jpg&ga=GA1.1.208150102.1708456772&semt=ais', 'rating': 4.2, 'price': '\$18'},
      {'title': 'The Little Prince', 'author': 'Antoine de Saint-Exupéry', 'imageUrl': 'https://img.freepik.com/free-vector/company-business-annual-report-brichure-template-design_1017-26808.jpg?size=626&ext=jpg&ga=GA1.1.208150102.1708456772&semt=ais', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Harry Potter and the Sorcerer\'s Stone', 'author': 'J.K. Rowling', 'imageUrl': 'https://img.freepik.com/free-vector/abstract-elegant-winter-book-cover_23-2148798745.jpg?size=626&ext=jpg&ga=GA1.1.208150102.1708456772&semt=ais', 'rating': 4.2, 'price': '\$18'},
      {'title': 'Moby-Dick', 'author': 'Herman Melville', 'imageUrl': 'https://mir-s3-cdn-cf.behance.net/project_modules/1400/f1284291229191.5e2c46564f4ff.jpg', 'rating': 4.2, 'price': '\$18'},
    ];

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
                child: Text('Favourite'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 260.0,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return _BookCard(
              title: books[index]['title'],
              author: books[index]['author'],
              imageUrl: books[index]['imageUrl'],
              rating: books[index]['rating'],
              price: books[index]['price'],
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class _BookCard extends StatefulWidget {
  final String title;
  final String author;
  final String imageUrl;
  final double rating;
  final String price;

  const _BookCard({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.rating,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<_BookCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailScreen(
              title: widget.title,
              author: widget.author,
              imageUrl: widget.imageUrl,
              rating: widget.rating,
              price: widget.price,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                  child: SizedBox(
                    child: widget.imageUrl.isNotEmpty
                        ? Image.network(
                      widget.imageUrl,
                      width: double.infinity,
                      height: 140,
                      fit: BoxFit.cover,
                    )
                        : const SizedBox.shrink(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18.0),
                      const SizedBox(width: 4.0),
                      Text(widget.rating.toString(), style: const TextStyle(fontSize: 14.0)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 120),
                    child: Text(
                      widget.title,
                      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  child: Text(
                    widget.author,
                    style: const TextStyle(fontSize: 14.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                  child: Text(widget.price, style: const TextStyle(fontSize: 14.0, color: Colors.orange)),
                ),
              ],
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? Colors.blue : Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(
                      isSelected ? Icons.favorite : Icons.favorite_border_outlined,
                      color: isSelected ? Colors.white : Colors.blueGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
