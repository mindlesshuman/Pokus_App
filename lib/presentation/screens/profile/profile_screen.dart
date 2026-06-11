import 'package:flutter/material.dart';
import 'package:pokus/core/constants/app_colors.dart';

/// ProfileScreen — user settings hub forced to dark theme.
///
/// Displays a large centered avatar, user credentials, and grouped
/// ListTile configuration sections with chevron indicators.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundDark,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backgroundDark,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          titleTextStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFFE5E7EB),
          ),
          subtitleTextStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            color: AppColors.grey400,
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                // ── Avatar block ────────────────────────────────
                const Center(
                  child: CircleAvatar(
                    radius: 44,
                    backgroundColor: AppColors.primary,
                    child: Text(
                      'A',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Alex Johnson',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'alex.johnson@email.com',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: AppColors.grey400,
                  ),
                ),
                const SizedBox(height: 4),
                Chip(
                  label: const Text('Premium Member'),
                  backgroundColor:
                      AppColors.warning.withValues(alpha: 0.15),
                  labelStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.warningLight,
                  ),
                  side: BorderSide.none,
                ),

                const SizedBox(height: 28),
                const Divider(),

                // ── Account section ─────────────────────────────
                const _SectionHeader(title: 'Account'),
                _SettingsTile(
                  icon: Icons.person_outline,
                  title: 'Personal Information',
                  onTap: () {},
                ),
                _SettingsTile(
                  icon: Icons.shield_outlined,
                  title: 'Privacy & Security',
                  onTap: () {},
                ),
                _SettingsTile(
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  onTap: () {},
                ),

                const Divider(),

                // ── Family section ──────────────────────────────
                const _SectionHeader(title: 'Family'),
                _SettingsTile(
                  icon: Icons.people_outline,
                  title: 'Family Members',
                  onTap: () {},
                ),
                _SettingsTile(
                  icon: Icons.screen_lock_portrait_outlined,
                  title: 'Screen Time Limits',
                  onTap: () {},
                ),
                _SettingsTile(
                  icon: Icons.gps_fixed_outlined,
                  title: 'Location Sharing',
                  onTap: () {},
                ),

                const Divider(),

                // ── App section ─────────────────────────────────
                const _SectionHeader(title: 'App'),
                _SettingsTile(
                  icon: Icons.palette_outlined,
                  title: 'Appearance',
                  trailing: 'System',
                  onTap: () {},
                ),
                _SettingsTile(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  onTap: () {},
                ),
                _SettingsTile(
                  icon: Icons.info_outline,
                  title: 'About',
                  trailing: 'v1.0.0',
                  onTap: () {},
                ),

                const SizedBox(height: 24),

                // ── Sign out ────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.error,
                        side: const BorderSide(color: AppColors.error),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Sign Out',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Section header ───────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.grey400,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// ── Settings tile ────────────────────────────────────────────────────
class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryLight, size: 22),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null)
            Text(
              trailing!,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: AppColors.grey400,
              ),
            ),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, color: AppColors.grey600, size: 20),
        ],
      ),
      onTap: onTap,
    );
  }
}
