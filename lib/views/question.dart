import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_notification/config/color.dart';
import 'package:my_notification/providers/notification.dart';
import 'package:shimmer/shimmer.dart';
import 'package:my_notification/views/third.dart';

final genderProvider = StateProvider.family<bool, int>((ref, id) => false);
final indexinkwllProvider = StateProvider<List<int>>((ref) => []);

class QuestionsPage extends ConsumerWidget {
  final int? id;
  var questions;
  QuestionsPage({required this.id, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionsAsyncValue = ref.watch(fetchQuestionsProvider(id!));
    final indexinkwll = ref.watch(indexinkwllProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColor.primary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: questionsAsyncValue.when(
          data: (questions) {
            int lengh = questions.length;

            return questions.isEmpty
                ? Center(child: Text('No questions found'))
                : ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      var questionList = questions[index];
                      final gender = ref.watch(genderProvider(index));

                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            // CheckboxListTile
                            Checkbox(
                              value: gender,
                              onChanged: (bool? value) {},
                              activeColor: AppColor.primary,
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  if (indexinkwll.isEmpty ||
                                      !indexinkwll.contains(index)) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => third(
                                            questionList, id!, index, lengh),
                                      ),
                                    );
                                  }
                                  ;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color:
                                            AppColor.primary,
                                          width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    margin: EdgeInsets.all(
                                        0), // Remove default margin to fit well
                                    child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Center(
                                            child: Text(
                                                "الفورم رقم  ${index + 1}"))),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
          },
          loading: () => ShimmerLoading(),
          error: (err, stack) => Center(child: Text('Error: $err')),
        ),
      ),
    );
  }
}

class ShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    width: double.infinity,
                    height: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
