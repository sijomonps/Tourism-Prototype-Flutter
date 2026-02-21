// -------------------------------------------------------
// Search Screen
// -------------------------------------------------------
// Full‑screen search with filtering across hotels,
// restaurants, homestays, and activities.
// -------------------------------------------------------

import 'package:flutter/material.dart';
import '../models/hotel_model.dart';
import '../models/restaurant_model.dart';
import '../models/homestay_model.dart';
import '../models/activity_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<_SearchResult> _results = [];

  static const Color _softGreen = Color(0xFF6B9F6B);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Search across all data models by name.
  void _search(String query) {
    if (query.trim().isEmpty) {
      setState(() => _results = []);
      return;
    }

    final q = query.toLowerCase();
    final List<_SearchResult> matches = [];

    // Search hotels
    for (final h in allHotels) {
      if (h.name.toLowerCase().contains(q) ||
          h.location.toLowerCase().contains(q)) {
        matches.add(_SearchResult(
          name: h.name,
          subtitle: '${h.location} • ${h.priceRange}',
          icon: Icons.hotel_rounded,
          type: 'Hotel',
        ));
      }
    }

    // Search restaurants
    for (final r in allRestaurants) {
      if (r.name.toLowerCase().contains(q) ||
          r.location.toLowerCase().contains(q)) {
        matches.add(_SearchResult(
          name: r.name,
          subtitle: '${r.location} • ★ ${r.rating}',
          icon: Icons.restaurant_rounded,
          type: 'Restaurant',
        ));
      }
    }

    // Search homestays
    for (final hs in allHomestays) {
      if (hs.name.toLowerCase().contains(q) ||
          hs.location.toLowerCase().contains(q)) {
        matches.add(_SearchResult(
          name: hs.name,
          subtitle: '${hs.location} • ${hs.priceRange}',
          icon: Icons.home_rounded,
          type: 'Homestay',
        ));
      }
    }

    // Search activities
    for (final a in allActivities) {
      if (a.name.toLowerCase().contains(q) ||
          a.location.toLowerCase().contains(q)) {
        matches.add(_SearchResult(
          name: a.name,
          subtitle: '${a.location} • ${a.duration}',
          icon: Icons.directions_bike_rounded,
          type: 'Activity',
        ));
      }
    }

    setState(() => _results = matches);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      appBar: AppBar(
        backgroundColor: _softGreen,
        foregroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          controller: _controller,
          autofocus: true,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            hintText: 'Search hotels, restaurants, activities...',
            hintStyle: TextStyle(color: Colors.white60, fontSize: 15),
            border: InputBorder.none,
          ),
          onChanged: _search,
        ),
        actions: [
          if (_controller.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () {
                _controller.clear();
                _search('');
              },
            ),
        ],
      ),
      body: _results.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search_rounded,
                      size: 64, color: Colors.grey.shade300),
                  const SizedBox(height: 14),
                  Text(
                    _controller.text.isEmpty
                        ? 'Type to search...'
                        : 'No results found',
                    style: TextStyle(
                        fontSize: 16, color: Colors.grey.shade500),
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _results.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final result = _results[index];
                return ListTile(
                  leading: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: _softGreen.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(result.icon, color: _softGreen, size: 20),
                  ),
                  title: Text(
                    result.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  subtitle: Text(result.subtitle,
                      style: TextStyle(
                          fontSize: 12, color: Colors.grey.shade600)),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: _softGreen.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      result.type,
                      style: const TextStyle(
                          fontSize: 11,
                          color: _softGreen,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Opening ${result.name}...'),
                        backgroundColor: _softGreen,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

/// Simple data class for search results.
class _SearchResult {
  final String name;
  final String subtitle;
  final IconData icon;
  final String type;

  const _SearchResult({
    required this.name,
    required this.subtitle,
    required this.icon,
    required this.type,
  });
}
