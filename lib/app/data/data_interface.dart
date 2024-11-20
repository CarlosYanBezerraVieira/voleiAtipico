abstract interface class DataInterface {
  Future<void> createData(String key, String value);
  Future<String?> getData(String key);
  Future<void> deleteData(String key);
  Future<void> updateData(String key, String value);
}
