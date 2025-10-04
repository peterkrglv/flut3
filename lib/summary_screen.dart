import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final int rating;
  final String reason;
  final String? comment;
  final VoidCallback onSubmit;
  final VoidCallback onBack;
  final bool canGoBack;

  const SummaryScreen({
    super.key,
    required this.rating,
    required this.reason,
    required this.comment,
    required this.onSubmit,
    required this.onBack,
    required this.canGoBack,
  });

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade700),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Шаг 4 из 4: Подтверждение'),
        backgroundColor: Colors.blue.shade700,
        leading: canGoBack
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
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
                'Проверьте данные вашего отзыва:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              _buildDetailRow('Оценка:', '$rating ⭐'),
              _buildDetailRow('Причина:', reason),
              _buildDetailRow('Комментарий:', comment!.isNotEmpty ? comment! : 'Нет'),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: onSubmit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.green.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Отправить отзыв',
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