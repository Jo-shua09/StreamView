import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String? _apiKey = dotenv.env['OMDB_API_KEY'];
  final String? _baseUrl = dotenv.env['OMDB_BASE_URL'];

  // General search that returns a list of movies
  Future<List<dynamic>> searchMovies(String query, {int page = 1}) async {
    final uri = _buildUri({'s': query, 'page': page.toString()});

    try {
      final response = await http.get(uri);
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        if (data['Response'] == 'True') {
          return data['Search'];
        } else {
          if (data['Error'] == 'Movie not found!') {
            return []; // Return empty list if no movie is found
          }
          throw Exception('API Error: ${data['Error']}');
        }
      } else {
        throw Exception(
          'Failed to load movies. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  // Fetches detailed information for a single movie by its title
  Future<Map<String, dynamic>> getMovieByTitle(
    String title, {
    String? year,
  }) async {
    final params = {'t': title};
    if (year != null) {
      params['y'] = year;
    }
    final uri = _buildUri(params);

    try {
      final response = await http.get(uri);
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        if (data['Response'] == 'True') {
          return data;
        } else {
          throw Exception('API Error: ${data['Error']}');
        }
      } else {
        throw Exception(
          'Failed to load movie. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  // Fetches detailed information for a single movie by its IMDb ID
  Future<Map<String, dynamic>> getMovieById(String imdbId) async {
    final uri = _buildUri({'i': imdbId});

    try {
      final response = await http.get(uri);
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        if (data['Response'] == 'True') {
          return data;
        } else {
          throw Exception('API Error: ${data['Error']}');
        }
      } else {
        throw Exception(
          'Failed to load movie. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Uri _buildUri(Map<String, String> params) {
    if (_apiKey == null || _baseUrl == null) {
      throw Exception('OMDB_API_KEY or OMDB_BASE_URL not set in .env file');
    }

    final queryParameters = {'apikey': _apiKey!, ...params};
    return Uri.parse(_baseUrl!).replace(queryParameters: queryParameters);
  }
}
