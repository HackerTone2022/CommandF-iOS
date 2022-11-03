import Foundation

import RxSwift
import RxCocoa
import Service

class AdminAddToDoViewModel: ViewModel {
    private let addToDoUseCase = AddToDoUseCase()

    struct Input {
        let title: Driver<String>
        let date: Driver<String>
        let content: Driver<String>
        let onTap: Driver<Void>
    }

    struct Output {
        let isSuccess: PublishRelay<Bool>
    }

    private var disposeBag = DisposeBag()

    func transform(_ input: Input) -> Output {
        let isSuccess = PublishRelay<Bool>()
        let list = Driver.combineLatest(input.title, input.date, input.content)

        input.onTap
            .asObservable()
            .withLatestFrom(list)
            .map { self.addToDoUseCase.excute(title: $0, content: $2, date: $1, userType: .admin) }
            .subscribe(onNext: {
                isSuccess.accept(true)
            })
            .disposed(by: disposeBag)

        return Output(isSuccess: isSuccess)
    }
}
