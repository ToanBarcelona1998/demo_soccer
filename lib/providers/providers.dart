import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soccer_app/providers/page_notifier.dart';
import 'package:soccer_app/providers/soccer_notifier.dart';
import 'package:soccer_app/providers/standing_notifier.dart';

final select_page=StateNotifierProvider<PageNotifier>((ref)=>PageNotifier());

final soccer_notifer = ChangeNotifierProvider<SoccerNotifier>((ref) => SoccerNotifier());

final standing_notifier = ChangeNotifierProvider<StandingNotifier>((ref) => StandingNotifier());