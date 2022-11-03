import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.excutable(
    name: "CommandF-iOS",
    platform: .iOS,
    dependencies: [
        .project(target: "Service", path: "../Service"),
        .project(target: "Library", path: "../Library")
    ])
