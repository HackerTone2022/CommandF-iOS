import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.excutable(
    name: "Command",
    platform: .iOS,
    dependencies: [
        .project(target: "Service", path: "../Service"),
        .project(target: "Library", path: "../Library")
    ])
