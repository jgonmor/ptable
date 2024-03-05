import 'package:elements_api/elements_api.dart';

/// {@template elements_api}
/// Interface and models for chemical elements API.
/// {@endtemplate}
abstract class ElementsApi {
  /// {@macro elements_api}
  const ElementsApi();

  /// Get all [Element].
  ///
  /// Return a [Stream] with a [List] of [Element]. 
  Stream<List<Element>> getElements();

  /// Get all [Element] with a specific [state].
  ///
  /// Return a [Stream] with a [List] of [Element] with a specific [state].
  Stream<List<Element>> getElementsByState(String state);

  /// Get all [Element] in a specific [block].
  ///
  /// Return a [Stream] with a [List] of [Element] in a specific [block].
  Stream<List<Element>> getElementsByBlock(String block);

  /// Get an [Element] with specific [atomicNumber].
  ///
  /// Return a [Future] of an [Element] with a specific [atomicNumber].
  Future<Element> getElementByANumber(int atomicNumber);

  /// Get an [Element] with specific [atomicName].
  ///
  /// Return a [Future] of an [Element] with a specific [atomicName].
  Future<Element> getElementByAName(String atomicName);

  /// Get an [Element] with specific [symbol].
  ///
  /// Return a [Future] of an [Element] with a specific [symbol].
  Future<Element> getElementBySymbol(String symbol);

  
}
