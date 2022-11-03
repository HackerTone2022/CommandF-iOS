import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "Library",
    platform: .iOS,
    dependencies: [
        .SPM.RxSwift,
        .SPM.RxCocoa,
        .SPM.Moya,
        .SPM.RxMoya,
        .SPM.SnapKit,
        .SPM.Then,
        .SPM.Charts
    ]
)
