import 'package:flut3/class_screen.dart';
import 'package:flut3/summary_screen.dart';
import 'package:flut3/thanks_screen.dart';
import 'package:flutter/material.dart';
import 'rating_screen.dart';
import 'details_screen.dart';

enum AppScreen {
  rating,
  classSelection,
  details,
  summary,
  thankYou,
}

void main() {
  runApp(const ReviewApp());
}

class ReviewApp extends StatelessWidget {
  const ReviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Симулятор Отзыва',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainNavigator(),
    );
  }
}

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  AppScreen _currentScreen = AppScreen.rating;

  int? _selectedRating;
  String? _selectedClass;
  String? _detailedComment;

  void _navigateTo(AppScreen screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  void _goBack() {
    setState(() {
      if (_currentScreen == AppScreen.classSelection) {
        _currentScreen = AppScreen.rating;
        _selectedRating = null;
      } else if (_currentScreen == AppScreen.details) {
        _currentScreen = AppScreen.classSelection;
        _detailedComment = null;
      } else if (_currentScreen == AppScreen.summary) {
        _currentScreen = AppScreen.details;
      } else if (_currentScreen == AppScreen.thankYou) {
        _currentScreen = AppScreen.rating;
        _selectedRating = null;
        _selectedClass = null;
        _detailedComment = null;
      } else {
        _currentScreen = AppScreen.rating;
      }
    });
  }

  void _updateRating(int rating) {
    _selectedRating = rating;
    _navigateTo(AppScreen.classSelection);
  }

  void _updateClass(String taxiClass) {
    _selectedClass = taxiClass;
    _navigateTo(AppScreen.details);
  }

  void _updateDetails(String comment) {
    _detailedComment = comment;
    _navigateTo(AppScreen.summary);
  }

  void _submitReview() {
    _navigateTo(AppScreen.thankYou);
  }

  @override
  Widget build(BuildContext context) {
    if (_currentScreen == AppScreen.rating) {
      return RatingScreen(
        onRatingSelected: _updateRating,
        onBack: _goBack,
        canGoBack: false,
      );
    } else if (_currentScreen == AppScreen.classSelection) {
      return ClassScreen(
        onReasonSelected: _updateClass,
        onBack: _goBack,
        canGoBack: true,
      );
    } else if (_currentScreen == AppScreen.details) {
      return DetailsScreen(
        onDetailsEntered: _updateDetails,
        onBack: _goBack,
        canGoBack: true,
      );
    } else if (_currentScreen == AppScreen.summary) {
      return SummaryScreen(
        rating: _selectedRating!,
        reason: _selectedClass!,
        comment: _detailedComment,
        onSubmit: _submitReview,
        onBack: _goBack,
        canGoBack: true,
      );
    } else if (_currentScreen == AppScreen.thankYou) {
      return ThankYouScreen(
        onStartNewReview: _goBack,
      );
    } else {
      return const Scaffold(body: Center(child: Text("Ошибка навигации!")));
    }
  }
}