import 'package:flutter/material.dart';
import 'package:online_course_ui/utils/data.dart';

class SliverTabbarScreen extends StatelessWidget {
  const SliverTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                pinned: true,
                expandedHeight: 250,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'Futuregoing',
                  ),
                  background: Image.network(
                    features[0]['image'],
                    fit: BoxFit.cover,
                  ),
                  stretchModes: [StretchMode.zoomBackground],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: MySliverPersistentHeaderDelegate(
                  minHeight: 50,
                  maxHeight: 50,
                  child: TabBar(
                    indicatorColor: Colors.teal,
                    tabs: [
                      Tab(
                          icon: Icon(
                        Icons.flight,
                        color: Colors.teal,
                      )),
                      Tab(
                          icon: Icon(
                        Icons.directions_transit,
                        color: Colors.teal,
                      )),
                      Tab(
                          icon: Icon(
                        Icons.directions_car,
                        color: Colors.teal,
                      )),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Icon(Icons.flight, size: 350),
              Icon(Icons.directions_transit, size: 350),
              Icon(Icons.directions_car, size: 350),
            ],
          ),
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant MySliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
