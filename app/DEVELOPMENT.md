# DEVELOPMENT

## Scope

- Patient app MVP, local-first with Drift (no sync yet).
- Keep feature folders simple: presentation, application, data.

## Setup

1. `flutter pub get`
2. `dart run build_runner build --delete-conflicting-outputs`

## Daily Commands

- Analyze: `flutter analyze`
- Test: `flutter test`
- Rebuild generated files: `dart run build_runner build --delete-conflicting-outputs`

## Conventions

- Use Riverpod `AsyncNotifier` for async feature state.
- Keep repository writes validated and normalized.
- Expose recoverable UI error states; avoid uncaught async exceptions.

