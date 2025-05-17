import 'package:cube_games_store/components/custom_icons/back_arrow_button_icon.dart';
import 'package:cube_games_store/components/shared/sale_section_list.dart';
import 'package:cube_games_store/data/sale_event.dart';
import 'package:flutter/material.dart';

class SaleSectionPage extends StatelessWidget {
  final SaleEvent saleEvent;
  const SaleSectionPage({super.key, required this.saleEvent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leadingWidth: 43 + 16 * 3,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BackArrowButtonIcon(),
        ),
        title: const Text('SALE SECTION'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SaleSectionList(saleEvent: saleEvent, limitOnlyOneRow: false),
        ),
      ),
    );
  }
}
