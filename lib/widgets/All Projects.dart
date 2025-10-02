import 'package:flutter/material.dart';

import '../theme.dart';

  class AllProjects extends StatelessWidget {
  const AllProjects();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'All Projects',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < 3; i++) ...[
            ProjectCard(
              title: 'Technology behind the Blockchain',
              subtitle: 'Project #${i + 1}  •  See project details',
              accent: i == 0 ? AppColors.accent : AppColors.textLight,
              showPencil: i == 0,
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color accent;
  final bool showPencil;
  const ProjectCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.accent,
    this.showPencil = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0E1B30),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: accent.withOpacity(.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.auto_awesome, color: Colors.white70),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          if (showPencil)
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit, color: Colors.white70),
            ),
        ],
      ),
    );
  }
}
