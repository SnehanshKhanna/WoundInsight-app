import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/core/theme/app_colors.dart';
import 'package:wound_insight_app/core/theme/app_typography.dart';
import 'package:wound_insight_app/models/wound.dart';
import 'package:wound_insight_app/providers/core_providers.dart';
import 'package:wound_insight_app/features/home/home_screen.dart';
import 'package:wound_insight_app/features/progress/progress_screen.dart';
import 'package:wound_insight_app/features/profile/profile_screen.dart';
import 'package:wound_insight_app/features/wounds/wound_selection_sheet.dart';
import 'package:wound_insight_app/features/scan/scan_preview_screen.dart';

class MainNavigationShell extends ConsumerStatefulWidget {
  const MainNavigationShell({super.key});

  @override
  ConsumerState<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends ConsumerState<MainNavigationShell> {
  int _currentIndex = 0;

  Future<void> _initiateNewScanFlow() async {
    // 1. Select or create target wound
    final Wound? chosenWound = await WoundSelectionSheet.show(context);
    if (chosenWound == null || !mounted) return;

    // 2. Select image source modal
    final source = await showModalBottomSheet<String>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Capture Wound Scan', style: AppTypography.titleLarge),
              const SizedBox(height: 6),
              Text(
                'Target: ${chosenWound.name}',
                style: AppTypography.labelSmall.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: 18),
              ListTile(
                leading: const Icon(Icons.camera_alt_rounded, color: AppColors.primary, size: 26),
                title: const Text('Take Photo with Camera'),
                subtitle: const Text('Position lesion centrally with neutral clinical lighting'),
                onTap: () => Navigator.of(ctx).pop('camera'),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.photo_library_rounded, color: AppColors.primary, size: 26),
                title: const Text('Choose from Gallery'),
                subtitle: const Text('Upload an existing clinical wound photograph'),
                onTap: () => Navigator.of(ctx).pop('gallery'),
              ),
            ],
          ),
        ),
      ),
    );

    if (source == null || !mounted) return;

    // 3. Pick image
    final captureService = ref.read(imageCaptureServiceProvider);
    String? imagePath;
    try {
      if (source == 'camera') {
        imagePath = await captureService.pickFromCamera();
      } else {
        imagePath = await captureService.pickFromGallery();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to access image source: $e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      return;
    }

    if (imagePath != null && mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ScanPreviewScreen(
            imagePath: imagePath!,
            wound: chosenWound,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Widget> screens = [
      HomeScreen(onStartNewScan: _initiateNewScanFlow),
      const ProgressScreen(),
      const ProfileScreen(),
    ];

    // Note: Tab indices: 0 = Home, 1 = Progress, 2 = Profile
    // The Scan button is the raised center action
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          border: Border(
            top: BorderSide(
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.06),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 64,
            child: Row(
              children: [
                // 1. Home Tab
                Expanded(
                  child: _buildNavItem(
                    icon: Icons.home_rounded,
                    unselectedIcon: Icons.home_outlined,
                    label: 'Home',
                    isSelected: _currentIndex == 0,
                    onTap: () => setState(() => _currentIndex = 0),
                    isDark: isDark,
                  ),
                ),

                // 2. Progress Tab
                Expanded(
                  child: _buildNavItem(
                    icon: Icons.insights_rounded,
                    unselectedIcon: Icons.insights_outlined,
                    label: 'Progress',
                    isSelected: _currentIndex == 1,
                    onTap: () => setState(() => _currentIndex = 1),
                    isDark: isDark,
                  ),
                ),

                // 3. Central Prominent Scan Pill Button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _initiateNewScanFlow,
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [AppColors.primary, Color(0xFF00897B)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.35),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt_rounded, color: Colors.white, size: 18),
                              SizedBox(width: 5),
                              Text(
                                'Scan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // 4. Profile Tab
                Expanded(
                  child: _buildNavItem(
                    icon: Icons.person_rounded,
                    unselectedIcon: Icons.person_outline_rounded,
                    label: 'Profile',
                    isSelected: _currentIndex == 2,
                    onTap: () => setState(() => _currentIndex = 2),
                    isDark: isDark,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData unselectedIcon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    final color = isSelected
        ? AppColors.primary
        : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(isSelected ? icon : unselectedIcon, color: color, size: 22),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
