import 'package:captain_app/shared/models/item_model.dart';
import 'package:captain_app/shared/widgets/addToCardSection.dart';
import 'package:captain_app/utils/colors.dart';
import 'package:captain_app/utils/spacing.dart';
import 'package:flutter/material.dart';

class CardListItem extends StatefulWidget {
  final Item? item;
  const CardListItem({Key? key, this.item}) : super(key: key);

  @override
  _CardListItemState createState() => _CardListItemState();
}

class _CardListItemState extends State<CardListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.m),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Spacing.m),
        // decoration: BoxDecoration(
        //   color: Colors.red,
        // ),
        child: Container(
          padding: const EdgeInsets.all(Spacing.m),
          decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(Spacing.m),
              border:
                  Border.all(width: 1, color: Colors.grey.withOpacity(0.2))),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Spacing.m),
                child: Container(
                  width: 70,
                  color: AppColors.lightOrangeColor,
                  padding: const EdgeInsets.all(Spacing.s),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.item?.imgUrl ?? ''),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: Spacing.m,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.item!.name.toString(),
                        style: const TextStyle(
                          fontSize: Spacing.xl,
                          fontFamily: "Mulish-SemiBold",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Net wt',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Mulish-Light",
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        width: Spacing.s,
                      ),
                      Text(
                        widget.item!.netWt.toString(),
                        style: const TextStyle(
                          fontSize: Spacing.m,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Text(
                        ' gms',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Gross wt',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Mulish-Light",
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        width: Spacing.s,
                      ),
                      Text(
                        widget.item!.grossWt.toString(),
                        style: const TextStyle(
                          fontSize: Spacing.m,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Text(
                        ' gms',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const Spacer(),
                  // Text('Add to cart'),
                  AddtoCardSection(item: widget.item!),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
