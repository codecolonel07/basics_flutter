import 'package:flutter/material.dart';

void main() => runApp(TicTacToeApp());

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicTacToeScreen(),
    );
  }
}

class TicTacToeScreen extends StatefulWidget {
  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<List<String>> board=[];
  String currentPlayer='X';
  bool gameOver=false;

  @override
  void initState() {
    super.initState();
    resetBoard();
  }

  void resetBoard() {
    setState(() {
      board = List.generate(3, (_) => List.generate(3, (_) => ' '));
      currentPlayer = 'X';
      gameOver = false;
    });
  }

  void makeMove(int row, int col) {
    if (!gameOver && board[row][col] == ' ') {
      setState(() {
        board[row][col] = currentPlayer;
        if (checkWinningMove(currentPlayer)) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Game Over'),
              content: Text('Player $currentPlayer wins!'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: resetBoard,
                ),
              ],
            ),
          );
          gameOver = true;
        } else if (checkBoardFull()) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Game Over'),
              content: Text('It\'s a draw!'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: resetBoard,
                ),
              ],
            ),
          );
          gameOver = true;
        } else {
          currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
        }
      });
    }
  }

  bool checkWinningMove(String player) {
    for (var i = 0; i < 3; i++) {
      if (board[i][0] == player && board[i][1] == player && board[i][2] == player) {
        return true;
      }
      if (board[0][i] == player && board[1][i] == player && board[2][i] == player) {
        return true;
      }
    }
    if (board[0][0] == player && board[1][1] == player && board[2][2] == player) {
      return true;
    }
    if (board[0][2] == player && board[1][1] == player && board[2][0] == player) {
      return true;
    }
    return false;
  }

  bool checkBoardFull() {
    for (var row in board) {
      if (row.contains(' ')) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                final row = index ~/ 3;
                final col = index % 3;
                return GestureDetector(
                  onTap: () => makeMove(row, col),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        board[row][col],
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: resetBoard,
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
