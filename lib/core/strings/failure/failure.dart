// ignore_for_file: constant_identifier_names

import 'package:you_cook/core/error/failure.dart';

const String SERVER_FAILURE_MESSAGE = 'بعد اذنك حاول مجددا';

const String EMPTY_FAILURE_MESSAGE = 'لا يوجد بيانات';

const String OFFLINE_FAILURE_MESSAGE = 'بعد اذنك تأكد من اتصالك بالانترنت';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case EmptyCacheFailure:
      return EMPTY_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
    default:
      return 'خطأ غير متوقع حاول مجددا';
  }
}
