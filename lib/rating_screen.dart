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
  late List<bool> _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = List.generate(5, (_) => false);
  }

  void _updateSelection(int index) {
    setState(() {
      for (int i = 0; i < _isSelected.length; i++) {
        _isSelected[i] = false;
      }
      _isSelected[index] = true;
      _localSelectedRating = index + 1;
    });
  }

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

              Center(
                child: ToggleButtons(
                  isSelected: _isSelected,
                  onPressed: _updateSelection,
                  borderRadius: BorderRadius.circular(8),
                  borderColor: Colors.grey.shade400,
                  selectedBorderColor: Colors.amber.shade700,
                  selectedColor: Colors.white,
                  fillColor: Colors.amber.shade700,
                  color: Colors.black87,
                  children: List.generate(5, (index) {
                    final rating = index + 1;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '$rating',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ),
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