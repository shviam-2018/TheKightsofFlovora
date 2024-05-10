class QuizLevel {
  final int number;
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  const QuizLevel({
    required this.number,
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });
}

final quizLevels = [
  QuizLevel(
    number: 1,
    question: 'What is the capital of France?',
    options: ['Paris', 'London', 'Berlin', 'Madrid'],
    correctOptionIndex: 0,
  ),
  QuizLevel(
    number: 2,
    question: 'What is the largest ocean in the world?',
    options: ['Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'Pacific Ocean'],
    correctOptionIndex: 3,
  ),
  // Add more quiz levels as needed
];