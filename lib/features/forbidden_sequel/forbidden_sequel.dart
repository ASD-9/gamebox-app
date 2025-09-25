import 'package:flutter/material.dart';
import 'package:gamebox/features/forbidden_sequel/forbidden_sequel_provider.dart';
import 'package:gamebox/features/forbidden_sequel/widgets/nature_button.dart';
import 'package:gamebox/features/forbidden_sequel/widgets/start_button.dart';
import 'package:provider/provider.dart';

class ForbiddenSequel extends StatefulWidget {
  const ForbiddenSequel({super.key});

  @override
  State<ForbiddenSequel> createState() => _ForbiddenSequelState();
}

class _ForbiddenSequelState extends State<ForbiddenSequel> {
  final List<Map<String, dynamic>> natures = [
    {
      'name': 'Katon',
      'color': Color(0xFFC20000),
    },
    {
      'name': 'Suiton',
      'color': Color(0xFF1C8DFF),
    },
    {
      'name': 'Raiton',
      'color': Color(0xFFCEBD00),
    },
    {
      'name': 'Futon',
      'color': Color(0xFF288D55),
    },
    {
      'name': 'Doton',
      'color': Color(0xFF764E29),
    }
  ];

  final List layout = [
    [0, 1],
    [2],
    [3, 4],
  ];

  @override
  Widget build(BuildContext context) {
    final ForbiddenSequelProvider provider = Provider.of<ForbiddenSequelProvider>(context);
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
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.4,
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
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Score: ${provider.score}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: provider.isGameLose ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StartButton(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        layout.length,
                        (index) {
                          final row = layout[index];
                          return Row(
                            mainAxisAlignment: row.length == 1 ? MainAxisAlignment.center : MainAxisAlignment.spaceAround,
                            children: List.generate(
                              row.length,
                              (index2) {
                                final Map nature = natures[row[index2]];
                                return NatureButton(
                                  nature: nature['name'],
                                  activeColor: nature['color'],
                                  index: row[index2],
                                );
                              },
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
