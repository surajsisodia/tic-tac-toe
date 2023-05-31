import 'package:tic_tac_toe/enums/tile_type.dart';

class HomePageState {
  List<List<String>> grid =
      List.generate(3, (index) => List.generate(3, (i) => ""));

  void registerGrid(int x, int y, TileType type) {
    grid[x][y] = type == TileType.Circle ? 'o' : "x";
  }
}
