import 'package:elements_api/elements_api.dart';
import 'package:elements_api_sqlite/src/data/data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// {@template elements_api_sqlite}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ElementsApiSqlite extends ElementsApi {
  /// {@macro elements_api_sqlite}
  late Database _database;

// Initializates db and setup the data 
  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'elements.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE elements('
          'atomicNumber INTEGER PRIMARY KEY, '
          'name TEXT, '
          'symbol TEXT, '
          'atomicMass TEXT, '
          'electronicConfiguration TEXT, '
          'electroNegativity TEXT, '
          'atomicRadius INTEGER, '
          'ionRadius TEXT, '
          'vanDerWaalsRadius INTEGER, '
          'ionizationEnergy INTEGER, '
          'electronAffinity INTEGER, '
          'oxidationStates TEXT, '
          'standardState TEXT, '
          'bondingType TEXT, '
          'meltingPoint TEXT, '
          'boilingPoint INTEGER, '
          'density REAL, '
          'groupBlock TEXT, '
          'yearDiscovered INTEGER, '
          'block TEXT, '
          'cpkHexColor TEXT, '
          'period INTEGER, '
          'group INTEGER'
          ')',
        );

        // Insertar datos por defecto
        await _insertDefaultElements(db);
      },
      version: 1,
    );
  }

  Future<void> _insertDefaultElements(Database db) async {
    // Insertar datos iniciales
    final List<Map<String, dynamic>> defaultElements = Data().elements;

    for (final elementData in defaultElements) {
      await db.insert(
        'elements',
        elementData,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Stream<List<Element>> getElements() async* {
    final List<Map<String, dynamic>> maps = await _database.query('elements');
    yield listGenerator(maps);
  }

  @override
  Future<Element> getElementByAName(String atomicName) {
    // TODO: implement getElementByAName
    throw UnimplementedError();
  }

  @override
  Future<Element> getElementByANumber(int atomicNumber) {
    // TODO: implement getElementByANumber
    throw UnimplementedError();
  }

  @override
  Future<Element> getElementBySymbol(String symbol) {
    // TODO: implement getElementBySymbol
    throw UnimplementedError();
  }

  @override
  Stream<List<Element>> getElementsByBlock(String block) async* {
    const where = 'block = ?';
    final arg = <dynamic>[block];

    final List<Map<String, dynamic>> maps = await _database.query(
      'elements',
      where: where,
      whereArgs: arg,
    );

    yield listGenerator(maps);
  }

  @override
  Stream<List<Element>> getElementsByState(String state) async*{
     const where = 'standardState = ?';
    final arg = <dynamic>[state];

    final List<Map<String, dynamic>> maps = await _database.query(
      'elements',
      where: where,
      whereArgs: arg,
    );

    yield listGenerator(maps);
  }

  List<Element> listGenerator(List<Map<String, dynamic>> maps){
    return List.generate(maps.length, (i) {
      return Element(
        atomicNumber: maps[i]['atomicNumber'] as int,
        name: maps[i]['name'].toString(),
        symbol: maps[i]['symbol'].toString(),
        atomicMass: maps[i]['atomicMass'].toString(),
        electronicConfiguration: maps[i]['electronicConfiguration'].toString(),
        electroNegativity: maps[i]['electroNegativity'].toString(),
        atomicRadius: maps[i]['atomicRadius'] as int,
        ionRadius: maps[i]['ionRadius'].toString(),
        vanDerWaalsRadius: maps[i]['vanDerWaalsRadius'] as int,
        ionizationEnergy: maps[i]['ionizationEnergy'] as int,
        electronAffinity: maps[i]['electronAffinity'] as int,
        oxidationStates: maps[i]['oxidationStates'].toString(),
        standardState: maps[i]['standardState'].toString(),
        bondingType: maps[i]['bondingType'].toString(),
        meltingPoint: maps[i]['meltingPoint'],
        boilingPoint: maps[i]['boilingPoint'],
        density: maps[i]['density'] as double,
        groupBlock: maps[i]['groupBlock'].toString(),
        yearDiscovered: maps[i]['yearDiscovered'] as int,
        block: maps[i]['block'].toString(),
        cpkHexColor: maps[i]['cpkHexColor'].toString(),
        period: maps[i]['period'] as int,
        group: maps[i]['group'] as int,
      );
    });
  }
}
