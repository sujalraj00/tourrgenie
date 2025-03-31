import 'package:bloc/bloc.dart';
import 'package:tourgenie/cubit/app_cubit_states.dart';
import 'package:tourgenie/models/data_model.dart';
import 'package:tourgenie/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());

      places = await data.getInfo();
      // emit(LoadedState(places));
      emit(LoadedState());
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState());
  }
}
