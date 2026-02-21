// -------------------------------------------------------
// Hotel Model
// -------------------------------------------------------
// Data class for hotels in Kuttikanam area.
// -------------------------------------------------------

class Hotel {
  final String name;
  final String image;
  final double rating;
  final String description;
  final String location;
  final String priceRange; // e.g. "₹2,000 – ₹4,000"

  const Hotel({
    required this.name,
    required this.image,
    required this.rating,
    required this.description,
    required this.location,
    required this.priceRange,
  });
}

// -------------------------------------------------------
// Hard-coded hotel data
// -------------------------------------------------------

final List<Hotel> allHotels = [
  const Hotel(
    name: 'Misty Mountain Resort',
    image: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=600',
    rating: 4.6,
    description:
        'Luxury hill-station resort with stunning valley views and spa.',
    location: 'Kuttikanam',
    priceRange: '₹4,500 – ₹8,000',
  ),
  const Hotel(
    name: 'Green Valley Inn',
    image: 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=600',
    rating: 4.3,
    description:
        'Charming inn surrounded by tea plantations with home-cooked meals.',
    location: 'Kuttikanam',
    priceRange: '₹2,000 – ₹3,500',
  ),
  const Hotel(
    name: 'The Leaf Hotel',
    image: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=600',
    rating: 4.5,
    description:
        'Boutique eco-hotel with organic gardens and nature trails.',
    location: 'Parunthumpara',
    priceRange: '₹3,000 – ₹5,500',
  ),
  const Hotel(
    name: 'Pine Crest Suites',
    image: 'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=600',
    rating: 4.4,
    description:
        'Modern suites nestled inside the pine forest with fireplace rooms.',
    location: 'Pine Forest',
    priceRange: '₹3,500 – ₹6,000',
  ),
  const Hotel(
    name: 'Cloud Nine Retreat',
    image: 'https://images.unsplash.com/photo-1445019980597-93fa8acb246c?w=600',
    rating: 4.7,
    description:
        'Premium retreat above the clouds with infinity pool and fine dining.',
    location: 'Kuttikanam',
    priceRange: '₹6,000 – ₹12,000',
  ),
];
