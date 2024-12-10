class FileNotFoundException implements Exception {
  final String filePath;

  FileNotFoundException(this.filePath);

  @override
  String toString() {
    return 'File not found: $filePath';
  }
}

class FileLoadException {}

class BrigadeLoadException {}

class AreaLoadException {}
