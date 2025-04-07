import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:open_weather/app/config/app_theme.dart';

class CarouselWidget extends StatefulWidget {
  final List<Widget> items;
  final double? height;
  final ValueChanged<int>? onChanged;
  final EdgeInsets? padding;

  const CarouselWidget({super.key, required this.items, this.height, this.onChanged, this.padding});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final _streamController = StreamController<int>.broadcast();
  final _controller = CarouselSliderController();

  bool _dotIndicators = true;

  @override
  void initState() {
    if (widget.items.length < 2) _dotIndicators = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget carousel = CarouselSlider(
      carouselController: _controller,
      items: widget.items,
      options: CarouselOptions(
        height: widget.height,
        enableInfiniteScroll: false,
        padEnds: true,
        viewportFraction: 0.9,
        onPageChanged: (index, _) {
          _streamController.add(index);
          widget.onChanged?.call(index);
        },
      ),
    );

    Widget indicator = Column(
      children: [
        const SizedBox(height: 16),
        StreamBuilder<int>(
          stream: _streamController.stream,
          initialData: 0,
          builder: (_, snapshot) => _updateIndicators(snapshot.data),
        ),
      ],
    );

    return Container(padding: widget.padding, child: Column(children: [carousel, if (_dotIndicators) indicator]));
  }

  Widget _updateIndicators(int? currentPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          widget.items.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPage == entry.key ? AppTheme.secondary : AppTheme.gray300,
                ),
              ),
            );
          }).toList(),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
