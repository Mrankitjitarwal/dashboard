import 'package:flutter/material.dart';
import '../theme.dart';
import 'Calendar_widget.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.sidebar,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.primary,
                child: const Text('AS'),
              ),
              const SizedBox(width: 12),
              const Text(
                'Adstacks',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            decoration: cardDecoration(),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: const [
                CircleAvatar(radius: 22),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pooja Mishra',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 2),
                      Chip(
                        label: Text('Admin'),
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const _NavItem(
            icon: Icons.home_filled,
            label: 'Home',
            selected: true,
          ),
          const _NavItem(icon: Icons.people_alt_outlined, label: 'Employees'),
          const _NavItem(icon: Icons.fact_check_outlined, label: 'Attendance'),
          const _NavItem(icon: Icons.analytics_outlined, label: 'Summary'),
          const _NavItem(icon: Icons.info_outline, label: 'Information'),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
            child: Text(
              'WORKSPACES',
              style: TextStyle(fontSize: 12, color: AppColors.textLight),
            ),
          ),
          _WorkspaceTile(title: 'Adstacks'),
          _WorkspaceTile(title: 'Finance'),
          const SizedBox(height: 20),
          const _NavItem(icon: Icons.settings, label: 'Setting'),
          const _NavItem(icon: Icons.logout, label: 'Logout'),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  const _NavItem({
    required this.icon,
    required this.label,
    this.selected = false,
  });
  @override
  Widget build(BuildContext context) {
    final bg = selected ? const Color(0xFFE9EEF8) : Colors.transparent;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.textDark),
        title: Text(label),
        onTap: () {},
      ),
    );
  }
}

class _WorkspaceTile extends StatelessWidget {
  final String title;
  const _WorkspaceTile({required this.title});
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 12),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      children: const [
        ListTile(title: Text('Project A')),
        ListTile(title: Text('Project B')),
      ],
    );
  }
}


class RightSidebar extends StatelessWidget {
  const RightSidebar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F1D3A),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          CalendarCard(),
          SizedBox(height: 16),
          _InfoCard(
            title: 'Today Birthday',
            total: 2,
            button: 'Birthday Wishing',
          ),
          SizedBox(height: 16),
          _InfoCard(
            title: 'Anniversary',
            total: 3,
            button: 'Anniversary Wishing',
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final int total;
  final String button;
  const _InfoCard({
    required this.title,
    required this.total,
    required this.button,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration(color: const Color(0xFF2B2341)),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                '✨',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const CircleAvatar(radius: 18),
              const SizedBox(width: 8),
              const CircleAvatar(radius: 18),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Total', style: TextStyle(color: Colors.white70)),
                  Text(
                    '$total',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Text(button),
            ),
          ),
        ],
      ),
    );
  }
}