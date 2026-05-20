import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/counter_provider.dart';

class CounterDetailsPage extends ConsumerWidget {
  const CounterDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('计数详情')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('当前计数: $count', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                children: [
                  FilledButton.icon(
                    onPressed: () => ref.read(counterProvider.notifier).increase(),
                    icon: const Icon(Icons.add),
                    label: const Text('再加 1'),
                  ),
                  OutlinedButton(
                    onPressed: () => ref.read(counterProvider.notifier).reset(),
                    child: const Text('重置'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
