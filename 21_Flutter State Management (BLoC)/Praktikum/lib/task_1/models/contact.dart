class Contact {
  String _contactName;
  String _contactNumber;
  String _contactImageUrl;

  Contact(this._contactName, this._contactNumber, this._contactImageUrl);

  set contactName(String contactName) {
    _contactName = contactName;
  }

  set contactStatus(String contactStatus) {
    this._contactNumber = contactNumber;
  }

  set contactImageUrl(String contactImageUrl) {
    this._contactImageUrl = contactImageUrl;
  }

  String get contactName => this._contactName;
  String get contactNumber => this._contactNumber;
  String get contactImageUrl => this._contactImageUrl;
}
