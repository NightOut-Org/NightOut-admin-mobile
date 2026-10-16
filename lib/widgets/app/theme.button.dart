import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nightoutadmin/extensions/context.extension.dart';
import 'package:nightoutadmin/models/app/theme.mode.dart';
import 'package:nightoutadmin/providers/main.provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ThemeModeButton extends ConsumerWidget {
  const ThemeModeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final themeMode = ref.watch(mainProvider.select((state) => state.themeMode));

    return PopupMenuButton<NightOutThemeMode>(
      tooltip: 'ธีม',
      initialValue: themeMode,
      color: colors.card,
      onSelected: (mode) => ref.read(mainProvider.notifier).setThemeMode(mode),
      icon: PhosphorIcon(
        switch (themeMode) {
          NightOutThemeMode.dark => PhosphorIconsFill.moon,
          NightOutThemeMode.light => PhosphorIconsFill.sun,
          NightOutThemeMode.system => PhosphorIconsFill.desktop,
        },
        color: colors.goldText,
      ),
      itemBuilder: (context) {
        return [
          for (final mode in NightOutThemeMode.values)
            PopupMenuItem(value: mode, child: Text(mode.label)),
        ];
      },
    );
  }
}
