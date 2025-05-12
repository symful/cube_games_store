import 'package:cube_games_store/components/shared/sale_section_list.dart';
import 'package:cube_games_store/data/sale_event.dart';
import 'package:cube_games_store/pages/sale_section/sale_section_page.dart';
import 'package:flutter/material.dart';

class HomeSaleSection extends StatelessWidget {
  final SaleEvent saleEvent;
  const HomeSaleSection({super.key, required this.saleEvent});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // Important for proper sizing
      children: [
        // Header Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(
                saleEvent.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => SaleSectionPage(saleEvent: saleEvent),
                    ),
                  );
                },
                child: const Text('SEE ALL'),
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
