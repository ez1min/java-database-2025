-- Procedure 에서 info_emp 만들어야함
-- info_emp 프로시저 실행

DECLARE
	v_empno 	emp.empno%TYPE;
	o_ename     emp.ename%TYPE;
	o_sal 		  emp.sal%TYPE;
BEGIN
		v_empno := 7900;

		info_emp(v_empno, o_ename, o_sal); -- 저장 프로시저 실행 후 o_ename, o_sal로 값을 돌려 받음
		DBMS_OUTPUT.PUT_LINE(v_empno || '는 이름은 ' || o_ename || '이고, 급여는 ' || o_sal);

	
END;
