import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/pages/widgets/base_page.dart';
import '/pages/widgets/bottom_appbar.dart';
import '/data/models/module_model.dart';
import '/state/programme_providers.dart';

class ProgrammeEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'På bondegården',
      child: Consumer(builder: (context, watch, child) {
        List<Module> _items = watch(programmeProvider);

        return ReorderableListView(
          children: <Widget>[
            for (int index = 0; index < _items.length; index++)
              Opacity(
                key: Key('$index'),
                opacity: _items[index].selected ? 1.0 : 0.5,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Theme.of(context).cardColor,
                  child: ListTile(
                    title: Row(
                      children: [
                        IconButton(
                          onPressed: () => context
                              .read(programmeProvider.notifier)
                              .toggle(_items[index].id),
                          splashRadius: 24,
                          icon: _items[index].selected
                              ? Icon(Icons.check)
                              : Icon(Icons.close),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            '${_items[index].title}',
                            style: Theme.of(context).textTheme.headline2,
                            overflow: TextOverflow.fade,
                            //softWrap: false,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      '${_items[index].description}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    minVerticalPadding: 10,
                    trailing: ReorderableDragStartListener(
                      index: index,
                      child: Icon(
                        Icons.reorder,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                ),
              ),
          ],
          onReorder: (int oldIndex, int newIndex) {
            context
                .read(programmeProvider.notifier)
                .reorder(oldIndex, newIndex);
          },
        );
      }),
      bottomBar: AKBottomAppBar(
        children: [
          TextButton(
            onPressed: () => null,
            child: Text('Fortryd'),
          ),
          SizedBox(width: 60),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Bekræft'),
          ),
        ],
      ),
    );
  }
}

class ProgrammeHeader extends StatelessWidget {
  const ProgrammeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Bekræft'),
            ),
            TextButton(
              onPressed: () => null,
              child: Text('Fortryd'),
            ),
          ],
        ),
      ],
    );
  }
}
