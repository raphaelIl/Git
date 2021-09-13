## stash 사용

작업을 하다보면 branch를 스위칭 해야 할 일이 생기는데 아직 커밋을 안했기에 git은 허용하지 않는다.

그렇다고 커밋을 하자니 아직 최소한의 커밋 조건에 안된다고 생각이 들때 사용하는게 stash이다.

> 완료하지 않은 작업 상태를 커밋하지 않고 나중에 다시 복원하여 작업이 가능하다.

<br>

### Ref

- https://git-scm.com/book/ko/v2/Git-%EB%8F%84%EA%B5%AC-Stashing%EA%B3%BC-Cleaning
- https://git-scm.com/docs/git-stash

<br>

### stash 적용

```
# 기본적으론 추적중인 파일만 stash에 저장한다.
git stash

# 추적중이지 않은 파일도 저장하고 싶다면
git stash -u (--include-untracked)

# alias name
git stash save {save_name}
```

<br>

### stash 복원 01

복원 후에 바로 커밋할 예정이라면

```
git stash apply

# specify
git stash apply stash@{hash_number}

# 복원 후 다시 staged 상태로 적용한다
git stash apply --index
```

<br>

### stash 복원 02

복원 후 새로운 branch를 생성해서 지속적으로 작업을 할 예정이라면  
Stash 할 당시의 커밋을 Checkout 한 후 새로운 브랜치를 만들고 여기에 적용한다.  
이 모든 것이 성공하면 Stash를 삭제한다.

```
git stash branch {branch_name}
```

<br>

### stash 제거

```
# 가장 최근에 저장한 stash 삭제
git stash drop

# specify
git stash drop stash@{hash_number}
```

<br>

### stash 모든 기록 제거

```
git stash claer
```
