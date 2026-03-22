import 'package:btg_funds/features/funds/data/datasources/funds_remote_datasource.dart';
import 'package:btg_funds/features/funds/data/mappers/fund_mapper.dart';
import 'package:btg_funds/features/funds/data/models/fund_dto.dart';
import 'package:btg_funds/features/funds/data/repositories/funds_repository_impl.dart';
import 'package:btg_funds/features/funds/domain/entities/fund_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Mock implementation of [FundsRemoteDatasource] for testing purposes.
class MockFundsRemoteDatasource extends Mock implements FundsRemoteDatasource {}

/// Mock implementation of [FundMapper] for testing purposes.
class MockFundMapper extends Mock implements FundMapper {}

void main() {
  /// The system under test: [FundsRepositoryImpl].
  late FundsRepositoryImpl sut;

  /// Mock of [FundsRemoteDatasource] injected into [sut].
  late MockFundsRemoteDatasource mockFundsDatasource;

  /// Mock of [FundMapper] injected into [sut].
  late MockFundMapper mockFundMapper;

  /// Base [FundDto] fixture for FPV BTG PACTUAL RECAUDADORA.
  const tFpvFundDto = FundDto(
    id: '1',
    name: 'FPV BTG PACTUAL RECAUDADORA',
    minimumAmount: 10000,
    category: 'FPV',
  );

  /// Base [FundEntity] fixture for FPV BTG PACTUAL RECAUDADORA.
  const tFpvFundEntity = FundEntity(
    id: '1',
    name: 'FPV BTG PACTUAL RECAUDADORA',
    minimumAmount: 10000,
    category: FundCategory.fpv,
  );

  /// [FundDto] fixture for FIC BTG ACCIONES COLOMBIA.
  const tFicFundDto = FundDto(
    id: '2',
    name: 'FIC BTG ACCIONES COLOMBIA',
    minimumAmount: 50000,
    category: 'FIC',
  );

  /// [FundEntity] fixture for FIC BTG ACCIONES COLOMBIA.
  const tFicFundEntity = FundEntity(
    id: '2',
    name: 'FIC BTG ACCIONES COLOMBIA',
    minimumAmount: 50000,
    category: FundCategory.fic,
  );

  /// [FundDto] fixture for another FPV fund.
  const tAnotherFpvFundDto = FundDto(
    id: '3',
    name: 'FPV BTG NOMINAL',
    minimumAmount: 5000,
    category: 'FPV',
  );

  /// [FundEntity] fixture for another FPV fund.
  const tAnotherFpvFundEntity = FundEntity(
    id: '3',
    name: 'FPV BTG NOMINAL',
    minimumAmount: 5000,
    category: FundCategory.fpv,
  );

  setUp(() {
    mockFundsDatasource = MockFundsRemoteDatasource();
    mockFundMapper = MockFundMapper();

    sut = FundsRepositoryImpl(
      fundsDatasource: mockFundsDatasource,
      fundMapper: mockFundMapper,
    );
  });

  group('FundsRepositoryImpl', () {
    group('getFunds', () {
      test('should return list of FundEntity when datasource succeeds', () async {
        // arrange
        const tDtoList = [tFpvFundDto, tFicFundDto, tAnotherFpvFundDto];
        final tEntityList = [tFpvFundEntity, tFicFundEntity, tAnotherFpvFundEntity];
        when(() => mockFundsDatasource.getFunds()).thenAnswer((_) async => tDtoList);
        when(() => mockFundMapper.modelsToEntities(tDtoList)).thenReturn(tEntityList);

        // act
        final result = await sut.getFunds();

        // assert
        expect(result, tEntityList);
        expect(result.length, 3);
        verify(() => mockFundsDatasource.getFunds()).called(1);
        verify(() => mockFundMapper.modelsToEntities(tDtoList)).called(1);
        verifyNoMoreInteractions(mockFundsDatasource);
        verifyNoMoreInteractions(mockFundMapper);
      });

      test('should call datasource getFunds method', () async {
        // arrange
        const tDtoList = [tFpvFundDto];
        final tEntityList = [tFpvFundEntity];
        when(() => mockFundsDatasource.getFunds()).thenAnswer((_) async => tDtoList);
        when(() => mockFundMapper.modelsToEntities(tDtoList)).thenReturn(tEntityList);

        // act
        await sut.getFunds();

        // assert
        verify(() => mockFundsDatasource.getFunds()).called(1);
      });

      test('should map all DTOs to entities correctly', () async {
        // arrange
        const tDtoList = [tFpvFundDto, tFicFundDto];
        final tEntityList = [tFpvFundEntity, tFicFundEntity];
        when(() => mockFundsDatasource.getFunds()).thenAnswer((_) async => tDtoList);
        when(() => mockFundMapper.modelsToEntities(tDtoList)).thenReturn(tEntityList);

        // act
        final result = await sut.getFunds();

        // assert
        expect(result.length, 2);
        expect(result[0].id, '1');
        expect(result[0].name, 'FPV BTG PACTUAL RECAUDADORA');
        expect(result[1].id, '2');
        expect(result[1].name, 'FIC BTG ACCIONES COLOMBIA');
        verify(() => mockFundMapper.modelsToEntities(tDtoList)).called(1);
      });

      test('should return funds with correct minimum amounts', () async {
        // arrange
        const tDtoList = [tFpvFundDto, tFicFundDto];
        final tEntityList = [tFpvFundEntity, tFicFundEntity];
        when(() => mockFundsDatasource.getFunds()).thenAnswer((_) async => tDtoList);
        when(() => mockFundMapper.modelsToEntities(tDtoList)).thenReturn(tEntityList);

        // act
        final result = await sut.getFunds();

        // assert
        expect(result[0].minimumAmount, 10000);
        expect(result[1].minimumAmount, 50000);
      });

      test('should return funds with correct categories', () async {
        // arrange
        const tDtoList = [tFpvFundDto, tFicFundDto, tAnotherFpvFundDto];
        final tEntityList = [tFpvFundEntity, tFicFundEntity, tAnotherFpvFundEntity];
        when(() => mockFundsDatasource.getFunds()).thenAnswer((_) async => tDtoList);
        when(() => mockFundMapper.modelsToEntities(tDtoList)).thenReturn(tEntityList);

        // act
        final result = await sut.getFunds();

        // assert
        expect(result[0].category, FundCategory.fpv);
        expect(result[1].category, FundCategory.fic);
        expect(result[2].category, FundCategory.fpv);
      });

      test('should return empty list when datasource returns empty list', () async {
        // arrange
        const tEmptyDtoList = <FundDto>[];
        const tEmptyEntityList = <FundEntity>[];
        when(() => mockFundsDatasource.getFunds()).thenAnswer((_) async => tEmptyDtoList);
        when(() => mockFundMapper.modelsToEntities(tEmptyDtoList)).thenReturn(tEmptyEntityList);

        // act
        final result = await sut.getFunds();

        // assert
        expect(result, isEmpty);
        verify(() => mockFundsDatasource.getFunds()).called(1);
        verify(() => mockFundMapper.modelsToEntities(tEmptyDtoList)).called(1);
      });

      test('should preserve fund order from datasource', () async {
        // arrange
        const tDtoList = [tFicFundDto, tFpvFundDto, tAnotherFpvFundDto];
        final tEntityList = [tFicFundEntity, tFpvFundEntity, tAnotherFpvFundEntity];
        when(() => mockFundsDatasource.getFunds()).thenAnswer((_) async => tDtoList);
        when(() => mockFundMapper.modelsToEntities(tDtoList)).thenReturn(tEntityList);

        // act
        final result = await sut.getFunds();

        // assert
        expect(result[0].id, '2');
        expect(result[1].id, '1');
        expect(result[2].id, '3');
      });

      test('should throw exception when datasource throws exception', () async {
        // arrange
        final exception = Exception('Failed to fetch funds');
        when(() => mockFundsDatasource.getFunds()).thenThrow(exception);

        // act & assert
        expect(() => sut.getFunds(), throwsA(isA<Exception>()));
        verify(() => mockFundsDatasource.getFunds()).called(1);
        verifyNoMoreInteractions(mockFundMapper);
      });

      test('should throw exception when mapper throws exception', () async {
        // arrange
        const tDtoList = [tFpvFundDto];
        final exception = Exception('Mapping failed');
        when(() => mockFundsDatasource.getFunds()).thenAnswer((_) async => tDtoList);
        when(() => mockFundMapper.modelsToEntities(tDtoList)).thenThrow(exception);

        // act & assert
        expect(() => sut.getFunds(), throwsA(isA<Exception>()));
        verify(() => mockFundsDatasource.getFunds()).called(1);
      });
    });

    group('getFundById', () {
      test('should return FundEntity when datasource succeeds', () async {
        // arrange
        const tFundId = '1';
        when(() => mockFundsDatasource.getFundById(tFundId)).thenAnswer((_) async => tFpvFundDto);
        when(() => mockFundMapper.modelToEntity(tFpvFundDto)).thenReturn(tFpvFundEntity);

        // act
        final result = await sut.getFundById(tFundId);

        // assert
        expect(result, tFpvFundEntity);
        verify(() => mockFundsDatasource.getFundById(tFundId)).called(1);
        verify(() => mockFundMapper.modelToEntity(tFpvFundDto)).called(1);
        verifyNoMoreInteractions(mockFundsDatasource);
        verifyNoMoreInteractions(mockFundMapper);
      });

      test('should call datasource with correct fund id', () async {
        // arrange
        const tFundId = '2';
        when(() => mockFundsDatasource.getFundById(tFundId)).thenAnswer((_) async => tFicFundDto);
        when(() => mockFundMapper.modelToEntity(tFicFundDto)).thenReturn(tFicFundEntity);

        // act
        await sut.getFundById(tFundId);

        // assert
        verify(() => mockFundsDatasource.getFundById(tFundId)).called(1);
      });

      test('should map DTO to entity correctly', () async {
        // arrange
        const tFundId = '1';
        when(() => mockFundsDatasource.getFundById(tFundId)).thenAnswer((_) async => tFpvFundDto);
        when(() => mockFundMapper.modelToEntity(tFpvFundDto)).thenReturn(tFpvFundEntity);

        // act
        final result = await sut.getFundById(tFundId);

        // assert
        expect(result.id, '1');
        expect(result.name, 'FPV BTG PACTUAL RECAUDADORA');
        verify(() => mockFundMapper.modelToEntity(tFpvFundDto)).called(1);
      });

      test('should return fund with correct minimum amount', () async {
        // arrange
        const tFundId = '2';
        when(() => mockFundsDatasource.getFundById(tFundId)).thenAnswer((_) async => tFicFundDto);
        when(() => mockFundMapper.modelToEntity(tFicFundDto)).thenReturn(tFicFundEntity);

        // act
        final result = await sut.getFundById(tFundId);

        // assert
        expect(result.minimumAmount, 50000);
      });

      test('should return fund with correct category', () async {
        // arrange
        const tFundId = '3';
        when(
          () => mockFundsDatasource.getFundById(tFundId),
        ).thenAnswer((_) async => tAnotherFpvFundDto);
        when(
          () => mockFundMapper.modelToEntity(tAnotherFpvFundDto),
        ).thenReturn(tAnotherFpvFundEntity);

        // act
        final result = await sut.getFundById(tFundId);

        // assert
        expect(result.category, FundCategory.fpv);
        expect(result.minimumAmount, 5000);
      });

      test('should handle fund with different id correctly', () async {
        // arrange
        const tFundId = '2';
        when(() => mockFundsDatasource.getFundById(tFundId)).thenAnswer((_) async => tFicFundDto);
        when(() => mockFundMapper.modelToEntity(tFicFundDto)).thenReturn(tFicFundEntity);

        // act
        final result = await sut.getFundById(tFundId);

        // assert
        expect(result.id, '2');
        expect(result.name, 'FIC BTG ACCIONES COLOMBIA');
        expect(result.category, FundCategory.fic);
      });

      test('should throw exception when datasource throws exception', () async {
        // arrange
        const tFundId = 'invalid-id';
        final exception = Exception('Fund not found');
        when(() => mockFundsDatasource.getFundById(tFundId)).thenThrow(exception);

        // act & assert
        expect(() => sut.getFundById(tFundId), throwsA(isA<Exception>()));
        verify(() => mockFundsDatasource.getFundById(tFundId)).called(1);
        verifyNoMoreInteractions(mockFundMapper);
      });

      test('should throw exception when mapper throws exception', () async {
        // arrange
        const tFundId = '1';
        final exception = Exception('Mapping failed');
        when(() => mockFundsDatasource.getFundById(tFundId)).thenAnswer((_) async => tFpvFundDto);
        when(() => mockFundMapper.modelToEntity(tFpvFundDto)).thenThrow(exception);

        // act & assert
        expect(() => sut.getFundById(tFundId), throwsA(isA<Exception>()));
        verify(() => mockFundsDatasource.getFundById(tFundId)).called(1);
      });

      test('should preserve all fund data through mapping process', () async {
        // arrange
        const tFundId = '2';
        when(() => mockFundsDatasource.getFundById(tFundId)).thenAnswer((_) async => tFicFundDto);
        when(() => mockFundMapper.modelToEntity(tFicFundDto)).thenReturn(tFicFundEntity);

        // act
        final result = await sut.getFundById(tFundId);

        // assert
        expect(result.id, tFicFundEntity.id);
        expect(result.name, tFicFundEntity.name);
        expect(result.minimumAmount, tFicFundEntity.minimumAmount);
        expect(result.category, tFicFundEntity.category);
      });
    });
  });
}
