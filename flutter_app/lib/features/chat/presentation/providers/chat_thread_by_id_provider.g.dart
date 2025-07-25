// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_thread_by_id_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatThreadByIdHash() => r'946e82e8c78b422173b7f6923daf384d0c0fecba';

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

abstract class _$ChatThreadById
    extends BuildlessAutoDisposeAsyncNotifier<Map<String, MessageViewModel>> {
  late final String chatThreadId;

  FutureOr<Map<String, MessageViewModel>> build(String chatThreadId);
}

/// See also [ChatThreadById].
@ProviderFor(ChatThreadById)
const chatThreadByIdProvider = ChatThreadByIdFamily();

/// See also [ChatThreadById].
class ChatThreadByIdFamily
    extends Family<AsyncValue<Map<String, MessageViewModel>>> {
  /// See also [ChatThreadById].
  const ChatThreadByIdFamily();

  /// See also [ChatThreadById].
  ChatThreadByIdProvider call(String chatThreadId) {
    return ChatThreadByIdProvider(chatThreadId);
  }

  @override
  ChatThreadByIdProvider getProviderOverride(
    covariant ChatThreadByIdProvider provider,
  ) {
    return call(provider.chatThreadId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatThreadByIdProvider';
}

/// See also [ChatThreadById].
class ChatThreadByIdProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ChatThreadById,
          Map<String, MessageViewModel>
        > {
  /// See also [ChatThreadById].
  ChatThreadByIdProvider(String chatThreadId)
    : this._internal(
        () => ChatThreadById()..chatThreadId = chatThreadId,
        from: chatThreadByIdProvider,
        name: r'chatThreadByIdProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$chatThreadByIdHash,
        dependencies: ChatThreadByIdFamily._dependencies,
        allTransitiveDependencies:
            ChatThreadByIdFamily._allTransitiveDependencies,
        chatThreadId: chatThreadId,
      );

  ChatThreadByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatThreadId,
  }) : super.internal();

  final String chatThreadId;

  @override
  FutureOr<Map<String, MessageViewModel>> runNotifierBuild(
    covariant ChatThreadById notifier,
  ) {
    return notifier.build(chatThreadId);
  }

  @override
  Override overrideWith(ChatThreadById Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatThreadByIdProvider._internal(
        () => create()..chatThreadId = chatThreadId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatThreadId: chatThreadId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    ChatThreadById,
    Map<String, MessageViewModel>
  >
  createElement() {
    return _ChatThreadByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatThreadByIdProvider &&
        other.chatThreadId == chatThreadId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatThreadId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChatThreadByIdRef
    on AutoDisposeAsyncNotifierProviderRef<Map<String, MessageViewModel>> {
  /// The parameter `chatThreadId` of this provider.
  String get chatThreadId;
}

class _ChatThreadByIdProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ChatThreadById,
          Map<String, MessageViewModel>
        >
    with ChatThreadByIdRef {
  _ChatThreadByIdProviderElement(super.provider);

  @override
  String get chatThreadId => (origin as ChatThreadByIdProvider).chatThreadId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
