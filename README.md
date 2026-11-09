# Student Progress Tracker

A Flutter mobile application demonstrating the **LinearProgressIndicator** widget through a Student Progress Tracker dashboard.

## About the Project

Student Progress Tracker helps students monitor their course completion and assignment progress using horizontal progress bars.

The application also includes an interactive demonstration where users can customise the LinearProgressIndicator widget.

## Features

- Overall course progress tracking.
- Individual assignment progress tracking.
- Interactive progress percentage slider.
- Progress bar colour customisation.
- Progress bar thickness adjustment.
- Reset button to demonstrate default widget behaviour.

## Widget Used

**LinearProgressIndicator**

LinearProgressIndicator is a Flutter Material Design widget that displays progress horizontally.

It can show determinate progress (when the completion value is known) or indeterminate progress (when the value is null).

## Three Properties Demonstrated

### 1. value

Controls the amount of progress displayed.

- Default: `null`
- Changed example: `0.65`
- Effect: Displays 65% progress when set to 0.65.

### 2. color

Controls the colour of the progress bar.

- Default: `null` (uses theme-based styling).
- Changed examples: `Colors.blue`, `Colors.green`, `Colors.orange`.
- Effect: Changes the progress bar colour.

### 3. minHeight

Controls the minimum thickness of the progress bar.

- Default: `4.0`
- Changed example: `10.0`
- Effect: Makes the progress bar thicker.

## Code Example

```dart
LinearProgressIndicator(
  value: progressValue,
  color: progressColor,
  minHeight: progressHeight,
),
```

## Technologies Used

- Flutter
- Dart
- Material Design
- Android Emulator

## How to Run the Project

1. Install Flutter and Android Studio.
2. Clone this repository:

```bash
git clone https://github.com/LeaM103/student_progress_tracker.git
```

3. Open the project folder:

```bash
cd student_progress_tracker
```

4. Get the dependencies:

```bash
flutter pub get
```

5. Start an Android emulator.
6. Run the application:

```bash
flutter run
```



Flutter Widget Presentation Project

**Widget:** LinearProgressIndicator
