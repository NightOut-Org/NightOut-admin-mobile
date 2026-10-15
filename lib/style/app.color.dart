import 'package:flutter/material.dart';

const nightOutEaseOut = Cubic(0.22, 1, 0.36, 1);

abstract final class NightOutMotion {
  static const fast = Duration(milliseconds: 150);
  static const base = Duration(milliseconds: 250);
  static const slow = Duration(milliseconds: 400);
  static const themeFade = Duration(milliseconds: 300);
  static const easeOut = nightOutEaseOut;
  static const pressedScale = 0.98;
}

abstract final class NightOutRadius {
  static const base = 12.0;
  static const pill = 9999.0;
  static const authGlass = 24.0;
}

abstract final class AppColor {
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);

  static const Color gold = Color(0xFFE8B64C);
  static const Color purple = Color(0xFFA738F5);

  static const Color backgroundDark = Color(0xFF07070D);
  static const Color surfaceDark = Color(0xFF11111A);
  static const Color cardDark = Color(0xFF171520);
  static const Color borderDark = Color(0xFF34283F);
  static const Color textDark = Color(0xFFF5F1E8);
  static const Color mutedDark = Color(0xFFA7A1B3);
  static const Color goldHighlightDark = Color(0xFFFFD77A);
  static const Color goldTextDark = Color(0xFFE8B64C);
  static const Color onGoldDark = Color(0xFF07070D);
  static const Color linkDark = Color(0xFFB86BFA);
  static const Color crowdAvailableDark = Color(0xFF22C55E);
  static const Color crowdAlmostFullDark = Color(0xFFEAB308);
  static const Color crowdFullDark = Color(0xFFEF4444);
  static const Color heroViaDark = Color(0xFF1E0B33);
  static const Color titleFromDark = Color(0xFFFFD77A);
  static const Color titleToDark = Color(0xFFE8B64C);
  static const Color glowDark = Color(0x40A738F5);

  static const Color backgroundLight = Color(0xFFFAF8F3);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFF4F1EA);
  static const Color borderLight = Color(0xFFE4DCCF);
  static const Color textLight = Color(0xFF1A1523);
  static const Color mutedLight = Color(0xFF5E5670);
  static const Color goldHighlightLight = Color(0xFFF5C85E);
  static const Color goldTextLight = Color(0xFF8A5A00);
  static const Color onGoldLight = Color(0xFF1A1523);
  static const Color linkLight = Color(0xFF7E22CE);
  static const Color crowdAvailableLight = Color(0xFF16A34A);
  static const Color crowdAlmostFullLight = Color(0xFFCA8A04);
  static const Color crowdFullLight = Color(0xFFDC2626);
  static const Color heroViaLight = Color(0xFFEFE3FF);
  static const Color titleFromLight = Color(0xFFB07A12);
  static const Color titleToLight = Color(0xFF8A5A00);
  static const Color glowLight = Color(0x141A1523);

  static const Color authLabel = Color(0xFF1A1206);
  static const Color authGlow = Color(0xA6E8B64C);

  static const Color rankS = Color(0xFFE8B64C);
  static const Color rankSText = Color(0xFF07070D);
  static const Color rankA = Color(0xFF963BE8);
  static const Color rankAText = Color(0xFFF5F1E8);
  static const Color rankB = Color(0xFF5869C8);
  static const Color rankBText = Color(0xFFF5F1E8);
  static const Color rankC = Color(0xFF74788B);
  static const Color rankCText = Color(0xFF07070D);
}

@immutable
class VenueRankColors {
  const VenueRankColors({
    required this.background,
    required this.foreground,
    required this.name,
  });

  final Color background;
  final Color foreground;
  final String name;

  static const s = VenueRankColors(
    background: AppColor.rankS,
    foreground: AppColor.rankSText,
    name: 'Legendary',
  );
  static const a = VenueRankColors(
    background: AppColor.rankA,
    foreground: AppColor.rankAText,
    name: 'Excellent',
  );
  static const b = VenueRankColors(
    background: AppColor.rankB,
    foreground: AppColor.rankBText,
    name: 'Good',
  );
  static const c = VenueRankColors(
    background: AppColor.rankC,
    foreground: AppColor.rankCText,
    name: 'Normal',
  );
}

@immutable
class NightOutColors extends ThemeExtension<NightOutColors> {
  const NightOutColors({
    required this.background,
    required this.surface,
    required this.card,
    required this.border,
    required this.text,
    required this.muted,
    required this.gold,
    required this.goldHighlight,
    required this.goldText,
    required this.onGold,
    required this.purple,
    required this.link,
    required this.crowdAvailable,
    required this.crowdAlmostFull,
    required this.crowdFull,
    required this.heroVia,
    required this.titleFrom,
    required this.titleTo,
    required this.glow,
  });

  final Color background;
  final Color surface;
  final Color card;
  final Color border;
  final Color text;
  final Color muted;
  final Color gold;
  final Color goldHighlight;
  final Color goldText;
  final Color onGold;
  final Color purple;
  final Color link;
  final Color crowdAvailable;
  final Color crowdAlmostFull;
  final Color crowdFull;
  final Color heroVia;
  final Color titleFrom;
  final Color titleTo;
  final List<BoxShadow> glow;

