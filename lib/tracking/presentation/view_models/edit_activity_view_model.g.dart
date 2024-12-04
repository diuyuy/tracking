// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_activity_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editActivityViewModelHash() =>
    r'a9c7848aa6f295857ecaada6f6287cf789d74822';

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

abstract class _$EditActivityViewModel
    extends BuildlessAutoDisposeNotifier<List<dynamic>> {
  late final int index;
  late final String selectedDate;

  List<dynamic> build(
    int index,
    String selectedDate,
  );
}

/// See also [EditActivityViewModel].
@ProviderFor(EditActivityViewModel)
const editActivityViewModelProvider = EditActivityViewModelFamily();

/// See also [EditActivityViewModel].
class EditActivityViewModelFamily extends Family<List<dynamic>> {
  /// See also [EditActivityViewModel].
  const EditActivityViewModelFamily();

  /// See also [EditActivityViewModel].
  EditActivityViewModelProvider call(
    int index,
    String selectedDate,
  ) {
    return EditActivityViewModelProvider(
      index,
      selectedDate,
    );
  }

  @override
  EditActivityViewModelProvider getProviderOverride(
    covariant EditActivityViewModelProvider provider,
  ) {
    return call(
      provider.index,
      provider.selectedDate,
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
  String? get name => r'editActivityViewModelProvider';
}

/// See also [EditActivityViewModel].
class EditActivityViewModelProvider extends AutoDisposeNotifierProviderImpl<
    EditActivityViewModel, List<dynamic>> {
  /// See also [EditActivityViewModel].
  EditActivityViewModelProvider(
    int index,
    String selectedDate,
  ) : this._internal(
          () => EditActivityViewModel()
            ..index = index
            ..selectedDate = selectedDate,
          from: editActivityViewModelProvider,
          name: r'editActivityViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editActivityViewModelHash,
          dependencies: EditActivityViewModelFamily._dependencies,
          allTransitiveDependencies:
              EditActivityViewModelFamily._allTransitiveDependencies,
          index: index,
          selectedDate: selectedDate,
        );

  EditActivityViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
    required this.selectedDate,
  }) : super.internal();

  final int index;
  final String selectedDate;

  @override
  List<dynamic> runNotifierBuild(
    covariant EditActivityViewModel notifier,
  ) {
    return notifier.build(
      index,
      selectedDate,
    );
  }

  @override
  Override overrideWith(EditActivityViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: EditActivityViewModelProvider._internal(
        () => create()
          ..index = index
          ..selectedDate = selectedDate,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
        selectedDate: selectedDate,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<EditActivityViewModel, List<dynamic>>
      createElement() {
    return _EditActivityViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditActivityViewModelProvider &&
        other.index == index &&
        other.selectedDate == selectedDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);
    hash = _SystemHash.combine(hash, selectedDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EditActivityViewModelRef
    on AutoDisposeNotifierProviderRef<List<dynamic>> {
  /// The parameter `index` of this provider.
  int get index;

  /// The parameter `selectedDate` of this provider.
  String get selectedDate;
}

class _EditActivityViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<EditActivityViewModel,
        List<dynamic>> with EditActivityViewModelRef {
  _EditActivityViewModelProviderElement(super.provider);

  @override
  int get index => (origin as EditActivityViewModelProvider).index;
  @override
  String get selectedDate =>
      (origin as EditActivityViewModelProvider).selectedDate;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
