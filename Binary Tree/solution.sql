
--select N, 'Root' as out from BST where P is NULL
--select N, 'Inner' as out from BST where N in (select distinct(P) from BST where P is not NULL) and P is not NULL;
--select N, 'Leaf' as out from BST where N not in (select distinct(P) from BST where P is not NULL) and P is not NULL;

select
    N,
    case
        when P is NULL THEN 'Root'
        when N in (select distinct(P) from BST where P is not NULL) THEN 'Inner'
        when N not in (select distinct(P) from BST where P is not NULL) THEN 'Leaf'
    END
FROM BST order by N Asc;
