<!-- Update all documents for other languages when new languages are added -->
[English](https://github.com/yumemi-inc/flutter-yumemi-lints/blob/main/docs/COPILOT.md) | [日本語](https://github.com/yumemi-inc/flutter-yumemi-lints/blob/main/docs/resources/translations/ja_JP/COPILOT.md)

# GitHub Copilot 

> [!NOTE]
> This document is based on YUMEMI Inc.'s internal document "[Policies, Rules, and Guidelines for the Use of ChatGPT and Other AI Services](https://www.notion.so/yumemi/ChatGPT-AI-f951c2e2542e4db5af72386329e23155)".
> Please check that guideline at the beginning if you are within YUMEMI.

## Risks of Generated AI in general
Generated AI in general has the following risks. You need to be fully aware of them with related parties when you use them.

### Risks under copyright law
Automatically generated source code may infringe on the copyright of others' source code.

### Security Risks
Code may be generated with insecure coding patterns or bugs, use of outdated APIs or libraries, or other security risks.

### Privacy Risks
There is concern that sensitive or personal information could be learned and displayed to third parties.
You should be aware of what information those tools collect from your project and use for learning.

## Risks of GitHub Copilot
GitHub Copilot can be used by setting up a subscription.
There are two types of subscriptions: personal and organizational (Organization or Enterprise) as shown below. Note that each has a different privacy policy.
- [GitHub Copilot Individual](https://docs.github.com/en/copilot/overview-of-github-copilot/about-github-copilot-individual)
- [GitHub Copilot Business](https://docs.github.com/en/copilot/overview-of-github-copilot/about-github-copilot-business)

### Risk as an IDE extension
Note that the extent to which GitHub Copilot extensions are enabled depends on the IDE.
VSCode and Xcode allow you to enable it on a per-project basis, but other IDEs do not allow you to control it on a per-project basis, so you must be careful not to accidentally run Copilot.

## How to use Copilot
### VSCode
1. install [GitHub Copilot extension](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot) to VSCode
2. disable the Copilot extension so that Copilot will not work throughout VSCode
3. open any workspace and enable the Copilot extension in that workspace only
4. Add the following GitHub Copilot configuration to the workspace settings (`.vscode/settings.json`)
  
```jsonc
{
  "github.copilot.enable": {
    // Specify which languages you want to enable Copilot for.
    "*": false,
    "dart": true
  },
  "github.copilot.editor.enableAutoCompletions": true
}
```` 

5. (Optional) Disable Copilot in the overall VSCode settings (`settings.json`)

```json
{
  "github.copilot.enable": {
    "*" : false
  },
  "github.copilot.editor.enableAutoCompletions": false
}
```

VSCode - Programming Languages Overview
https://code.visualstudio.com/docs/languages/overview

List of languages supported by VSCode
https://code.visualstudio.com/docs/languages/identifiers


### Xcode
1. install [Copilot for Xcode](https://github.com/intitni/CopilotForXcode) 
2. Follow the README to activate Copilot for Xcode
3. open the Copilot for Xcode app and activate the `Disable Suggestion Feature Globally` in the `Feature tab
4. click on the `Exception List` next to step 3 and add the project path where you want to enable Copilot

## Reference
https://docs.github.com/en/copilot
