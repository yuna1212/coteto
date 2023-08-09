# 사용 방법
### 1. 다운로드
```bash
git clone https://github.com/yuna1212/coteto.git
```
wsl 환경: `master` 브랜치에서 진행  
mac 환경: 브랜치를 `for-macOS`로 변경 후 진행

### 2. 환경 변수 등록
- 아래 예시와 같이, 해당 프로젝트 위치를 .bashrc에 `COTETO_HOME`으로 등록
- 실행 경로 alias 추가 
```bash
export COTETO_HOME="/home/user/coteto"

alias coteto-init="bash $COTETO_HOME/init.sh"
alias coteto-fin="bash $COTETO_HOME/fin.sh"
```
### 3. 알고리즘 파일 관리 
<img src="https://user-images.githubusercontent.com/41707077/216835679-4497fa27-c126-4a27-af16-8b85ed69bd14.gif" width="80%" />

- 문제 풀이 파일 생성: 매개변수는 파일 이름 또는 파일 경로
```bash
coteto-init "평범한 배낭.py"
```
- 문제 풀이 파일에 소요 시간을 기록
    - 소요 시간은 10분 단위로 반올림해서 기록
```bash
coteto-fin "평범한 배낭.py"
```
