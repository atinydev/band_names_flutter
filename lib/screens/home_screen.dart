import 'dart:io';

import 'package:band_names/models/models.dart';
import 'package:band_names/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const name = 'Home';
  static const path = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bands = ref.watch(bandsProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          'BandNames',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) {
          final band = bands[index];
          return _BandTile(band: band);
        },
      ),
      floatingActionButton: const _AddBandButton(),
    );
  }
}

class _BandTile extends ConsumerWidget {
  const _BandTile({
    Key? key,
    required this.band,
  }) : super(key: key);

  final Band band;

  @override
  Widget build(BuildContext context, ref) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        ref.watch(bandsProvider.notifier).remove(
              targetBand: band,
            );
      },
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.only(left: 8),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Delete Band',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(
            band.name.substring(0, 2),
          ),
        ),
        title: Text(band.name),
        trailing: Text(
          '${band.votes}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}

class _AddBandButton extends HookConsumerWidget {
  const _AddBandButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();

    return FloatingActionButton(
      elevation: 1,
      child: const Icon(Icons.add),
      onPressed: () {
        (Platform.isAndroid)
            ? showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('New band name:'),
                    content: TextField(
                      controller: textController,
                    ),
                    actions: [
                      TextButton(
                        child: const Text('Add'),
                        onPressed: () {
                          addBandToList(
                            context,
                            ref,
                            textController.text,
                          );
                        },
                      )
                    ],
                  );
                },
              )
            : showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text('New band name:'),
                    content: CupertinoTextField(
                      controller: textController,
                    ),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: const Text('Add'),
                        onPressed: () {
                          addBandToList(
                            context,
                            ref,
                            textController.text,
                          );
                        },
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        child: const Text('Dismiss'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
      },
    );
  }

  void addBandToList(
    BuildContext context,
    WidgetRef ref,
    String name,
  ) {
    if (name.length > 1) {
      ref.watch(bandsProvider.notifier).add(
            band: Band(
              id: DateTime.now().toString(),
              name: name,
            ),
          );
    }
    Navigator.of(context).pop();
  }
}
