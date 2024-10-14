-- создание таблицы Сотрудник
create table employee(
    employee_id int(8) primary key,
    last_name varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    middle_name varchar(255),
    role varchar(50) NOT NULL,
    e_mail varchar(255) NOT NULL,
    phone_number varchar(255) NOT NULL,
    location varchar(255) NOT NULL
);
-- создание таблицы Проект
create table project(
    project_id int(8) primary key,
    name varchar(255) NOT NULL,
    description text,
    customer varchar(255) NOT NULL,
    date_start date,
    date_end date,
    technology text,
    manager_id int(8) NOT NULL,
    foreign key (manager_id) references employee(employee_id)
);

-- создание таблицы project
create table employee_project(
    employee_project_id int(8) primary key,
    employee_id int(8) NOT NULL,
    project_id int(8) NOT NULL,
    foreign key (employee_id) references employee(employee_id),
    foreign key (project_id) references project(project_id)
);

-- создание таблицы Карточка проекта
create table card_project (
    employee_id int(8) primary key,
    name_project varchar(255) NOT NULL,
    type_project varchar(255) NOT NULL,
    customer varchar(255) NOT NULL,
    functional_direction varchar(150) NOT NULL,
    subject_domain text,
    description text,
    tasks text,
    project_stage varchar(50) NOT NULL,
    date_end date,
    technology text,
    number_of_stakeholders integer,
    team varchar(255),
    location varchar(255) NOT NULL,
    documentation varchar(50) NOT NULL,
    project_id int(8) NOT NULL,
    foreign key (employee_id) references employee(employee_id),
    foreign key (project_id) references project(project_id)
);
