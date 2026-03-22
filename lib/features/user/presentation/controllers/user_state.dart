import 'package:btg_funds/features/user/domain/domain.dart' show UserEntity;
import 'package:equatable/equatable.dart';

/// Represents the state of the user feature.
///
/// Encapsulates the current user's account data, balance, and active subscriptions.
class UserState extends Equatable {
  /// Creates a [UserState] with the given [user].
  const UserState({
    required this.user,
  });

  /// The current user's account and subscription information.
  final UserEntity user;

  /// Returns a copy of this state with the given fields replaced.
  UserState copyWith({
    UserEntity? user,
  }) {
    return UserState(
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [user];
}
