// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fuoday/commons/providers/dropdown_provider.dart' as _i19;
import 'package:fuoday/features/auth/presentation/providers/sliding_segmented_provider.dart'
    as _i25;
import 'package:fuoday/features/bottom_nav/providers/bottom_nav_provider.dart'
    as _i886;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i19.DropdownProvider>(() => _i19.DropdownProvider());
    gh.factory<_i886.BottomNavProvider>(() => _i886.BottomNavProvider());
    gh.factory<_i25.SlidingSegmentedProvider>(
      () => _i25.SlidingSegmentedProvider(),
    );
    return this;
  }
}
