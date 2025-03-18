CREATE OR REPLACE FUNCTION SAMPLEUSER.MAX_SAL
(
    v_deptno emp.deptno%TYPE
)
RETURN NUMBER
IS
    max_sal emp.sal%TYPE;
BEGIN
    -- 최고 급여 조회
    SELECT MAX(sal) INTO max_sal
    FROM emp
    WHERE deptno = v_deptno;

    -- 반환
    RETURN max_sal;   -- 빼먹으면 안됨
END MAX_SAL;