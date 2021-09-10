## IDE에서 주로 사용하는 keymap 정리

vscode keymap을 기반으로 커스텀해서 자주 사용 중인 키맵을 정리한다

<br>

### MAC(Window)

대입해보면 거의 다 된다.

| Mac     | Window |
| ------- | ------ |
| command | ctrl   |
| option  | alt    |

### Code

- ctrl + space : Basic Code Completion
- ctrl + shift + space : Smart Code Completion
  - (Type-matching: filters the list of methodsand variables by expected type)
- ctrl + shift + enter : Complete statement  
  <br>
- **cmd(ctrl) + option(alt) + T : Surround with ...**

  - 다음으로 코드 감싸기 (ifElse, tryCatch, for, synchronized, ...)

  <br>

- cmd + / : Comment with line comment
- cmd + shift + / : Comment with block comment
- ` : Move caret to next word
- shift + ` : Move caret to previous word

  <br>

- cmd(ctrl) + option(alt) + I : Auto-Indent Lines
- cmd(ctrl) + option(alt) + B: Go to class
- cmd(ctrl) + option(alt) + B: Go to File

  - 일부러 class or file로 이동하게끔 2개 커맨드가 같음

  <br>

- cmd(ctrl) + P: view parameter info

- ctrl + enter: code generate (Getters, Setters, Constructors, HashCode/equals, toString)

<br>

### Find

- cmd + B : Go to Declaration or Usages

  <br>

- cmd(ctrl) + D : Add Selection for Next Occurrence
- cmd(ctrl) + shift + D : Select All Occurrences
- cmd(ctrl) + G : Find Next / Move to Next Occurrence
- cmd(ctrl) + shift + G : Find Previous / Move to Next Occurrence

<br>

### Editor Actions

- cmd(ctrl) + `+` : ,Increase Font Size
- cmd(ctrl) + `-` : Decrease Font Size