import 'package:equatable/equatable.dart';

class Failures extends Equatable {
  final String message;

  const Failures(this.message);
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failures {
  const ServerFailure(String message) : super(message);
}
