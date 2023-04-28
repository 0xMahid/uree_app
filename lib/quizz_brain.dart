import 'package:flutter/material.dart';

import 'question.dart';

class QuizBrain {
  final List<Question> _questionBank = [
    Question(questionText: 'পাখি উড়ে', questionAnswer: true),
    Question(questionText: 'গরু উড়ে', questionAnswer: false),
    Question(questionText: 'সাপ উড়ে', questionAnswer: false),
    Question(questionText: 'মানুষ উড়ে', questionAnswer: false),
    Question(questionText: 'মাহিদে উড়ে', questionAnswer: true),
    Question(questionText: 'বনবিড়াল উড়ে', questionAnswer: true),
    Question(questionText: 'গাছ উড়ে', questionAnswer: false),
    Question(questionText: 'হাঁস উড়ে', questionAnswer: true),
    Question(questionText: 'ছাগল উড়ে', questionAnswer: false),
    Question(questionText: 'গাঞ্জা খাইলে মানুষ উড়ে', questionAnswer: true),
    Question(questionText: 'কাঁক উড়ে', questionAnswer: true),
    Question(questionText: 'ভালোবাসা উড়ে', questionAnswer: true),
    Question(questionText: 'সাদিয়ার মনে আরমিম উড়ে', questionAnswer: true),
    Question(questionText: 'ঘোড়া উড়ে', questionAnswer: false),
    Question(questionText: 'সালফার উড়ে', questionAnswer: true),
    // Question(questionText: 'ইলেক্ট্রন উড়ে', questionAnswer: true),
    // Question(questionText: 'মেঘ উড়ে', questionAnswer: true),
    // Question(questionText: 'গ্লাইডার উড়ে', questionAnswer: true),
    // Question(questionText: 'সপ্ন উড়ে', questionAnswer: false),
    // Question(questionText: 'বিড়াল উড়ে', questionAnswer: false),
    // Question(questionText: 'মহাকাশে বস্তু উড়ে', questionAnswer: true),
  ];

  int _questionIndex = 0;

  int questionIndex() {
    return _questionIndex;
  }

  void nextQuestion() {
    _questionIndex++;
    if (_questionIndex >= _questionBank.length) {
      _questionIndex = 0;
    }
  }

  void resetQuestion() {
    _questionIndex = 0;
  }

  String getQuestionText() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionIndex].questionAnswer;
  }

  int getListLength() {
    return _questionBank.length;
  }
}
