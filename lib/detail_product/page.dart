import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  int _quantity = 1;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final arguments =
        (ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?) ??
            {};
    final name = arguments['name']?.toString() ?? 'Product';
    final price = arguments['price']?.toString() ?? '0';

    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.onSurface.withOpacity(0.08),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.onSurface.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? Colors.red : colorScheme.onSurface,
              ),
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Section with Gradient
            Container(
              height: 380,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primaryContainer.withOpacity(0.7),
                    colorScheme.secondaryContainer.withOpacity(0.4),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: SafeArea(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag_rounded,
                    size: 140,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),

            // Product Info Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Price Tag
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: colorScheme.onSurface,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Rp $price',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Rating and Reviews
                  Row(
                    children: [
                      Icon(Icons.star_rounded,
                          color: Colors.amber[600], size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '4.8',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '(120 reviews)',
                        style: TextStyle(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Description Header
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Description Content
                  Text(
                    'Experience premium comfort and outstanding design with this $name. Designed for versatility and durability, it features high-quality materials to elevate your daily routine.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Quantity Selector
                  Row(
                    children: [
                      Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: colorScheme.onSurface.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (_quantity > 1) {
                                  setState(() {
                                    _quantity--;
                                  });
                                }
                              },
                              icon: const Icon(Icons.remove, size: 20),
                            ),
                            Text(
                              '$_quantity',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _quantity++;
                                });
                              },
                              icon: const Icon(Icons.add, size: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Action Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$name added to cart!'),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: colorScheme.primary,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
