import 'package:flutter/material.dart';

import '../theme.dart';

class CreatorTable extends StatelessWidget {
  const CreatorTable({super.key});
  @override
  Widget build(BuildContext context) {
    final headerStyle = TextStyle(
      color: Colors.white.withOpacity(.8),
      fontWeight: FontWeight.w600,
    );
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF152447),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Creators',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: Text('Name', style: headerStyle)),
              Expanded(child: Text('Artworks', style: headerStyle)),
              Expanded(child: Text('Rating', style: headerStyle)),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(color: Colors.white24, height: 1),
          const SizedBox(height: 8),
          for (final r in _rows)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const CircleAvatar(radius: 10),
                        const SizedBox(width: 10),
                        Text(
                          r.handle,
                          style: const TextStyle(color: Colors.white,fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${r.artworks}',
                      style: const TextStyle(color: Colors.white70,fontSize: 10),
                    ),
                  ),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: r.rating / 100,
                      backgroundColor: Colors.white12,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _CreatorRow {
  final String handle;
  final int artworks;
  final int rating;
  const _CreatorRow(this.handle, this.artworks, this.rating);
}

const _rows = [
  _CreatorRow('@maddison_c21', 9821, 84),
  _CreatorRow('@karlwil002', 7032, 72),
  _CreatorRow('@jessy_art', 5544, 66),
  _CreatorRow('@alex_ro', 4210, 50),
];