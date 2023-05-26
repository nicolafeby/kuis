

import 'package:get_it/get_it.dart';
import 'package:kuis/core/network/api_service.dart';

part 'bloc/bloc_injector.dart';
part 'datasource/datasource_injector.dart';
part 'common/common_injector.dart';
part 'repository/repository_injector.dart';
part 'usecase/usecase_injector.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await BlocInjector.configureBlocInjector();
  await DataSourceInjector.configureDataSourceInjector();
  await HelperInjector.configureHelperInjector();
  await RepositoryInjector.configureRepositoryInjector();
  await UsecaseInjector.configureUsecaseInjector();
}
