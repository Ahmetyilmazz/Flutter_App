import 'dart:async';

import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:logging/logging.dart';

class AudioController {
  static final Logger _log = Logger('AudioController');

  SoLoud? _soloud;

  SoundHandle? _musicHandle;

  Future<void> initialize() async {
    _soloud = SoLoud.instance;
    await _soloud?.init();
  }

  void dispose() {
    _soloud?.deinit();
  }

  Future<void> playSound(String assetKey) async {
    try {
      final source = await _soloud?.loadAsset(assetKey);
      if (source != null) {
        await _soloud?.play(source);
      } else {
        _log.warning("Sound source for '$assetKey' is null.");
      }
    } on SoLoudException catch (e) {
      _log.severe(
          "Cannot play sound '$assetKey'. Ignoring. Error: ${e.toString()}");
    }
  }

  Future<void> startMusic() async {
    if (_musicHandle != null) {
      if (_soloud?.getIsValidVoiceHandle(_musicHandle!) == true) {
        _log.info('Müzik çoktan çalışıyor. İlk duruş');
        await _soloud?.stop(_musicHandle!);
      }
    }
    _log.info('Müzik yükleniyor...');
    final musicSource = await _soloud?.loadAsset('assets/music/AltayKai.mp3',
        mode: LoadMode.disk);

    if (musicSource != null) {
      musicSource.allInstancesFinished.first.then((_) {
        _soloud?.disposeSource(musicSource);
        _log.info('Müzik kaynağı bulunamadı.');
        _musicHandle = null;
      });

      _log.info('Müzik Çal');
      _musicHandle = await _soloud?.play(
        musicSource,
        volume: 0.6,
        looping: true,
        loopingStartAt: const Duration(seconds: 25, milliseconds: 43),
      );
    } else {
      _log.warning('Müzik kaynağı boş. Müzik Çalınamadı.');
    }
  }

  void fadeOutMusic() {
    if (_musicHandle == null) {
      _log.info("");
      return;
    }
    const length = Duration(seconds: 5);
    _soloud?.fadeVolume(_musicHandle!, 0, length);
    _soloud?.scheduleStop(_musicHandle!, length);
  }

  void applyFilter() {
    // TODO
  }

  void removeFilter() {
    // TODO
  }
}
