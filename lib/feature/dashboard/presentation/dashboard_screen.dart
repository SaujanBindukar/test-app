import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/feature/dashboard/application/color_controller.dart';

///dashboard screen
class DashboardScreen extends ConsumerStatefulWidget {
  ///
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.displayMedium;
    final color = ref.watch(colorProvider);

    return Scaffold(
      backgroundColor: color,
      body: InkWell(
        onTap: () {
          ref.read(colorProvider.notifier).generateColor();
        },
        child: Center(
          child: Text(
            'Hello there!',
            style: textTheme?.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(colorProvider.notifier).setDefaultColor();
        },
        child: const Icon(
          Icons.restart_alt,
        ),
      ),
    );
  }
}
