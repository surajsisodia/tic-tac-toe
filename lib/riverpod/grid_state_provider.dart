import 'package:riverpod/riverpod.dart';
import 'package:tic_tac_toe/view_model/grid_state_model.dart';

final gridStateProvider = StateProvider<GridState>(
  (ref) => GridState(
    grid: List.generate(3, (index) => List.generate(3, (i) => "")),
    chance: true,
  ),
);
