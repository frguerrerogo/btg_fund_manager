import 'package:btg_funds/features/user/data/data.dart'
    show
        ActiveSubscriptionDto,
        ActiveSubscriptionMapper,
        UserDto,
        UserMapper,
        UserRemoteDatasource,
        UserRepositoryImpl;
import 'package:btg_funds/features/user/domain/domain.dart'
    show ActiveSubscriptionEntity, UserEntity;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Mock implementation of [UserRemoteDatasource] for testing purposes.
class MockUserRemoteDatasource extends Mock implements UserRemoteDatasource {}

/// Mock implementation of [UserMapper] for testing purposes.
class MockUserMapper extends Mock implements UserMapper {}

/// Mock implementation of [ActiveSubscriptionMapper] for testing purposes.
class MockActiveSubscriptionMapper extends Mock implements ActiveSubscriptionMapper {}

void main() {
  /// The system under test: [UserRepositoryImpl].
  late UserRepositoryImpl sut;

  /// Mock of [UserRemoteDatasource] injected into [sut].
  late MockUserRemoteDatasource mockUserDatasource;

  /// Mock of [UserMapper] injected into [sut].
  late MockUserMapper mockUserMapper;

  /// Mock of [ActiveSubscriptionMapper] injected into [sut].
  late MockActiveSubscriptionMapper mockActiveSubscriptionMapper;

  /// Base [ActiveSubscriptionDto] fixture with fundId '1' and amount 75000.
  const tActiveSubscriptionDto = ActiveSubscriptionDto(
    fundId: '1',
    fundName: 'FPV_BTG_PACTUAL_RECAUDADORA',
    amount: 75000,
    subscribedAt: '2024-01-01T00:00:00.000',
  );

  /// Base [ActiveSubscriptionEntity] fixture with fundId '1' and amount 75000.
  final tActiveSubscriptionEntity = ActiveSubscriptionEntity(
    fundId: '1',
    fundName: 'FPV_BTG_PACTUAL_RECAUDADORA',
    amount: 75000,
    subscribedAt: DateTime.parse('2024-01-01T00:00:00.000'),
  );

  /// Base [UserDto] fixture with id '1', balance 500000 and one active subscription.
  const tUserDto = UserDto(
    id: '1',
    name: 'BTG User',
    balance: 500000,
    activeSubscriptions: [tActiveSubscriptionDto],
  );

  /// Base [UserEntity] fixture with id '1', balance 500000 and one active subscription.
  final tUserEntity = UserEntity(
    id: '1',
    name: 'BTG User',
    balance: 500000,
    activeSubscriptions: [tActiveSubscriptionEntity],
  );

  /// Updated [UserDto] fixture with id '1' and balance 750000.
  const tUpdatedBalanceUserDto = UserDto(
    id: '1',
    name: 'BTG User',
    balance: 750000,
    activeSubscriptions: [tActiveSubscriptionDto],
  );

  /// Updated [UserEntity] fixture with id '1' and balance 750000.
  final tUpdatedBalanceUserEntity = UserEntity(
    id: '1',
    name: 'BTG User',
    balance: 750000,
    activeSubscriptions: [tActiveSubscriptionEntity],
  );

  /// [UserDto] fixture with id '1', balance 825000 and two active subscriptions.
  const tUserWithTwoSubscriptionsDto = UserDto(
    id: '1',
    name: 'BTG User',
    balance: 825000,
    activeSubscriptions: [
      tActiveSubscriptionDto,
      ActiveSubscriptionDto(
        fundId: '2',
        fundName: 'FIC_BTG_ACCIONES_COLOMBIA',
        amount: 150000,
        subscribedAt: '2024-02-15T10:30:00.000',
      ),
    ],
  );

  /// [UserEntity] fixture with id '1', balance 825000 and two active subscriptions.
  final tUserWithTwoSubscriptionsEntity = UserEntity(
    id: '1',
    name: 'BTG User',
    balance: 825000,
    activeSubscriptions: [
      tActiveSubscriptionEntity,
      ActiveSubscriptionEntity(
        fundId: '2',
        fundName: 'FIC_BTG_ACCIONES_COLOMBIA',
        amount: 150000,
        subscribedAt: DateTime.parse('2024-02-15T10:30:00.000'),
      ),
    ],
  );

  /// [UserDto] fixture with id '1', balance 500000 and no active subscriptions.
  const tUserWithoutSubscriptionsDto = UserDto(
    id: '1',
    name: 'BTG User',
    balance: 500000,
    activeSubscriptions: [],
  );

  /// [UserEntity] fixture with id '1', balance 500000 and no active subscriptions.
  const tUserWithoutSubscriptionsEntity = UserEntity(
    id: '1',
    name: 'BTG User',
    balance: 500000,
  );

  setUp(() {
    mockUserDatasource = MockUserRemoteDatasource();
    mockUserMapper = MockUserMapper();
    mockActiveSubscriptionMapper = MockActiveSubscriptionMapper();

    sut = UserRepositoryImpl(
      userDatasource: mockUserDatasource,
      userMapper: mockUserMapper,
      activeSubscriptionMapper: mockActiveSubscriptionMapper,
    );
  });

  group('UserRepositoryImpl', () {
    group('getUser', () {
      test('should return UserEntity when datasource succeeds', () async {
        // arrange
        when(() => mockUserDatasource.getUser()).thenAnswer((_) async => tUserDto);
        when(() => mockUserMapper.modelToEntity(tUserDto)).thenReturn(tUserEntity);

        // act
        final result = await sut.getUser();

        // assert
        expect(result, tUserEntity);
        verify(() => mockUserDatasource.getUser()).called(1);
        verify(() => mockUserMapper.modelToEntity(tUserDto)).called(1);
        verifyNoMoreInteractions(mockUserDatasource);
        verifyNoMoreInteractions(mockUserMapper);
      });

      test('should return user with correct id when getUser succeeds', () async {
        // arrange
        when(() => mockUserDatasource.getUser()).thenAnswer((_) async => tUserDto);
        when(() => mockUserMapper.modelToEntity(tUserDto)).thenReturn(tUserEntity);

        // act
        final result = await sut.getUser();

        // assert
        expect(result.id, '1');
      });

      test('should return user with correct balance when getUser succeeds', () async {
        // arrange
        when(() => mockUserDatasource.getUser()).thenAnswer((_) async => tUserDto);
        when(() => mockUserMapper.modelToEntity(tUserDto)).thenReturn(tUserEntity);

        // act
        final result = await sut.getUser();

        // assert
        expect(result.balance, 500000);
      });

      test('should return user with active subscriptions when getUser succeeds', () async {
        // arrange
        when(
          () => mockUserDatasource.getUser(),
        ).thenAnswer((_) async => tUserWithTwoSubscriptionsDto);
        when(
          () => mockUserMapper.modelToEntity(tUserWithTwoSubscriptionsDto),
        ).thenReturn(tUserWithTwoSubscriptionsEntity);

        // act
        final result = await sut.getUser();

        // assert
        expect(result.activeSubscriptions.length, 2);
        expect(result.activeSubscriptions.first.fundId, '1');
        expect(result.activeSubscriptions.last.fundId, '2');
      });

      test('should throw exception when datasource throws exception', () async {
        // arrange
        final exception = Exception('Network error');
        when(() => mockUserDatasource.getUser()).thenThrow(exception);

        // act & assert
        expect(() => sut.getUser(), throwsA(isA<Exception>()));
        verify(() => mockUserDatasource.getUser()).called(1);
        verifyNoMoreInteractions(mockUserMapper);
      });
    });

    group('updateBalance', () {
      const tNewBalance = 750000.0;

      test('should return updated UserEntity when datasource succeeds', () async {
        // arrange
        when(
          () => mockUserDatasource.updateBalance(tNewBalance),
        ).thenAnswer((_) async => tUpdatedBalanceUserDto);
        when(
          () => mockUserMapper.modelToEntity(tUpdatedBalanceUserDto),
        ).thenReturn(tUpdatedBalanceUserEntity);

        // act
        final result = await sut.updateBalance(tNewBalance);

        // assert
        expect(result, tUpdatedBalanceUserEntity);
        expect(result.balance, tNewBalance);
        verify(() => mockUserDatasource.updateBalance(tNewBalance)).called(1);
        verify(() => mockUserMapper.modelToEntity(tUpdatedBalanceUserDto)).called(1);
        verifyNoMoreInteractions(mockUserDatasource);
        verifyNoMoreInteractions(mockUserMapper);
      });

      test('should call datasource with correct balance parameter', () async {
        // arrange
        when(
          () => mockUserDatasource.updateBalance(tNewBalance),
        ).thenAnswer((_) async => tUpdatedBalanceUserDto);
        when(
          () => mockUserMapper.modelToEntity(tUpdatedBalanceUserDto),
        ).thenReturn(tUpdatedBalanceUserEntity);

        // act
        await sut.updateBalance(tNewBalance);

        // assert
        verify(() => mockUserDatasource.updateBalance(tNewBalance)).called(1);
      });

      test('should map updated balance correctly', () async {
        // arrange
        when(
          () => mockUserDatasource.updateBalance(tNewBalance),
        ).thenAnswer((_) async => tUpdatedBalanceUserDto);
        when(
          () => mockUserMapper.modelToEntity(tUpdatedBalanceUserDto),
        ).thenReturn(tUpdatedBalanceUserEntity);

        // act
        final result = await sut.updateBalance(tNewBalance);

        // assert
        expect(result.balance, 750000);
      });

      test('should throw exception when datasource throws exception', () async {
        // arrange
        final exception = Exception('Balance update failed');
        when(() => mockUserDatasource.updateBalance(tNewBalance)).thenThrow(exception);

        // act & assert
        expect(() => sut.updateBalance(tNewBalance), throwsA(isA<Exception>()));
        verify(() => mockUserDatasource.updateBalance(tNewBalance)).called(1);
        verifyNoMoreInteractions(mockUserMapper);
      });

      test('should throw exception when balance is negative', () async {
        // arrange
        const negativeBalance = -10000.0;
        final exception = Exception('Invalid balance');
        when(() => mockUserDatasource.updateBalance(negativeBalance)).thenThrow(exception);

        // act & assert
        expect(() => sut.updateBalance(negativeBalance), throwsA(isA<Exception>()));
      });
    });

    group('addActiveSubscription', () {
      test('should return UserEntity with new subscription when succeeds', () async {
        // arrange
        when(
          () => mockActiveSubscriptionMapper.entityToModel(tActiveSubscriptionEntity),
        ).thenReturn(tActiveSubscriptionDto);
        when(
          () => mockUserDatasource.addActiveSubscription(tActiveSubscriptionDto),
        ).thenAnswer((_) async => tUserWithTwoSubscriptionsDto);
        when(
          () => mockUserMapper.modelToEntity(tUserWithTwoSubscriptionsDto),
        ).thenReturn(tUserWithTwoSubscriptionsEntity);

        // act
        final result = await sut.addActiveSubscription(tActiveSubscriptionEntity);

        // assert
        expect(result, tUserWithTwoSubscriptionsEntity);
        expect(result.activeSubscriptions.length, 2);
        verify(
          () => mockActiveSubscriptionMapper.entityToModel(tActiveSubscriptionEntity),
        ).called(1);
        verify(() => mockUserDatasource.addActiveSubscription(tActiveSubscriptionDto)).called(1);
        verify(() => mockUserMapper.modelToEntity(tUserWithTwoSubscriptionsDto)).called(1);
        verifyNoMoreInteractions(mockActiveSubscriptionMapper);
        verifyNoMoreInteractions(mockUserDatasource);
        verifyNoMoreInteractions(mockUserMapper);
      });

      test('should map subscription entity to model before calling datasource', () async {
        // arrange
        when(
          () => mockActiveSubscriptionMapper.entityToModel(tActiveSubscriptionEntity),
        ).thenReturn(tActiveSubscriptionDto);
        when(
          () => mockUserDatasource.addActiveSubscription(tActiveSubscriptionDto),
        ).thenAnswer((_) async => tUserWithTwoSubscriptionsDto);
        when(
          () => mockUserMapper.modelToEntity(tUserWithTwoSubscriptionsDto),
        ).thenReturn(tUserWithTwoSubscriptionsEntity);

        // act
        await sut.addActiveSubscription(tActiveSubscriptionEntity);

        // assert
        verify(
          () => mockActiveSubscriptionMapper.entityToModel(tActiveSubscriptionEntity),
        ).called(1);
        verify(() => mockUserDatasource.addActiveSubscription(tActiveSubscriptionDto)).called(1);
      });

      test('should call mapper with correct subscription entity', () async {
        // arrange
        when(
          () => mockActiveSubscriptionMapper.entityToModel(tActiveSubscriptionEntity),
        ).thenReturn(tActiveSubscriptionDto);
        when(
          () => mockUserDatasource.addActiveSubscription(tActiveSubscriptionDto),
        ).thenAnswer((_) async => tUserWithTwoSubscriptionsDto);
        when(
          () => mockUserMapper.modelToEntity(tUserWithTwoSubscriptionsDto),
        ).thenReturn(tUserWithTwoSubscriptionsEntity);

        // act
        await sut.addActiveSubscription(tActiveSubscriptionEntity);

        // assert
        verify(
          () => mockActiveSubscriptionMapper.entityToModel(tActiveSubscriptionEntity),
        ).called(1);
      });

      test('should throw exception when mapper throws exception', () async {
        // arrange
        final exception = Exception('Mapping failed');
        when(
          () => mockActiveSubscriptionMapper.entityToModel(tActiveSubscriptionEntity),
        ).thenThrow(exception);

        // act & assert
        expect(
          () => sut.addActiveSubscription(tActiveSubscriptionEntity),
          throwsA(isA<Exception>()),
        );
        verify(
          () => mockActiveSubscriptionMapper.entityToModel(tActiveSubscriptionEntity),
        ).called(1);
        verifyNoMoreInteractions(mockUserDatasource);
      });

      test('should throw exception when datasource throws exception', () async {
        // arrange
        final exception = Exception('Add subscription failed');
        when(
          () => mockActiveSubscriptionMapper.entityToModel(tActiveSubscriptionEntity),
        ).thenReturn(tActiveSubscriptionDto);
        when(
          () => mockUserDatasource.addActiveSubscription(tActiveSubscriptionDto),
        ).thenThrow(exception);

        // act & assert
        expect(
          () => sut.addActiveSubscription(tActiveSubscriptionEntity),
          throwsA(isA<Exception>()),
        );
        verify(
          () => mockActiveSubscriptionMapper.entityToModel(tActiveSubscriptionEntity),
        ).called(1);
        verify(() => mockUserDatasource.addActiveSubscription(tActiveSubscriptionDto)).called(1);
        verifyNoMoreInteractions(mockUserMapper);
      });
    });

    group('removeActiveSubscription', () {
      const tFundId = '1';

      test('should return UserEntity without removed subscription when succeeds', () async {
        // arrange
        when(
          () => mockUserDatasource.removeActiveSubscription(tFundId),
        ).thenAnswer((_) async => tUserWithoutSubscriptionsDto);
        when(
          () => mockUserMapper.modelToEntity(tUserWithoutSubscriptionsDto),
        ).thenReturn(tUserWithoutSubscriptionsEntity);

        // act
        final result = await sut.removeActiveSubscription(tFundId);

        // assert
        expect(result, tUserWithoutSubscriptionsEntity);
        expect(result.activeSubscriptions, isEmpty);
        verify(() => mockUserDatasource.removeActiveSubscription(tFundId)).called(1);
        verify(() => mockUserMapper.modelToEntity(tUserWithoutSubscriptionsDto)).called(1);
        verifyNoMoreInteractions(mockUserDatasource);
        verifyNoMoreInteractions(mockUserMapper);
      });

      test('should call datasource with correct fund id', () async {
        // arrange
        when(
          () => mockUserDatasource.removeActiveSubscription(tFundId),
        ).thenAnswer((_) async => tUserWithoutSubscriptionsDto);
        when(
          () => mockUserMapper.modelToEntity(tUserWithoutSubscriptionsDto),
        ).thenReturn(tUserWithoutSubscriptionsEntity);

        // act
        await sut.removeActiveSubscription(tFundId);

        // assert
        verify(() => mockUserDatasource.removeActiveSubscription(tFundId)).called(1);
      });

      test('should still have user info but without the subscription', () async {
        // arrange
        when(
          () => mockUserDatasource.removeActiveSubscription(tFundId),
        ).thenAnswer((_) async => tUserWithoutSubscriptionsDto);
        when(
          () => mockUserMapper.modelToEntity(tUserWithoutSubscriptionsDto),
        ).thenReturn(tUserWithoutSubscriptionsEntity);

        // act
        final result = await sut.removeActiveSubscription(tFundId);

        // assert
        expect(result.id, '1');
        expect(result.balance, 500000);
        expect(result.activeSubscriptions.length, 0);
      });

      test('should throw exception when datasource throws exception', () async {
        // arrange
        final exception = Exception('Remove subscription failed');
        when(() => mockUserDatasource.removeActiveSubscription(tFundId)).thenThrow(exception);

        // act & assert
        expect(() => sut.removeActiveSubscription(tFundId), throwsA(isA<Exception>()));
        verify(() => mockUserDatasource.removeActiveSubscription(tFundId)).called(1);
        verifyNoMoreInteractions(mockUserMapper);
      });

      test('should throw exception when fund id is not found', () async {
        // arrange
        const invalidFundId = 'non-existent-fund';
        final exception = Exception('Fund not found');
        when(() => mockUserDatasource.removeActiveSubscription(invalidFundId)).thenThrow(exception);

        // act & assert
        expect(() => sut.removeActiveSubscription(invalidFundId), throwsA(isA<Exception>()));
      });
    });
  });
}
