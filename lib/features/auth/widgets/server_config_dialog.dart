import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wound_insight_app/core/theme/app_colors.dart';
import 'package:wound_insight_app/core/theme/app_typography.dart';
import 'package:wound_insight_app/providers/core_providers.dart';

class ServerConfigDialog extends ConsumerStatefulWidget {
  const ServerConfigDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => const ServerConfigDialog(),
    );
  }

  @override
  ConsumerState<ServerConfigDialog> createState() => _ServerConfigDialogState();
}

class _ServerConfigDialogState extends ConsumerState<ServerConfigDialog> {
  late final TextEditingController _urlController;
  bool _isTesting = false;
  String? _testMessage;
  bool _isSuccess = false;

  @override
  void initState() {
    super.initState();
    final config = ref.read(appConfigProvider);
    _urlController = TextEditingController(text: config.baseUrl);
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  Future<void> _testConnection() async {
    final candidate = _urlController.text.trim();
    if (candidate.isEmpty) return;

    setState(() {
      _isTesting = true;
      _testMessage = null;
    });

    final config = ref.read(appConfigProvider);
    final result = await config.testConnection(candidate);

    if (mounted) {
      setState(() {
        _isTesting = false;
        _isSuccess = result['success'] == true;
        _testMessage = result['message'];
      });
    }
  }

  Future<void> _saveAndClose() async {
    final candidate = _urlController.text.trim();
    if (candidate.isNotEmpty) {
      final config = ref.read(appConfigProvider);
      await config.setBaseUrl(candidate);
      ref.invalidate(apiClientProvider);
    }
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  void _applyPreset(String url) {
    setState(() {
      _urlController.text = url;
      _testMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.dns_rounded, color: AppColors.primary),
          SizedBox(width: 10),
          Text('API Server Setup', style: AppTypography.titleMedium),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select a preset or enter the host machine URL for the FastAPI backend:',
              style: AppTypography.bodySmall.copyWith(
                color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                ActionChip(
                  avatar: const Icon(Icons.usb_rounded, size: 16),
                  label: const Text('USB (127.0.0.1)'),
                  onPressed: () => _applyPreset('http://127.0.0.1:8000'),
                ),
                ActionChip(
                  avatar: const Icon(Icons.wifi_rounded, size: 16),
                  label: const Text('Wi-Fi LAN'),
                  onPressed: () => _applyPreset('http://10.152.20.175:8000'),
                ),
                ActionChip(
                  avatar: const Icon(Icons.phone_android_rounded, size: 16),
                  label: const Text('Emulator'),
                  onPressed: () => _applyPreset('http://10.0.2.2:8000'),
                ),
              ],
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _urlController,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                labelText: 'Server URL',
                hintText: 'http://127.0.0.1:8000',
                prefixIcon: Icon(Icons.link_rounded, size: 20),
                isDense: true,
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: _isTesting ? null : _testConnection,
              icon: _isTesting
                  ? const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.network_check_rounded, size: 18),
              label: const Text('Test Connection'),
            ),
            if (_testMessage != null) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _isSuccess
                      ? AppColors.severityLow.withOpacity(0.12)
                      : AppColors.severityHigh.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _isSuccess
                        ? AppColors.severityLow.withOpacity(0.4)
                        : AppColors.severityHigh.withOpacity(0.4),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      _isSuccess ? Icons.check_circle_rounded : Icons.error_outline_rounded,
                      size: 16,
                      color: _isSuccess ? AppColors.severityLow : AppColors.severityHigh,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _testMessage!,
                        style: AppTypography.bodySmall.copyWith(
                          fontSize: 12,
                          color: _isSuccess ? AppColors.severityLow : AppColors.severityHigh,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _saveAndClose,
          child: const Text('Save & Apply'),
        ),
      ],
    );
  }
}
