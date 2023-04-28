import 'package:flutter/material.dart';
import 'quizz_brain.dart';

QuizBrain quizBrain = QuizBrain();

// COLOR PROFILE

// Deep Blue = #011638
Color _deepBlue = const Color(0xFF011638);

// Deep Blue = #9055a2
Color _lightBlue = const Color(0xFF9055A2);

// Deep Blue = ##FCC419
Color _lightYellow = const Color(0xFFFCC419);

void main() => runApp(const QuizBuzz());

class QuizBuzz extends StatelessWidget {
  const QuizBuzz({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _deepBlue,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  bool? correctAnswers;

  void clearScore() {
    scoreKeeper.clear();
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(
      () {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextQuestion();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Sirajee Sanjar',
                fontSize: 45.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      _lightBlue,
                    ),
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.all(15.0),
                    ),
                  ),
                  onPressed: () => checkAnswer(true),
                  child: const Text(
                    'উরে',
                    style: TextStyle(
                      fontFamily: 'Hasan Meghaloy',
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      _lightBlue,
                    ),
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.all(15.0),
                    ),
                  ),
                  onPressed: () => checkAnswer(false),
                  child: const Text(
                    'উরে না',
                    style: TextStyle(
                      fontFamily: 'Hasan Meghaloy',
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                _lightYellow,
              ),
              padding: const MaterialStatePropertyAll(
                EdgeInsets.all(8.0),
              ),
            ),
            onPressed: () => setState(() {
              quizBrain.resetQuestion();
              clearScore();
            }),
            child: Text(
              'RESET!',
              style: TextStyle(
                  color: _deepBlue,
                  fontSize: 30.0,
                  fontFamily: 'Hasan Meghaloy'),
            ),
          ),
        ),
        SizedBox(
          height: 50.0,
          child: Row(
            children: scoreKeeper,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Made with ',
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            Text(
              ' By ',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              '0xMahid',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}
