import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductLoadingStateWidget extends StatelessWidget {
  const ProductLoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Skeletonizer(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 0.5.sp),
            child: Container(
              color: theme.colorScheme.primaryContainer,
              child: ListTile(
                leading: Container(
                  height: 300.h,
                  width: 100.w,
                  color: theme.colorScheme.secondary,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.sp),
                title: const Text('title'),
                subtitle: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('price'),
                    Row(
                      children: [Text('discount'), Text('price')],
                    ),
                    Text('stock'),
                  ],
                ),
                isThreeLine: true,
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          );
        },
      ),
    );
  }
}
