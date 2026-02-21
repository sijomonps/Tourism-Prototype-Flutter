// -------------------------------------------------------
// Location Overview Screen
// -------------------------------------------------------
// Shown when a user taps a popular place (from either
// AllPopularPlacesScreen or PlaceDetailScreen).
//
// Displays a collapsing hero header and 4 tabs:
//   Restaurants | Hotels | Homestays | Activities
//
// Each tab shows a 2-column grid of items filtered
// to this location.
// -------------------------------------------------------

import 'package:flutter/material.dart';
import '../models/restaurant_model.dart';
import '../models/hotel_model.dart';
import '../models/homestay_model.dart';
import '../models/activity_model.dart';

class LocationOverviewScreen extends StatelessWidget {
  final String placeName;
  final String imageUrl;
  final double rating;

  const LocationOverviewScreen({
    super.key,
    required this.placeName,
    required this.imageUrl,
    required this.rating,
  });

  static const Color _softGreen = Color(0xFF6B9F6B);

  @override
  Widget build(BuildContext context) {
    // Filter data per location
    final restaurants =
        allRestaurants.where((r) => r.location == placeName).toList();
    final hotels =
        allHotels.where((h) => h.location == placeName).toList();
    final homestays =
        allHomestays.where((h) => h.location == placeName).toList();
    final activities =
        allActivities.where((a) => a.location == placeName).toList();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F6F0),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            // ---------- Collapsing hero ----------
            SliverAppBar(
              expandedHeight: 240,
              pinned: true,
              backgroundColor: _softGreen,
              foregroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  placeName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    shadows: [Shadow(blurRadius: 8, color: Colors.black54)],
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          Container(color: const Color(0xFFE0D8C8)),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.60),
                          ],
                          stops: const [0.4, 1.0],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ---------- Tab bar ----------
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarDelegate(
                TabBar(
                  labelColor: _softGreen,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: _softGreen,
                  indicatorWeight: 3,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 13),
                  unselectedLabelStyle: const TextStyle(fontSize: 13),
                  isScrollable: false,
                  tabs: [
                    _buildTab(Icons.restaurant_rounded, 'Food',
                        restaurants.length),
                    _buildTab(
                        Icons.hotel_rounded, 'Hotels', hotels.length),
                    _buildTab(
                        Icons.home_rounded, 'Stays', homestays.length),
                    _buildTab(Icons.directions_bike_rounded, 'Do',
                        activities.length),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              // Tab 1 – Restaurants
              _GridTab<Restaurant>(
                items: restaurants,
                emptyLabel: 'No restaurants in $placeName',
                emptyIcon: Icons.restaurant_menu_rounded,
                cardBuilder: (item) => _RestaurantGridCard(item: item),
              ),
              // Tab 2 – Hotels
              _GridTab<Hotel>(
                items: hotels,
                emptyLabel: 'No hotels in $placeName',
                emptyIcon: Icons.hotel_rounded,
                cardBuilder: (item) => _HotelGridCard(item: item),
              ),
              // Tab 3 – Homestays
              _GridTab<Homestay>(
                items: homestays,
                emptyLabel: 'No homestays in $placeName',
                emptyIcon: Icons.home_rounded,
                cardBuilder: (item) => _HomestayGridCard(item: item),
              ),
              // Tab 4 – Activities
              _GridTab<Activity>(
                items: activities,
                emptyLabel: 'No activities in $placeName',
                emptyIcon: Icons.directions_bike_rounded,
                cardBuilder: (item) => _ActivityGridCard(item: item),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Tab _buildTab(IconData icon, String label, int count) {
    return Tab(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18),
          Text('$label ($count)'),
        ],
      ),
    );
  }
}

// -------------------------------------------------------
// Generic 2-column grid tab
// -------------------------------------------------------
class _GridTab<T> extends StatelessWidget {
  final List<T> items;
  final String emptyLabel;
  final IconData emptyIcon;
  final Widget Function(T item) cardBuilder;

  const _GridTab({
    required this.items,
    required this.emptyLabel,
    required this.emptyIcon,
    required this.cardBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(emptyIcon, size: 64, color: Colors.grey.shade300),
            const SizedBox(height: 14),
            Text(emptyLabel,
                style: TextStyle(
                    fontSize: 15, color: Colors.grey.shade500)),
          ],
        ),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.all(14),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.78,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => cardBuilder(items[index]),
    );
  }
}

// -------------------------------------------------------
// Per-type grid cards
// -------------------------------------------------------

class _RestaurantGridCard extends StatelessWidget {
  final Restaurant item;
  const _RestaurantGridCard({required this.item});
  @override
  Widget build(BuildContext context) => _BaseGridCard(
        image: item.image,
        name: item.name,
        rating: item.rating,
        line2: item.description,
        badge: null,
      );
}

class _HotelGridCard extends StatelessWidget {
  final Hotel item;
  const _HotelGridCard({required this.item});
  @override
  Widget build(BuildContext context) => _BaseGridCard(
        image: item.image,
        name: item.name,
        rating: item.rating,
        line2: item.priceRange,
        badge: null,
      );
}

class _HomestayGridCard extends StatelessWidget {
  final Homestay item;
  const _HomestayGridCard({required this.item});
  @override
  Widget build(BuildContext context) => _BaseGridCard(
        image: item.image,
        name: item.name,
        rating: item.rating,
        line2: item.priceRange,
        badge: '${item.maxGuests} guests',
      );
}

class _ActivityGridCard extends StatelessWidget {
  final Activity item;
  const _ActivityGridCard({required this.item});
  @override
  Widget build(BuildContext context) => _BaseGridCard(
        image: item.image,
        name: item.name,
        rating: item.rating,
        line2: item.duration,
        badge: item.difficulty,
        badgeColor: item.difficulty == 'Easy'
            ? const Color(0xFF6B9F6B)
            : item.difficulty == 'Moderate'
                ? Colors.orange
                : Colors.redAccent,
      );
}

// -------------------------------------------------------
// Base grid card (image + info rows)
// -------------------------------------------------------
class _BaseGridCard extends StatelessWidget {
  final String image;
  final String name;
  final double rating;
  final String line2;
  final String? badge;
  final Color? badgeColor;

  const _BaseGridCard({
    required this.image,
    required this.name,
    required this.rating,
    required this.line2,
    required this.badge,
    this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18)),
            child: Stack(
              children: [
                Image.network(
                  image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (ctx, child, prog) {
                    if (prog == null) return child;
                    return Container(
                      height: 120,
                      color: const Color(0xFFE0D8C8),
                      child: const Center(
                        child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Color(0xFF6B9F6B)),
                      ),
                    );
                  },
                  errorBuilder: (_, __, ___) => Container(
                    height: 120,
                    color: const Color(0xFFE0D8C8),
                    child: const Center(
                        child: Icon(Icons.broken_image_rounded,
                            color: Colors.grey)),
                  ),
                ),
                // Optional badge (difficulty / guests)
                if (badge != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: badgeColor ?? const Color(0xFF6B9F6B),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        badge!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Info
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C2C2C),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: Colors.amber, size: 13),
                      const SizedBox(width: 3),
                      Text(rating.toString(),
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3C3C3C))),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    line2,
                    style: TextStyle(
                        fontSize: 11, color: Colors.grey.shade600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------
// SliverPersistentHeader delegate for the TabBar
// -------------------------------------------------------
class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  const _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => 58;
  @override
  double get maxExtent => 58;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) => false;
}
