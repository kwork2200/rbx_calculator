import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

class QuizTimeController extends GetxController {
  final _box = GetStorage();

  final currentIndex = 0.obs;
  final selectedIndex = (-1).obs;
  final correctAnswers = 0.obs;
  final isAnswered = false.obs;

  final List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'Which feature allows for automatic control of in-game characters?',
      options: ['Pathfinding Service', 'Animation Controller', 'Remote Functions', 'GUI Service'],
      correctIndex: 0,
    ),
    QuizQuestion(
      question: 'What currency is used in Roblox?',
      options: ['Coins', 'Robux', 'Gems', 'Credits'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'What language is used to script in Roblox?',
      options: ['Python', 'JavaScript', 'Lua', 'C++'],
      correctIndex: 2,
    ),
    QuizQuestion(
      question: 'Which company developed Roblox?',
      options: ['Epic Games', 'Roblox Corporation', 'Mojang', 'Valve'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'What is the name of Roblox\'s avatar system?',
      options: ['Skin System', 'R6 / R15', 'Avatar Pro', 'Mesh Body'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'What year was Roblox officially launched?',
      options: ['2004', '2006', '2008', '2010'],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'What is the Roblox marketplace called?',
      options: ['Item Store', 'Avatar Shop', 'Roblox Market', 'Catalog'],
      correctIndex: 3,
    ),
    QuizQuestion(
      question: 'Which service handles player data storage in Roblox?',
      options: ['DataStore', 'PlayerStore', 'SaveService', 'CloudDB'],
      correctIndex: 0,
    ),
    QuizQuestion(
      question: 'What does "NPC" stand for in Roblox games?',
      options: [
        'New Player Character',
        'Non-Playable Character',
        'Next Play Controller',
        'None of the above'
      ],
      correctIndex: 1,
    ),
    QuizQuestion(
      question: 'Which event fires when a player joins in Roblox?',
      options: ['PlayerAdded', 'PlayerJoined', 'OnPlayerEnter', 'CharacterAdded'],
      correctIndex: 0,
    ),
  ];

  QuizQuestion get currentQuestion => questions[currentIndex.value];
  int get totalQuestions => questions.length;

  void selectAnswer(int index) {
    if (isAnswered.value) return;
    selectedIndex.value = index;
    isAnswered.value = true;

    if (index == currentQuestion.correctIndex) {
      correctAnswers.value++;
    }

    Future.delayed(const Duration(milliseconds: 800), () {
      if (currentIndex.value < totalQuestions - 1) {
        currentIndex.value++;
        selectedIndex.value = -1;
        isAnswered.value = false;
      } else {
        // Save robux from correct answers
        final earned = correctAnswers.value * 1;
        final current = _box.read('robux_count') ?? 14;
        _box.write('robux_count', current + earned);
        Get.offNamed(Routes.QUIZ_RESULT, arguments: {
          'correct': correctAnswers.value,
          'total': totalQuestions,
          'earned': earned,
        });
      }
    });
  }

  Color getOptionColor(int index) {
    if (!isAnswered.value) return const Color(0xFF1E1E1E);
    if (index == currentQuestion.correctIndex) return const Color(0xFF4ECFA8);
    if (index == selectedIndex.value) return const Color(0xFFE53935);
    return const Color(0xFF1E1E1E);
  }
}