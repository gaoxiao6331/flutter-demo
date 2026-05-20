import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../counter/data/counter_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final bool isWide = MediaQuery.of(context).size.width >= 700;
    final String platform = _platformLabel();
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 跨平台 Demo'),
        actions: [
          TextButton(
            onPressed: () => context.pushNamed('counter-details'),
            child: const Text('详情页'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: isWide
                ? Row(
                    children: [
                      Expanded(child: _buildSummaryCard(textTheme, platform)),
                      const SizedBox(width: 16),
                      Expanded(child: _buildCounterCard(context, textTheme, count)),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildSummaryCard(textTheme, platform),
                      const SizedBox(height: 16),
                      _buildCounterCard(context, textTheme, count),
                    ],
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ref.read(counterProvider.notifier).increase(),
        icon: const Icon(Icons.add),
        label: const Text('加 1'),
      ),
    );
  }

  Widget _buildSummaryCard(TextTheme textTheme, String platform) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('运行信息', style: textTheme.titleLarge),
            const SizedBox(height: 12),
            Text('当前平台: $platform'),
            const SizedBox(height: 6),
            Text('渲染引擎: ${kIsWeb ? "Web Canvas/Skia" : "Skia"}'),
            const SizedBox(height: 6),
            const Text('同一套 Dart 代码可运行在 Android / iOS / Web。'),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterCard(BuildContext context, TextTheme textTheme, int count) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('交互示例', style: textTheme.titleLarge),
            const SizedBox(height: 12),
            const Text('你点击按钮的次数:'),
            const SizedBox(height: 8),
            Text(
              '$count',
              style: textTheme.displaySmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _platformLabel() {
    if (kIsWeb) return 'Web';
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return 'Android';
      case TargetPlatform.iOS:
        return 'iOS';
      case TargetPlatform.macOS:
        return 'macOS';
      case TargetPlatform.windows:
        return 'Windows';
      case TargetPlatform.linux:
        return 'Linux';
      case TargetPlatform.fuchsia:
        return 'Fuchsia';
    }
  }
}
