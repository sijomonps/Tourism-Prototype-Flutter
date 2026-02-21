// -------------------------------------------------------
// Homestay Model
// -------------------------------------------------------
// Data class for homestays in Kuttikanam area.
// -------------------------------------------------------

class Homestay {
  final String name;
  final String image;
  final double rating;
  final String description;
  final String location;
  final String priceRange;
  final int maxGuests;

  const Homestay({
    required this.name,
    required this.image,
    required this.rating,
    required this.description,
    required this.location,
    required this.priceRange,
    required this.maxGuests,
  });
}

// -------------------------------------------------------
// Hard-coded homestay data
// -------------------------------------------------------

final List<Homestay> allHomestays = [
  const Homestay(
    name: 'Ammachi\'s Heritage Home',
    image: 'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=600',
    rating: 4.8,
    description:
        'Traditional Kerala-style home with warm hospitality and homemade food.',
    location: 'Kuttikanam',
    priceRange: '₹1,500 – ₹2,500',
    maxGuests: 6,
  ),
  const Homestay(
    name: 'Tea Garden Cottage',
    image: 'https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=600',
    rating: 4.5,
    description:
        'Cozy cottage inside a working tea garden with fresh tea every morning.',
    location: 'Parunthumpara',
    priceRange: '₹1,800 – ₹3,000',
    maxGuests: 4,
  ),
  const Homestay(
    name: 'Hilltop Farmhouse',
    image: 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=600',
    rating: 4.6,
    description:
        'Organic farm homestay with pepper, cardamom, and coffee plantations.',
    location: 'Azhutha',
    priceRange: '₹2,000 – ₹3,500',
    maxGuests: 8,
  ),
  const Homestay(
    name: 'Forest Edge Villa',
    image: 'https://images.unsplash.com/photo-1480074568708-e7b720bb3f09?w=600',
    rating: 4.4,
    description:
        'Private villa at the edge of the pine forest with bonfire area.',
    location: 'Pine Forest',
    priceRange: '₹2,500 – ₹4,000',
    maxGuests: 5,
  ),
  const Homestay(
    name: 'Sunrise Point Stay',
    image: 'https://images.unsplash.com/photo-1523217582562-09d0def993a6?w=600',
    rating: 4.7,
    description:
        'Wake up to stunning sunrise views over the Western Ghats.',
    location: 'Parunthumpara',
    priceRange: '₹2,200 – ₹3,800',
    maxGuests: 4,
  ),
];
