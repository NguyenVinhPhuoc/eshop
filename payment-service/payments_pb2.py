# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: payments.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='payments.proto',
  package='payments',
  syntax='proto3',
  serialized_options=b'\252\002\023OrderingService.API',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n\x0epayments.proto\x12\x08payments\"\'\n\x19GetReceiptForOrderRequest\x12\n\n\x02id\x18\x01 \x01(\t\"Z\n\x1aGetReceiptForOrderResponse\x12\x0c\n\x04type\x18\x01 \x01(\t\x12\x0e\n\x06\x61mount\x18\x02 \x01(\x01\x12\x10\n\x08\x63urrency\x18\x03 \x01(\t\x12\x0c\n\x04paid\x18\x04 \x01(\x08\x32n\n\x0fPaymentsService\x12[\n\x0eGetReceiptById\x12#.payments.GetReceiptForOrderRequest\x1a$.payments.GetReceiptForOrderResponseB\x16\xaa\x02\x13OrderingService.APIb\x06proto3'
)




_GETRECEIPTFORORDERREQUEST = _descriptor.Descriptor(
  name='GetReceiptForOrderRequest',
  full_name='payments.GetReceiptForOrderRequest',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='id', full_name='payments.GetReceiptForOrderRequest.id', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=28,
  serialized_end=67,
)


_GETRECEIPTFORORDERRESPONSE = _descriptor.Descriptor(
  name='GetReceiptForOrderResponse',
  full_name='payments.GetReceiptForOrderResponse',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='type', full_name='payments.GetReceiptForOrderResponse.type', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='amount', full_name='payments.GetReceiptForOrderResponse.amount', index=1,
      number=2, type=1, cpp_type=5, label=1,
      has_default_value=False, default_value=float(0),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='currency', full_name='payments.GetReceiptForOrderResponse.currency', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=b"".decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='paid', full_name='payments.GetReceiptForOrderResponse.paid', index=3,
      number=4, type=8, cpp_type=7, label=1,
      has_default_value=False, default_value=False,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=69,
  serialized_end=159,
)

DESCRIPTOR.message_types_by_name['GetReceiptForOrderRequest'] = _GETRECEIPTFORORDERREQUEST
DESCRIPTOR.message_types_by_name['GetReceiptForOrderResponse'] = _GETRECEIPTFORORDERRESPONSE
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

GetReceiptForOrderRequest = _reflection.GeneratedProtocolMessageType('GetReceiptForOrderRequest', (_message.Message,), {
  'DESCRIPTOR' : _GETRECEIPTFORORDERREQUEST,
  '__module__' : 'payments_pb2'
  # @@protoc_insertion_point(class_scope:payments.GetReceiptForOrderRequest)
  })
_sym_db.RegisterMessage(GetReceiptForOrderRequest)

GetReceiptForOrderResponse = _reflection.GeneratedProtocolMessageType('GetReceiptForOrderResponse', (_message.Message,), {
  'DESCRIPTOR' : _GETRECEIPTFORORDERRESPONSE,
  '__module__' : 'payments_pb2'
  # @@protoc_insertion_point(class_scope:payments.GetReceiptForOrderResponse)
  })
_sym_db.RegisterMessage(GetReceiptForOrderResponse)


DESCRIPTOR._options = None

_PAYMENTSSERVICE = _descriptor.ServiceDescriptor(
  name='PaymentsService',
  full_name='payments.PaymentsService',
  file=DESCRIPTOR,
  index=0,
  serialized_options=None,
  create_key=_descriptor._internal_create_key,
  serialized_start=161,
  serialized_end=271,
  methods=[
  _descriptor.MethodDescriptor(
    name='GetReceiptById',
    full_name='payments.PaymentsService.GetReceiptById',
    index=0,
    containing_service=None,
    input_type=_GETRECEIPTFORORDERREQUEST,
    output_type=_GETRECEIPTFORORDERRESPONSE,
    serialized_options=None,
    create_key=_descriptor._internal_create_key,
  ),
])
_sym_db.RegisterServiceDescriptor(_PAYMENTSSERVICE)

DESCRIPTOR.services_by_name['PaymentsService'] = _PAYMENTSSERVICE

# @@protoc_insertion_point(module_scope)