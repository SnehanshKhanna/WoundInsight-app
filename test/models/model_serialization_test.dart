import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:wound_insight_app/models/analysis_result.dart';
import 'package:wound_insight_app/models/user.dart';
import 'package:wound_insight_app/models/wound.dart';
import 'package:wound_insight_app/models/auth_token.dart';

void main() {
  group('Model Serialization Tests', () {
    const woundJsonString = '''
{
  "analysis_id": "b95f1ce8-d531-4430-8cb0-6b91a460e5f7",
  "status": "success",
  "timestamp": "2026-09-13T16:44:42.159578+00:00",
  "original_filename": "1011.png",
  "user_id": "u123",
  "wound_id": "w456",
  "wound": {
    "detected": true,
    "area_pixels": 2044,
    "area_cm2": 0.46,
    "perimeter_mm": 23.1,
    "circularity": 1.0,
    "is_irregular": false
  },
  "tissue": {
    "fibrin_slough_percent": 18.4,
    "granulation_percent": 72.6,
    "callus_percent": 9.1
  },
  "etiology": {
    "predicted_type": "Venous Ulcer",
    "confidence": 56.7,
    "probabilities": {
      "DFU": 26.2,
      "Pressure": 4.1,
      "Surgical": 13.1,
      "Venous": 56.7
    }
  },
  "severity": {
    "severity_score": 10.5,
    "severity_grade": "Low (Mild)",
    "recommended_action": "Routine clinical assessment and skin protection protocol recommended."
  },
  "uncertainty": {
    "ai_confidence_score": 89.2,
    "requires_clinician_review": true
  },
  "visualizations": {
    "report_image_url": "/api/v1/analyses/b95f1ce8-d531-4430-8cb0-6b91a460e5f7/report",
    "report_filename": "report_b95f1ce8-d531-4430-8cb0-6b91a460e5f7.png",
    "original_image_url": "/api/v1/analyses/b95f1ce8-d531-4430-8cb0-6b91a460e5f7/image",
    "gradcam_image_url": "/api/v1/analyses/b95f1ce8-d531-4430-8cb0-6b91a460e5f7/gradcam"
  },
  "explainability": {
    "available": true,
    "method": "Grad-CAM (Dual-Branch ResNet34)",
    "target_class": "Venous Ulcer",
    "global_target_layer": "global_backbone.layer4",
    "roi_target_layer": "roi_backbone.layer4",
    "fusion_method": "normalize((global_cam + roi_cam_full) / 2)",
    "academic_notice": "Attribution visualization indicates model feature activation patterns, not clinical causality."
  },
  "academic_notice": "Academic prototype. Not certified for standalone clinical diagnostic decisions."
}
''';

    const blankJsonString = '''
{
  "analysis_id": "70e08bd8-7c9c-4ff6-8ffb-b7df3ab658de",
  "status": "success",
  "timestamp": "2026-09-13T16:44:44.203280+00:00",
  "original_filename": "blank.png",
  "user_id": null,
  "wound": {
    "detected": false,
    "area_pixels": 0,
    "area_cm2": 0.0,
    "perimeter_mm": 0.0,
    "circularity": 0.0,
    "is_irregular": false
  },
  "tissue": {
    "fibrin_slough_percent": 0.0,
    "granulation_percent": 0.0,
    "callus_percent": 0.0
  },
  "etiology": {
    "predicted_type": "Surgical Wound",
    "confidence": 80.3,
    "probabilities": {
      "DFU": 7.0,
      "Pressure": 7.6,
      "Surgical": 80.3,
      "Venous": 5.1
    }
  },
  "severity": {
    "severity_score": 0.0,
    "severity_grade": "No Active Lesion Detected",
    "recommended_action": "No active wound bed delineated. Clinical re-assessment advised if an unsegmented lesion is suspected."
  },
  "uncertainty": {
    "ai_confidence_score": 100.0,
    "requires_clinician_review": false
  },
  "visualizations": {
    "report_image_url": "/api/v1/analyses/70e08bd8-7c9c-4ff6-8ffb-b7df3ab658de/report",
    "report_filename": "report_70e08bd8-7c9c-4ff6-8ffb-b7df3ab658de.png",
    "original_image_url": "/api/v1/analyses/70e08bd8-7c9c-4ff6-8ffb-b7df3ab658de/image"
  },
  "explainability": {
    "available": true,
    "method": "Grad-CAM (Dual-Branch ResNet34)",
    "target_class": "Surgical Wound",
    "global_target_layer": "global_backbone.layer4",
    "roi_target_layer": "roi_backbone.layer4",
    "fusion_method": "normalize((global_cam + roi_cam_full) / 2)",
    "academic_notice": "Attribution visualization indicates model feature activation patterns, not clinical causality."
  },
  "academic_notice": "Academic prototype. Not certified for standalone clinical diagnostic decisions."
}
''';

    test('parses real wound analysis JSON and round-trips cleanly', () {
      final Map<String, dynamic> rawMap = jsonDecode(woundJsonString);
      final analysis = AnalysisResult.fromJson(rawMap);

      expect(analysis.analysisId, 'b95f1ce8-d531-4430-8cb0-6b91a460e5f7');
      expect(analysis.status, 'success');
      expect(analysis.wound.detected, isTrue);
      expect(analysis.isLesionDetected, isTrue);
      expect(analysis.wound.areaCm2, 0.46);
      expect(analysis.wound.perimeterMm, 23.1);
      expect(analysis.wound.circularity, 1.0);
      expect(analysis.tissue.granulationPercent, 72.6);
      expect(analysis.etiology.predictedType, 'Venous Ulcer');
      expect(analysis.severity.severityGrade, 'Low (Mild)');
      expect(analysis.severity.severityScore, 10.5);
      expect(analysis.uncertainty.aiConfidenceScore, 89.2);
      expect(analysis.uncertainty.requiresClinicianReview, isTrue);
      expect(analysis.explainability?.available, isTrue);

      final exported = analysis.toJson();
      expect(exported['analysis_id'], analysis.analysisId);
      expect(analysis.wound.areaCm2, 0.46);
    });

    test('parses real blank non-lesion JSON with no active lesion state', () {
      final Map<String, dynamic> rawMap = jsonDecode(blankJsonString);
      final analysis = AnalysisResult.fromJson(rawMap);

      expect(analysis.analysisId, '70e08bd8-7c9c-4ff6-8ffb-b7df3ab658de');
      expect(analysis.wound.detected, isFalse);
      expect(analysis.isLesionDetected, isFalse);
      expect(analysis.severity.severityGrade, 'No Active Lesion Detected');
      expect(analysis.wound.areaCm2, 0.0);
      expect(analysis.uncertainty.requiresClinicianReview, isFalse);

      final exported = analysis.toJson();
      expect(exported['analysis_id'], '70e08bd8-7c9c-4ff6-8ffb-b7df3ab658de');
      expect(analysis.wound.detected, isFalse);
    });

    test('parses User model fromJson and toJson', () {
      final userMap = {
        'id': 'user-uuid-123',
        'email': 'clinician@test.edu',
        'name': 'Dr. Sarah Smith',
        'created_at': '2026-09-13T10:00:00Z',
      };
      final user = User.fromJson(userMap);
      expect(user.id, 'user-uuid-123');
      expect(user.email, 'clinician@test.edu');
      expect(user.name, 'Dr. Sarah Smith');
      expect(user.createdAt, '2026-09-13T10:00:00Z');

      final json = user.toJson();
      expect(json['email'], 'clinician@test.edu');
    });

    test('parses Wound model fromJson and toJson', () {
      final woundMap = {
        'id': 'wound-999',
        'user_id': 'user-uuid-123',
        'name': 'Left Heel Ulcer',
        'location': 'Left Posterior Calcaneus',
        'created_at': '2026-09-13T12:00:00Z',
      };
      final wound = Wound.fromJson(woundMap);
      expect(wound.id, 'wound-999');
      expect(wound.userId, 'user-uuid-123');
      expect(wound.name, 'Left Heel Ulcer');
      expect(wound.location, 'Left Posterior Calcaneus');

      final json = wound.toJson();
      expect(json['name'], 'Left Heel Ulcer');
    });

    test('parses AuthToken model fromJson and toJson', () {
      final tokenMap = {
        'access_token': 'jwt.token.string',
        'token_type': 'bearer',
        'user': {
          'id': 'user-uuid-123',
          'email': 'clinician@test.edu',
          'name': 'Dr. Sarah Smith',
          'created_at': '2026-09-13T10:00:00Z',
        },
      };
      final token = AuthToken.fromJson(tokenMap);
      expect(token.accessToken, 'jwt.token.string');
      expect(token.tokenType, 'bearer');
      expect(token.user.email, 'clinician@test.edu');
    });
  });
}
