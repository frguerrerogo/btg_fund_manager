import 'package:btg_funds/features/transaction/data/datasources/transaction_remote_datasource.dart';
import 'package:btg_funds/features/transaction/data/mappers/transaction_mapper.dart';
import 'package:btg_funds/features/transaction/data/models/transaction_dto.dart';
import 'package:btg_funds/features/transaction/data/repositories/transaction_repository_impl.dart';
import 'package:btg_funds/features/transaction/domain/entities/transaction_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Mock implementation of [TransactionRemoteDatasource] for testing purposes.
class MockTransactionRemoteDatasource extends Mock implements TransactionRemoteDatasource {}

/// Mock implementation of [TransactionMapper] for testing purposes.
class MockTransactionMapper extends Mock implements TransactionMapper {}

void main() {
  /// The system under test: [TransactionRepositoryImpl].
  late TransactionRepositoryImpl sut;

  /// Mock of [TransactionRemoteDatasource] injected into [sut].
  late MockTransactionRemoteDatasource mockDatasource;

  /// Mock of [TransactionMapper] injected into [sut].
  late MockTransactionMapper mockMapper;

  /// Base [TransactionDto] fixture for a subscription transaction.
  const tSubscriptionTransactionDto = TransactionDto(
    id: 'trans-001',
    fundId: '1',
    fundName: 'FPV_BTG_PACTUAL_RECAUDADORA',
    amount: 100000,
    type: 'subscription',
    notificationMethod: 'email',
    createdAt: '2024-01-15T10:30:00.000',
  );

  /// Base [TransactionEntity] fixture for a subscription transaction.
  final tSubscriptionTransactionEntity = TransactionEntity(
    id: 'trans-001',
    fundId: '1',
    fundName: 'FPV_BTG_PACTUAL_RECAUDADORA',
    amount: 100000,
    type: TransactionType.subscription,
    notificationMethod: NotificationMethod.email,
    createdAt: DateTime.parse('2024-01-15T10:30:00.000'),
  );

  /// [TransactionDto] fixture for a cancellation transaction.
  const tCancellationTransactionDto = TransactionDto(
    id: 'trans-002',
    fundId: '1',
    fundName: 'FPV_BTG_PACTUAL_RECAUDADORA',
    amount: 50000,
    type: 'cancellation',
    notificationMethod: 'sms',
    createdAt: '2024-01-20T14:45:00.000',
  );

  /// [TransactionEntity] fixture for a cancellation transaction.
  final tCancellationTransactionEntity = TransactionEntity(
    id: 'trans-002',
    fundId: '1',
    fundName: 'FPV_BTG_PACTUAL_RECAUDADORA',
    amount: 50000,
    type: TransactionType.cancellation,
    notificationMethod: NotificationMethod.sms,
    createdAt: DateTime.parse('2024-01-20T14:45:00.000'),
  );

  /// [TransactionDto] fixture for another fund subscription.
  const tSecondFundTransactionDto = TransactionDto(
    id: 'trans-003',
    fundId: '2',
    fundName: 'FIC_BTG_ACCIONES_COLOMBIA',
    amount: 75000,
    type: 'subscription',
    notificationMethod: 'email',
    createdAt: '2024-02-01T09:15:00.000',
  );

  /// [TransactionEntity] fixture for another fund subscription.
  final tSecondFundTransactionEntity = TransactionEntity(
    id: 'trans-003',
    fundId: '2',
    fundName: 'FIC_BTG_ACCIONES_COLOMBIA',
    amount: 75000,
    type: TransactionType.subscription,
    notificationMethod: NotificationMethod.email,
    createdAt: DateTime.parse('2024-02-01T09:15:00.000'),
  );

  setUp(() {
    mockDatasource = MockTransactionRemoteDatasource();
    mockMapper = MockTransactionMapper();

    sut = TransactionRepositoryImpl(
      datasource: mockDatasource,
      mapper: mockMapper,
    );
  });

  group('TransactionRepositoryImpl', () {
    group('getHistory', () {
      test('should return list of TransactionEntity when datasource succeeds', () async {
        // arrange
        const tDtoList = [
          tSubscriptionTransactionDto,
          tCancellationTransactionDto,
          tSecondFundTransactionDto,
        ];
        final tEntityList = [
          tSubscriptionTransactionEntity,
          tCancellationTransactionEntity,
          tSecondFundTransactionEntity,
        ];
        when(() => mockDatasource.getHistory()).thenAnswer((_) async => tDtoList);
        when(() => mockMapper.modelsToEntities(tDtoList)).thenReturn(tEntityList);

        // act
        final result = await sut.getHistory();

        // assert
        expect(result, tEntityList);
        expect(result.length, 3);
        verify(() => mockDatasource.getHistory()).called(1);
        verify(() => mockMapper.modelsToEntities(tDtoList)).called(1);
        verifyNoMoreInteractions(mockDatasource);
        verifyNoMoreInteractions(mockMapper);
      });

      test('should call datasource getHistory method', () async {
        // arrange
        const tDtoList = [tSubscriptionTransactionDto];
        final tEntityList = [tSubscriptionTransactionEntity];
        when(() => mockDatasource.getHistory()).thenAnswer((_) async => tDtoList);
        when(() => mockMapper.modelsToEntities(tDtoList)).thenReturn(tEntityList);

        // act
        await sut.getHistory();

        // assert
        verify(() => mockDatasource.getHistory()).called(1);
      });

      test('should map all DTOs to entities correctly', () async {
        // arrange
        const tDtoList = [
          tSubscriptionTransactionDto,
          tCancellationTransactionDto,
        ];
        final tEntityList = [
          tSubscriptionTransactionEntity,
          tCancellationTransactionEntity,
        ];
        when(() => mockDatasource.getHistory()).thenAnswer((_) async => tDtoList);
        when(() => mockMapper.modelsToEntities(tDtoList)).thenReturn(tEntityList);

        // act
        final result = await sut.getHistory();

        // assert
        expect(result.length, 2);
        expect(result[0].id, 'trans-001');
        expect(result[1].id, 'trans-002');
        verify(() => mockMapper.modelsToEntities(tDtoList)).called(1);
      });

      test('should return empty list when datasource returns empty list', () async {
        // arrange
        const tEmptyDtoList = <TransactionDto>[];
        const tEmptyEntityList = <TransactionEntity>[];
        when(() => mockDatasource.getHistory()).thenAnswer((_) async => tEmptyDtoList);
        when(() => mockMapper.modelsToEntities(tEmptyDtoList)).thenReturn(tEmptyEntityList);

        // act
        final result = await sut.getHistory();

        // assert
        expect(result, isEmpty);
        verify(() => mockDatasource.getHistory()).called(1);
        verify(() => mockMapper.modelsToEntities(tEmptyDtoList)).called(1);
      });

      test('should preserve transaction order from datasource', () async {
        // arrange
        const tDtoList = [
          tSubscriptionTransactionDto,
          tCancellationTransactionDto,
          tSecondFundTransactionDto,
        ];
        final tEntityList = [
          tSubscriptionTransactionEntity,
          tCancellationTransactionEntity,
          tSecondFundTransactionEntity,
        ];
        when(() => mockDatasource.getHistory()).thenAnswer((_) async => tDtoList);
        when(() => mockMapper.modelsToEntities(tDtoList)).thenReturn(tEntityList);

        // act
        final result = await sut.getHistory();

        // assert
        expect(result[0].id, 'trans-001');
        expect(result[1].id, 'trans-002');
        expect(result[2].id, 'trans-003');
      });

      test('should throw exception when datasource throws exception', () async {
        // arrange
        final exception = Exception('Failed to fetch history');
        when(() => mockDatasource.getHistory()).thenThrow(exception);

        // act & assert
        expect(() => sut.getHistory(), throwsA(isA<Exception>()));
        verify(() => mockDatasource.getHistory()).called(1);
        verifyNoMoreInteractions(mockMapper);
      });

      test('should throw exception when mapper throws exception', () async {
        // arrange
        const tDtoList = [tSubscriptionTransactionDto];
        final exception = Exception('Mapping failed');
        when(() => mockDatasource.getHistory()).thenAnswer((_) async => tDtoList);
        when(() => mockMapper.modelsToEntities(tDtoList)).thenThrow(exception);

        // act & assert
        expect(() => sut.getHistory(), throwsA(isA<Exception>()));
        verify(() => mockDatasource.getHistory()).called(1);
      });
    });

    group('saveTransaction', () {
      test('should return TransactionEntity when datasource succeeds', () async {
        // arrange
        when(
          () => mockMapper.entityToModel(tSubscriptionTransactionEntity),
        ).thenReturn(tSubscriptionTransactionDto);
        when(
          () => mockDatasource.saveTransaction(tSubscriptionTransactionDto),
        ).thenAnswer((_) async => tSubscriptionTransactionDto);
        when(
          () => mockMapper.modelToEntity(tSubscriptionTransactionDto),
        ).thenReturn(tSubscriptionTransactionEntity);

        // act
        final result = await sut.saveTransaction(tSubscriptionTransactionEntity);

        // assert
        expect(result, tSubscriptionTransactionEntity);
        verify(() => mockMapper.entityToModel(tSubscriptionTransactionEntity)).called(1);
        verify(() => mockDatasource.saveTransaction(tSubscriptionTransactionDto)).called(1);
        verify(() => mockMapper.modelToEntity(tSubscriptionTransactionDto)).called(1);
        verifyNoMoreInteractions(mockMapper);
        verifyNoMoreInteractions(mockDatasource);
      });

      test('should convert entity to model before saving', () async {
        // arrange
        when(
          () => mockMapper.entityToModel(tSubscriptionTransactionEntity),
        ).thenReturn(tSubscriptionTransactionDto);
        when(
          () => mockDatasource.saveTransaction(tSubscriptionTransactionDto),
        ).thenAnswer((_) async => tSubscriptionTransactionDto);
        when(
          () => mockMapper.modelToEntity(tSubscriptionTransactionDto),
        ).thenReturn(tSubscriptionTransactionEntity);

        // act
        await sut.saveTransaction(tSubscriptionTransactionEntity);

        // assert
        verify(() => mockMapper.entityToModel(tSubscriptionTransactionEntity)).called(1);
        verify(() => mockDatasource.saveTransaction(tSubscriptionTransactionDto)).called(1);
      });

      test('should map saved DTO back to entity', () async {
        // arrange
        when(
          () => mockMapper.entityToModel(tSubscriptionTransactionEntity),
        ).thenReturn(tSubscriptionTransactionDto);
        when(
          () => mockDatasource.saveTransaction(tSubscriptionTransactionDto),
        ).thenAnswer((_) async => tSubscriptionTransactionDto);
        when(
          () => mockMapper.modelToEntity(tSubscriptionTransactionDto),
        ).thenReturn(tSubscriptionTransactionEntity);

        // act
        final result = await sut.saveTransaction(tSubscriptionTransactionEntity);

        // assert
        expect(result.id, 'trans-001');
        expect(result.fundId, '1');
        expect(result.amount, 100000);
        expect(result.type, TransactionType.subscription);
        verify(() => mockMapper.modelToEntity(tSubscriptionTransactionDto)).called(1);
      });

      test('should save cancellation transaction correctly', () async {
        // arrange
        when(
          () => mockMapper.entityToModel(tCancellationTransactionEntity),
        ).thenReturn(tCancellationTransactionDto);
        when(
          () => mockDatasource.saveTransaction(tCancellationTransactionDto),
        ).thenAnswer((_) async => tCancellationTransactionDto);
        when(
          () => mockMapper.modelToEntity(tCancellationTransactionDto),
        ).thenReturn(tCancellationTransactionEntity);

        // act
        final result = await sut.saveTransaction(tCancellationTransactionEntity);

        // assert
        expect(result.type, TransactionType.cancellation);
        expect(result.amount, 50000);
        verify(() => mockDatasource.saveTransaction(tCancellationTransactionDto)).called(1);
      });

      test('should throw exception when mapper throws exception on entityToModel', () async {
        // arrange
        final exception = Exception('Entity to model mapping failed');
        when(() => mockMapper.entityToModel(tSubscriptionTransactionEntity)).thenThrow(exception);

        // act & assert
        expect(
          () => sut.saveTransaction(tSubscriptionTransactionEntity),
          throwsA(isA<Exception>()),
        );
        verify(() => mockMapper.entityToModel(tSubscriptionTransactionEntity)).called(1);
        verifyNoMoreInteractions(mockDatasource);
      });

      test('should throw exception when datasource throws exception', () async {
        // arrange
        final exception = Exception('Save transaction failed');
        when(
          () => mockMapper.entityToModel(tSubscriptionTransactionEntity),
        ).thenReturn(tSubscriptionTransactionDto);
        when(
          () => mockDatasource.saveTransaction(tSubscriptionTransactionDto),
        ).thenThrow(exception);

        // act & assert
        expect(
          () => sut.saveTransaction(tSubscriptionTransactionEntity),
          throwsA(isA<Exception>()),
        );
        verify(() => mockMapper.entityToModel(tSubscriptionTransactionEntity)).called(1);
        verify(() => mockDatasource.saveTransaction(tSubscriptionTransactionDto)).called(1);
      });

      test('should throw exception when mapper throws exception on modelToEntity', () async {
        // arrange
        final exception = Exception('Model to entity mapping failed');
        when(
          () => mockMapper.entityToModel(tSubscriptionTransactionEntity),
        ).thenReturn(tSubscriptionTransactionDto);
        when(
          () => mockDatasource.saveTransaction(tSubscriptionTransactionDto),
        ).thenAnswer((_) async => tSubscriptionTransactionDto);
        when(() => mockMapper.modelToEntity(tSubscriptionTransactionDto)).thenThrow(exception);

        // act & assert
        expect(
          () => sut.saveTransaction(tSubscriptionTransactionEntity),
          throwsA(isA<Exception>()),
        );
        verify(() => mockMapper.entityToModel(tSubscriptionTransactionEntity)).called(1);
        verify(() => mockDatasource.saveTransaction(tSubscriptionTransactionDto)).called(1);
      });

      test('should preserve transaction data through mapping process', () async {
        // arrange
        when(
          () => mockMapper.entityToModel(tSecondFundTransactionEntity),
        ).thenReturn(tSecondFundTransactionDto);
        when(
          () => mockDatasource.saveTransaction(tSecondFundTransactionDto),
        ).thenAnswer((_) async => tSecondFundTransactionDto);
        when(
          () => mockMapper.modelToEntity(tSecondFundTransactionDto),
        ).thenReturn(tSecondFundTransactionEntity);

        // act
        final result = await sut.saveTransaction(tSecondFundTransactionEntity);

        // assert
        expect(result.id, 'trans-003');
        expect(result.fundId, '2');
        expect(result.fundName, 'FIC_BTG_ACCIONES_COLOMBIA');
        expect(result.amount, 75000);
        expect(result.notificationMethod, NotificationMethod.email);
      });
    });
  });
}
