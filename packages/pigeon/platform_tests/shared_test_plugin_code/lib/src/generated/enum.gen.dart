// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//
// Autogenerated from Pigeon, do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse(
    {Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

/// This comment is to test enum documentation comments.
enum EnumState {
  /// This comment is to test enum member (Pending) documentation comments.
  Pending,

  /// This comment is to test enum member (Success) documentation comments.
  Success,

  /// This comment is to test enum member (Error) documentation comments.
  Error,

  /// This comment is to test enum member (SnakeCase) documentation comments.
  SnakeCase,
}

/// This comment is to test class documentation comments.
class DataWithEnum {
  DataWithEnum({
    this.state,
  });

  /// This comment is to test field documentation comments.
  EnumState? state;

  Object encode() {
    return <Object?>[
      state,
    ];
  }

  static DataWithEnum decode(Object result) {
    result as List<Object?>;
    return DataWithEnum(
      state: result[0] as EnumState?,
    );
  }
}

class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is DataWithEnum) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is EnumState) {
      buffer.putUint8(130);
      writeValue(buffer, value.index);
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129:
        return DataWithEnum.decode(readValue(buffer)!);
      case 130:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : EnumState.values[value];
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// This comment is to test api documentation comments.
class EnumApi2Host {
  /// Constructor for [EnumApi2Host].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  EnumApi2Host(
      {BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : __pigeon_binaryMessenger = binaryMessenger,
        __pigeon_messageChannelSuffix =
            messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String __pigeon_messageChannelSuffix;

  /// This comment is to test method documentation comments.
  Future<DataWithEnum> echo(DataWithEnum data) async {
    final String __pigeon_channelName =
        'dev.flutter.pigeon.pigeon_integration_tests.EnumApi2Host.echo$__pigeon_messageChannelSuffix';
    final BasicMessageChannel<Object?> __pigeon_channel =
        BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[data]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else if (__pigeon_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (__pigeon_replyList[0] as DataWithEnum?)!;
    }
  }
}

/// This comment is to test api documentation comments.
abstract class EnumApi2Flutter {
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  /// This comment is to test method documentation comments.
  DataWithEnum echo(DataWithEnum data);

  static void setUp(
    EnumApi2Flutter? api, {
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) {
    messageChannelSuffix =
        messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.pigeon_integration_tests.EnumApi2Flutter.echo$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.pigeon_integration_tests.EnumApi2Flutter.echo was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final DataWithEnum? arg_data = (args[0] as DataWithEnum?);
          assert(arg_data != null,
              'Argument for dev.flutter.pigeon.pigeon_integration_tests.EnumApi2Flutter.echo was null, expected non-null DataWithEnum.');
          try {
            final DataWithEnum output = api.echo(arg_data!);
            return wrapResponse(result: output);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
