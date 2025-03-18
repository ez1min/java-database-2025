CREATE OR REPLACE FUNCTION SAMPLEUSER.GET_AREA(
    v_deptno emp2.deptno%TYPE
) RETURN VARCHAR2  --  FUNCTION에서만 사용 가능
IS
    darea  dept2.area%TYPE;
BEGIN
    -- 부서 이름 조회
    SELECT area INTO darea 
    FROM dept2
    WHERE dcode = v_deptno;

    --  반환
    RETURN darea;	-- 빼먹으면 안됨
END GET_AREA;