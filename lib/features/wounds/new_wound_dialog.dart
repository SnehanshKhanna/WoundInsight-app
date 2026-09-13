import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/core/theme/app_typography.dart';
import 'package:wound_insight_app/models/wound.dart';
import 'package:wound_insight_app/providers/wound_providers.dart';

class NewWoundDialog extends ConsumerStatefulWidget {
  const NewWoundDialog({super.key});

  static Future<Wound?> show(BuildContext context) {
    return showDialog<Wound>(
      context: context,
      builder: (_) => const NewWoundDialog(),
    );
  }

  @override
  ConsumerState<NewWoundDialog> createState() => _NewWoundDialogState();
}

class _NewWoundDialogState extends ConsumerState<NewWoundDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    final name = _nameController.text.trim();
    final location = _locationController.text.trim();

    final wound = await ref.read(woundListProvider.notifier).createWound(
          name: name,
          location: location.isNotEmpty ? location : null,
        );

    if (mounted) {
      setState(() => _isSaving = false);
      if (wound != null) {
        ref.read(selectedWoundIdProvider.notifier).state = wound.id;
        Navigator.of(context).pop(wound);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New Wound Profile', style: AppTypography.titleLarge),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create a tracked profile to log progression and compare morphometrics over time.',
              style: AppTypography.bodySmall,
            ),
            const SizedBox(height: 18),
            const Text('Wound Label *', style: AppTypography.labelSmall),
            const SizedBox(height: 6),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'e.g. Left Heel Ulcer',
              ),
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Please give this wound a label.';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
            const Text('Anatomical Location (Optional)', style: AppTypography.labelSmall),
            const SizedBox(height: 6),
            TextFormField(
              controller: _locationController,
              decoration: const InputDecoration(
                hintText: 'e.g. Plantar surface, 1st metatarsal',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSaving ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isSaving ? null : _handleSave,
          style: ElevatedButton.styleFrom(minimumSize: const Size(100, 42)),
          child: _isSaving
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                )
              : const Text('Create'),
        ),
      ],
    );
  }
}
