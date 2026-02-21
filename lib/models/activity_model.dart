// -------------------------------------------------------
// Activity Model
// -------------------------------------------------------
// Data class for activities & things to do in Kuttikanam.
// -------------------------------------------------------

class Activity {
  final String name;
  final String image;
  final double rating;
  final String description;
  final String location;
  final String duration; // e.g. "2–3 hours"
  final String difficulty; // Easy, Moderate, Hard

  const Activity({
    required this.name,
    required this.image,
    required this.rating,
    required this.description,
    required this.location,
    required this.duration,
    required this.difficulty,
  });
}

// -------------------------------------------------------
// Hard-coded activity data
// -------------------------------------------------------

final List<Activity> allActivities = [
  const Activity(
    name: 'Parunthumpara Trekking',
    image: 'https://images.unsplash.com/photo-1551632811-561732d1e306?w=600',
    rating: 4.8,
    description:
        'Trek to the eagle rock viewpoint with breathtaking panoramic views.',
    location: 'Parunthumpara',
    duration: '3–4 hours',
    difficulty: 'Moderate',
  ),
  const Activity(
    name: 'Tea Plantation Walk',
    image: 'https://images.unsplash.com/photo-1582126892906-5ba118eaf46e?w=600',
    rating: 4.6,
    description:
        'Guided walk through lush tea gardens learning about tea processing.',
    location: 'Kuttikanam',
    duration: '1–2 hours',
    difficulty: 'Easy',
  ),
  const Activity(
    name: 'Pine Forest Cycling',
    image: 'https://images.unsplash.com/photo-1544191696-102dbdaeeaa0?w=600',
    rating: 4.5,
    description:
        'Cycle through scenic pine-lined trails with rentals available.',
    location: 'Pine Forest',
    duration: '2–3 hours',
    difficulty: 'Easy',
  ),
  const Activity(
    name: 'River Kayaking',
    image: 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=600',
    rating: 4.4,
    description:
        'Paddle along the calm river surrounded by tropical greenery.',
    location: 'Azhutha',
    duration: '2 hours',
    difficulty: 'Easy',
  ),
  const Activity(
    name: 'Spice Garden Tour',
    image: 'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?w=600',
    rating: 4.7,
    description:
        'Explore pepper, cardamom, and cinnamon plantations with tastings.',
    location: 'Kuttikanam',
    duration: '1.5 hours',
    difficulty: 'Easy',
  ),
  const Activity(
    name: 'Sunrise Point Hike',
    image: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=600',
    rating: 4.9,
    description:
        'Early morning hike to catch the spectacular sunrise over the hills.',
    location: 'Parunthumpara',
    duration: '2–3 hours',
    difficulty: 'Moderate',
  ),
];
