import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:warehouse_web/util/const/solved_rank.dart';

class RankModal extends HookWidget {
  const RankModal({
    super.key,
    required this.selectRank,
  });

  final void Function(int) selectRank;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        width: 500,
        height: 400,
        padding: const EdgeInsets.all(16),
        child: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: rankLevel.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  selectRank(index);
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: rankLevel[index],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
