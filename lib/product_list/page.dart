import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final int price;

  Product({
    required this.id,
    required this.name,
    required this.price,
  });
}

class ProductList extends StatelessWidget {
  ProductList({super.key});

  final List<Product> _products = [
    Product(
      id: 1,
      name: 'Product 1',
      price: 1000000,
    ),
    Product(
      id: 2,
      name: 'Product 2',
      price: 2000000,
    ),
    Product(
      id: 3,
      name: 'Product 3',
      price: 3000000,
    ),
    Product(
      id: 4,
      name: 'Product 4',
      price: 4000000,
    ),
    Product(
      id: 5,
      name: 'Product 5',
      price: 5000000,
    ),
    Product(
      id: 6,
      name: 'Product 6',
      price: 6000000,
    ),
    Product(
      id: 7,
      name: 'Product 7',
      price: 7000000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 0.85,
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/detail-product', arguments: {
                'name': product.name,
                'price': product.price,
              });
            },
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            size: 40,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp ${product.price}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
