import 'dart:math';

import 'package:cube_games_store/components/home/home_game_thumbnail.dart';
import 'package:cube_games_store/data/sale_event.dart';
import 'package:cube_games_store/pages/overview/overview_page.dart';
import 'package:flutter/material.dart';

class SaleSectionList extends StatelessWidget {
  const SaleSectionList({
    super.key,
    required this.saleEvent,
    required this.limitOnlyOneRow,
  });

  final SaleEvent saleEvent;
  final bool limitOnlyOneRow;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 8.0;
        final padding = MediaQuery.of(context).padding;
        final availableWidth = constraints.maxWidth - padding.horizontal;

        // Calculate responsive column count
        final crossCount =
            availableWidth >= 1200
                ? 5
                : availableWidth >= 900
                ? 4
                : availableWidth >= 600
                ? 3
                : 2;

        // Calculate item height based on width
        final itemWidth =
            (availableWidth - (spacing * (crossCount - 1))) / crossCount;
        final itemHeight = itemWidth * 1.5; // 1.5 aspect ratio for game covers

        // Calculate total grid height
        final rowCount =
            limitOnlyOneRow ? 1 : (saleEvent.games.length / crossCount).ceil();
        final totalHeight =
            (itemHeight * rowCount) + (spacing * (rowCount - 1));

        return SizedBox(
          height: totalHeight,
          child: GridView.builder(
            physics:
                const NeverScrollableScrollPhysics(), // Disable inner scrolling
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossCount,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
            ),
            itemCount: min(rowCount * crossCount, saleEvent.games.length),
            itemBuilder: (context, index) {
              final game = saleEvent.games[index];
              return InkWell(
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OverviewPage(game: game),
                      ),
                    ),
                child: Stack(
                  children: [
                    HomeGameThumbnail(game: game, borderRadiusSize: 4),
                    Container(
                      alignment: Alignment.topCenter,
                      child: FittedBox(
                        child: Column(
                          children: [
                            Container(
                              color: Colors.black54,
                              padding: const EdgeInsets.only(
                                top: 12,
                                bottom: 8,
                                left: 24,
                                right: 24,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Rating ${game.rating} ',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow[700],
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: FittedBox(
                        child: Container(
                          width: itemWidth,
                          color: Colors.black54,
                          padding: const EdgeInsets.only(top: 8, bottom: 16),
                          child: Text(
                            game.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
