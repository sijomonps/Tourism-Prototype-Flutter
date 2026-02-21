// -------------------------------------------------------
// Home Screen
// -------------------------------------------------------
// The main shell of the Kuttikanam Tourism app.
//
// Hosts 4 bottom-nav tabs via IndexedStack:
//   0 – Home (hero, search, categories, popular)
//   1 – Explore
//   2 – Bookings
//   3 – Profile
//
// All navigation (categories, search, popular cards,
// bottom nav) is fully wired and functional.
// -------------------------------------------------------

import 'package:flutter/material.dart';

// Widgets
import '../widgets/category_button.dart';
import '../widgets/popular_card.dart';

// Screens
import 'explore_screen.dart';
import 'bookings_screen.dart';
import 'profile_screen.dart';
import 'hotels_screen.dart';
import 'restaurants_screen.dart';
import 'homestays_screen.dart';
import 'activities_screen.dart';
import 'search_screen.dart';
import 'location_overview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Currently selected bottom-nav index
  int _currentIndex = 0;

  // -------------------------------------------------------
  // The four tab bodies (indexed by _currentIndex).
  // IndexedStack keeps them alive so scroll position etc.
  // are preserved when switching tabs.
  // -------------------------------------------------------
  final List<Widget> _tabScreens = const [
    _HomeBody(),        // 0 - Home tab content
    ExploreScreen(),    // 1 - Explore tab
    BookingsScreen(),   // 2 - Bookings tab
    ProfileScreen(),    // 3 - Profile tab
  ];

  static const Color _softGreen = Color(0xFF6B9F6B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Show the selected tab's screen
      body: IndexedStack(
        index: _currentIndex,
        children: _tabScreens,
      ),

      // =============================================
      // BOTTOM NAVIGATION BAR
      // =============================================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: _softGreen,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_rounded),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------
// _HomeBody
// -------------------------------------------------------
// The actual scrollable Home tab content (hero image,
// search bar, category grid, popular cards).
// Extracted into its own widget so IndexedStack can
// host it alongside the other tab screens.
// -------------------------------------------------------

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  // Popular places data
  static const List<Map<String, dynamic>> _popularPlaces = [
    {
      'name': 'Parunthumpara',
      'rating': 4.7,
      'image':
          'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=600',
    },
    {
      'name': 'Pine Forest',
      'rating': 4.6,
      'image':
          'https://images.unsplash.com/photo-1448375240586-882707db888b?w=600',
    },
    {
      'name': 'Azhutha',
      'rating': 4.5,
      'image':
          'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=600',
    },
  ];

  static const Color _bgColor = Color(0xFFF9F6F0);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double heroHeight = MediaQuery.of(context).size.height * 0.40;

    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =============================================
              // 1) HERO IMAGE + SEARCH BAR
              // =============================================
              SizedBox(
                height: heroHeight + 28,
                child: Stack(
                  children: [
                    // ---------- Hero image ----------
                    Container(
                      height: heroHeight,
                      width: screenWidth,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=900',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.30),
                              Colors.black.withValues(alpha: 0.55),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Kuttikanam',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Tourism Community',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // ---------- Floating search bar (tappable) ----------
                    Positioned(
                      bottom: 0,
                      left: 24,
                      right: 24,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SearchScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 54,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.10),
                                blurRadius: 14,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: const Row(
                            children: [
                              SizedBox(width: 18),
                              Icon(Icons.search_rounded,
                                  color: Colors.grey, size: 22),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Search hotels, restaurants, activities...',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // =============================================
              // 2) CATEGORY GRID (2×2) — fully navigable
              // =============================================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.25,
                  children: [
                    CategoryButton(
                      icon: Icons.hotel_rounded,
                      label: 'Hotels',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HotelsScreen()),
                        );
                      },
                    ),
                    CategoryButton(
                      icon: Icons.restaurant_rounded,
                      label: 'Restaurants',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RestaurantsScreen(
                                selectedLocation: 'Kuttikanam'),
                          ),
                        );
                      },
                    ),
                    CategoryButton(
                      icon: Icons.home_rounded,
                      label: 'Homestays',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HomestaysScreen()),
                        );
                      },
                    ),
                    CategoryButton(
                      icon: Icons.directions_bike_rounded,
                      label: 'Activities',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ActivitiesScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // =============================================
              // 3) POPULAR IN KUTTIKANAM
              // =============================================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular in Kuttikanam',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ExploreScreen(),
                          ),
                        );
                      },
                      child: Icon(Icons.arrow_forward_ios_rounded,
                          size: 16, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // ---------- Horizontal card list ----------
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20, right: 4),
                  itemCount: _popularPlaces.length,
                  itemBuilder: (context, index) {
                    final place = _popularPlaces[index];
                    return PopularCard(
                      placeName: place['name'] as String,
                      rating: place['rating'] as double,
                      imageUrl: place['image'] as String,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LocationOverviewScreen(
                              placeName: place['name'] as String,
                              rating: place['rating'] as double,
                              imageUrl: place['image'] as String,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
