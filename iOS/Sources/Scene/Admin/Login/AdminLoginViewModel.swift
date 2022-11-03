import Foundation

import Service
import RxSwift
import RxCocoa

class AdminLoginViewModel: ViewModel {
    private let loginUseCase = LoginUseCase()

    struct Input {
        let id: Driver<String>
        let password: Driver<String>
        let onTap: Driver<Void>
    }
    struct Output {
        let isSuccess: PublishRelay<Bool>
    }

    private var disposeBag = DisposeBag()

    func transform(_ input: Input) -> Output {
        let list = Driver.combineLatest(input.id, input.password)
        let isSuccess = PublishRelay<Bool>()

        input.onTap
            .asObservable()
            .withLatestFrom(list.asObservable())
            .map {
                self.loginUseCase.excute(id: $0, password: $1)
            }
            .subscribe(onNext: {
                isSuccess.accept($0)
            })
            .disposed(by: disposeBag)

        return Output(isSuccess: isSuccess)
    }
}
