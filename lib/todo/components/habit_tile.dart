import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;

  const HabitTile({
    super.key,
    required this.habitName,
    required this.habitCompleted,
    required this.onChanged,
    required this.settingsTapped,
    required this.deleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            // settings option
            SlidableAction(
              onPressed: settingsTapped,
              backgroundColor: Theme.of(context).colorScheme.outline,
              icon: Icons.edit,
            ),

            // delete option
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Theme.of(context).colorScheme.error,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
          ),
          child: Row(
            children: [
              Checkbox(
                activeColor: Theme.of(context).colorScheme.inverseSurface,
                checkColor: Theme.of(context).colorScheme.primaryContainer,
                value: habitCompleted,
                onChanged: onChanged,
              ),

              // habit name
              Expanded(
                  child: Text(
                habitName,
                style: TextStyle(
                    decoration: habitCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 5,
                    fontSize: 15),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
