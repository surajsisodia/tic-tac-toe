import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/riverpod/grid_state_provider.dart';
import 'package:tic_tac_toe/utils/palettes.dart';
import 'package:tic_tac_toe/view_model/grid_state_model.dart';
import 'package:tic_tac_toe/widgets/circle.dart';
import 'package:tic_tac_toe/widgets/cross.dart';
import 'package:tic_tac_toe/widgets/grid.dart';
import 'package:tic_tac_toe/widgets/pattern_line.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Consumer(builder: (context, ref, _) {
                  return TextButton.icon(
                    onPressed: () {
                      ref.read(gridStateProvider.notifier).state = GridState(
                        grid: List.generate(
                            3, (index) => List.generate(3, (i) => "")),
                        chance: true,
                        winner: null,
                        lineCoord: null,
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(200.w)),
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 10.w),
                    ),
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Reset",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                  );
                }),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 40.w),
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenWidth,
                child: CustomPaint(
                  painter: Grid(),
                ),
              ),
            ),
            Consumer(builder: (context, ref, _) {
              final gridState = ref.watch(gridStateProvider);

              return gridState.lineCoord == null
                  ? SizedBox()
                  : Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(top: 80.w),
                        width: ScreenUtil().screenWidth,
                        height: ScreenUtil().screenWidth,
                        child: PatternLine(lineCoord: gridState.lineCoord!),
                      ),
                    );
            }),
            Align(
              alignment: Alignment.center,
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 33.w,
                    crossAxisSpacing: 20.w,
                  ),
                  itemBuilder: (context, index) =>
                      Consumer(builder: (context, ref, _) {
                        final grid = ref.watch(gridStateProvider);

                        return Padding(
                            padding: EdgeInsets.all(10.w),
                            child: grid.grid![index % 3][index ~/ 3] == 'o'
                                ? Circle()
                                : grid.grid![index % 3][index ~/ 3] == 'x'
                                    ? Cross()
                                    : EmptyTile(
                                        x: index % 3,
                                        y: index ~/ 3,
                                        chance: grid.chance));
                      })),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyTile extends ConsumerWidget {
  const EmptyTile(
      {super.key, required this.x, required this.y, required this.chance});

  final int x;
  final int y;
  final bool? chance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (chance == null) return;

        var temp = ref.read(gridStateProvider.notifier).state;
        temp.grid![x][y] = chance! ? 'o' : 'x';

        ref.read(gridStateProvider.notifier).state =
            GridState(chance: !(temp.chance!), grid: temp.grid);

        ref.read(gridStateProvider).setWinner();
      },
      child: Container(
        color: Colors.transparent,
      ),
    );
  }
}
