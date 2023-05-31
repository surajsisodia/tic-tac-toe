import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/riverpod/app_flow_provider.dart';
import 'package:tic_tac_toe/utils.dart/palettes.dart';
import 'package:tic_tac_toe/widgets/circle.dart';
import 'package:tic_tac_toe/widgets/cross.dart';
import 'package:tic_tac_toe/widgets/grid.dart';

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
                alignment: Alignment.topCenter,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Reset",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Consumer(builder: (context, ref, _) {
              final gridState = ref.watch(gridStateProvider).winner;
              final chance = ref.watch(chanceProvider);

              print("Winner : $gridState");
              return gridState != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "$gridState Win",
                          style:
                              TextStyle(color: Colors.white, fontSize: 24.sp),
                        ),
                      ),
                    )
                  : SizedBox();
            }),
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
            Align(
              alignment: Alignment.center,
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20.w,
                    crossAxisSpacing: 20.w,
                  ),
                  itemBuilder: (context, index) =>
                      Consumer(builder: (context, ref, _) {
                        final chance = ref.watch(chanceProvider);
                        final grid = ref.watch(gridStateProvider).grid;
                        final gridState = ref
                            .read(gridStateProvider.notifier)
                            .state
                            .checkWinner();

                        print(grid);

                        return Padding(
                            padding: EdgeInsets.all(10.w),
                            child: grid[index % 3][index ~/ 3] == 'o'
                                ? Circle()
                                : grid[index % 3][index ~/ 3] == 'x'
                                    ? Cross()
                                    : EmptyTile(
                                        x: index % 3,
                                        y: index ~/ 3,
                                        chance: chance));
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
  final bool chance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        print("Called");
        ref.read(gridStateProvider.notifier).state.grid[x][y] =
            chance ? 'o' : 'x';
        ref.read(chanceProvider.notifier).state = !chance;
        ref.read(gridStateProvider.notifier).state.setWinner();
      },
      child: Container(
        color: Colors.transparent,
      ),
    );
  }
}
