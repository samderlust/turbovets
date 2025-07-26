import '../../../core/domain/entities/result.dart';
import '../entities/user.dart';

abstract interface class UserRepoFacade {
  /// Get the authenticated user
  ///
  /// the current user that using the app.
  /// this play like an authentication endpoint
  Future<Result<User>> getAuthUser();

  /// Get all users
  Future<Result<List<User>>> getUsers();
}
