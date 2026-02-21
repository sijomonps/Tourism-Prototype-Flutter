// -------------------------------------------------------
// Profile Screen
// -------------------------------------------------------
// Basic user profile page for the prototype.
// Shows a placeholder avatar, user info, and settings
// list tiles.
// -------------------------------------------------------

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color _softGreen = Color(0xFF6B9F6B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),

              // Avatar
              CircleAvatar(
                radius: 50,
                backgroundColor: _softGreen.withValues(alpha: 0.15),
                child: const Icon(Icons.person_rounded,
                    size: 52, color: _softGreen),
              ),
              const SizedBox(height: 14),

              // User name
              const Text(
                'Guest User',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C2C2C),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'guest@kuttikanam.app',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
              ),

              const SizedBox(height: 28),

              // Stats row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const _StatItem(count: '3', label: 'Bookings'),
                    Container(
                        width: 1,
                        height: 36,
                        color: Colors.grey.shade300),
                    const _StatItem(count: '7', label: 'Wishlist'),
                    Container(
                        width: 1,
                        height: 36,
                        color: Colors.grey.shade300),
                    const _StatItem(count: '2', label: 'Reviews'),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Settings / menu items
              _buildSection(context, [
                _MenuItem(
                  icon: Icons.edit_outlined,
                  title: 'Edit Profile',
                  onTap: () => _showSnack(context, 'Edit Profile tapped'),
                ),
                _MenuItem(
                  icon: Icons.favorite_border_rounded,
                  title: 'My Wishlist',
                  onTap: () => _showSnack(context, 'Wishlist tapped'),
                ),
                _MenuItem(
                  icon: Icons.history_rounded,
                  title: 'Booking History',
                  onTap: () => _showSnack(context, 'Booking History tapped'),
                ),
              ]),

              const SizedBox(height: 12),

              _buildSection(context, [
                _MenuItem(
                  icon: Icons.notifications_none_rounded,
                  title: 'Notifications',
                  onTap: () => _showSnack(context, 'Notifications tapped'),
                ),
                _MenuItem(
                  icon: Icons.help_outline_rounded,
                  title: 'Help & Support',
                  onTap: () => _showSnack(context, 'Help tapped'),
                ),
                _MenuItem(
                  icon: Icons.info_outline_rounded,
                  title: 'About Kuttikanam Tourism',
                  onTap: () => _showSnack(context, 'About tapped'),
                ),
              ]),

              const SizedBox(height: 12),

              _buildSection(context, [
                _MenuItem(
                  icon: Icons.logout_rounded,
                  title: 'Sign Out',
                  iconColor: Colors.redAccent,
                  textColor: Colors.redAccent,
                  onTap: () => _showSnack(context, 'Signed out (prototype)'),
                ),
              ]),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper: wraps menu items in a card section.
  Widget _buildSection(BuildContext context, List<_MenuItem> items) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: items.map((item) {
          return ListTile(
            leading: Icon(item.icon,
                color: item.iconColor ?? const Color(0xFF6B9F6B), size: 22),
            title: Text(
              item.title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: item.textColor ?? const Color(0xFF2C2C2C),
              ),
            ),
            trailing: Icon(Icons.chevron_right_rounded,
                size: 20, color: Colors.grey.shade400),
            onTap: item.onTap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)),
          );
        }).toList(),
      ),
    );
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: _softGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

// -------------------------------------------------------
// Helper widgets
// -------------------------------------------------------

class _StatItem extends StatelessWidget {
  final String count;
  final String label;
  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C2C2C),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
        ),
      ],
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? textColor;

  const _MenuItem({
    required this.icon,
    required this.title,
    this.onTap,
    this.iconColor,
    this.textColor,
  });
}
