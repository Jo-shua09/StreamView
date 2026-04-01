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
      child: SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
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
            const SizedBox(height: 8),
            Flexible(
              child: Text(
                movie.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextStyles.bodyMediumBold.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              movie.year,
              style: AppTextStyles.bodySmallSemi.copyWith(
                color: AppColors.gray70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
