import 'package:get/get.dart';
import 'package:streamview/core/services/api_service.dart';
import 'package:streamview/core/models/movie.dart';

class HomeController extends GetxController {
  final ApiService apiService = ApiService();

  final RxList<Movie> topSearchedMovies = <Movie>[].obs;
  final RxList<Movie> topSearchMovies = <Movie>[].obs;
  final RxBool isLoading = false.obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadInitialMovies();
  }

  Future<void> loadInitialMovies() async {
    await Future.wait([_loadTopSearched('action'), _loadTopSearches('drama')]);
  }

  Future<void> _loadTopSearched(String query) async {
    try {
      final results = await apiService.searchMovies(query);
      topSearchedMovies.assignAll(results.map((json) => Movie.fromJson(json)));
    } catch (e) {
      print('Error loading top searched: $e');
    }
  }

  Future<void> _loadTopSearches(String query) async {
    try {
      final results = await apiService.searchMovies(query);
      topSearchMovies.assignAll(results.map((json) => Movie.fromJson(json)));
    } catch (e) {
      print('Error loading top searches: $e');
    }
  }

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) return;
    isLoading.value = true;
    try {
      final results = await apiService.searchMovies(query);
      // Update one of the lists or add RxList for search results
      topSearchedMovies.assignAll(results.map((json) => Movie.fromJson(json)));
    } catch (e) {
      print('Search error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
