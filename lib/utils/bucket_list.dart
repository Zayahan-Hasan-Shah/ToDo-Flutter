import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BucketList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? delteFunction;
  const BucketList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.delteFunction,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 0,
            ),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const StretchMotion(), 
                children: [
                  SlidableAction(
                    onPressed: delteFunction,
                    icon: Icons.delete,
                    borderRadius: BorderRadius.circular(16),
                    backgroundColor: Colors.white,
                  )
                ]),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.indigo,
                ),
                padding: const EdgeInsets.only(
                  top: 8,
                  right: 12,
                  left: 12,
                  bottom: 8,
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: taskCompleted, 
                      onChanged: onChanged,
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      ),
                    Text(
                      taskName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                        decorationColor: Colors.white,
                        decorationThickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}