// -------------------------------------------------------
// Bookings Screen
// -------------------------------------------------------
// Shows the user's saved / booked items.
// Since this is a prototype with no backend, we display
// sample bookings and an empty-state UI.
// -------------------------------------------------------

import 'package:flutter/material.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  static const Color _softGreen = Color(0xFF6B9F6B);

  // Sample bookings for prototype demonstration
  final List<Map<String, dynamic>> _bookings = [
    {
      'title': 'Misty Mountain Resort',
      'type': 'Hotel',
      'icon': Icons.hotel_rounded,
      'date': 'Mar 15 – Mar 18, 2026',
      'status': 'Confirmed',
      'statusColor': const Color(0xFF6B9F6B),
    },
    {
      'title': 'Parunthumpara Trekking',
      'type': 'Activity',
      'icon': Icons.directions_bike_rounded,
      'date': 'Mar 16, 2026',
      'status': 'Pending',
      'statusColor': Colors.orange,
    },
    {
      'title': 'Hilltop Kitchen',
      'type': 'Restaurant',
      'icon': Icons.restaurant_rounded,
      'date': 'Mar 16, 2026 – 7:30 PM',
      'status': 'Confirmed',
      'statusColor': const Color(0xFF6B9F6B),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 4),
              child: Text(
                'My Bookings',
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
                'Your upcoming trips & reservations',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
            ),

            const SizedBox(height: 20),

            // Bookings list
            Expanded(
              child: _bookings.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _bookings.length,
                      itemBuilder: (context, index) {
                        final booking = _bookings[index];
                        return _BookingCard(
                          booking: booking,
                          onCancel: () {
                            setState(() {
                              _bookings.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${booking['title']} booking cancelled'),
                                backgroundColor: _softGreen,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.bookmark_border_rounded,
              size: 72, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(
            'No bookings yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your hotel, restaurant, and activity\nbookings will appear here.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
          ),
        ],
      ),
    );
  }
}

// -------------------------------------------------------
// Booking card widget
// -------------------------------------------------------
class _BookingCard extends StatelessWidget {
  final Map<String, dynamic> booking;
  final VoidCallback onCancel;

  const _BookingCard({required this.booking, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF6B9F6B).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(booking['icon'] as IconData,
                color: const Color(0xFF6B9F6B), size: 24),
          ),
          const SizedBox(width: 14),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  booking['title'] as String,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C2C2C),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  booking['date'] as String,
                  style: TextStyle(
                      fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                // Status badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color:
                        (booking['statusColor'] as Color).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    booking['status'] as String,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: booking['statusColor'] as Color,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Cancel button
          IconButton(
            onPressed: onCancel,
            icon: Icon(Icons.close_rounded,
                size: 20, color: Colors.grey.shade400),
            tooltip: 'Cancel booking',
          ),
        ],
      ),
    );
  }
}
