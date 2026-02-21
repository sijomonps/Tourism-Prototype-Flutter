// -------------------------------------------------------
// Restaurant Model
// -------------------------------------------------------
// A simple data class that represents a restaurant.
// Each restaurant has a name, image URL, rating,
// description, and the location it belongs to.
// -------------------------------------------------------

class Restaurant {
  final String name;
  final String image; // network image URL
  final double rating;
  final String description;
  final String location; // which popular place it's near

  const Restaurant({
    required this.name,
    required this.image,
    required this.rating,
    required this.description,
    required this.location,
  });
}

// -------------------------------------------------------
// Hard‑coded restaurant data
// -------------------------------------------------------
// These are sample restaurants mapped to popular
// locations so we can filter them on the detail screen.
// -------------------------------------------------------

final List<Restaurant> allRestaurants = [
  // --- Parunthumpara restaurants ---
  const Restaurant(
    name: 'Hilltop Kitchen',
    image:
        'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=600',
    rating: 4.5,
    description:
        'Delicious Kerala cuisine with a panoramic view of the valley.',
    location: 'Parunthumpara',
  ),
  const Restaurant(
    name: 'Green Leaf Café',
    image:
        'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=600',
    rating: 4.3,
    description: 'Organic dishes and fresh juices amidst lush greenery.',
    location: 'Parunthumpara',
  ),
  const Restaurant(
    name: 'Mist & Spice',
    image:
        'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=600',
    rating: 4.6,
    description: 'Traditional spice‑rich meals in a cozy hill‑station setting.',
    location: 'Parunthumpara',
  ),

  // --- Pine Forest restaurants ---
  const Restaurant(
    name: 'Pine Breeze Diner',
    image:
        'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=600',
    rating: 4.4,
    description: 'Comfort food surrounded by tall pine trees.',
    location: 'Pine Forest',
  ),
  const Restaurant(
    name: 'Forest Table',
    image:
        'https://images.unsplash.com/photo-1559329007-40df8a9345d8?w=600',
    rating: 4.2,
    description: 'Farm‑to‑table dining with seasonal specialities.',
    location: 'Pine Forest',
  ),

  // --- Azhutha restaurants ---
  const Restaurant(
    name: 'Riverside Bites',
    image:
        'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?w=600',
    rating: 4.3,
    description: 'Enjoy fresh fish and Kerala snacks by the river.',
    location: 'Azhutha',
  ),
  const Restaurant(
    name: 'Spice Garden',
    image:
        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=600',
    rating: 4.5,
    description: 'Home‑style Kerala meals in a beautiful spice garden.',
    location: 'Azhutha',
  ),

  // --- Kuttikanam restaurants ---
  const Restaurant(
    name: 'Tea Valley Kitchen',
    image:
        'https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?w=600',
    rating: 4.4,
    description: 'Authentic Kerala thali with tea-infused desserts.',
    location: 'Kuttikanam',
  ),
  const Restaurant(
    name: 'Mountain View Café',
    image:
        'https://images.unsplash.com/photo-1554118811-1e0d58224f24?w=600',
    rating: 4.6,
    description: 'Coffee, snacks, and meals with a panoramic hill view.',
    location: 'Kuttikanam',
  ),
  const Restaurant(
    name: 'Cardamom House',
    image:
        'https://images.unsplash.com/photo-1537047902294-62a40c20a6ae?w=600',
    rating: 4.5,
    description: 'Fine dining featuring spice-infused multi-course meals.',
    location: 'Kuttikanam',
  ),
];
