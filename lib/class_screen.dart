import 'package:flutter/material.dart';

class ClassScreen extends StatefulWidget {
  final Function(String) onReasonSelected;
  final VoidCallback onBack;
  final bool canGoBack;

  const ClassScreen({
    super.key,
    required this.onReasonSelected,
    required this.onBack,
    required this.canGoBack,
  });

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  String? _selectedClass;

  final List<String> _taxiClasses = const [
    'Эконом',
    'Комфорт',
    'Бизнес',
    'Минивэн',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Шаг 2 из 4: Класс поездки'),
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
                'Выберите класс такси, на котором вы ехали:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              ..._taxiClasses.map((taxiClass) {
                final bool isSelected = _selectedClass == taxiClass;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _selectedClass = taxiClass;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: isSelected ? Colors.deepPurple.shade600 : Colors.grey,
                        width: isSelected ? 3 : 1,
                      ),
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      taxiClass,
                      style: TextStyle(
                        fontSize: 18,
                        color: isSelected ? Colors.deepPurple.shade600 : Colors.black87,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: _selectedClass != null
                    ? () => widget.onReasonSelected(_selectedClass!)
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