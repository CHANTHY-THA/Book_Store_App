import 'package:flutter/material.dart';
import 'package:test/presentation/widgets/bottom_navigation.dart';

class CartItem {
  final String productName;
  final String author; 
  final double price;
  final int quantity;
  final String imageUrl; 

  CartItem({
    required this.productName,
    required this.author, 
    required this.price,
    required this.quantity,
    required this.imageUrl, 
  });
}

class CartScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CartScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for cart items
    final List<CartItem> cartItems = [
      CartItem(
        productName: 'The Great Gatsby',
        author: 'F. Scott Fitzgerald',
        price: 10.99,
        quantity: 2,
        imageUrl: 'https://www.shutterstock.com/blog/wp-content/uploads/sites/5/2022/05/Black-book-cover-by-Anar-Gulyev-via-Behance.jpg?w=720',
      ),
      CartItem(
        productName: 'To Kill a Mockingbird',
        author: 'Harper Lee', 
        price: 12.99,
        quantity: 1,
        imageUrl: 'https://5.imimg.com/data5/IU/SQ/GD/SELLER-43618059/book-cover-page-design.jpg',
      ),
      CartItem(
        productName: '1984',
        author: 'George Orwell',
        price: 9.99,
        quantity: 3,
        imageUrl: 'https://mapsystemsindia.com/images/Graphics/book-cover.jpg',
      ),
      // Add more products here
      CartItem(
        productName: 'Pride and Prejudice',
        author: 'Jane Austen',
        price: 8.99,
        quantity: 1,
        imageUrl: 'https://images.penguinrandomhouse.com/cover/9780143105428',
      ),
      CartItem(
        productName: 'The Catcher in the Rye',
        author: 'J.D. Salinger',
        price: 11.49,
        quantity: 2,
        imageUrl: 'https://images.newrepublic.com/dec8cb1ed9b399a3a1d2c62007d72cac9a17b80e.jpeg?auto=compress&w=768&h=undefined&ar=3%3A2&fit=crop&crop=faces&q=65&fm=jpg&ixlib=react-9.0.2',
      ),
      CartItem(
        productName: 'The Hobbit',
        author: 'J.R.R. Tolkien',
        price: 15.79,
        quantity: 1,
        imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkJjpk3OjPXcGDTMxtcWOy_KwaP35SWeAjur_-XoHc-h2x8WBadWqMJ95DxtVMAU7No4M&usqp=CAU',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        title: const Text('Shopping Cart'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Add delete action
            },
            icon: const Icon(Icons.delete_sweep_outlined),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF9F9F9), 
        child: Padding(
          padding: const EdgeInsets.all(16), 
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return CartItemCard(
                productName: item.productName,
                author: item.author,
                price: item.price,
                quantity: item.quantity,
                imageUrl: item.imageUrl, 
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class CartItemCard extends StatefulWidget {
  final String productName;
  final String author;
  final double price;
  final int quantity;
  final String imageUrl; 

  // ignore: use_key_in_widget_constructors
  const CartItemCard({
    required this.productName,
    required this.author,
    required this.price,
    required this.quantity,
    required this.imageUrl, 
  });

  @override
  // ignore: library_private_types_in_public_api
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  int _quantity = 0;

  @override
  void initState() {
    super.initState();
    _quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      elevation: 0, 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), 
      color: Colors.white, 
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, 
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'by ${widget.author}', 
                    maxLines: 1, 
                    overflow: TextOverflow.ellipsis, 
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${widget.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 14, color: Colors.orange),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center( 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end, 
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey.withOpacity(0.1), 
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (_quantity > 0) {
                            setState(() {
                              _quantity--;
                            });
                          }
                        },
                        icon: const Icon(Icons.remove, size: 16, color: Colors.blueGrey),
                      ),
                    ),
                    const SizedBox(width: 8), 
                    Text(
                      '$_quantity',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 8), 
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF0C8A7B).withOpacity(0.1),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _quantity++;
                          });
                        },
                        icon: const Icon(Icons.add, size: 16, color: Color(0xFF0C8A7B)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}