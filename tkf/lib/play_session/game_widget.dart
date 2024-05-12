// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../style/palette.dart';
import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../game_internals/level_state.dart';
import '../level_selection/levels.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({super.key});

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  int currentLevelIndex = 0;

  void _handleOptionSelected(int selectedIndex) {
    final currentLevel = quizLevels[currentLevelIndex];
    if (selectedIndex == currentLevel.correctOptionIndex) {
      // Correct answer
      // Proceed to the next level or show a success message
      _proceedToNextLevel();
    } else {
      // Incorrect answer
      // Show an error message or allow the player to retry
    }
  }

  void _proceedToNextLevel() {
    setState(() {
      currentLevelIndex++;
      if (currentLevelIndex >= quizLevels.length) {
        // Game completed
        // Show a completion message or navigate to a results screen
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentLevel = quizLevels[currentLevelIndex];
    final palette = context.watch<Palette>();

    return Container(
      color: palette.backgroundPlaySession,
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  currentLevel.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(currentLevel.question),
                SizedBox(height: 20),
                ...currentLevel.options.asMap().entries.map((entry) {
                  final index = entry.key;
                  final option = entry.value;
                  return ElevatedButton(
                    onPressed: () => _handleOptionSelected(index),
                    child: Text(option),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}