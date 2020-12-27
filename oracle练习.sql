------第二章------
------练习1
------1.使用两种方式查询所有员工(EMP)信息
select * from emp;

select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp;

------2.查询(EMP)员工编号、员工姓名、员工职位、员工月薪、工作部门编号。
select empno,ename,job,sal,deptno
from emp;

------练习2
------1.员工转正后，月薪上调20%，请查询出所有员工转正后的月薪。
select ename,sal+(sal*0.2)
from emp;

------2.员工试用期6个月，转正后月薪上调20%，请查询出所有员工工作第一年的年薪所得（不考虑奖金部分,年薪的试用期6个月的月薪+转正后6个月的月薪)
select ename,sal*6+(sal*1.2)*6
from emp;

------练习3
------1.员工试用期6个月，转正后月薪上调20%，请查询出所有员工工作第一年的所有收入（需考虑奖金部分)，要求显示列标题为员工姓名，工资收入，奖金收入，总收入。
select ename "员工名字",sal "工资收入",comm "奖金收入",sal*6+(sal*1.2)*6+comm*12 "总收入"
from emp;

------练习4
------1.员工试用期6个月，转正后月薪上调20%，请查询出所有员工工作第一年的所有收入（需考虑奖金部分)，要求显示格式为:XXX的第一年总收入为XXX。
select ename  || '的第一年总收入为' || (sal*6+(sal*1.2)*6+comm*12) 
from emp;

------2.查询员工表中一共有哪几种岗位类型。
select distinct job
from emp;

------课后作业
------1.分别选择员工表、部门表、薪资等级表中的所有数据。
select * from emp;
select * from dept;
select * from salgrade;



------第三章------
------练习1
------1.查询职位为SALESMAN的员工编号、职位、入职日期。
select empno,job
from emp
where job ='SALESMAN';

------2.查询1985年12月31日之前入职的员工姓名及入职日期。
select ename,hiredate
from emp
where hiredate<to_date('31-12-1985','dd-mm-yyyy');

------3.查询部门编号不在10部门的员工姓名、部门编号。
select ename,deptno
from emp
where deptno <> 10;

------练习2
------1.查询入职日期在82年至85年的员工姓名，入职日期。
select ename,hiredate
from emp
where hiredate between '1-1月-1982' and '31-12月-1985';

------2.查询月薪在3000到5000的员工姓名，月薪。
select ename,sal
from  emp
where sal between 3000 and 5000;

------3.查询部门编号为10或者20的员工姓名，部门编号。
select ename,deptno
from  emp
where deptno in (10,20);

------4.查询经理编号为7902, 7566, 7788的员工姓名，经理编号。
select ename,mgr
from emp
where mgr in (7902,7566,7788);


------练习3
------1.查询员工姓名以W开头的员工姓名。
select ename
from emp
where ename like 'W_%';

------2.查询员工姓名倒数第2个字符为T的员工姓名。
select ename
from emp
where ename like '%_T_';

------3.查询奖金为空的员工姓名，奖金。
select ename,comm
from emp
where comm is null;

------练习4
------1.查询工资超过2000并且职位是MANAGER,或者职位是SALESMAN的员工姓名、职位、工资
select ename,job,sal
from emp
where sal >2000
and job='MANAGER';

------2.查询工资超过2000并且职位是 MANAGER或SALESMAN的员工姓名、职位、工资。
select ename,job,sal
from emp
where sal >2000
and job='MANAGER' or job='SALESMAN';

------3.查询部门在10或者20，并且工资在3000到5000之间的员工姓名、部门、工资。
select ename,deptno,sal
from emp
where sal >=3000
and sal <=5000
and deptno in (10,20);

------4.查询入职日期在81年，并且职位不是SALES开头的员工姓名、入职日期、职位。
select ename,hiredate,job
from emp
where job not like 'SALES_%'
and hiredate < '31-12月-81' and hiredate > '1-1月-81';

------5.查询职位为SALESMAN或MANAGER，部门编号为10或者20，姓名包含A的员工姓名、职位、部门编号。
select ename,job,deptno
from emp
where job ='SALESMAN' or job ='MANAGER'
and deptno in (10,20)
and ename like 'A%';

-----练习5
------1.查询部门在20或30的员工姓名，部门编号，并按照工资升序排序。
select * from emp;
select ename,sal,deptno
from emp
where deptno ='20' or deptno ='30'
order by sal asc;