  static const dark = NightOutColors(
    background: AppColor.backgroundDark,
    surface: AppColor.surfaceDark,
    card: AppColor.cardDark,
    border: AppColor.borderDark,
    text: AppColor.textDark,
    muted: AppColor.mutedDark,
    gold: AppColor.gold,
    goldHighlight: AppColor.goldHighlightDark,
    goldText: AppColor.goldTextDark,
    onGold: AppColor.onGoldDark,
    purple: AppColor.purple,
    link: AppColor.linkDark,
    crowdAvailable: AppColor.crowdAvailableDark,
    crowdAlmostFull: AppColor.crowdAlmostFullDark,
    crowdFull: AppColor.crowdFullDark,
    heroVia: AppColor.heroViaDark,
    titleFrom: AppColor.titleFromDark,
    titleTo: AppColor.titleToDark,
    glow: [
      BoxShadow(color: AppColor.gold, spreadRadius: 1),
      BoxShadow(
        color: AppColor.glowDark,
        offset: Offset(0, 8),
        blurRadius: 32,
      ),
    ],
  );

  static const light = NightOutColors(
    background: AppColor.backgroundLight,
    surface: AppColor.surfaceLight,
    card: AppColor.cardLight,
    border: AppColor.borderLight,
    text: AppColor.textLight,
    muted: AppColor.mutedLight,
    gold: AppColor.gold,
    goldHighlight: AppColor.goldHighlightLight,
    goldText: AppColor.goldTextLight,
    onGold: AppColor.onGoldLight,
    purple: AppColor.purple,
    link: AppColor.linkLight,
    crowdAvailable: AppColor.crowdAvailableLight,
    crowdAlmostFull: AppColor.crowdAlmostFullLight,
    crowdFull: AppColor.crowdFullLight,
    heroVia: AppColor.heroViaLight,
    titleFrom: AppColor.titleFromLight,
    titleTo: AppColor.titleToLight,
    glow: [
      BoxShadow(
        color: AppColor.glowLight,
        offset: Offset(0, 8),
        blurRadius: 24,
      ),
    ],
  );

  ColorScheme toScheme(Brightness brightness) {
    return ColorScheme.fromSeed(
      seedColor: gold,
      brightness: brightness,
    ).copyWith(
      primary: gold,
      onPrimary: onGold,
      secondary: purple,
      onSecondary: AppColor.white,
      tertiary: link,
      onTertiary: brightness == Brightness.dark ? background : AppColor.white,
      error: crowdFull,
      onError: AppColor.white,
      surface: background,
      onSurface: text,
      onSurfaceVariant: muted,
      surfaceContainer: surface,
      surfaceContainerHigh: card,
      surfaceContainerHighest: card,
      outline: border,
    );
  }

  @override
  NightOutColors copyWith({
    Color? background,
    Color? surface,
    Color? card,
    Color? border,
    Color? text,
    Color? muted,
    Color? gold,
    Color? goldHighlight,
    Color? goldText,
    Color? onGold,
    Color? purple,
    Color? link,
    Color? crowdAvailable,
    Color? crowdAlmostFull,
    Color? crowdFull,
    Color? heroVia,
    Color? titleFrom,
    Color? titleTo,
    List<BoxShadow>? glow,
  }) {
    return NightOutColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      card: card ?? this.card,
      border: border ?? this.border,
      text: text ?? this.text,
      muted: muted ?? this.muted,
      gold: gold ?? this.gold,
      goldHighlight: goldHighlight ?? this.goldHighlight,
      goldText: goldText ?? this.goldText,
      onGold: onGold ?? this.onGold,
      purple: purple ?? this.purple,
      link: link ?? this.link,
      crowdAvailable: crowdAvailable ?? this.crowdAvailable,
      crowdAlmostFull: crowdAlmostFull ?? this.crowdAlmostFull,
      crowdFull: crowdFull ?? this.crowdFull,
      heroVia: heroVia ?? this.heroVia,
      titleFrom: titleFrom ?? this.titleFrom,
      titleTo: titleTo ?? this.titleTo,
      glow: glow ?? this.glow,
    );
  }

  @override
  NightOutColors lerp(NightOutColors? other, double t) {
    if (other == null) return this;
    return NightOutColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      card: Color.lerp(card, other.card, t)!,
      border: Color.lerp(border, other.border, t)!,
      text: Color.lerp(text, other.text, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      gold: Color.lerp(gold, other.gold, t)!,
      goldHighlight: Color.lerp(goldHighlight, other.goldHighlight, t)!,
      goldText: Color.lerp(goldText, other.goldText, t)!,
      onGold: Color.lerp(onGold, other.onGold, t)!,
      purple: Color.lerp(purple, other.purple, t)!,
      link: Color.lerp(link, other.link, t)!,
      crowdAvailable: Color.lerp(crowdAvailable, other.crowdAvailable, t)!,
      crowdAlmostFull: Color.lerp(crowdAlmostFull, other.crowdAlmostFull, t)!,
      crowdFull: Color.lerp(crowdFull, other.crowdFull, t)!,
      heroVia: Color.lerp(heroVia, other.heroVia, t)!,
      titleFrom: Color.lerp(titleFrom, other.titleFrom, t)!,
      titleTo: Color.lerp(titleTo, other.titleTo, t)!,
      glow: BoxShadow.lerpList(glow, other.glow, t) ?? glow,
    );
  }
}
