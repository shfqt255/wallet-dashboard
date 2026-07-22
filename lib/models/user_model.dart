/// Represents the signed-in account shown in the dashboard header.
class UserModel {
  final String name;
  final bool hasUnreadNotification;

  const UserModel({
    required this.name,
    this.hasUnreadNotification = false,
  });
}
