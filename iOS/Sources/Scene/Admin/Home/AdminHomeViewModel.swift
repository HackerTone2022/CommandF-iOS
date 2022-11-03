import Foundation

import RxSwift
import RxCocoa
import Service

class AdminHomeViewModel: ViewModel {
    private let fetchUserListUseCase = FetchUserListUseCase()
    private let addAccountUseCase = AddAccountUseCase()

    struct Input {
        let getList: Driver<Void>
        let index: Driver<IndexPath>
        let id: Driver<String>
        let name: Driver<String>
        let password: Driver<String>
        let onTap: Driver<Void>
    }

    struct Output {
        let userList: BehaviorRelay<[User]>
        let id: PublishRelay<String>
        let isSuccess: PublishRelay<Bool>
    }

    private var disposeBag = DisposeBag()

    func transform(_ input: Input) -> Output {
        let userList = BehaviorRelay<[User]>(value: [])
        let id = PublishRelay<String>()
        let list = Driver.combineLatest(input.id, input.name, input.password)
        let isSuccess = PublishRelay<Bool>()

        input.getList
            .asObservable()
            .map { self.fetchUserListUseCase.excute() }
            .subscribe(onNext: {
                userList.accept($0)
            })
            .disposed(by: disposeBag)

        input.index
            .asObservable()
            .subscribe(onNext: { index in
                let list = userList.value
                id.accept(list[index.row].id)
            })
            .disposed(by: disposeBag)

        input.onTap
            .asObservable()
            .withLatestFrom(list)
            .map { self.addAccountUseCase.excute(id: $0, password: $2, name: $1) }
            .subscribe(onNext: {
                isSuccess.accept(true)
            })
            .disposed(by: disposeBag)

        return Output(userList: userList, id: id, isSuccess: isSuccess)
    }
}
