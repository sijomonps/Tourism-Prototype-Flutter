// -------------------------------------------------------
// Hotels Screen
// -------------------------------------------------------
// Lists all hotels in a 2-column grid.
// -------------------------------------------------------

import 'package:flutter/material.dart';
import '../models/hotel_model.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  static const Color _softGreen = Color(0xFF6B9F6B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      appBar: AppBar(
        backgroundColor: _softGreen,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Hotels (${allHotels.length})',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(14),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: allHotels.length,
        itemBuilder: (context, index) {
          return _HotelCard(hotel: allHotels[index]);
        },
      ),
    );
  }
}

// -------------------------------------------------------
// Hotel grid card (compact 2-column design)
// -------------------------------------------------------
class _HotelCard extends StatelessWidget {
  final Hotel hotel;
  const _HotelCard({required this.hotel});

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
            child: Image.network(
              hotel.image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Container(
                  height: 120,
                  color: const Color(0xFFE0D8C8),
                  child: const Center(
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Color(0xFF6B9F6B))),
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
                    hotel.name,
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
                      Text(
                        hotel.rating.toString(),
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF3C3C3C)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    hotel.priceRange,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6B9F6B),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    hotel.location,
                    style: TextStyle(
                        fontSize: 10, color: Colors.grey.shade500),
                    maxLines: 1,
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
