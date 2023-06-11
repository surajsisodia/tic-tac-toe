import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/riverpod/grid_state_provider.dart';
import 'package:tic_tac_toe/utils/palettes.dart';
import 'package:tic_tac_toe/utils/theme.dart';
import 'package:tic_tac_toe/view_model/grid_state_model.dart';
import 'package:tic_tac_toe/widgets/circle.dart';
import 'package:tic_tac_toe/widgets/cross.dart';

class WinnerDialogBox extends StatelessWidget {
  const WinnerDialogBox({super.key, required this.winner});

  final String winner;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 17.w),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(20.w)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Congratulations",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
            ),
            verticalSpace(30.w),
            Text(
              'The winner is',
              style: textTheme.bodyText1!
                  .copyWith(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            verticalSpace(10.w),
            SizedBox(
                width: 100.w,
                height: 100.w,
                child: winner == 'o' ? Circle() : Cross()),
            verticalSpace(20.w),
            Consumer(builder: (context, ref, _) {
              return MaterialButton(
                onPressed: () {
                  ref.read(gridStateProvider.notifier).state = GridState(
                    grid: List.generate(
                        3, (index) => List.generate(3, (i) => "")),
                    chance: true,
                    winner: null,
                    lineCoord: null,
                  );

                  Navigator.of(context).pop();
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(200.w)),
                padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 10.w),
                child: Text(
                  "Restart",
                  style: textTheme.bodyText1!
                      .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w700),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
