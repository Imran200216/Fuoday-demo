import 'package:flutter/cupertino.dart';


class ProfileEditProvider extends ChangeNotifier {
  bool _isEditMode = false;

  bool get isEditMode => _isEditMode;

  void toggleEditMode() {
    _isEditMode = !_isEditMode;
    notifyListeners();
  }

  void cancelEdit() {
    _isEditMode = false;
    notifyListeners();
  }
}
