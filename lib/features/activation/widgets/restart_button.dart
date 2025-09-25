import 'package:flutter/material.dart';
import 'package:gamebox/features/activation/activation_provider.dart';
import 'package:provider/provider.dart';

class RestartButton extends StatelessWidget {
  const RestartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<ActivationProvider>(context, listen: false).disableSwitch(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.red.shade700,
          border: Border.all(color: Colors.black, width: 4),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: Text(
            "↺",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
