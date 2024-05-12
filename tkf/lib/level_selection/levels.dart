class QuizLevel {
  final int number;
  final String name;
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  const QuizLevel({
    required this.number,
    required this.name,
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });
}

final quizLevels = [
  QuizLevel(
    number: 1,
    name: 'The Fateful Encounter',
    question: 'Sir Aldric encounters a wounded knight on his path. What should he do?',
    options: ['Aid the wounded knight', 'Ignore the wounded knight and prioritize his mission'],
    correctOptionIndex: 0,
  ),
  QuizLevel(
    number: 2,
    name: 'The Trial of Martial Prowess',
    question: 'Sir Aldric faces his first trial, a test of martial prowess and determination. How should he approach it?',
    options: ['Confront the trial alone, relying on his own abilities', 'Seek guidance from a mentor to enhance his skills'],
    correctOptionIndex: 1,
  ),
  // Add more quiz levels as needed
  QuizLevel(
      number: 3,
      name: 'The Oath of Loyalty',
      question: 'Sir Aldric is summoned to swear the Oath of Loyalty to the Knight of Flovora. What should he do?',
      options: ['Recite the oath with unwavering loyalty', 'Question the implications of blind allegiance'],
      correctOptionIndex: 0,
    ),
];