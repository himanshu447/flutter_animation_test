import 'package:animation_test/model/subscription_dm.dart';
import 'package:hive/hive.dart';

part 'user_selected_subs.g.dart';

@HiveType(typeId: 1)
class UserSelectedSubs {
  UserSelectedSubs({
    required this.name,
    required this.userId,
    required this.selectedSubscriptions,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String userId;

  @HiveField(2)
  final List<SubscriptionDm> selectedSubscriptions;
}
