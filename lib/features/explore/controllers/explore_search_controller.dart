import 'package:get/get.dart';
import 'package:streamview/core/models/movie.dart';
import 'package:streamview/core/services/api_service.dart';

class ExploreSearchController extends GetxController {
  final ApiService _apiService = ApiService();

  // Explore Categories State
  final RxString selectedCategory = 'All'.obs;
  final RxList<Movie> categoryMovies = <Movie>[].obs;
  final RxBool isLoadingCategory = false.obs;

  // Search State
  final RxString searchQuery = ''.obs;
  final RxList<Movie> searchResults = <Movie>[].obs;
  final RxBool isLoadingSearch = false.obs;

  Worker? _searchWorker;

  @override
  void onInit() {
    super.onInit();
    // Fetch initial popular movies
    fetchCategoryMovies('movie');

    // Listen to category changes and fetch new movies
    ever(selectedCategory, (category) {
      final query = category == 'All' ? 'movie' : category;
      fetchCategoryMovies(query);
    });

    // Debounce search query changes to avoid spamming the API
    _searchWorker = debounce(searchQuery, (query) {
      if (query.isNotEmpty) {
        searchMovies(query);
      } else {
        searchResults.clear();
      }
    }, time: const Duration(milliseconds: 600));
  }

  @override
  void onClose() {
    _searchWorker?.dispose();
    super.onClose();
  }

  Future<void> fetchCategoryMovies(String query) async {
    isLoadingCategory.value = true;
    try {
      final results = await _apiService.searchMovies(query);
      categoryMovies.value = results
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      categoryMovies.clear();
    } finally {
      isLoadingCategory.value = false;
    }
  }

  Future<void> searchMovies(String query) async {
    isLoadingSearch.value = true;
    try {
      final results = await _apiService.searchMovies(query);
      searchResults.value = results
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      searchResults.clear();
    } finally {
      isLoadingSearch.value = false;
    }
  }
}
