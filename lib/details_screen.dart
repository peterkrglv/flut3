import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Function(String) onDetailsEntered;
  final VoidCallback onBack;
  final bool canGoBack;

  const DetailsScreen({
    super.key,
    required this.onDetailsEntered,
    required this.onBack,
    required this.canGoBack,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Шаг 3 из 4: Комментарий'),
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
                'Оставьте дополнительный комментарий:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              TextField(
                controller: _controller,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Расскажите подробнее (необязательно)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () => widget.onDetailsEntered(_controller.text.trim()),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.blue.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Продолжить',
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