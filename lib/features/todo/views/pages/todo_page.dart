import 'package:cardinal_quotes_task/core/dummy_db.dart';
import 'package:cardinal_quotes_task/core/theme/app_theme.dart';
import 'package:cardinal_quotes_task/features/todo/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_palette.dart';

class TodoPage extends StatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const TodoPage());
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

Future<void> _showBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    enableDrag: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
    ),
    backgroundColor: AppPalette.color1,
    barrierColor: AppPalette.color3.withAlpha(30),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: AppTheme.textStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  'New To-dos',
                  style: AppTheme.textStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Next',
                    style: AppTheme.textStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: AppPalette.color3Variant,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/todo_icons/calender.svg',
                    height: 26,
                    width: 26,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 15),
                  Opacity(
                    opacity: 0.68,
                    child: Text(
                      'New To-dos',
                      style: AppTheme.textStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppPalette.color1,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/icons/todo_icons/clock.svg',
                    height: 26,
                    width: 26,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppPalette.color3.withAlpha(102),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(1000),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Repeat',
                        style: AppTheme.textStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Everyday',
                        style: AppTheme.textStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: AppPalette.color3,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Divider(
                    height: 0.5,
                    color: AppPalette.color3.withAlpha(50),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        'End Repeat',
                        style: AppTheme.textStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'After 1 Month',
                        style: AppTheme.textStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: AppPalette.color3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

class _TodoPageState extends State<TodoPage> {
  List<bool> isChecked = List.generate(todos.length, (index) {
    final todo = Todo.fromMap(todos[index]);
    return todo.isDone;
  });
  bool isBottomSheetOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-dos'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_forward_rounded,
              size: 26,
              color: AppPalette.color1,
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: 65,
        margin: const EdgeInsets.only(right: 15, bottom: 30),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              isBottomSheetOpen = true;
            });
            _showBottomSheet(context).then((_) {
              setState(() {
                isBottomSheetOpen = false;
              });
            });
          },
          backgroundColor: AppPalette.color1,
          foregroundColor: AppPalette.color3,
          splashColor: AppPalette.color3.withAlpha(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10000),
          ),
          child: const Icon(
            Icons.add_to_photos,
            size: 30,
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Transform.flip(
              flipX: true,
              child: SizedBox(
                height: 226,
                width: 133,
                child: Image.asset(
                  'assets/images/todo_bgs/bg1.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 133,
            child: SizedBox(
              height: 179,
              width: 179,
              child: Image.asset(
                'assets/images/todo_bgs/bg2.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 236),
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = Todo.fromMap(todos[index]);
                final timesText = isBottomSheetOpen
                    ? ', ${todo.times.length} times a day'
                    : ' At ${todo.times[0]}';
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppPalette.color1,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(65),
                        offset: const Offset(4, 4),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isChecked[index] = !isChecked[index];
                              });
                            },
                            child: SvgPicture.asset(
                              isChecked[index]
                                  ? 'assets/icons/todo_icons/checked.svg'
                                  : 'assets/icons/todo_icons/not_checked.svg',
                              fit: BoxFit.cover,
                              width: 18,
                              height: 18,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            todo.title,
                            style: AppTheme.textStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${todo.repeat}$timesText${todo.isOverdue ? ' OverDue' : ''}',
                            style: AppTheme.textStyle.copyWith(
                              color: todo.isOverdue
                                  ? AppPalette.colorRed
                                  : AppPalette.color3,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
