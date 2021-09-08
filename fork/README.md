## fork_sync에 관해서...

### Glossary

- upstream: main(root, forked) repository
- origin: fork한 나의 repository

<br>

## 요구 사항

지금은 알고 있던 git flow가 아닌 fork를 사용하여 upstream를 보호하는 정책을 사용하고 있다.  
fork한 프로젝트에서 이미 커밋을 하였는데 upstream에서 변경사항이 생겼다면 어떻게 적용할 것인가?

upstream의 커밋 히스토리와 나의 변경사항을 분리해서 git graph로 관리하고 싶었다.

> [Update your project on pyCharm](https://www.jetbrains.com/help/pycharm/2021.2/sync-with-a-remote-repository.html#update)

그러나 내가 진행한 방법은 다음과 같았다. (실수)

- `Merge the incoming changes into the current branch`

원하는 모습은 `rebase`를 사용하는게 맞았다.

- `Rebase the current branch on top of the incoming changes`
  > Rebase를 하든지, Merge를 하든지 최종 결과물은 같고 커밋 히스토리만 다르다는 것이 중요하다.  
  > Rebase 의 경우는 브랜치의 변경사항을 순서대로 다른 브랜치에 적용하면서 합치고  
  > Merge 의 경우는 두 브랜치의 최종결과만을 가지고 합친다.

<br>

## Git Flow

- https://guides.github.com/introduction/flow/
- https://techblog.woowahan.com/2553/
  <br>

## Rebase가 뭔가요?

- https://git-scm.com/book/ko/v2/Git-%EB%B8%8C%EB%9E%9C%EC%B9%98-Rebase-%ED%95%98%EA%B8%B0

<br>

Fork 이후 remote 상태 확인

```sh
$ git remote -v
origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
```

<br>

sync하고 싶은 원본 repository를 upstream이라는 이름으로 추가한다.

```sh
$ git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git
```

<br>

remote 상태 확인

```sh
$ git remote -v
origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (fetch)
upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (push)
```

<br>

upstream의 변경사항을 받아온다

```sh
$ git pull --rebase

or

$ git fetch upstream master   # upstream 변경 사항 가져옴
$ git rebase upstream/master  # rebase: local_master가 fetch로 가져온 upstream_master로 base를 변경함
```

<br>

#### origin에 변경사항을 push하여 적용한다

Rebase를 통해 현재 로컬의 Master 브랜치는 원본 upstream Master 브랜치로 변경이 되어있는 상태입니다.  
이제 Fork한 원격 저장소도 원본 upstream Master 브랜치로 변경해야 합니다.

```sh
$ git push origin master -f
```

---

### upstream의 변경사항이 확인되면

IDE에서 `Git - Project Update - Rebase the current branch on top of the incoming changes` 하면 한방에 해결되는듯
