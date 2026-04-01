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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 80,
                    width: 120,
                    color: AppColors.gray20,
                    child:
                        movie.poster != null &&
                            movie.poster!.isNotEmpty &&
                            movie.poster != 'N/A'
                        ? Image.network(
                            movie.poster!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.movie,
                                  color: AppColors.gray70,
                                ),
                          )
                        : const Icon(Icons.movie, color: AppColors.gray70),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        movie.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        movie.genre ?? movie.year,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
                    size: 28,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
