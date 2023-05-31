import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final chanceProvider = StateProvider<bool>((ref) => false);

// final gridProvider = StateProvider<List<List<String>>>(
//     (ref) => List.generate(3, (index) => List.generate(3, (i) => "")));

// class GridStateNotifier extends StateNotifier {
//   GridStateNotifier(super.state);

//   checkWinner() {
//     //Check Horizontal
//   }
// }

final gridStateProvider = StateProvider<GridState>((ref) => GridState());

class GridState {
  List<List<String>> grid =
      List.generate(3, (index) => List.generate(3, (i) => ""));
  String? winner;

  @override
  bool operator ==(Object object) {
    return (object is GridState) &&
        (object.grid == this.grid || object.grid == this.winner);
  }

  void setWinner() {
    winner = checkWinner();
  }

  String? checkWinner() {
    //Check Horizontal
    for (int i = 0; i < 3; i++) {
      if (grid[i][0] == 'o' && grid[i][1] == 'o' && grid[i][2] == 'o')
        return 'o';
      else if (grid[i][0] == 'x' && grid[i][1] == 'x' && grid[i][2] == 'x')
        return 'x';
    }

    //Check Vertically
    for (int i = 0; i < 3; i++) {
      if (grid[0][i] == 'o' && grid[1][i] == 'o' && grid[2][i] == 'o')
        return 'o';
      else if (grid[0][i] == 'x' && grid[1][i] == 'x' && grid[2][i] == 'x')
        return 'x';
    }

    //Check Top-Left to Bottom right Diagonally
    if (grid[0][0] == 'o' && grid[1][1] == 'o' && grid[2][2] == 'o')
      return 'o';
    else if (grid[0][0] == 'x' && grid[1][1] == 'x' && grid[2][2] == 'x')
      return 'x';

    //Check Top-right to Bottom left Diagonally
    if (grid[0][2] == 'o' && grid[1][1] == 'o' && grid[2][0] == 'o')
      return 'o';
    else if (grid[0][2] == 'x' && grid[1][1] == 'x' && grid[2][0] == 'x')
      return 'x';

    return null;
  }
}

// final homeStateNotifier =
//     StateNotifierProvider<GridState>((ref) => GridState(state));
