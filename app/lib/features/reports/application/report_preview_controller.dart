import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/app_types.dart';
import '../data/report_repository.dart';

final reportPreviewControllerProvider =
    AsyncNotifierProvider<ReportPreviewController, DoctorSummaryPreview>(
      ReportPreviewController.new,
    );

class ReportPreviewController extends AsyncNotifier<DoctorSummaryPreview> {
  @override
  Future<DoctorSummaryPreview> build() async {
    return ref.read(reportRepositoryProvider).buildPreview();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(reportRepositoryProvider).buildPreview(),
    );
  }
}
