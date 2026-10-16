abstract final class Config {
  static const appName = 'NightOut Admin';
  static const themeStorageKey = 'nightout-theme';
  static const sessionStorageKey = 'nightout-admin-session';

  /// โหลดจาก `--dart-define-from-file=.env.dev`
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const anonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
  static const apiBaseUrl = String.fromEnvironment('API_BASE_URL');
  static const authRedirectUrl = String.fromEnvironment('AUTH_REDIRECT_URL');
}
