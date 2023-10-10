import 'package:flutter/material.dart';
import 'package:hue_nhaunao_partygame/c_theme/c_theme.dart';

Widget searchCustom() {
  return SearchAnchor(
      viewBackgroundColor: Colors.white,
      dividerColor: Colors.grey,
      viewSurfaceTintColor: Colors.white,
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          backgroundColor: MaterialStateProperty.all(bgGray),
          surfaceTintColor: MaterialStateProperty.all(Colors.grey.shade100),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          hintText: 'Nhập từ khóa',
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
          trailing: const <Widget>[
            // Tooltip(
            //   message: 'Change brightness mode',
            //   child: IconButton(
            //     onPressed: () {},
            //     icon: const Icon(Icons.wb_sunny_outlined),
            //     selectedIcon: const Icon(Icons.brightness_2_outlined),
            //   ),
            // )
          ],
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              controller.closeView(item);
            },
          );
        });
      });
}
