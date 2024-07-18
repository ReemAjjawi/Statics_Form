import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:my_notification/stream_provider.dart';
import 'package:my_notification/third.dart';

class QuestionsPage extends ConsumerWidget {
  final int? id;

  QuestionsPage({required this.id, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionsAsyncValue = ref.watch(fetchQuestionsProvider(id!));
    final questions = ref.watch(questionsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: questionsAsyncValue.when(
          data: (questions) {
            return questions.isEmpty
                ? Center(child: Text('No questions found'))
                : ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      var questionList = questions[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: questionList.map((question) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => third(question),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(question),
                              ),
                            )).toList(),
                          ),
                        ),
                      );
                    },
                  );
          },
          loading: () => ShimmerLoading(),
          error: (err, stack) => Center(child: Text('Error: $err')),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.send),
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
              children: List.generate(3, (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Container(
                  width: double.infinity,
                  height: 16.0,
                  color: Colors.white,
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
