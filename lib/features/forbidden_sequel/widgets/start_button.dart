import 'package:flutter/material.dart';
import 'package:gamebox/features/forbidden_sequel/forbidden_sequel_provider.dart';
import 'package:provider/provider.dart';

class StartButton extends StatefulWidget {
  const StartButton({super.key});

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(BuildContext context) {
    final ForbiddenSequelProvider provider = Provider.of<ForbiddenSequelProvider>(context);
    return GestureDetector(
      onTap: () {
        if (provider.isGameStarted) return;
        provider.startGame();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red.shade700,
          boxShadow: provider.isGameStarted
              ? []
              : [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 6,
                    offset: const Offset(2, 4),
                  ),
                ],
          border: Border.all(color: Colors.black, width: provider.isGameStarted ? 6 : 4),
        ),
        child: Center(
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: provider.isGameStarted ? 16 : 18,
            ),
            duration: const Duration(milliseconds: 200),
            child: const Text("Start"),
          ),
        ),
      ),
    );
  }
}
