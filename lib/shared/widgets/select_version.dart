import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractic/core/enums/versions.dart';
import 'package:flutterpractic/core/utils/get_theme.dart';
import 'package:flutterpractic/modules/home/context/book_context.dart';
import 'package:flutterpractic/modules/search/services/search_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:niku/niku.dart';
import 'package:niku/namespace.dart' as n;

class BibleSelectVersion extends HookConsumerWidget {
  const BibleSelectVersion({super.key, this.onChanged});
  final void Function()? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final version = ref.watch(bibleVersionProvider);
    final theme = getTheme(context);

    return DropdownButtonFormField2<TypeBibleVersion>(
      value: version,
      isExpanded: true,
      decoration: InputDecoration(
        // Add Horizontal padding using menuItemStyleData.padding so it matches
        // the menu padding when button's width is not specified.
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
      onChanged: (newValue) {
        ref.read(bibleVersionProvider.notifier).changeVersion(newValue!);
        onChanged?.call();
      },
      style: TextStyle(color: theme.onSurface),
      items: [
        ...versionsList.map(
          (e) => DropdownMenuItem(
            value: e,
            child: e.name.n,
          ),
        )
      ],
    );
  }
}