------2.查询工资在2000-3000之间，部门不在10号的员工姓名，部门编号，工资，并按照部门升序，工资降序排序。
select ename,deptno,sal 
from emp 
where sal >=2000 and sal <=3000 and deptno <>10
order by sal asc;

------3.查询入职日期在82年至83年之间，职位以SALES或者MAN开头的员工姓名，入职日期，职位，并按照入职日期降序排序。
select ename,hiredate,job 
from emp
where hiredate>to_date('1-1-82','dd-MM-yy') and hiredate<to_date('31-12-8','dd-MM-yy' )
and job like  'MAN_%'  or job like 'SALES_%'
order by hiredate asc,sal desc;


------课后作业
------1.查询入职时间在1982-7-9之后，并且不从事SALESMAN工作的员工姓名、入职时间、职位。
select ename,hiredate,job
from emp
where hiredate>to_date('9-7-1982','dd-MM-yyyy')
and job<>'SALESMAN';

------2.查询员工姓名的第三个字母是a的员工姓名。
select ename
from emp
where ename like '__A%'

------3.查询除了10、20号部门以外的员工姓名、部门编号。
select ename,deptno
from emp
where deptno not in(10,20);

------4.查询部门号为30号员工的信息，先按工资降序排序，再按姓名升序排序
select * from emp
where deptno = 30
order by sal desc,ename asc;

------5.查询没有上级的员工(经理号为空)的员工姓名。
select * from emp
where mgr is null;

------6.查询工资大于等于4500并且部门为10或者20的员工的姓名\工资、部门编号。
select ename,sal,deptno
from emp
where sal >= 4500 and (deptno in (10,20));




------第四章------
------练习1
------1.写一个查询,用首字母大写，其它字母小写显示雇员的 ename，显示名字的长度，并给每列一个适当的标签，条件是满足所有雇员名字的开始字母是J、A 或 M 的雇员，并对查询结果按雇员的ename升序排序。（提示：使用initcap、length、substr）
select INITCAP(ename) 员工名字,LENGTH(ename) 名字长度
from emp
where substr(ename,1,1) in('J','A','M')
order by ename;

------练习2
------1.查询员工姓名中中包含大写或小写字母A的员工姓名。
select ename,instr(ename,'A')
from emp

------2.查询部门编号为10或20，入职日期在81年5月1日之后，并且姓名中包含大写字母A的员工姓名，员工姓名长度（提示，要求使用INSTR函数，不能使用like进行判断)
select ename,length(ename)
from emp  
where deptno in (10,20)
and  instr(ename,'A')>0
or  instr(ename,'a') >0
and hiredate>to_date('81-5-1','yy-MM-dd');


------3.查询每个职工的编号,姓名，工资
------要求将查询到的数据按照一定的格式合并成一个字符串.
------前10位：编号,不足部分用*填充,左对齐
------中间10位：姓名，不足部分用*填充,左对齐
------后10位：工资，不足部分用*填充,右对齐

select concat(concat(rpad(empno,10,'*'),rpad(ename,10,'*')),lpad(sal,10,'*'))
from emp;

------练习3
------1.写一个查询，分别计算100.456 四舍五入到小数点后第2位，第1位，整数位的值。
select round(100.456,2) 小数点后第2位,round(100.456,1) 小数点后第1位
from dual

------2.写一个查询，分别计算100.456 从小数点后第2位，第1位，整数位截断的值。
select trunc(100.456,2) 小数点后第2位,trunc(100.456,1) 小数点后第1位
from dual

------练习4
------1.查询每个员工截止到现在一共入职多少天？
select * from emp
select ename, trunc((sysdate-hiredate),0) 入职天数
from emp
 
------2.当前日期为2015年，指定日期格式为DD-MON-RR,指定日期为01-1月-01，该日期实际所代表的日期为？
select to_date('01-1月-01','DD-MON-RR') 日期为
from dual;

------3.当前日期为2015年，指定日期格式为DD-MON-RR,指定日期为01-1月-95，该日期实际所代表的日期为？
select to_date('01-1月-95','DD-MON-RR') 日期为
from dual;

------4.当前日期为1998年，指定日期格式为DD-MON-RR,指定日期为01-1月-01，该日期实际所代表的日期为？
select to_date('01-1月-01','DD-MON-RR') 日期为
from dual;

