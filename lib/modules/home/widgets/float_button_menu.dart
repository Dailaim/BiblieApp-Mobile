import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterpractic/core/contexts/auth_context.dart';
import 'package:flutterpractic/shared/widgets/select_version.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:niku/niku.dart';
import 'package:niku/namespace.dart' as n;

class FloatButtonHome extends HookConsumerWidget {
  const FloatButtonHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
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
        FloatingActionButton.small(
          onPressed: () {
            final state = key.value.currentState;
            n.showDialog(
              context: context,
              builder: (context) => n.Alert()
                ..title = 'Selecciona una Biblia'.n
                ..content = BibleSelectVersion(
                    onChanged: () => Navigator.of(context).pop())
                ..freezed,
            );
            if (state != null) state.toggle();
          },
          child: const Icon(Icons.book_sharp),
        )
      ],
    );
  }
}
