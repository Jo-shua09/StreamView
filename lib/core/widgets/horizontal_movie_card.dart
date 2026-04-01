import 'package:flutter/material.dart';
import 'package:streamview/core/models/movie.dart';
import 'package:streamview/core/themes/app_colors.dart';
import 'package:streamview/core/themes/app_text_styles.dart';

class HorizontalMovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;

  const HorizontalMovieCard({super.key, required this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 120 / 160,
                  child: Container(
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
                ),
                const SizedBox(height: 8),
                Text(
                  movie.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyles.bodyMediumBold.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  movie.genre ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodySmallSemi.copyWith(
                    color: AppColors.gray70,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
