import 'package:flutter/material.dart';
import 'package:gamebox/features/activation/widgets/restart_button.dart';
import 'package:gamebox/features/activation/activation_provider.dart';
import 'package:provider/provider.dart';
import 'package:riff_switch/riff_switch.dart';

class Activation extends StatelessWidget {
  const Activation({super.key});

  final List<List<int>> _rules = const [
    [0, 1],
    [1, 2],
    [2, 0, 3],
    [3, 4],
    [4, 5],
    [5, 1, 3]
  ];

  @override
  Widget build(BuildContext context) {
    final ActivationProvider provider = Provider.of<ActivationProvider>(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: 400,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wood.jpg'),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 6,
                  offset: const Offset(4, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 50,
              children: [
                Column(
                  spacing: 40,
                  children: List.generate(
                    _rules.length,
                    (index) => Row(
                      spacing: 10,
                      children: [
                        Expanded(
                          child: RiffSwitch(
                            value: provider.activedSwitch.contains(index),
                            onChanged: (_) {
                              if (provider.activedSwitch.length == _rules.length) return;
                              provider.toggleSwitch(_rules[index]);
                            },
                            type: RiffSwitchType.decorative,
                            width: double.infinity,
                            height: 50,
                            trackColor: WidgetStatePropertyAll(Colors.black),
                            thumbColor: WidgetStatePropertyAll(Colors.blue),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: provider.activedSwitch.contains(index) ? Colors.red : Colors.black,
                          ),
                        )
                      ],
                    )
                  ),
                ),
                RestartButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
