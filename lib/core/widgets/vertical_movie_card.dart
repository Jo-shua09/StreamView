import 'package:flutter/material.dart';
import 'package:streamview/core/models/movie.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';

class VerticalMovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onPlayTap;

  const VerticalMovieCard({super.key, required this.movie, this.onPlayTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 80,
            width: 120,
            decoration: BoxDecoration(
              color: AppColors.gray20,
              borderRadius: BorderRadius.circular(12),
              image:
                  movie.poster != null &&
                      movie.poster!.isNotEmpty &&
                      movie.poster != 'N/A'
                  ? DecorationImage(
                      image: NetworkImage(movie.poster!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: AppTextStyles.bodyMediumBold.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  movie.year,
                  style: AppTextStyles.bodySmallSemi.copyWith(
                    color: AppColors.gray70,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onPlayTap,
            icon: const Icon(
              Icons.play_circle_outline,
              color: AppColors.gray80,
            ),
          ),
        ],
      ),
    );
  }
}
