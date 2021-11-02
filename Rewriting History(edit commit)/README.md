## [7.6 Git 도구 - 히스토리 단장하기](https://git-scm.com/book/ko/v2/Git-%EB%8F%84%EA%B5%AC-%ED%9E%88%EC%8A%A4%ED%86%A0%EB%A6%AC-%EB%8B%A8%EC%9E%A5%ED%95%98%EA%B8%B0)

당연히 origin에 올라간 커밋을 변경할때는 force push 할 각오를 해야한다.  
앵간하면 로컬에있는 커밋만을 변경하길 바란다.  
`git log --pretty=oneline`로 이쁘게 로그를 확인할 수 있다.  
<br>

**_기본 컨셉: rebase interactive editor를 열고 이후 커맨드를 사용해서 조작한다._**

<br>

### 마지막 커밋 메시지 수정(amend)
```
git commit --amend
```

<br>

### [커밋 메시지 여러개 수정](https://git-scm.com/book/ko/v2/Git-%EB%8F%84%EA%B5%AC-%ED%9E%88%EC%8A%A4%ED%86%A0%EB%A6%AC-%EB%8B%A8%EC%9E%A5%ED%95%98%EA%B8%B0#_changing_multiple)(rebase + amend)
~~쓸 일이 있을까?~~

head로부터 3개의 커밋을 합치고 싶다면 rebase로 interactive editor를 연다.
```sh
git rebase -i HEAD~3
```

**edit** 으로 변경 후 amend사용하면됨.
```
edit f7f3f6d changed my name a bit
pick 310154e updated README formatting and added blame
pick a5f4a0d added cat-file
```

커밋 삭제도 별거 없다.  
위에 상황에서 제거할 대상을 없애고 editor를 종료하면 된다.

<br>

### 커밋 합치기(rebase + squash)
head로부터 3개의 커밋을 합치고 싶다면 rebase로 interactive editor를 연다.
```sh
git rebase -i HEAD~3
```
<br>

맨 앞 method를 **pick || squash**로 변경
```
pick f7f3f6d changed my name a bit
squash 310154e updated README formatting and added blame
squash a5f4a0d added cat-file
```

<br>

### [filter-branch는 포크레인](https://git-scm.com/book/ko/v2/Git-%EB%8F%84%EA%B5%AC-%ED%9E%88%EC%8A%A4%ED%86%A0%EB%A6%AC-%EB%8B%A8%EC%9E%A5%ED%95%98%EA%B8%B0#_filter_branch%EB%8A%94_%ED%8F%AC%ED%81%AC%EB%A0%88%EC%9D%B8)
한방에 정리할때 사용
