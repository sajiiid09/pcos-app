import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/domain/app_types.dart';
import '../data/user_profile_repository.dart';

final onboardingControllerProvider =
    AsyncNotifierProvider<OnboardingController, UserProfileRecord?>(
      OnboardingController.new,
    );

class OnboardingController extends AsyncNotifier<UserProfileRecord?> {
  UserProfileRepository get _repository =>
      ref.read(userProfileRepositoryProvider);

  @override
  Future<UserProfileRecord?> build() async {
    await _repository.prepareForLaunch();
    return _repository.getProfile();
  }

  Future<void> saveProfile(UserProfileDraft draft) async {
    await _repository.saveProfile(draft);
    state = AsyncData(await _repository.getProfile());
  }
}
