// -------------------------------------------------------
// All Popular Places Screen
// -------------------------------------------------------
// Shown when the user taps the arrow next to
// "Popular in Kuttikanam" on the Home screen.
// Displays all popular destinations as large cards.
// Tapping a card opens LocationOverviewScreen.
// -------------------------------------------------------

import 'package:flutter/material.dart';
import 'location_overview_screen.dart';

class AllPopularPlacesScreen extends StatelessWidget {
  const AllPopularPlacesScreen({super.key});

  static const Color _softGreen = Color(0xFF6B9F6B);

  static const List<Map<String, dynamic>> _places = [
    {
      'name': 'Parunthumpara',
      'subtitle': 'Eagle Rock & Valley Views',
      'rating': 4.7,
      'tags': ['Trekking', 'Viewpoint', 'Photography'],
      'image':
          'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800',
    },
    {
      'name': 'Pine Forest',
      'subtitle': 'Scenic Pine Trails',
      'rating': 4.6,
      'tags': ['Cycling', 'Nature', 'Walks'],
      'image':
          'https://images.unsplash.com/photo-1448375240586-882707db888b?w=800',
    },
    {
      'name': 'Azhutha',
      'subtitle': 'Riverside Charm & Spice Gardens',
      'rating': 4.5,
      'tags': ['River', 'Spices', 'Kayaking'],
      'image':
          'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=800',
    },
    {
      'name': 'Kuttikanam',
      'subtitle': 'Tea Plantations & Hill Station',
      'rating': 4.8,
      'tags': ['Tea', 'Hills', 'Culture'],
      'image':
          'https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=800',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      appBar: AppBar(
        backgroundColor: _softGreen,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Popular in Kuttikanam',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
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
            child: _PlaceCard(place: place),
          );
        },
      ),
    );
  }
}

// -------------------------------------------------------
// Large place card
// -------------------------------------------------------
class _PlaceCard extends StatelessWidget {
  final Map<String, dynamic> place;
  const _PlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    final List<String> tags = List<String>.from(place['tags'] as List);
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image
            Image.network(
              place['image'] as String,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Container(color: const Color(0xFFE0D8C8));
              },
              errorBuilder: (_, __, ___) =>
                  Container(color: const Color(0xFFE0D8C8)),
            ),
            // Gradient overlay
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.72),
                  ],
                  stops: const [0.35, 1.0],
                ),
              ),
            ),
            // Content
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name & rating row
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          place['name'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Icon(Icons.star_rounded,
                          color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        (place['rating'] as double).toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    place['subtitle'] as String,
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  // Tags
                  Wrap(
                    spacing: 6,
                    children: tags
                        .map(
                          (tag) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color:
                                  Colors.white.withValues(alpha: 0.22),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color:
                                      Colors.white.withValues(alpha: 0.4),
                                  width: 1),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            // Arrow indicator
            const Positioned(
              right: 16,
              top: 16,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white24,
                child: Icon(Icons.arrow_forward_ios_rounded,
                    size: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
