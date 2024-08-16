import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:neobis_smart_tailor/core/network/entity/failure.dart';
import 'package:neobis_smart_tailor/core/network/entity/state_status.dart';
import 'package:neobis_smart_tailor/features/profile/domain/model/my_purchases.dart';
import 'package:neobis_smart_tailor/features/profile/domain/use_case/get_all_purchases_use_case.dart';
import 'package:neobis_smart_tailor/features/profile/domain/use_case/load_more_purchases_use_case.dart';

part 'purchases_event.dart';

part 'purchases_state.dart';

part 'purchases_bloc.freezed.dart';

@injectable
class PurchasesBloc extends Bloc<PurchasesEvent, PurchasesState> {
  final GetAllPurchasesUseCase getAllPurchasesUseCase;
  final LoadMorePurchasesUseCase loadMorePurchasesUseCase;
  PurchasesBloc(
    this.getAllPurchasesUseCase,
    this.loadMorePurchasesUseCase,
  ) : super(
          const PurchasesState(
            stateStatus: StateStatus.initial(),
            purchases: [],
            isLast: false,
            totalCount: 0,
            page: 0,
          ),
        ) {
    on<_GetPurchasesList>(_getPurchasesList);
    on<_LoadMoreElements>(_loadMoreElements);
  }

  Future<void> _loadMoreElements(
    _LoadMoreElements event,
    Emitter<PurchasesState> emit,
  ) async {
    if (state.isLast) {
      return;
    } else {
      emit(state.copyWith(stateStatus: const StateStatus.loading()));
      try {
        var entity = await loadMorePurchasesUseCase.call(pageNumber: state.page);
        final updatedPurchases = List<PurchasesEntity>.from(state.purchases ?? [])..addAll(entity.advertisement ?? []);

        emit(state.copyWith(
            stateStatus: const StateStatus.success(),
            purchases: updatedPurchases,
            isLast: entity.isLast ?? false,
            totalCount: entity.totalCount ?? state.totalCount,
            page: state.page + 1));
      } catch (e) {
        final errorMessage = e is Failure ? e.message : 'Произошла ошибка';
        emit(state.copyWith(stateStatus: StateStatus.failure(message: errorMessage!)));
      }
    }
  }

  Future<void> _getPurchasesList(
    _GetPurchasesList event,
    Emitter<PurchasesState> emit,
  ) async {
    emit(state.copyWith(stateStatus: const StateStatus.loading()));
    try {
      var entity = await getAllPurchasesUseCase.call(0);

      emit(state.copyWith(
          stateStatus: const StateStatus.success(),
          purchases: entity.advertisement,
          isLast: entity.isLast!,
          totalCount: entity.totalCount!,
          page: 1));
    } catch (e) {
      final errorMessage = e is Failure ? e.message : 'Произошла ошибка';
      emit(state.copyWith(stateStatus: StateStatus.failure(message: errorMessage!)));
    }
  }
}