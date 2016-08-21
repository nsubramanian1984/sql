/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
with emp_cte(ec, cc)
AS
(select employee_code,company_code from employee group by company_code,employee_code),
empCountTable(emp_count, com_code)
as
(select count(ec), cc from emp_cte group by emp_cte.cc),
mgr_cte(cc, mc)
AS
(select company_code,manager_code from manager group by company_code,manager_code),
mgrCountTable(mgr_count, com_code)
as
(select count(mc), cc from mgr_cte group by mgr_cte.cc),
smgr_cte(cc, smc)
AS
(select company_code,senior_manager_code from senior_manager group by company_code,senior_manager_code),
smgrCountTable(smgr_count, com_code)
as
(select count(smc),cc from smgr_cte group by smgr_cte.cc),
lmgr_cte(cc, lmc)
AS
(select company_code,lead_manager_code from lead_manager group by company_code,lead_manager_code),
lmgrCountTable(lmgr_count, com_code)
as
(select count(lmc),cc from lmgr_cte group by lmgr_cte.cc)


--select * from empCountTable;
select empCountTable.com_code, founder, lmgr_count, smgr_count, mgr_count,emp_count  from company inner join empCountTable on empCountTable.com_code = company.company_code inner join mgrCountTable on mgrCountTable.com_code = company.company_code inner join smgrCountTable on smgrCountTable.com_code = company.company_code inner join lmgrCountTable on lmgrCountTable.com_code = company.company_code order by company.company_code;



