import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forest Exploration Game',
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String _gameText = "New fresh meet!\nToday will be your first day on jab after 3 years of training.\nYou are an official ranger.\nYour first job will be to explore a forest people have been camping in for a while.";
  GameState _gameState = GameState.inProgress;
  bool _showResetButton = false;

  void _handleChoice(String choice) {
    switch (choice) {
      case "yes":
        setState(() {
          _gameText = "You go in.\n\nYou see a light on the right and a loud sound from the left. Where do you go?";
        });
        break;
      case "no":
        _handleEnding("You lost. Wimp ending.");
        break;
      case "right":
        setState(() {
          _gameText = "You see a lost and forgotten tribe.\n\nWho will you talk to them?";
        });
        break;
      case "left":
        _handleEnding("You get eaten by a monster. Brave ending.");
        break;
      case "rudely":
        _handleEnding("They get angry and kill you.");
        break;
      case "nicely":
        _handleEnding("They are all friendly.\n\nYou talk stuff out with the tribe and solve their problem. Good job!");
        break;
    }
  }

  void _handleEnding(String ending) {
    setState(() {
      _gameText = ending;
      _gameState = GameState.lose;
      _showResetButton = true;
    });
  }

  void _resetGame() {
    setState(() {
      _gameText = "New fresh meet!\nToday will be your first day on jab after 3 years of training.\nYou are an official ranger.\nYour first job will be to explore a forest people have been camping in for a while.";
      _gameState = GameState.inProgress;
      _showResetButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forest Exploration Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                _gameText,
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
            if (_gameState == GameState.inProgress)
              Column(
                children: [
                  if (_gameText.contains("Do you go in?"))
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _handleChoice("yes"),
                          child: const Text("Yes"),
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedButton(
                          onPressed: () => _handleChoice("no"),
                          child: const Text("No"),
                        ),
                      ],
                    ),
                  if (_gameText.contains("Where do you go?"))
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _handleChoice("right"),
                          child: const Text("Right"),
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedButton(
                          onPressed: () => _handleChoice("left"),
                          child: const Text("Left"),
                        ),
                      ],
                    ),
                  if (_gameText.contains("Who will you talk to them?"))
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _handleChoice("rudely"),
                          child: const Text("Rudely"),
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedButton(
                          onPressed: () => _handleChoice("nicely"),
                          child: const Text("Nicely"),
                        ),
                      ],
                    ),
                ],
              ),
            if (_showResetButton)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _resetGame,
                    child: const Text("Restart Game"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

enum GameState { inProgress, lose }