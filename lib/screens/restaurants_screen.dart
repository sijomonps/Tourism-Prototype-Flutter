// -------------------------------------------------------
// Restaurants Screen
// -------------------------------------------------------
// Displays a filtered list of restaurants based on the
// selected popular location passed via the constructor.
//
// Uses the hardcoded restaurant list from the model
// and filters with:
//   restaurants.where((r) => r.location == selectedLocation)
// -------------------------------------------------------

import 'package:flutter/material.dart';
import '../models/restaurant_model.dart';

class RestaurantsScreen extends StatelessWidget {
  /// The popular place name used to filter restaurants.
  final String selectedLocation;

  const RestaurantsScreen({
    super.key,
    required this.selectedLocation,
  });

  // Soft green accent color (same as home screen)
  static const Color _softGreen = Color(0xFF6B9F6B);

  @override
  Widget build(BuildContext context) {
    // -------------------------------------------------------
    // Filter restaurants whose location matches the selected
    // popular place.
    // -------------------------------------------------------
    final List<Restaurant> filteredRestaurants = allRestaurants
        .where((r) => r.location == selectedLocation)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      // ---------- App bar ----------
      appBar: AppBar(
        backgroundColor: _softGreen,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Restaurants in $selectedLocation',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: filteredRestaurants.isEmpty
          // ---------- Empty state ----------
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.restaurant_menu_rounded,
                      size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 14),
                  Text(
                    'No restaurants found\nin $selectedLocation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            )
          // ---------- Restaurant list ----------
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredRestaurants.length,
              itemBuilder: (context, index) {
                final restaurant = filteredRestaurants[index];
                return _RestaurantCard(restaurant: restaurant);
              },
            ),
    );
  }
}

// -------------------------------------------------------
// Private restaurant card widget
// -------------------------------------------------------
class _RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const _RestaurantCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- Restaurant image ----------
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: Image.network(
              restaurant.image,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Container(
                  height: 170,
                  color: const Color(0xFFE0D8C8),
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Color(0xFF6B9F6B),
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stack) => Container(
                height: 170,
                color: const Color(0xFFE0D8C8),
                child: const Center(
                  child:
                      Icon(Icons.broken_image_rounded, color: Colors.grey),
                ),
              ),
            ),
          ),

          // ---------- Text content ----------
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name + rating row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Restaurant name
                    Expanded(
                      child: Text(
                        restaurant.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C2C2C),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Star + rating
                    Row(
                      children: [
                        const Icon(Icons.star_rounded,
                            color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          restaurant.rating.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3C3C3C),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Description
                Text(
                  restaurant.description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
