import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  final Function(int) onRatingSelected;
  final VoidCallback onBack;
  final bool canGoBack;

  const RatingScreen({
    super.key,
    required this.onRatingSelected,
    required this.onBack,
    required this.canGoBack,
  });

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int? _localSelectedRating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Шаг 1 из 4: Оценка'),
        backgroundColor: Colors.blue.shade700,
        leading: widget.canGoBack
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: widget.onBack,
        )
            : null,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Пожалуйста, оцените поездку:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final int rating = index + 1;
                  final bool isSelected = _localSelectedRating == rating;

                  final Color backgroundColor = isSelected ? Colors.amber.shade700 : Colors.grey[300]!;
                  final Color foregroundColor = isSelected ? Colors.white : Colors.black87;
                  final Color borderColor = isSelected ? Colors.amber.shade800 : Colors.grey.shade400;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _localSelectedRating = rating;
                        });
                      },
                      style: TextButton.styleFrom(
                        minimumSize: const Size(40, 40),
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                        backgroundColor: backgroundColor,
                        foregroundColor: foregroundColor,
                        side: BorderSide(
                          color: borderColor,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        '$rating',
                        style: TextStyle(
                          color: foregroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: _localSelectedRating != null
                    ? () => widget.onRatingSelected(_localSelectedRating!)
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.blue.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Далее',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}