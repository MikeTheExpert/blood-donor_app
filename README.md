# Blood Donor App

A Flutter application developed as a task for an undergraduate study exploring how mobile technology can support and advance blood donation. The app is designed to connect people seeking blood with potential donors by providing a place to register, share donation requests, and communicate interest in helping.

## Project purpose

Finding a willing donor can involve time-sensitive coordination and communication. This project explores how a mobile app backed by Firebase can make donor and recipient information and requests easier to share and discover. It provides a practical prototype for studying the role of mobile technology in blood-donation coordination; it is not a medical service and does not replace healthcare professionals, blood banks, or established donation procedures.

## Intended capabilities

- Register and authenticate app users.
- Let users participate as potential donors or people seeking blood.
- Store and retrieve donor and recipient/request information using Firebase services, including Firestore where configured.
- Browse and search requests using relevant details, then identify potential donor-recipient matches.
- Allow a potential donor to communicate their interest in responding to a request.

Matching in the app is intended to help people find and contact one another. It does not confirm medical eligibility, compatibility, availability, or the safety of a donation. Those decisions must be made through qualified healthcare professionals and appropriate blood donation services.

## How Firebase helps

Firebase provides hosted infrastructure for an app that needs to keep user and request data available beyond a single device. Firestore can store structured records and make them accessible to authorized app users, while Firebase Authentication can provide an identity for registered users. This can support sharing and discovery of requests without requiring the project to operate its own application server.

Firebase configuration, security rules, and the precise services enabled depend on the project setup. Before deploying or using real personal or health-related information, configure access controls carefully, collect only necessary data, and follow applicable privacy, security, and research ethics requirements. Never commit Firebase service-account credentials or other secrets to source control.

## Getting started

This repository is a Flutter project. To run it locally:

1. Install the Flutter SDK and the platform tooling for your target device.
2. Clone the repository and enter its directory:

   ```bash
   git clone https://github.com/MikeTheExpert/blood-donor_app.git
   cd blood-donor_app
   ```

3. Install project dependencies:

   ```bash
   flutter pub get
   ```

4. Configure the Firebase project for your development environment. Register the target app in Firebase and provide the platform configuration expected by the app. Make sure required Firebase services are enabled and their security rules are set before running.
5. Start the app on a connected device or emulator:

   ```bash
   flutter run
   ```

If Firebase setup files or dependencies are missing from your checkout, confirm the intended configuration with the project maintainer; do not use production credentials in a development build.

## Research context and responsible use

The app was developed as an undergraduate study task on the inclusion of mobile technology in the advancement of blood donation. It should be understood as an academic prototype, not a validated donor-matching system. Users should avoid sharing sensitive personal information beyond what is necessary, and should verify requests through trusted channels. Donation eligibility, blood-group compatibility, and the donation process must always be confirmed by qualified medical personnel or an authorized blood service.

## Technology

- Flutter and Dart
- Firebase services for user and donation-request data (including Firestore where configured)

## Further work

Possible extensions include improving request status and donor-response tracking, adding stronger privacy controls and data lifecycle policies, and evaluating usability with appropriate research and ethics approval. Any matching improvements should support—not replace—professional medical assessment.
