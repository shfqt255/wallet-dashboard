# Wallet Dashboard

A **pixel-perfect Wallet Dashboard UI** built with **Flutter** by recreating the provided Figma/UI design as accurately as possible. This project focuses on clean architecture, reusable widgets, responsive layouts, Provider state management, and modern Flutter development practices.

---

# Preview

## Original Design

> Replace the image below with the provided design.

<p align="center">
  <img src="assets/readme/original_design.png" width="350">
</p>

---

## Flutter Recreation

> Replace the image below with your application's screenshot.

<p align="center">
  <img src="assets/readme/flutter_dashboard.png" width="350">
</p>

---

## Side-by-Side Comparison

<p align="center">
  <img src="assets/readme/comparison.png" width="900">
</p>

---

#  Features

- Pixel-perfect UI implementation
- Modern Flutter architecture
- Provider State Management
- Responsive design
- Reusable widgets
- Clean code structure
- Custom theme management
- Modular folder structure
- Separation of UI and business logic
- Consistent spacing and styling
- Optimized widget tree


---


#  State Management

The application uses **Provider** for state management.

Reasons for choosing Provider:

- Lightweight
- Official Flutter recommendation
- Easy to understand
- Scalable for medium-sized applications
- Minimal boilerplate

---

#  Reusable Components

The dashboard is composed of reusable widgets such as:

- Dashboard Header
- Header Action Cluster
- Wallet Balance Card
- Quick Action Buttons
- Transaction Summary Card
- Subscription Cards
- Joint Wallet Cards
- Bottom Navigation Bar

Each component is independent and reusable.

---

#  Bottom Navigation

The bottom navigation bar was implemented to closely match the original design.

Achieving the same appearance required experimenting with multiple Flutter approaches, including:

- Material NavigationBar
- BottomNavigationBar
- Cupertino Icons
- Built-in Material Icons
- Custom icon sizing
- Custom spacing
- Rounded navigation container
- Shadow tuning

The final implementation is a custom solution that visually matches the provided design as closely as possible while remaining responsive and maintainable.

---

# Pixel Perfect Recreation

Special attention was given to reproducing:

- Layout spacing
- Border radius
- Card elevation
- Shadows
- Typography
- Colors
- Alignment
- Padding
- Icon sizes
- Component hierarchy

Some icons in the reference design appear to come from a custom icon set rather than Flutter's default Material Icons. Where exact assets were unavailable, the closest built-in Flutter icons were selected to preserve the overall visual appearance.

---

# Getting Started

## Clone

```bash
git clone https://github.com/yourusername/wallet_dashboard.git
```

## Navigate

```bash
cd wallet_dashboard
```

## Install packages

```bash
flutter pub get
```

## Run

```bash
flutter run
```

---

# Dependencies

```yaml
provider
cupertino_icons
```

---

# Built With

- Flutter
- Dart
- Provider
