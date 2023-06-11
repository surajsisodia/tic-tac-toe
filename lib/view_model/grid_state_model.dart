import 'package:flutter/material.dart';
import 'package:tic_tac_toe/main.dart';
import 'package:tic_tac_toe/widgets/winner_dialog_box.dart';

class GridState {
  List<List<String>>? grid =
      List.generate(3, (index) => List.generate(3, (i) => ""));
  String? winner;
  List<int>? lineCoord;
  bool? chance;

  GridState({this.grid, this.chance, this.lineCoord, this.winner});

  @override
  bool operator ==(Object object) {
    return (object is GridState) && (object.grid == this.grid);
  }

  GridState copyWith(
      {List<List<String>>? grid,
      String? winner,
      List<int>? lineCoord,
      bool? chance}) {
    return GridState(
        grid: grid ?? this.grid,
        winner: winner ?? this.winner,
        chance: chance ?? this.chance,
        lineCoord: lineCoord ?? this.lineCoord);
  }

  setWinner() async {
    final temp = checkWinner();

    if (temp != null) {
      winner = temp;

      await Future.delayed(Duration(seconds: 1));
      showGeneralDialog(
        context: navigationKey.currentContext!,
        pageBuilder: (context, _, rts) => WinnerDialogBox(winner: temp),
      );
    }
  }

  String? checkWinner() {
    //Check Horizontal
    for (int i = 0; i < 3; i++) {
      if (grid?[i][0] == 'o' && grid?[i][1] == 'o' && grid?[i][2] == 'o') {
        lineCoord = [i, 0, i, 2];
        return 'o';
      } else if (grid?[i][0] == 'x' &&
          grid?[i][1] == 'x' &&
          grid?[i][2] == 'x') {
        lineCoord = [i, 0, i, 2];
        return 'x';
      }
    }

    //Check Vertically
    for (int i = 0; i < 3; i++) {
      if (grid?[0][i] == 'o' && grid?[1][i] == 'o' && grid?[2][i] == 'o') {
        lineCoord = [0, i, 2, i];
        return 'o';
      } else if (grid?[0][i] == 'x' &&
          grid?[1][i] == 'x' &&
          grid?[2][i] == 'x') {
        lineCoord = [0, i, 2, i];
        return 'x';
      }
    }

    //Check Top-Left to Bottom right Diagonally
    if (grid?[0][0] == 'o' && grid?[1][1] == 'o' && grid?[2][2] == 'o') {
      lineCoord = [0, 0, 2, 2];
      return 'o';
    } else if (grid?[0][0] == 'x' && grid?[1][1] == 'x' && grid?[2][2] == 'x') {
      lineCoord = [0, 0, 2, 2];
      return 'x';
    }

    //Check Top-right to Bottom left Diagonally
    if (grid?[0][2] == 'o' && grid?[1][1] == 'o' && grid?[2][0] == 'o') {
      lineCoord = [0, 2, 2, 0];
      return 'o';
    } else if (grid![0][2] == 'x' && grid![1][1] == 'x' && grid![2][0] == 'x') {
      lineCoord = [0, 2, 2, 0];
      return 'x';
    }

    return null;
  }
}
