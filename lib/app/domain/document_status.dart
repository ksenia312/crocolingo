enum DocumentStatus { translating, done, queued, error, downloading }

extension DocumentStatusWorker on DocumentStatus {
  static DocumentStatus fromString(String? name) {
    for (final status in DocumentStatus.values) {
      if (status.name == name?.toLowerCase()) {
        return status;
      }
    }
    return DocumentStatus.error;
  }
}
