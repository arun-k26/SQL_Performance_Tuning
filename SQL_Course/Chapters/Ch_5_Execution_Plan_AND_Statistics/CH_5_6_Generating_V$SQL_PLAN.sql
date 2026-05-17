select * from hr.employees e, hr.retired_employees r where e.employee_id = r.employee_id and e.employee_id = 104;

select * from v$sql;

select * from v$sql where sql_text = 'select * from hr.employees e, hr.retired_employees r where e.employee_id = r.employee_id and e.employee_id = 104';

select /*MY_QUERY*/ * from hr.employees e, hr.retired_employees r where e.employee_id = r.employee_id and e.employee_id = 104;
select * from v$sql where sql_text like '%MY_QUERY%';
select * from v$sql_plan where sql_id = '8fmbmxt26jzmm';
select * from table (dbms_xplan.display_cursor('8fmbmxt26jzmm')); -- This will show easier way to read the explain plan.