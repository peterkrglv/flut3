import 'package:flutter/material.dart';

class ThankYouScreen extends StatelessWidget {
  final VoidCallback onStartNewReview;

  const ThankYouScreen({
    super.key,
    required this.onStartNewReview,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Готово!'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Спасибо за оставленный отзыв!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              OutlinedButton(
                onPressed: onStartNewReview,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: BorderSide(color: Colors.blue.shade600, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Оставить еще один отзыв',
                  style: TextStyle(fontSize: 18, color: Colors.blue.shade600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}