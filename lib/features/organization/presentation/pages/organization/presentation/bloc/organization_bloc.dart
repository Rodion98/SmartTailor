import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:neobis_smart_tailor/core/network/entity/failure.dart';
import 'package:neobis_smart_tailor/core/network/entity/state_status.dart';
import 'package:neobis_smart_tailor/features/organization/presentation/pages/organization/domain/entitys/organization_info_entity.dart';
import 'package:neobis_smart_tailor/features/organization/presentation/pages/organization/domain/use_case/get_profile_use_case.dart';

part 'organization_event.dart';
part 'organization_state.dart';
part 'organization_bloc.freezed.dart';

@singleton
class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  final GetProfileUseCase getProfileUseCase;

  OrganizationBloc(
    this.getProfileUseCase,
  ) : super(
          OrganizationState(
            stateStatus: const StateStatus.initial(),
            organizationInfo: OrganizationInfoEntity.initial(),
          ),
        ) {
    on<_GetOrganization>(_getProfile);
  }

  Future<void> _getProfile(
    _GetOrganization event,
    Emitter<OrganizationState> emit,
  ) async {
    emit(state.copyWith(stateStatus: const StateStatus.loading()));
    try {
      final results = await getProfileUseCase.call();
      emit(state.copyWith(stateStatus: const StateStatus.success(), organizationInfo: results));
    } catch (e) {
      final errorMessage = e is Failure ? e.message : 'Произошла ошибка';
      emit(state.copyWith(stateStatus: StateStatus.failure(message: errorMessage!)));
    }
  }
}