import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';
import 'week_recipes_event.dart';
import 'week_recipes_state.dart';

class WeekRecipesBloc extends Bloc <WeekRecipesEvent, WeekRecipesState> {
  // final CounterCubit counterCubit;
  // final List<String> _loadedLogList = [];
  final WeekRecipes _weekRecipes;
  // StreamSubscription? _counterCubitStreamSubscription;

  WeekRecipesBloc(this._weekRecipes, /*{required this.counterCubit}*/) : super(WeekRecipesEmptyState()) {
    // _counterCubitStreamSubscription =
    //     counterCubit.stream.listen((state) {
    //       print('_counterCubitStreamSubscription state = $state');
    //       _loadedLogList.add(state);
    //     });

    on <WeekRecipesLoadEvent>((event, emit) {
      print('emit(LogLoadedState');
      emit(WeekRecipesLoadedState(weekRecipes: _weekRecipes));
      // emit(LogLoadingState());
      // try {
      //   _counterCubitStreamSubscription =
      //       counterCubit.stream.distinct((previous, next) {
      //         return previous != next;
      //       }).listen((state) {
      //         print('_counterCubitStreamSubscription');
      //         _loadedLogList.add(state);
      //       });
      //   emit(LogLoadedState(loadedLog: _loadedLogList));
      // } catch (_) {
      //   emit(LogErrorState());
      // }
    });
    on <WeekRecipesClearEvent>((event, emit) {
      emit(WeekRecipesEmptyState());
    });
  }
}