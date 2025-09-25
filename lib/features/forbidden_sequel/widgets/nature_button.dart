import 'package:flutter/material.dart';
import 'package:gamebox/features/forbidden_sequel/forbidden_sequel_provider.dart';
import 'package:provider/provider.dart';

class NatureButton extends StatelessWidget {
  final String nature;
  final Color activeColor;
  final int index;

  const NatureButton({
    super.key,
    required this.nature,
    required this.activeColor,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    final ForbiddenSequelProvider provider = Provider.of<ForbiddenSequelProvider>(context);
    return GestureDetector(
      onTap: () {
        if (!provider.isPlayerTurn) return;
        provider.playerTry(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/wood.jpg'),
            fit: BoxFit.cover
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
            if (provider.activeIndex == index)
              BoxShadow(
                color: activeColor,
                blurRadius: 15,
                spreadRadius: 15,
              )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 3,
                child: Image.asset('assets/${nature.toLowerCase()}.png', fit: BoxFit.contain)
              ),
              Flexible(
                flex: 1,
                child: Text(
                  nature,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    shadows: const [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 2
                      )
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
