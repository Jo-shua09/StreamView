# StreamView 🎬

StreamView is a modern, feature-rich movie streaming and discovery application built with **Flutter** and powered by **GetX** for robust state management and routing. It consumes the **OMDb API** to dynamically fetch, search, and display comprehensive movie data including plots, cast, ratings, and posters.

---

## 🚀 Features

### 🎥 Content Discovery

- **Home Dashboard:** Features a beautiful hero carousel highlighting top movies, complete with dynamic step indicators and gradient overlays.
- **Explore Categories:** Reactive category tabs (All, Action, Comedy, Horror) that dynamically filter and fetch popular movies in real-time.
- **Live Search with Debouncing:** A highly optimized search interface that waits for the user to stop typing before pinging the API, saving bandwidth. Includes a custom empty state when no movies are found.
- **Dynamic "See All" Screens:** A fully reusable and generic list view screen that adapts to any category or movie list passed to it.

### 📖 Detailed Movie Metadata

- Tapping any movie reveals a rich details screen showcasing:
  - High-quality hero posters
  - IMDb Ratings, Release Year, and Genres
  - Full Storyline / Plot
  - Directors and Lead Actors
  - "More Like This" and "Recommended" horizontal scroll lists

### 🔐 Authentication Flow (UI)

- Fully mapped onboarding journey: Splash Screen ➔ Onboarding ➔ Sign In / Sign Up ➔ OTP Verification ➔ Create Profile ➔ Profile PIN lock.

### 📱 Additional Features

- Simulated video playback UI.
- Mocked download management screens.
- Clean, modular UI using reusable widgets (`VerticalMovieCard`, `HorizontalMovieCard`, etc.) following DRY principles.

---

## 🛠️ Tech Stack & Architecture

- **Framework:** Flutter
- **State Management & Routing:** GetX
- **Network Calls:** http
- **Environment Variables:** flutter_dotenv
- **API:** OMDb API

### Architecture Pattern

The app follows a modular, feature-first architecture separating core utilities from feature-specific logic:

```text
lib/
│
├── core/                   # Shared resources across the app
│   ├── bindings/           # GetX Dependency Injection bindings
│   ├── models/             # Data models (e.g., Movie model)
│   ├── routes/             # App routing (AppRoutes, GetPage definitions)
│   ├── services/           # External integrations (e.g., ApiService)
│   ├── themes/             # Colors, Typography, AppTheme
│   └── widgets/            # Reusable UI components
│
├── features/               # Specific app features/screens
│   ├── auth/               # Sign in, Sign up, OTP, PIN
│   ├── downloads/          # Downloads screen
│   ├── explore/            # Explore screen, Search screen, ExploreController
│   ├── home/               # Home screen, HomeController
│   ├── movies/             # Movie details, Video Player, See All screen
│   ├── navigation/         # Bottom Navigation Bar setup
│   ├── onboarding/         # Welcome screens
│   └── profile/            # User profile management
│
└── main.dart               # App entry point
```

---

## ⚙️ Getting Started

### Prerequisites

- Flutter SDK (`>=3.0.0`)
- Dart SDK
- An active API Key from OMDb API

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/jo-shua09/streamview.git
   cd streamview
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Set up Environment Variables:**
   Create a `.env` file in the root directory of your project and add your OMDb API key:

   ```env
   OMDB_API_KEY=your_api_key_here
   OMDB_BASE_URL=https://www.omdbapi.com/
   ```

   _(Ensure `.env` is added to your `pubspec.yaml` under `assets`)_

4. **Run the App:**
   ```bash
   flutter run
   ```

---

## 🌐 API Integration Details

StreamView uses a custom `ApiService` wrapper to interact with the OMDb API.
Because OMDb's general search endpoint (`/?s=movie`) only returns basic data, the `ApiService` is built to handle **concurrent fetching**. It first retrieves the list of movies, then fires parallel requests (`getMovieById`) to retrieve detailed metadata (Plot, Directors, Actors) for every search result, ensuring the UI always displays rich data.

To prevent TV shows and games from returning `"Director": "N/A"`, queries are strictly filtered using the `&type=movie` parameter.

---

_Developed with ❤️ using Flutter._
