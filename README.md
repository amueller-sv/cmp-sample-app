# sz_sample_app

Sample app (Flutter).

## Prerequisites

- **FVM** (Flutter Version Manager) installed
- Flutter version is pinned in `.fvmrc`: **3.32.8**

If FVM is installed, run all Flutter commands via `fvm flutter ...`.

## Setup

From the project root:

```bash
fvm install
fvm flutter pub get
```

## Run the app (Debug)

```bash
fvm flutter run
```

Optional with device selection:

```bash
fvm flutter devices
fvm flutter run -d <deviceId>
```

## Builds for testers

### Android (APK)

Build a release APK:

```bash
fvm flutter build apk --release
```

Artifact:

- `build/app/outputs/flutter-apk/app-release.apk`

### iOS

If supporters have the source code, the simplest way is to run the app directly on their device:

```bash
fvm flutter run -d <deviceId>
```