------5.当前日期为1998年，指定日期格式为DD-MON-RR,指定日期为01-1月-95，该日期实际所代表的日期为？
select to_date('01-1月-95','DD-MON-RR') 日期为
from dual;

------6.当前日期为2015年，指定日期格式为DD-MON-YY,指定日期为 01-1月-01，该日期实际所代表的日期为？
select to_date('01-1月-01','DD-MON-RR') 日期为
from dual;

------7.当前日期为1998年，指定日期格式为DD-MON-YY,指定日期为01-1月-95，该日期实际所代表的日期为？
select to_date('01-1月-95','DD-MON-RR') 日期为
from dual;

------练习5
------1.查询服务器当前时间
select sysdate
from dual;
select * from emp

------2.查询部门10,20的员工截止到2000年1月1日，工作了多少个月，入职的月份。(提示：使用months_between,extract)
select ename,hiredate,deptno,months_between('1-1月-2000',hiredate),extract(month from hiredate)
from emp
where deptno in(10,20);

------3.如果员工试用期6个月，查询职位不是MANAGER的员工姓名，入职日期，转正日期，入职日期后的第一个星期一,入职当月的最后一天日期。（提示：使用add_months,next_day,last_day)
select ename,hiredate,
add_months(hiredate,6), 
next_day(hiredate,'星期一'),
last_day(hiredate)
from emp
where job <>'MANAGER';


------练习6
------1.显示服务器系统当前时间，格式为2007-10-12 17:11:11(提示：使用to_char函数)
select to_char(sysdate,'YYYY-MM-DD HH:MM:SS')
from dual;

------2.显示ename、hiredate 和 雇员开始工作日是星期几，列标签DAY(提示：使用to_char函数)
select ename,hiredate,to_char(hiredate,'DAY') 星期几
from emp

------3.查询员工姓名，工资，格式化的工资（￥999,999.99） (提示：使用to_char函数)
select ename 员工姓名,sal 工资,to_char(sal,'U999,999.99') 格式化的工资 
from emp;

------4.把字符串2015-3月-18 13:13:13 转换成日期格式，并计算和系统当前时间间隔多少天。 (提示：使用to_date函数)
select to_date('2015-3月-18 13:13:13','yyyy-mm"月"-dd hh24:mi:ss'),
round(sysdate-to_date('2015-3月-18 13:13:13','yyyy-mm"月"-dd hh24:mi:ss'),0)
from dual;

------课后作业
------1.计算2000年1月1日到现在有多少月，多少周（四舍五入）。
select MONTHS_BETWEEN(sysdate,'01-1月-2000') months,
round(round(sysdate- to_date('2000-01-01','YYYY-MM-DD'))/7) week
from dual

------2.查询员工ENAME的第三个字母是A的员工的信息(使用2个函数)。
select * from emp where substr(ename,3,1)='A';
select * from emp where instr(ename,'A',3)=3;

------3.使用trim函数将字符串‘hello’、‘  Hello ’、‘bllb’、‘ hello    ’分别处理得到下列字符串ello、Hello、ll、hello。
select trim(leading 'h' from 'hello') ,trim(' Hello '),
trim (both'l'  from 'hello'),trim(' hello ')
from dual;

------4.将员工工资按如下格式显示：123,234.00 RMB 。
select to_char('123234.00','000,999.00')|| 'RMB'
from dual

------5.查询员工的姓名及其经理编号，要求对于没有经理的显示“No Manager”字符串。
select ename,nvl(to_char(mgr) , 'No Manager')
from emp;

------6.将员工的参加工作日期按如下格式显示：月份/年份。 
select ename,hiredate,to_char(hiredate,'HH/RR')
from emp;

------7.在员工表中查询出员工的工资，并计算应交税款：如果工资小于1000,税率为0，如果工资大于等于1000并小于2000，税率为10％，如果工资大于等于2000并小于3000，税率为15％，如果工资大于等于3000，税率为20％。
select ename,sal,lpad(sal,15,'$'),case
when sal > 0 and sal <1000 THEN sal * 0
when sal > =1000 and sal <2000 THEN sal * 0.1
when sal >= 2000 and sal <3000 THEN sal * 0.15
when sal >= 3000  THEN sal * 0.2
else 0
end 应交税款
from emp;

------8.创建一个查询显示所有雇员的 ename和 sal。格式化sal为 15 个字符长度，用 $ 左填充，列标签 SALARY。
select ename,lpad(sal,15,'$')
from emp;
