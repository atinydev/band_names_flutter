import 'package:band_names/models/band.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _bands = [
  Band(id: '1', name: 'Metallica', votes: 5),
  Band(id: '2', name: 'Queen', votes: 1),
  Band(id: '3', name: 'Héroes del silencio', votes: 2),
  Band(id: '4', name: 'Bon Jovi', votes: 5),
];

class BandsNotifier extends StateNotifier<List<Band>> {
  BandsNotifier() : super(_bands);

  void add({required Band band}) {
    state = [...state, band];
  }
}

final bandsProvider = StateNotifierProvider<BandsNotifier, List<Band>>((ref) {
  return BandsNotifier();
});
