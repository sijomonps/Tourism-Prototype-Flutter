// -------------------------------------------------------
// Place Detail Screen
// -------------------------------------------------------
// Shown when a user taps a popular place card.
// Displays information about the place and provides
// quick links to view restaurants, hotels, homestays,
// and activities in that location.
// -------------------------------------------------------

import 'package:flutter/material.dart';
import '../models/restaurant_model.dart';
import '../models/hotel_model.dart';
import '../models/homestay_model.dart';
import '../models/activity_model.dart';
import 'restaurants_screen.dart';

class PlaceDetailScreen extends StatelessWidget {
  final String placeName;
  final double rating;
  final String imageUrl;

  const PlaceDetailScreen({
    super.key,
    required this.placeName,
    required this.rating,
    required this.imageUrl,
  });

  static const Color _softGreen = Color(0xFF6B9F6B);

  @override
  Widget build(BuildContext context) {
    // Count items available in this location
    final int restaurantCount =
        allRestaurants.where((r) => r.location == placeName).length;
    final int hotelCount =
        allHotels.where((h) => h.location == placeName).length;
    final int homestayCount =
        allHomestays.where((h) => h.location == placeName).length;
    final int activityCount =
        allActivities.where((a) => a.location == placeName).length;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: CustomScrollView(
        slivers: [
          // ---------- Collapsing hero app bar ----------
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: _softGreen,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                placeName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  shadows: [
                    Shadow(blurRadius: 8, color: Colors.black54),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(imageUrl, fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                    return Container(color: const Color(0xFFE0D8C8));
                  }),
                  // Gradient scrim
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.55),
                        ],
                        stops: const [0.5, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ---------- Content ----------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating row
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: Colors.amber, size: 22),
                      const SizedBox(width: 6),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C2C2C),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Popular Destination',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade600),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Description
                  Text(
                    _descriptionFor(placeName),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // What's here section
                  const Text(
                    'What\'s Here',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C2C2C),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Quick stat cards
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 2.2,
                    children: [
                      _StatTile(
                        icon: Icons.restaurant_rounded,
                        label: 'Restaurants',
                        count: restaurantCount,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RestaurantsScreen(
                                  selectedLocation: placeName),
                            ),
                          );
                        },
                      ),
                      _StatTile(
                        icon: Icons.hotel_rounded,
                        label: 'Hotels',
                        count: hotelCount,
                      ),
                      _StatTile(
                        icon: Icons.home_rounded,
                        label: 'Homestays',
                        count: homestayCount,
                      ),
                      _StatTile(
                        icon: Icons.directions_bike_rounded,
                        label: 'Activities',
                        count: activityCount,
                      ),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // "View Restaurants" button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RestaurantsScreen(
                                selectedLocation: placeName),
                          ),
                        );
                      },
                      icon: const Icon(Icons.restaurant_rounded),
                      label: const Text('View Restaurants'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _softGreen,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Returns a short description paragraph per location.
  String _descriptionFor(String name) {
    switch (name) {
      case 'Parunthumpara':
        return 'Parunthumpara, meaning "Eagle Rock", is a breathtaking viewpoint '
            'perched atop the Western Ghats. Visitors flock here for the stunning '
            'panoramic views of the valleys, misty mornings, and the famous eagle-shaped '
            'rock formation. It is one of the most photographed spots near Kuttikanam.';
      case 'Pine Forest':
        return 'The Pine Forest near Kuttikanam is a serene stretch of towering pine trees '
            'that create a magical, cathedral-like canopy. Perfect for morning walks, cycling, '
            'and photography, this enchanting forest offers a peaceful escape from the bustle '
            'of everyday life.';
      case 'Azhutha':
        return 'Azhutha is a charming riverside hamlet known for its spice gardens, traditional '
            'Kerala cuisine, and tranquil waterways. It offers an authentic glimpse into the '
            'rural life of the Western Ghats with pepper, cardamom, and coffee plantations.';
      default:
        return 'A beautiful destination in the Kuttikanam region of Kerala\'s Western Ghats. '
            'Known for tea plantations, cool climate, and warm hospitality.';
    }
  }
}

// -------------------------------------------------------
// Stat tile for "What's Here" grid
// -------------------------------------------------------
class _StatTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;
  final VoidCallback? onTap;

  const _StatTile({
    required this.icon,
    required this.label,
    required this.count,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF6B9F6B), size: 22),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$count found',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
