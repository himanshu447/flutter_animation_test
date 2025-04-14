import 'dart:async';

import 'package:animation_test/gen/assets.gen.dart';
import 'package:animation_test/model/subscription_dm.dart';
import 'package:animation_test/model/user_selected_subs.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MySubsPageController with ChangeNotifier {
  MySubsPageController() {
    unawaited(loadStoreData());
    loadAllAvailableSubscriptions();
  }

  final List<SubscriptionDm> allSubscriptions = [];
  final List<UserSelectedSubs> storeSubscription = [];

  void loadAllAvailableSubscriptions() {
    allSubscriptions
      ..add(
        SubscriptionDm(
          name: 'Figma',
          subImage: Assets.vectors.figma.path,
          type: 'month',
          amount: 12,
        ),
      )
      ..add(
        SubscriptionDm(
          name: 'HBO Max',
          subImage: Assets.vectors.hboMaxSvgrepoCom.path,
          type: 'month',
          amount: 9.99,
        ),
      )
      ..add(
        SubscriptionDm(
          name: 'Spotify',
          subImage: Assets.vectors.spotifyColorSvgrepoCom.path,
          type: 'month',
          amount: 8,
        ),
      )
      ..add(
        SubscriptionDm(
          name: 'PlayStation Plus',
          subImage: Assets.vectors.playStationControllerSvgrepoCom.path,
          type: 'year',
          amount: 67.57,
        ),
      )
      ..add(
        SubscriptionDm(
          name: 'Youtube',
          subImage: Assets.vectors.youtubeSvgrepoCom.path,
          type: 'year',
          amount: 8.97,
        ),
      )
      ..add(
        SubscriptionDm(
          name: 'Twitter',
          subImage: Assets.vectors.twitterSvgrepoCom.path,
          type: 'year',
          amount: 59.99,
        ),
      )
      ..add(
        SubscriptionDm(
          name: 'Instagram',
          subImage: Assets.vectors.instagramSvgrepoCom.path,
          type: 'year',
          amount: 12,
        ),
      );
    notifyListeners();
  }

  Future<void> loadStoreData() async {
    final userBox = await Hive.openBox<UserSelectedSubs>('usersSelectedSubs');
    storeSubscription
      ..clear()
      ..addAll(userBox.values);
    notifyListeners();
  }
}
