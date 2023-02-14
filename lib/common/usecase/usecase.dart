import '../network/api_result.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}
