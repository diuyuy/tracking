// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_screen_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$trackingScreenViewModelHash() =>
    r'017682b06a9736fb4b8ea9129e209273e5c0a5b7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TrackingScreenViewModel
    extends BuildlessAutoDisposeNotifier<Activity> {
  late final int index;

  Activity build(
    int index,
  );
}

/// See also [TrackingScreenViewModel].
@ProviderFor(TrackingScreenViewModel)
const trackingScreenViewModelProvider = TrackingScreenViewModelFamily();

/// See also [TrackingScreenViewModel].
class TrackingScreenViewModelFamily extends Family<Activity> {
  /// See also [TrackingScreenViewModel].
  const TrackingScreenViewModelFamily();

  /// See also [TrackingScreenViewModel].
  TrackingScreenViewModelProvider call(
    int index,
  ) {
    return TrackingScreenViewModelProvider(
      index,
    );
  }

  @override
  TrackingScreenViewModelProvider getProviderOverride(
    covariant TrackingScreenViewModelProvider provider,
  ) {
    return call(
      provider.index,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'trackingScreenViewModelProvider';
}

/// See also [TrackingScreenViewModel].
class TrackingScreenViewModelProvider
    extends AutoDisposeNotifierProviderImpl<TrackingScreenViewModel, Activity> {
  /// See also [TrackingScreenViewModel].
  TrackingScreenViewModelProvider(
    int index,
  ) : this._internal(
          () => TrackingScreenViewModel()..index = index,
          from: trackingScreenViewModelProvider,
          name: r'trackingScreenViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trackingScreenViewModelHash,
          dependencies: TrackingScreenViewModelFamily._dependencies,
          allTransitiveDependencies:
              TrackingScreenViewModelFamily._allTransitiveDependencies,
          index: index,
        );

  TrackingScreenViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Activity runNotifierBuild(
    covariant TrackingScreenViewModel notifier,
  ) {
    return notifier.build(
      index,
    );
  }

  @override
  Override overrideWith(TrackingScreenViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: TrackingScreenViewModelProvider._internal(
        () => create()..index = index,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TrackingScreenViewModel, Activity>
      createElement() {
    return _TrackingScreenViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrackingScreenViewModelProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TrackingScreenViewModelRef on AutoDisposeNotifierProviderRef<Activity> {
  /// The parameter `index` of this provider.
  int get index;
}

class _TrackingScreenViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<TrackingScreenViewModel,
        Activity> with TrackingScreenViewModelRef {
  _TrackingScreenViewModelProviderElement(super.provider);

  @override
  int get index => (origin as TrackingScreenViewModelProvider).index;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
