# java-database-2025
Java 개발자 과정 Database 리포지토리  

## 1일차

- Github Desktop 설치
    - https://desktop.github.com/download/ 다운로드
    - 기존 Github 계정으로 Signin with Browser
    - Git 명령어 없이 사용가능

- Database(DB) 개요
    - 데이터를 저장하는 장소
    - 데이터를 관리하는 프로그램 DBMS(Data Base Management System)
    - 가장 유명한 것 Oracle 
    - 사용자는 SQL로 요청, DB서버는 처리결과를 테이블로 리턴
    - SQL 배우는 것!

- Oracle 설치
    1. Powershell 오픈
    2. pull 내려받기
        ```shell
        >docker pull doctorkirk/oracle-19c
        Using default tag: latest
        latest: Pulling from doctorkirk/oracle-19c
        198bff5413e1: Download complete
        e8b1c0b24c00: Download complete
        30ed1731acd1: Download complete
        1afbeedfc34a: Downloading [========>                                           ]  801.1MB/5.027GB
        8bfefd996a95: Download complete
        29415c7d058f: Download complete
        ```

    3. 다운로드 이미지 확인
        ```shell
        PS C:\Users\Admin> docker image ls
        REPOSITORY                 TAG       IMAGE ID       CREATED         SIZE
        ...
        doctorkirk/oracle-19c      latest    5816fe124f2a   3 years ago     16.8GB
        ```

    4. 도커 컨테이너 실행
        ```shell
       >docker run --name oracle19c -p 1522:1522 -e ORACLE_SID=ORCL -e ORACLE_PWD=12345 -e ORACLE_CHARACTERSET=KO16MSWIN949 --restart=always doctorkirk/oracle-19c
       ```
       -1522 - 오라클 기본포트

- DBeaver 툴 설치
    -https://dbeaver.io/download/
    5. 도커 실행확인
        - Docker Desktop > Containers 확인
    
    6. Powershell 오픈
        ```shell
        > docker exec -it oracle19c bash
        [oracle@... ~]$ sqlplus / as sysdba
        SQL > 
        ```
    7. DBeaver 접속
        - Connection > Select your DB > Oracle 선택
        

    
- DML, DDL, DCL
    - 언어의 특징을 가짐
        -프로그램이 언어와 차이? - 어떻게(How)
        -SQL - 무엇(What)

    - SQL 구성요소 3가지
    - DDL(Data Definition Lang) - 데이터베이스 생성, 테이블 생성, 객체 생성, 수정, 삭제
        - CREATE, ALTER, DROP ...

    - DCL(Data Control Lang) - 사용자의 권한을 부여, 해제, 트랜젝션 시작, 종료
       - GRANT, REVOKE, BEGIN TRANS, COMMIT, ROLLBACK  

    - DML(Data Manafulation Lang) -데이터 조작언어(핵심!), 데이터 삽입, 조회, 수정, 삭제
        - INSERT, SELECT, UPDATE, DELETE
    - SELECT 기본

## 2일차
