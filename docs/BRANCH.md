# Branch Strategy

## Branches

| Branch                                     | Description                                                                                                                                                              |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| main                                       | Production branch.                                                                                                                                                       |
| issue/#{issue-number}                      | Used to work on an issue.                                                                                                                                                |
| feature/{name}                             | Used to work on feature development other than issues.                                                                                                                   |
| improve/{name}                             | Used to work on improvements other than issues.                                                                                                                          |
| fix/{name}                                 | Used to work on bug fixes other than issues.                                                                                                                             |
| release/{version}                          | Release branch. When merged into the main branch, a {version} tag is automatically pushed. Furthermore, when the tag is pushed, it is automatically deployed to pub.dev. |
| update-contributors                        | Exclusively occupied by a GitHub workflow dedicated to updating the Contributors section in the README.                                                                  |
| auto/update-lint-rules-{short-commit-hash} | Exclusively occupied by a GitHub workflow dedicated to updating lint rules.                                                                                              |
| dependabot/{target}                        | Exclusively occupied by Dependabot.                                                                                                                                      |

## Example

```mermaid
gitGraph
    commit
    branch "release/2.0.0" order: 1
    checkout "release/2.0.0"
    branch "issue/#1" order: 2
    commit
    checkout "main"
    branch "dependabot/github_actions/peter-evans/create-pull-request-6" order: 3
    commit
    checkout "main"
    merge "dependabot/github_actions/peter-evans/create-pull-request-6"
    checkout "release/2.0.0"
    merge "main"
    checkout "issue/#1"
    merge "release/2.0.0"
    commit
    checkout "release/2.0.0"
    merge "issue/#1"
    branch "issue/#2" order: 4
    commit
    commit
    checkout "main"
    branch "auto/update-lint-rules-1234567" order: 5
    commit
    checkout "main"
    merge "auto/update-lint-rules-1234567"
    checkout "release/2.0.0"
    merge "main"
    checkout "issue/#2"
    merge "release/2.0.0"
    commit
    commit
    checkout "release/2.0.0"
    merge "issue/#2"
    checkout "main"
    merge "release/2.0.0"
    branch "update-contributors" order: 6
    checkout "update-contributors"
    commit
    checkout "main"
    merge "update-contributors"
```
