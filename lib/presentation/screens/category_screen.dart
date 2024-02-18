import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/presentation/widgets/bottom_navigation.dart';

class CategoryItem {
  final String title;
  final String imageUrl;
  // ignore: prefer_typing_uninitialized_variables
  final numberOfProduct;

  CategoryItem({required this.title, required this.imageUrl, required this.numberOfProduct});
}

// ignore: use_key_in_widget_constructors
class CategoryScreen extends StatelessWidget {
  final List<CategoryItem> categories = [
    CategoryItem(
      title: 'Science Fiction',
      imageUrl: 'https://www.bookcoversart.com/wp-content/uploads/2019/12/Science-Fiction-SciFi-SF-Space-Opera-Book-Cover-Hidden-Federation.jpg',
      numberOfProduct: 200,
    ),
    CategoryItem(
      title: 'Mystery & Thriller',
      imageUrl: 'https://www.rockingbookcovers.com/wp-content/uploads/2021/08/41qwC3lHSPS.jpg',
      numberOfProduct: 500,
    ),
    CategoryItem(
      title: 'Fantasy',
      imageUrl: 'https://images-platform.99static.com//PiHWJxAcOnC7gw197YEXKtyxDXQ=/fit-in/500x500/99designs-contests-attachments/39/39493/attachment_39493946',
      numberOfProduct: 480,
    ),
    // Add 10 more categories
    CategoryItem(
      title: 'Romance',
      imageUrl: 'https://bellamediamanagement.com/wp-content/uploads/2020/12/Premadecover121ebook-700x1050.jpg',
      numberOfProduct: 350,
    ),
    CategoryItem(
      title: 'Horror',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9nv5HqDJiJEAK-yg5bTKwv2CEDn5MXc8vIQ&usqp=CAU',
      numberOfProduct: 300,
    ),
    CategoryItem(
      title: 'Adventure',
      imageUrl: 'https://bookcover4u.com/pro/Adventures-book-cover-design-P1475646623ADB-Travel-Around-The-World-travel-life-alone-traveltravel-around-the-world.jpg',
      numberOfProduct: 250,
    ),
    CategoryItem(
      title: 'Historical Fiction',
      imageUrl: 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/4c285e78-23fe-42c3-9dec-3ef2f2eea268/dg24g8s-b7db3397-187d-41ee-a19b-2cf77a68efee.png/v1/fill/w_1280,h_1920,q_80,strp/historical_romance_fiction_book_cover_art_by_sparkletrailstudio_dg24g8s-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTkyMCIsInBhdGgiOiJcL2ZcLzRjMjg1ZTc4LTIzZmUtNDJjMy05ZGVjLTNlZjJmMmVlYTI2OFwvZGcyNGc4cy1iN2RiMzM5Ny0xODdkLTQxZWUtYTE5Yi0yY2Y3N2E2OGVmZWUucG5nIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.J-W6G0BD9bKYVRfpcANkwauLWTVdXYf7SYeJGrUd6vM',
      numberOfProduct: 180,
    ),
    CategoryItem(
      title: 'Biography',
      imageUrl: 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/kindle-book-cover-templates-design-132879592ee469df69ce9cedfcad8fe1.jpg?ts=1664072279',
      numberOfProduct: 220,
    ),
    CategoryItem(
      title: 'Self-Help',
      imageUrl: 'https://i.pinimg.com/736x/77/e7/90/77e7903e0eaa583bd1470eec655013cb.jpg',
      numberOfProduct: 150,
    ),
    CategoryItem(
      title: 'Cooking',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZ_ag-YugnDLcSIR_RMQlEzCMD6TSqXab8bg&usqp=CAU',
      numberOfProduct: 320,
    ),
    CategoryItem(
      title: 'Science',
      imageUrl: 'https://www.mswordcoverpages.com/wp-content/uploads/2023/04/Chemistry-book-cover-page-1-CRC.png',
      numberOfProduct: 280,
    ),
  ];

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
                child: Text('Category'),
              ),
            ),
            Icon(
              Icons.local_mall_outlined,
              color: Colors.blueGrey,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryItemCard(
                  key: Key('category_item_$index'),
                  title: category.title,
                  imageUrl: category.imageUrl,
                  numberOfProduct: category.numberOfProduct, 
                  onTap: () {  },
                );
              },
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                // Add functionality for the plus button
              },
              backgroundColor: const Color(0xFF0C8A7B),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class CategoryItemCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;
  final int numberOfProduct;

  // ignore: use_super_parameters
  const CategoryItemCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
    required this.numberOfProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12), 
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 80,
                height: double.infinity,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            subtitle: Text('$numberOfProduct products'),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.grey,
              semanticLabel: 'Next',
              size: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
