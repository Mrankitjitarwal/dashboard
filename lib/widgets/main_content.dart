import 'package:dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:table_calendar/table_calendar.dart';

import '../theme.dart';
import 'All Projects.dart';
import 'CreatorTable.dart';
import 'PerformanceChart.dart';
class MainContent extends StatelessWidget {
  final bool isMobile;
  const MainContent({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMobile) _TopBar(),
          if (!isMobile) const SizedBox(height: 16),
          _HeroCard(),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, c) {
              if (context.isMobile) {
                return Column(
                  children: const [
                    AllProjects(),
                    SizedBox(height: 16),
                    CreatorTable(),
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(child: AllProjects()),
                  SizedBox(width: 5),
                  Expanded(child: CreatorTable()),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          Container(
            decoration: cardDecoration(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Over All Performance'),
                SizedBox(height: 12),
                SizedBox(height: 220, child: PerformanceChart()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Home',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
        ),
        const Spacer(),
        SizedBox(
          width: 360,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        _IconPill(icon: Icons.notifications_none),
        const SizedBox(width: 8),
        _IconPill(icon: Icons.settings_outlined),
        const SizedBox(width: 8),
        const CircleAvatar(radius: 16),
      ],
    );
  }
}

class _IconPill extends StatelessWidget {
  final IconData icon;
  const _IconPill({required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      child: Icon(icon, size: 20),
    );
  }
}

class _HeroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF6C4DFF), Color(0xFFEA4C89)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ETHEREUM 2.0',
                    style: TextStyle(color: Colors.white70, letterSpacing: 1),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Top Rating\nProject',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                    ),
                  ),
                  SizedBox(height: 10),
                  _HeroButton(),
                ],
              ),
            ),
            // image / visual on right for large screens
            if (context.isDesktop) const SizedBox(width: 12),
            if (context.isDesktop)
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    color: Colors.white24,
                    child: const Center(
                      child: Icon(
                        Icons.auto_awesome,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _HeroButton extends StatelessWidget {
  const _HeroButton();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {},
      child: const Text('Learn More.'),
    );
  }
}