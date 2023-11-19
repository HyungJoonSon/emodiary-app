import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiaryWritingViewModel extends GetxController {
  static const int titleMaxLength = 40;
  static const int contentMaxLength = 1000;

  late TextEditingController _titleEditingController;
  late TextEditingController _contentEditingController;

  RxnInt selectedPicture = RxnInt(null);
  RxBool isShownPicture = true.obs;

  TextEditingController get titleCtrl => _titleEditingController;
  TextEditingController get contentCtrl => _contentEditingController;

  @override
  void onInit() {
    super.onInit();
    initTextController();
  }

  @override
  void onClose() {
    disposeTextController();
    super.onClose();
  }

  void initTextController() {
    _titleEditingController = TextEditingController();
    _contentEditingController = TextEditingController();
  }

  void disposeTextController() {
    _titleEditingController.dispose();
    _contentEditingController.dispose();
  }

  bool canSend() {
    return _titleEditingController.text.isNotEmpty &&
        _contentEditingController.text.isNotEmpty;
  }

  int? getSelectedPicture() {
    return selectedPicture.value;
  }

  void setSelectedPicture(int selected) {
    if (selected < 0 || 3 < selected) {
      return;
    }

    selectedPicture.value = selected;
  }

  bool isSelected() {
    return selectedPicture.value != null;
  }

  void flipCard() {
    isShownPicture.value = !isShownPicture.value;
  }

  bool getIsShownPicture() {
    return isShownPicture.value;
  }
}
