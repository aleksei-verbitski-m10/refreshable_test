import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'refreshable_state.dart';

class RefreshableCubit extends Cubit<RefreshableState> {
  RefreshableCubit() : super(const RefreshableState(0));

  void increaseCounter() {
    emit(RefreshableState(state.counter + 1));
  }
}
