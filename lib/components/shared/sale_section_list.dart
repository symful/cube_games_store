import 'package:cube_games_store/components/shared/game_thumbnail.dart';
import 'package:cube_games_store/data/game.dart';
import 'package:cube_games_store/data/sale_event.dart';
import 'package:cube_games_store/pages/overview/overview_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SaleSectionList extends StatefulWidget {
  const SaleSectionList({
    super.key,
    required this.saleEvent,
    required this.limitOnlyOneRow,
  });

  final SaleEvent saleEvent;
  final bool limitOnlyOneRow;

  @override
  State<SaleSectionList> createState() => _SaleSectionListState();
}

class _SaleSectionListState extends State<SaleSectionList> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.limitOnlyOneRow
        ? _buildSingleRowList(context)
        : _buildResponsiveGrid(context);
  }

  Widget _buildSingleRowList(BuildContext context) {
    const spacing = 16.0;
    final itemWidth = 173.0;
    const rowHeight = 252.0;

    return SizedBox(
      height: rowHeight,
      child: Scrollbar(
        thickness: 6.0,
        radius: const Radius.circular(3),
        controller: scrollController,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          itemCount: widget.saleEvent.games.length,
          itemBuilder: (context, index) {
            final game = widget.saleEvent.games[index];
            return Container(
              margin: EdgeInsets.only(
                right: index == widget.saleEvent.games.length - 1 ? 0 : spacing,
              ),
              width: itemWidth,
              child: _buildGameCard(context, game),
            );
          },
        ),
      ),
    );
  }

  Widget _buildResponsiveGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive column count based on available width
        final crossAxisCount = switch (constraints.maxWidth) {
          >= 1200 => 5,
          >= 900 => 4,
          >= 600 => 3,
          >= 400 => 2,
          _ => 1,
        };

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 37 / 50,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          itemCount: widget.saleEvent.games.length,
          itemBuilder: (context, index) {
            final game = widget.saleEvent.games[index];
            return _buildGameCard(context, game);
          },
        );
      },
    );
  }

  Widget _buildGameCard(BuildContext context, Game game) {
    return InkWell(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => OverviewPage(game: game)),
          ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: GameThumbnail(game: game, borderRadiusSize: 4),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 120,
              height: 28,
              child: Center(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: SvgPicture.asset(
                        'assets/images/rating_background.svg',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Rating ${game.rating} ',
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 8,
                              letterSpacing: 1.6,
                            ),
                          ),
                          const Icon(
                            Icons.star_outlined,
                            color: Color(0xffffb802),
                            size: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[
                    Color(0x80000000),
                    Color(0x80000000),
                    Color(0x80000000),
                    Color(0x80000000),
                    Color(0x80000000),
                    Color(0x80000000),
                    Color(0x80000000),
                    Color(0x80000000),

                    Color(0x00000000),
                  ],
                  tileMode: TileMode.mirror,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
              child: Text(
                game.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.6,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
