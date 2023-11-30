SELECT
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_id) AS total_lead_manager,
    COUNT(DISTINCT sm.senior_manager_id) AS total_senior_manager,
    COUNT(DISTINCT m.manager_id) AS total_manager,
    COUNT(DISTINCT e.employee_id) AS total_employee
FROM
    company c
LEFT JOIN
    lead_manager lm ON c.company_code = lm.company_code
LEFT JOIN
    senior_manager sm ON c.company_code = sm.company_code
LEFT JOIN
    manager m ON c.company_code = m.company_code
LEFT JOIN
    employee e ON c.company_code = e.company_code
GROUP BY
    c.company_code, c.founder;


