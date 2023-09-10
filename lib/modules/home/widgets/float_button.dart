import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterpractic/core/enums/versions.dart';
import 'package:flutterpractic/core/utils/get_theme.dart';
import 'package:flutterpractic/modules/home/context/select_book_context.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatButtonHome extends HookWidget {
  const FloatButtonHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = useState(GlobalKey<ExpandableFabState>());

    return ExpandableFab(
      key: key.value,
      // duration: const Duration(milliseconds: 500),
      // distance: 200.0,
      // type: ExpandableFabType.up,
      // pos: ExpandableFabPos.left,
      // childrenOffset: const Offset(0, 20),
      // fanAngle: 40,
      // openButtonBuilder: RotateFloatingActionButtonBuilder(
      //   child: const Icon(Icons.abc),
      //   fabSize: ExpandableFabSize.large,
      //   foregroundColor: Colors.amber,
      //   backgroundColor: Colors.green,
      //   shape: const CircleBorder(),
      //   angle: 3.14 * 2,
      // ),
      // closeButtonBuilder: FloatingActionButtonBuilder(
      //   size: 56,
      //   builder: (BuildContext context, void Function()? onPressed,
      //       Animation<double> progress) {
      //     return IconButton(
      //       onPressed: onPressed,
      //       icon: const Icon(
      //         Icons.check_circle_outline,
      //         size: 40,
      //       ),
      //     );
      //   },
      // ),
      overlayStyle: ExpandableFabOverlayStyle(
        // color: Colors.black.withOpacity(0.5),
        blur: 5,
      ),

      children: [
        FloatingActionButton.small(
          // shape: const CircleBorder(),
          heroTag: null,
          child: const Icon(Icons.add),
          onPressed: () {
            final state = key.value.currentState;
            if (state != null) {
              debugPrint('isOpen:${state.isOpen}');
              state.toggle();
            }
          },
        ),
        FloatingActionButton.small(
          // shape: const CircleBorder(),
          heroTag: null,
          child: const Icon(Icons.edit),
          onPressed: () {
            final state = key.value.currentState;
            if (state != null) {
              debugPrint('isOpen:${state.isOpen}');
              state.toggle();
            }
          },
        ),

        // icono de libro
        FloatingActionButton.small(
          onPressed: () {
            final state = key.value.currentState;
            _dialogBuilder(context);
            if (state != null) state.toggle();
          },
          child: const Icon(Icons.book_sharp),
        )
        // icono de biblia
      ],
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        final theme = getTheme(context);
        return HookConsumer(builder: (context, ref, child) {
          final selectValue = ref.watch(selectBookContext);
          return AlertDialog(
            title: const Text('Selecciona una Biblia'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DropdownButton<BibleVersion>(
                  value: selectValue,
                  onChanged: (newValue) {
                    ref.read(selectBookContext.notifier).state = newValue!;
                    Navigator.of(context).pop();
                  },
                  style: TextStyle(color: theme.onSurface),
                  items: [
                    ...versionsList.map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
      },
    );
  }
}
