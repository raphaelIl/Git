## IDE에서 주로 사용하는 keymap 정리

Git 관련 내용은 아니지만 내가 보기위해  
vscode keymap을 기반으로 커스텀해서 자주 사용 중인 키맵을 정리한다

<br>

### MAC(Window)

대입해보면 거의 다 된다.

| OS   | Mac     | Window |
|------|---------|--------|
| key1 | command | ctrl   |
| key2 | option  | alt    |

### Code

- ctrl + space : Basic Code Completion
- ctrl + shift + space : Smart Code Completion
  - (Type-matching: filters the list of methodsand variables by expected type)
- ctrl + shift + enter : Complete statement  
- **cmd(ctrl) + option(alt) + T : Surround with ...**

  - 다음으로 코드 감싸기 (ifElse, tryCatch, for, synchronized, ...)

  <br>

- cmd(ctrl) + / : Comment with line comment
- cmd(ctrl) + option(alt) + / : Comment with block comment  
  <br>

- option(alt) + <- : Move caret to Previous(next ->) word
- option(alt) + cmd(ctrl) + <- : Move caret to Previous(next ->) word in Different "CamelHumps" Mode
- ctrl + P: view parameter info
- ctrl + enter: code generate (Getters, Setters, Constructors, HashCode/equals, toString)
  <br>

- ctrl + alt + I : Auto-Indent Lines
- _**cmd(ctrl) + option(alt) + B : Go to class, Go to File, Go to Symbol, Go to Database Object**_
  - 의도함 class, file, symbol, DTO로 이동하게끔 4개 커맨드가 같음

<br>

### Find

- **_cmd(ctrl) + B : Go to Declaration or Usages, Go to Implementation, Go to Type Declaration_**
- cmd(ctrl) + D : Add Selection for Next Occurrence
- cmd(ctrl) + shift + D : Select All Occurrences
- cmd(ctrl) + G : Find Next / Move to Next Occurrence
- cmd(ctrl) + shift + G : Find Previous / Move to Next Occurrence


### Git

- cmd(ctrl) + k, cmd(ctrl) + k : commit
- cmd(ctrl) + k, cmd(ctrl) + p : push
- cmd(ctrl) + p, cmd(ctrl) + p : pull

### Editor Actions

- cmd(ctrl) + `+(=)` : Increase Font Size
- cmd(ctrl) + `-(-)` : Decrease Font Size

### Github Copilot
(vscode도 동일하게 맞춤, keybinding에서)

- option(alt) + `[` : Copilot Show Previous Completions
- option(alt) + `]` : Copilot Show Next Completions
- option(alt) + `enter` : Open Github Copilot (선택지 10개정도 보여줌)
- option(alt) + `\` : Copilot Show Completions (ctrl + space도 추가)
