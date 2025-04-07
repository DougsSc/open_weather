import 'dart:async';

abstract class ParamUseCase<Type, Params> {
  FutureOr<Type> execute(Params params);
}
