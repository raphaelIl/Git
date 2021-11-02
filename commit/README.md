## Commit에 관해서

### git add 취소
```sh
# 모든 파일을 staged로 변경한다.
git add *

# cancel add
# 파일을 지정하지 않으면 add한 모든 파일을 Unstaged로 변경한다.
git reset HEAD (specific_file)
```

<br>

### git commit 취소
origin에 push하기전 커밋을 취소 한다면
reset 옵션
* soft : index 보존(add한 상태, staged 상태), 워킹 디렉터리의 파일 보존. 즉 모두 보존.
* mixed **(기본 옵션)**: index 취소(add하기 전 상태, unstaged 상태), 워킹 디렉터리의 파일 보존 
* hard : index 취소(add하기 전 상태, unstaged 상태), 워킹 디렉터리의 파일 삭제. 즉 모두 취소.
```sh
# commit을 취소하고 해당 파일들은 staged 상태로 워킹 디렉터리에 보존
$ git reset --soft HEAD^

# commit을 취소하고 해당 파일들은 unstaged 상태로 워킹 디렉터리에 보존
$ git reset --mixed HEAD^ # Default
$ git reset HEAD^ # 위와 동일
$ git reset HEAD~2 # 마지막 2개의 commit을 취소

# commit을 취소하고 해당 파일들은 unstaged 상태로 워킹 디렉터리에서 삭제
# working directory를 origin의 마지막 commit 상태로 돌린다. (작업했던 내용 제거)
$ git reset --hard HEAD^
```

<br>

### git commit message 취소
```
$ git commit --amend
```

<br>

### git push 취소
실은 push를 취소한다는건 없다.  
local의 내용을 origin에 강제로 덮어쓴다가 적절한 표현이다.

원하는 시점 또는 충돌난 commit으로 이동
```sh
# Reflog: 지난 동안 가리켰던 커밋 목록 확인
$ git reflog 
or 
$ git log -g

# 원하는 시점으로 변경
$ git reset HEAD@{number} 
or
$ git reset [commit_id]

# 이후 origin에 강제로 push
$ git push origin [branch_name] -f
```

<br>

### untracked file 삭제
git clean은 추적중이지 않은 파일만 지우는게 기본이다.  
.gitignore에 명시한 무시된 파일은 지우지 않는다.
```sh
$ git clean -f        # 파일만 삭제
$ git clean -f -d     # 디렉터리까지 삭제
$ git clean -f -d -x  # 무시된 파일까지 삭제
$ git clean -n -d     # 적용전 어떤 파일이 지워질지 리스트업 (-n option)
```
