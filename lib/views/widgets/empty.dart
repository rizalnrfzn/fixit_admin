import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({super.key, this.errorMessage});

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            errorMessage ?? 'Tidak ada data',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
