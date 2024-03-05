import 'package:elements_api/src/models/json_map.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'element.g.dart';

/// {@template element}
/// A single `element` item.
///
/// Contains an [atomicNumber], [symbol],
/// and [atomicNumber], in addition to a [isCompleted]
/// flag.
///
/// If an [atomicNumber] is provided, it cannot be empty. If no [atomicNumber] is provided, one
/// will be generated.
///
/// [Element]s are immutable and can be copied using [copyWith], in addition to
/// being serialized and deserialized using [toJson] and [fromJson]
/// respectively.
/// {@endtemplate}

// @inmutable
@JsonSerializable()
class Element extends Equatable {
  /// {@macro element_item}
  const Element({
    required this.name,
    this.atomicNumber = 0,
    this.symbol = '',
    this.atomicMass = '',
    this.electronicConfiguration = '',
    this.electroNegativity = '',
    this.atomicRadius = 0,
    this.ionRadius = '',
    this.vanDerWaalsRadius = 0,
    this.ionizationEnergy = 0,
    this.electronAffinity = 0,
    this.oxidationStates = '',
    this.standardState = '',
    this.bondingType = '',
    this.meltingPoint = '',
    this.boilingPoint = 0,
    this.density = 0.0,
    this.groupBlock = '',
    this.yearDiscovered = 0,
    this.block = '',
    this.cpkHexColor = '',
    this.period = 0,
    this.group = 0,

    // "group": 18
  });

  /// The unique identifier of the `Element`.
  ///
  /// Cannot be empty.
  final int atomicNumber;

  /// The name of the `Element`.
  ///
  /// Note that the name may be empty.
  final String name;

  /// The symbol of the `Element`.
  ///
  /// Defaults to an empty string.
  final String symbol;
   /// The Atomic Mass of the `Element`.
  ///
  /// Defaults to 0.
  final String atomicMass;
   /// The Electronic Configuration of the `Element`.
  ///
  /// Defaults to an empty string.
  final String electronicConfiguration;
  final String electroNegativity;
  final int atomicRadius;
  final String ionRadius;
  final int vanDerWaalsRadius;
  final int ionizationEnergy;
  final int electronAffinity;
  final String oxidationStates;
  final String standardState;
  final String bondingType;
  final dynamic meltingPoint;
  final dynamic boilingPoint;
  final double density;
  final String groupBlock;
  final int yearDiscovered;
  final String block;
  final String cpkHexColor;
  final int period;
  final int group;

  /// Returns a copy of this `Element` with the given values updated.
  ///
  /// {@macro Element_item}
  // Element copyWith({
  //   String? atomicNumber,
  //   String? name,
  //   String? symbol,
  //   bool? isCompleted,
  // }) {
  //   return Element(
  //     atomicNumber: atomicNumber ?? this.atomicNumber,
  //     name: name ?? this.name,
  //     symbol: symbol ?? this.symbol,
  //   );
  // }

  /// Deserializes the given [JsonMap] into a [Element].
  static Element fromJson(JsonMap json) => _$ElementFromJson(json);

  @override
  List<Object?> get props => [
        atomicNumber,
        name,
        symbol,
        atomicMass,
        electronicConfiguration,
        electroNegativity,
        atomicRadius,
        ionRadius,
        vanDerWaalsRadius,
        ionizationEnergy,
        electronAffinity,
        oxidationStates,
        standardState,
        bondingType,
        meltingPoint,
        boilingPoint,
        density,
        groupBlock,
        yearDiscovered,
        block,
        cpkHexColor,
        period,
        group,
      ];
}
