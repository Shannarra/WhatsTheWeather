import 'package:flutter/material.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';

class SavedCityRadioTile extends StatelessWidget {
  final int uniqueId;
  final int groupId;
  final String name;
  final String description;
  final ValueChanged<int?>? onValueChange;
  final VoidCallback? onDismiss;

  const SavedCityRadioTile({
    Key? key,
    this.onValueChange,
    this.onDismiss,
    required this.uniqueId,
    required this.groupId,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        color: Theme.of(context).colorScheme.secondary,
        child: Icon(
          Icons.delete,
          size: 36,
          color: context.theme.primaryIconTheme.color,
        ),
      ),
      onDismissed: (_) => onDismiss?.call(),
      direction: DismissDirection.endToStart,
      key: ValueKey<int>(uniqueId),
      child: RadioListTile<int>(
        groupValue: groupId,
        value: uniqueId,
        onChanged: onValueChange,
        title: Text(name),
        subtitle: Text(description),
        secondary: const Icon(
          Icons.location_city_sharp,
          size: 42,
        ),
      ),
    );
  }
}
