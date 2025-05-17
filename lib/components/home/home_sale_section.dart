import 'package:cube_games_store/components/shared/sale_section_list.dart';
import 'package:cube_games_store/data/sale_event.dart';
import 'package:cube_games_store/pages/sale_section/sale_section_page.dart';
import 'package:cube_games_store/navigator.dart';
import 'package:flutter/material.dart';

class HomeSaleSection extends StatelessWidget {
  final SaleEvent saleEvent;
  const HomeSaleSection({super.key, required this.saleEvent});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Row(
            children: [
              Text(
                saleEvent.name,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  pushPage(
                    context,
                    (_) => SaleSectionPage(saleEvent: saleEvent),
                  );
                },
                child: const Text(
                  'SEE ALL',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        SaleSectionList(saleEvent: saleEvent, limitOnlyOneRow: true),
      ],
    );
  }
}
