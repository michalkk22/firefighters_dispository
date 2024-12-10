abstract class JsonRepo<T> {
  final String filePath;

  JsonRepo({required this.filePath});

  // void save(T entity);
  T load();
  List<T> loadAll();
}
