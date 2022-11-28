import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resep_app/theme.dart';

class RecipesContainerWidget extends StatelessWidget {
  const RecipesContainerWidget(
      {super.key,
      required this.title,
      required this.thumb,
      required this.recipeKey,
      required this.times,
      required this.serving,
      required this.difficulty});

  final String title, thumb, recipeKey, times, serving, difficulty;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      width: Get.width * 0.8,
      margin: const EdgeInsets.only(left: 15),
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: containerColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(9),
                ),
              ),
              child: Image.network(thumb),
            ),
          ),
          Text(
            title,
            style: mainTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Row(
            children: [
              Text(
                times,
                style: mainTextStyle.copyWith(color: secondaryColor),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                serving,
                style: mainTextStyle.copyWith(color: secondaryColor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  difficulty,
                  style: mainTextStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
