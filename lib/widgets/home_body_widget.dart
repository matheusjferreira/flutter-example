import 'package:flutter/material.dart';

class HomeBodyWidget extends StatelessWidget {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const HomeBodyWidget({
    super.key,
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('User ID: $userId}'),
        const SizedBox(height: 16),
        Text('ID: $id'),
        const SizedBox(height: 16),
        Text('Title: $title'),
        const SizedBox(height: 16),
        Text('Completed: $completed'),
      ],
    );
  }
}
