/// Placeholder database wrapper for future local storage tables.
///
/// This keeps the app compiling cleanly while you add tables later.
class AppDatabase {
  const AppDatabase();

  Future<void> close() async {}
}
