import 'package:emodiary/screen/Writing/SelectPicture/Widget/picture_box.dart';
import 'package:emodiary/screen/Writing/Writing/Widget/diary_writing_bottom_button.dart';
import 'package:emodiary/viewModel/Writing/Writing/diary_writing_view_model.dart';
import 'package:emodiary/widget/Writing/diary_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emodiary/widget/Writing/diary_confirm_dialog.dart';

class DiaryWritingSelectPictureScreen extends StatefulWidget {
  const DiaryWritingSelectPictureScreen({super.key});

  @override
  State<DiaryWritingSelectPictureScreen> createState() =>
      _DiaryWritingSelectPictureScreenState();
}

class _DiaryWritingSelectPictureScreenState
    extends State<DiaryWritingSelectPictureScreen> {
  final DiaryWritingViewModel vm = Get.find<DiaryWritingViewModel>();

  void onTapBack() {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: const Color.fromRGBO(98, 98, 114, 0.4),
      builder: (BuildContext context) {
        return DiaryConfirmDialog(
          question: "일기 작성을 그만 하시겠습니까?",
          cancel: "취소",
          confirm: "그만쓰기",
          cancelAction: () {
            Get.back();
          },
          confirmAction: () {
            Get.back();
            Get.delete<DiaryWritingViewModel>(force: true);
            Get.offAllNamed("/");
          },
        );
      },
    );
  }

  void onTapSend() {
    Get.toNamed("/writing/save");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: DiaryAppBar(
              title: '나의 하루 그림일기',
              onPressedLeading: onTapBack,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /* Title Text */
                      const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "마음에 드는 그림",
                                style: TextStyle(
                                  color: Color(0xFF7541EF),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  height: 1.625,
                                ),
                              ),
                              Text(
                                "을 골라",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  height: 1.625,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "오늘 하루를 저장해보세요!",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  height: 1.625,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      /* Pictures */
                      Obx(
                        () => Column(
                          children: [
                            Row(
                              children: [
                                PictureBox(
                                  imagePath: 'assets/images/ex1.png',
                                  isSelected: vm.getSelectedPicture() == 0,
                                  onTap: () {
                                    vm.setSelectedPicture(0);
                                  },
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                PictureBox(
                                  imagePath: 'assets/images/ex2.png',
                                  isSelected: vm.getSelectedPicture() == 1,
                                  onTap: () {
                                    vm.setSelectedPicture(1);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                PictureBox(
                                  imagePath: 'assets/images/ex3.png',
                                  isSelected: vm.getSelectedPicture() == 2,
                                  onTap: () {
                                    vm.setSelectedPicture(2);
                                  },
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                PictureBox(
                                  imagePath: 'assets/images/ex4.png',
                                  isSelected: vm.getSelectedPicture() == 3,
                                  onTap: () {
                                    vm.setSelectedPicture(3);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: DiaryWritingBottomButton(
                        disabledText: "오늘 하루와 어울리는 그림은 무엇인가요?",
                        text: "이 그림으로 저장할래요!",
                        onPressed: vm.isSelected() ? null : onTapSend,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
