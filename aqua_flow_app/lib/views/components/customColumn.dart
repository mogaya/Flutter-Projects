import 'package:aqua_flow_app/configs/constants.dart';
import 'package:flutter/material.dart';

class column extends StatelessWidget {
  const column({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Row(
            children: [
              singleCell(),
              SizedBox(
                width: 10,
              ),
              singleCell(),
            ],
          ),
        ),
      ),
    );
  }
}

class singleCell extends StatelessWidget {
  const singleCell({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 165,
      color: appBlue,
    );
  }
}
