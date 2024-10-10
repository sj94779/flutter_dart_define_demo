import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', useConstantCase: true , allowOptionalFields: true)
final class Env {
  @EnviedField(varName: 'TOKEN' , obfuscate: true , optional: true)
    String token = _Env.token;

}
