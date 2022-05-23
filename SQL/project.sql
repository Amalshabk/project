conn system/password
create user school identified by school
grant connect,resource to school
conn school/school

create table teacher(
    idTeach number(6) constraint teach_idTeach_pk primary key,
    fnameTeach varchar2(20) constraint teach_fnameTeach_uni unique not null,
    lnameTeach varchar2(20) constraint teach_lnameTeach_uni unique not null,
    telnoTeach varchar2(10) not null,
    addressTeach varchar2(50) not null)
    /
create table student(
    idStu number(6) constraint stu_idStu_pk primary key,
    fnameStu varchar2(20) constraint stu_fnameStu_uni unique not null,
    lnameStu varchar2(20) constraint stu_lnameStu_uni unique not null,
    telnoStu varchar2(10) not null,
    addressStu varchar2(50) not null)
    /
create table class(
    idClass number(6) constraint class_idClass_pk primary key,
    nameClass varchar2(20) not null,
    idStu char(4) references student,
    idTeach char(4) references teacher)
    /
SQL> create sequence seq_teacher
      start with 1000
      increment by 1 
      maxvalue 10000
      nocycle
      cache 10;
    /
    create sequence seq_student
      start with 1000
      increment by 1 
      maxvalue 10000
      nocycle
      cache 10;
    /
    create sequence seq_class
      start with 100
      increment by 1 
      maxvalue 1000
      nocycle
      cache 10;
    /
    CREATE MATERIALIZED VIEW teacher
    refresh complete
    on commit
    AS
    SELECT attributes 
    FROM teacher;
    /
    CREATE MATERIALIZED VIEW student
    refresh complete
    on commit
    AS
    SELECT attributes 
    FROM student;
    /
    CREATE MATERIALIZED VIEW class
    refresh complete
    on commit
    AS
    SELECT attributes 
    FROM class;
    /
    insert into teacher values(seq_teacher.nextval,'&first_name','&last_name','&telephone_number','&address');
    insert into student values(seq_student1.nextval,'&first_name','&last_name','&address','&telephone_number');
    insert into class values(seq_class.nextval,'&class_name',1010,1001);
    insert into class values(1007,1002,seq_class.nextval,'&class_name');
    insert into class values(1008,1003,seq_class.nextval,'&class_name');
    insert into class values(1009,10007,seq_class.nextval,'&class_name');
    /
    create or replace procedure teacher_update(
    pidTech teacher.idTech%type,
    pfnameTech teacher.fnameTech%type,
    plnameTech teacher.lnameTech%type,
    ptelnoTech teacher.telnoTech%type,
    paddressTech teacher.addressTech%type)
    as
    begin
    update teacher
    set fnameTech=pfnameTech, lnameTech=plnameTech,
    telnoTech=ptelnoTech, addressTech=paddressTech
    where idTech=pidTech;
    commit;
    dbms_output.put_line('Record update successfully...!');
    end;
    /
    create or replace procedure teacher_insert(
    pfnameTech teacher.fnameTech%type,
    plnameTech teacher.lnameTech%type,
    ptelnoTech teacher.telnoTech%type,
    paddressTech teacher.addressTech%type)
    as
    begin
    insert into teacher(idTech,fnameTech,lnameTech,telnoTech,addressTech)
    values(seq_teacher.nextval,pfnameTech,plnameTech,ptelnoTech,paddressTech);
    commit;
    end;
    /
   create or replace procedure teacher_delete(
   pidTech teacher.idTech%type)
   as
   begin
   delete from teacher
   where idTech=pidTech;
   dbms_output.put_line('Record deleted successfully...!');
   end;
   /
   create or replace function getAllData_teacher(pidTech teacher.idTech%type)
   return varchar2
   as
  pfnameTech teacher.fnameTech%type;
  plnameTech teacher.lnameTech%type;
  ptelnoTech teacher.telnoTech%type;
  paddressTech teacher.addressTech%type;
  res varchar2(300);
  begin
  select fnameTech,lnameTech,telnoTech,addressTech into pfnameTech,plnameTech,ptelnoTech,paddressTech 
  from teacher
  where idTech=pidTech;
  res := 'first Name ' || pfnameTech || ' last name '|| plnameTech || ' telephone number ' || ptelnoTech || ' address ' || paddressTech ;
  return res;
  end;
  /