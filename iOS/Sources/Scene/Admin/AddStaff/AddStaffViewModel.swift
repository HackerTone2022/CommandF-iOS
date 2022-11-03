import Foundation

import RxSwift
import RxCocoa
import Service

class AddStaffViewModel: ViewModel {
    private let addAccountUserUseCase = AddAccountUseCase()
    private let fetchUserListUseCase = FetchUserListUseCase()

    struct Input {
        let fetchList: Driver<Void>
        let id: Driver<String>
        let name: Driver<String>
        let password: Driver<String>
        let onTap: Driver<Void>
    }

    struct Output {
        let userList: BehaviorRelay<[User]>
    }

    private var disposeBag = DisposeBag()

    func transform(_ input: Input) -> Output {
        let userList = BehaviorRelay<[User]>(value: [])

        let list = Driver.combineLatest(input.id, input.name, input.password)
        input.onTap
            .asObservable()
            .withLatestFrom(list.asObservable())
            .map { self.addAccountUserUseCase.excute(id: $0, password: $2, name: $1)}
            .subscribe(onNext: { _ in
            })
            .disposed(by: disposeBag)

        input.fetchList
            .asObservable()
            .map { self.fetchUserListUseCase.excute() }
            .subscribe(onNext: {
                userList.accept($0)
            }).disposed(by: disposeBag)

        return Output(userList: userList)
    }
}
