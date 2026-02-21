// -------------------------------------------------------
// Explore Screen
// -------------------------------------------------------
// Shows all locations as cards users can browse.
// Tapping a location navigates to RestaurantsScreen
// for that place.
// -------------------------------------------------------

import 'package:flutter/material.dart';
import 'restaurants_screen.dart';
import 'hotels_screen.dart';
import 'homestays_screen.dart';
import 'activities_screen.dart';
import 'location_overview_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static const Color _softGreen = Color(0xFF6B9F6B);

  // All the popular places to explore
  static const List<Map<String, dynamic>> _places = [
    {
      'name': 'Parunthumpara',
      'subtitle': 'Eagle Rock & Valley Views',
      'rating': 4.7,
      'image':
          'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=600',
    },
    {
      'name': 'Pine Forest',
      'subtitle': 'Scenic Pine Trails',
      'rating': 4.6,
      'image':
          'https://images.unsplash.com/photo-1448375240586-882707db888b?w=600',
    },
    {
      'name': 'Azhutha',
      'subtitle': 'Riverside Charm',
      'rating': 4.5,
      'image':
          'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=600',
    },
    {
      'name': 'Kuttikanam',
      'subtitle': 'Tea Plantations & Hills',
      'rating': 4.8,
      'image':
          'https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=600',
    },
  ];

  // Quick-access category chips
  static const List<Map<String, dynamic>> _categories = [
    {'label': 'Hotels', 'icon': Icons.hotel_rounded},
    {'label': 'Restaurants', 'icon': Icons.restaurant_rounded},
    {'label': 'Homestays', 'icon': Icons.home_rounded},
    {'label': 'Activities', 'icon': Icons.directions_bike_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 4),
                child: Text(
                  'Explore',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Discover the beauty of Kuttikanam',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ),

              const SizedBox(height: 20),

              // Category chips (horizontal scroll)
              SizedBox(
                height: 44,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: _categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final cat = _categories[index];
                    return ActionChip(
                      avatar: Icon(cat['icon'] as IconData,
                          size: 18, color: _softGreen),
                      label: Text(cat['label'] as String),
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        _navigateToCategory(
                            context, cat['label'] as String);
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Section title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Popular Destinations',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Place cards
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _places.length,
                itemBuilder: (context, index) {
                  final place = _places[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LocationOverviewScreen(
                            placeName: place['name'] as String,
                            imageUrl: place['image'] as String,
                            rating: place['rating'] as double,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 160,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.10),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              place['image'] as String,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                  color: const Color(0xFFE0D8C8)),
                            ),
                            // Gradient
                            DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withValues(alpha: 0.65),
                                  ],
                                  stops: const [0.4, 1.0],
                                ),
                              ),
                            ),
                            // Text
                            Positioned(
                              left: 16,
                              bottom: 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    place['name'] as String,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    place['subtitle'] as String,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigate to the screen for the tapped category chip.
  void _navigateToCategory(BuildContext context, String label) {
    Widget screen;
    switch (label) {
      case 'Hotels':
        screen = const HotelsScreen();
        break;
      case 'Restaurants':
        screen = const RestaurantsScreen(selectedLocation: 'Kuttikanam');
        break;
      case 'Homestays':
        screen = const HomestaysScreen();
        break;
      case 'Activities':
        screen = const ActivitiesScreen();
        break;
      default:
        return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }
}
