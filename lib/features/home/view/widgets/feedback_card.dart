import 'package:flutter/material.dart';

import '../../../../core/dummy_db.dart';
import '../../../../core/theme/app_palette.dart';
import 'feeling_button.dart';

class FeedbackCard extends StatefulWidget {
  final VoidCallback onClose;
  final VoidCallback? onContinue;
  final TextEditingController textController;

  const FeedbackCard({
    super.key,
    required this.onClose,
    required this.textController,
    this.onContinue,
  });

  @override
  State<FeedbackCard> createState() => _FeedbackCardState();
}

class _FeedbackCardState extends State<FeedbackCard> {
  bool showInput = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppPalette.color1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: widget.onClose,
                  icon: const Icon(
                    Icons.clear,
                    size: 20,
                    color: AppPalette.color3,
                  ),
                ),
              ),
              Text(
                showInput
                    ? 'Share something with us.'
                    : 'How Are You Feeling Today?',
                style: const TextStyle(
                  color: AppPalette.color3,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              showInput
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(
                        25,
                        15,
                        25,
                        10,
                      ),
                      child: TextField(
                        controller: widget.textController,
                        textAlign: TextAlign.justify,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: AppPalette.color3.withAlpha(15),
                          filled: true,
                        ),
                        maxLines: 8,
                        style: const TextStyle(
                          color: AppPalette.color3,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    )
                  : GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(
                        30,
                        20,
                        30,
                        40,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 15,
                            childAspectRatio: 4.5,
                          ),
                      itemCount: feelingOptions.length,
                      itemBuilder: (context, index) {
                        return FeelingButton(
                          onTap: () {
                            setState(() {
                              showInput = true;
                            });
                          },
                          iconPath: feelingOptions[index]['iconPath']!,
                          title: feelingOptions[index]['title']!,
                        );
                      },
                    ),

              showInput
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(
                        25,
                        0,
                        25,
                        10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: widget.onClose,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppPalette.color1,
                              foregroundColor: AppPalette.color3,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 18,
                              ),
                              textStyle: const TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: widget.onContinue,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 35,
                              ),
                              textStyle: const TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            child: const Text('Continue'),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
