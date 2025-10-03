import 'package:flutter/material.dart';

void main() {
  runApp(const ReviewApp());
}

class ReviewApp extends StatelessWidget {
  const ReviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Симулятор Отзыва Таксисту',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ReviewScreen(),
    );
  }
}

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  int? _selectedRating;
  bool _isReviewSubmitted = false;

  void _selectRating(int rating) {
    setState(() {
      _selectedRating = rating;
      _isReviewSubmitted = false;
    });
  }

  void _submitReview() {
    if (_selectedRating != null) {
      setState(() {
        _isReviewSubmitted = true;
      });
    }
  }

  void _startNewReview() {
    setState(() {
      _selectedRating = null;
      _isReviewSubmitted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLowRating = _selectedRating != null && _selectedRating! <= 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Оцените поездку'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          constraints: const BoxConstraints(maxWidth: 600),
          child: _isReviewSubmitted
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Спасибо за оставленный отзыв!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                onPressed: _startNewReview,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: BorderSide(color: Colors.blue.shade600, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Оставить новый отзыв',
                  style: TextStyle(fontSize: 18, color: Colors.blue.shade600),
                ),
              ),
            ],
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Оцените водителя по шкале от 1 до 5:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextButton(
                      onPressed: () => _selectRating(1),
                      style: TextButton.styleFrom(
                        minimumSize: const Size(40, 40),
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                        backgroundColor: _selectedRating == 1 ? Colors.amber.shade700 : Colors.grey[300]!,
                        foregroundColor: _selectedRating == 1 ? Colors.white : Colors.black87,
                        side: BorderSide(
                          color: _selectedRating == 1 ? Colors.amber.shade800 : Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: _selectedRating == 1 ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextButton(
                      onPressed: () => _selectRating(2),
                      style: TextButton.styleFrom(
                        minimumSize: const Size(40, 40),
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                        backgroundColor: _selectedRating == 2 ? Colors.amber.shade700 : Colors.grey[300]!,
                        foregroundColor: _selectedRating == 2 ? Colors.white : Colors.black87,
                        side: BorderSide(
                          color: _selectedRating == 2 ? Colors.amber.shade800 : Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        '2',
                        style: TextStyle(
                          color: _selectedRating == 2 ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextButton(
                      onPressed: () => _selectRating(3),
                      style: TextButton.styleFrom(
                        minimumSize: const Size(40, 40),
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                        backgroundColor: _selectedRating == 3 ? Colors.amber.shade700 : Colors.grey[300]!,
                        foregroundColor: _selectedRating == 3 ? Colors.white : Colors.black87,
                        side: BorderSide(
                          color: _selectedRating == 3 ? Colors.amber.shade800 : Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: _selectedRating == 3 ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextButton(
                      onPressed: () => _selectRating(4),
                      style: TextButton.styleFrom(
                        minimumSize: const Size(40, 40),
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                        backgroundColor: _selectedRating == 4 ? Colors.amber.shade700 : Colors.grey[300]!,
                        foregroundColor: _selectedRating == 4 ? Colors.white : Colors.black87,
                        side: BorderSide(
                          color: _selectedRating == 4 ? Colors.amber.shade800 : Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        '4',
                        style: TextStyle(
                          color: _selectedRating == 4 ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextButton(
                      onPressed: () => _selectRating(5),
                      style: TextButton.styleFrom(
                        minimumSize: const Size(40, 40),
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                        backgroundColor: _selectedRating == 4 ? Colors.amber.shade700 : Colors.grey[300]!,
                        foregroundColor: _selectedRating == 4 ? Colors.white : Colors.black87,
                        side: BorderSide(
                          color: _selectedRating == 4 ? Colors.amber.shade800 : Colors.grey.shade400,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: _selectedRating == 5 ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              if (isLowRating)
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.shade400),
                  ),
                  child: const Text(
                    'Нам очень жаль, что ваша поездка прошла плохо. Мы учтем ваш отзыв для улучшения сервиса, но компенсации, к сожалению, не предусмотрено.',
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),

              ElevatedButton(
                onPressed: _selectedRating != null ? _submitReview : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.blue.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Подтвердить отзыв',
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