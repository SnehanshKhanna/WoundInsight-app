import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/core/theme/app_colors.dart';
import 'package:wound_insight_app/core/theme/app_typography.dart';
import 'package:wound_insight_app/models/wound.dart';
import 'package:wound_insight_app/providers/wound_providers.dart';
import 'package:wound_insight_app/features/wounds/new_wound_dialog.dart';
import 'package:wound_insight_app/widgets/loading_view.dart';
import 'package:wound_insight_app/widgets/error_view.dart';

class WoundSelectionSheet extends ConsumerWidget {
  const WoundSelectionSheet({super.key});

  static Future<Wound?> show(BuildContext context) {
    return showModalBottomSheet<Wound>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const WoundSelectionSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final woundListAsync = ref.watch(woundListProvider);
    final selectedWoundId = ref.watch(selectedWoundIdProvider);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Wound Profile',
                  style: AppTypography.titleLarge,
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Associate your new scan with an existing wound or create a new profile.',
              style: AppTypography.bodySmall,
            ),
            const SizedBox(height: 16),
            woundListAsync.when(
              loading: () => const SizedBox(height: 120, child: LoadingView(message: 'Loading wounds...')),
              error: (e, _) => ErrorView(
                message: e.toString(),
                onRetry: () => ref.read(woundListProvider.notifier).fetchWounds(),
              ),
              data: (wounds) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 280),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: wounds.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final wound = wounds[index];
                      final isSelected = wound.id == selectedWoundId;

                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        leading: CircleAvatar(
                          backgroundColor: isSelected
                              ? AppColors.primary
                              : AppColors.primary.withOpacity(0.1),
                          foregroundColor: isSelected ? Colors.white : AppColors.primary,
                          child: const Icon(Icons.healing_rounded, size: 20),
                        ),
                        title: Text(
                          wound.name,
                          style: AppTypography.titleMedium.copyWith(
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                          ),
                        ),
                        subtitle: wound.location != null ? Text(wound.location!) : null,
                        trailing: isSelected
                            ? const Icon(Icons.check_circle_rounded, color: AppColors.primary)
                            : null,
                        onTap: () {
                          ref.read(selectedWoundIdProvider.notifier).state = wound.id;
                          Navigator.of(context).pop(wound);
                        },
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () async {
                final newWound = await NewWoundDialog.show(context);
                if (newWound != null && context.mounted) {
                  Navigator.of(context).pop(newWound);
                }
              },
              icon: const Icon(Icons.add_rounded),
              label: const Text('Create New Wound Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
