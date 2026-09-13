import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette
  static const Color primary = Color(0xFF0D6E6E);       // Deep Clinical Teal
  static const Color primaryLight = Color(0xFF4A9B9B);
  static const Color primaryDark = Color(0xFF074545);
  static const Color accent = Color(0xFF00A896);        // Vibrant Cyan / Seafoam

  // Neutral Palette (Light Mode)
  static const Color backgroundLight = Color(0xFFF7F9FB);
  static const Color surfaceLight = Colors.white;
  static const Color cardLight = Colors.white;
  static const Color textPrimaryLight = Color(0xFF1E293B);   // Slate 800
  static const Color textSecondaryLight = Color(0xFF64748B); // Slate 500
  static const Color borderLight = Color(0xFFE2E8F0);        // Slate 200

  // Neutral Palette (Dark Mode)
  static const Color backgroundDark = Color(0xFF0F172A);  // Slate 900
  static const Color surfaceDark = Color(0xFF1E293B);     // Slate 800
  static const Color cardDark = Color(0xFF1E293B);
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
  static const Color borderDark = Color(0xFF334155);

  // Severity Grade Colors
  static const Color severityLow = Color(0xFF10B981);       // Emerald Green
  static const Color severityModerate = Color(0xFFF59E0B);  // Amber
  static const Color severityHigh = Color(0xFFEF4444);      // Red
  static const Color severityCritical = Color(0xFF991B1B);  // Deep Burgundy
  static const Color severityNoLesion = Color(0xFF0284C7);  // Sky Blue

  // Tissue Breakdown Colors (Exact clinical mapping from WoundInsight ML)
  static const Color tissueGranulation = Color(0xFFE62828);    // Red (Healing)
  static const Color tissueFibrinSlough = Color(0xFFEAB308);   // Yellow (Slough/Fibrin)
  static const Color tissueCallus = Color(0xFF94A3B8);         // Light Gray/Slate (Callus)
  static const Color tissueBackground = Color(0xFFCBD5E1);

  static Color getSeverityColor(String? grade) {
    if (grade == null) return textSecondaryLight;
    final lower = grade.toLowerCase();
    if (lower.contains('no active') || lower.contains('no lesion')) {
      return severityNoLesion;
    } else if (lower.contains('low') || lower.contains('mild')) {
      return severityLow;
    } else if (lower.contains('moderate') || lower.contains('chronic')) {
      return severityModerate;
    } else if (lower.contains('high') || lower.contains('severe')) {
      return severityHigh;
    } else if (lower.contains('critical') || lower.contains('urgent')) {
      return severityCritical;
    }
    return severityModerate;
  }
}
