# OMDB API Integration TODO

## Steps:

- [ ] 1. Update pubspec.yaml: Add flutter_dotenv, http deps; .env to assets
- [ ] 2. Create .env with OMDB vars (user fill key)
- [ ] 3. Create lib/core/models/movie.dart model
- [ ] 4. Create lib/core/services/omdb_api_service.dart
- [x] 5. Create lib/features/home/controllers/home_controller.dart
- [ ] 6. Update lib/core/routes/app_pages.dart: Add bindings
- [x] 7. Update lib/main.dart: dotenv.load(), home binding (done, route via mainNav?)
- [x] 8. Update lib/features/home/view/home_screen.dart: Use controller, search, dynamic lists

- [ ] 9. `flutter pub get`
- [ ] 10. Test search in home

Progress will be updated per step.
