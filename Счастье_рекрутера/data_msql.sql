-- создание таблицы Сотрудник
create table if not exists employee(
    employee_id int(8) AUTO_INCREMENT primary key,
    
    last_name varchar(255) NOT NULL,
    first_name varchar(255) NOT NULL,
    middle_name varchar(255),
    role varchar(50) NOT NULL,
    email varchar(255) NOT NULL, -- такой нейм тоже используется и он читабельнее 
    phone_number varchar(255) NOT NULL,
    location varchar(255) NOT NULL
);
-- создание таблицы Проект
create table if not exists project(
    project_id int(8) AUTO_INCREMENT  primary key,
    
    [name] varchar(255) NOT NULL,
    [description] text,
    customer varchar(255) NOT NULL,
    date_start date,
    date_end date,
    technology text,
    manager_id int(8) NOT NULL,
    
    foreign key (manager_id) references employee(employee_id)
);

-- создание таблицы project
create table if not exists employee_project(
    -- employee_project_id int(8) primary key, не обязательно, тк ты в таблице card_project не ссылаешь работника на проект
    employee_id int(8) NOT NULL,
    project_id int(8) NOT NULL,
    
    foreign key (employee_id) references employee(employee_id),
    foreign key (project_id) references project(project_id)
);

-- создание таблицы Карточка проекта
create table if not exists card_project (
    card_id int(8) AUTO_INCREMENT primary key, -- лучше сделать отдельный филд под id 
    employee_id int(8) NOT NULL, -- а вот на это наоборот ссылкаться на сотрудника
    project_id int(8) NOT NULL,
    
    name_project varchar(255) NOT NULL,
    type_project varchar(255) NOT NULL,
    customer varchar(255) NOT NULL,
    functional_direction varchar(150) NOT NULL,
    subject_domain text,
    [description] text,
    tasks text,
    project_stage varchar(50) NOT NULL,
    date_end date,
    technology text,
    number_of_stakeholders integer,
    team varchar(255),
    [location] varchar(255) NOT NULL,
    documentation varchar(50) NOT NULL,
    foreign key (employee_id) references employee(employee_id),
    foreign key (project_id) references project(project_id)
);

-- Вставка данных в таблицу employee
insert into employee (last_name, first_name, middle_name, role, email, phone_number, location) values
('Ivanov', 'Ivan', 'Ivanovich', 'Manager', 'ivanov@mail.com', '+1234567890', 'Moscow'),
('Petrov', 'Petr', 'Petrovich', 'Developer', 'petrov@mail.com', '+1234567891', 'Saint Petersburg'),
('Sidorov', 'Sidr', 'Sidorovich', 'Designer', 'sidorov@mail.com', '+1234567892', 'Kazan'),
('Smirnov', 'Alexey', 'Alexeevich', 'Tester', 'smirnov@mail.com', '+1234567893', 'Novosibirsk'),
('Fedorov', 'Fedor', 'Fedorovich', 'Analyst', 'fedorov@mail.com', '+1234567894', 'Yekaterinburg');

-- Вставка данных в таблицу project
insert into project (name, description, customer, date_start, date_end, technology, manager_id) values
('Project A', 'Development of system A', 'Customer 1', '2024-01-01', '2024-06-01', 'Python, Django', 1),
('Project B', 'Implementation of project B', 'Customer 2', '2024-02-01', '2024-07-01', 'Java, Spring', 1),
('Project C', 'Support of project C', 'Customer 3', '2024-03-01', '2024-08-01', 'JavaScript, React', 2),
('Project D', 'Upgrade of system D', 'Customer 4', '2024-04-01', '2024-09-01', 'PHP, Laravel', 3),
('Project E', 'Development of product E', 'Customer 5', '2024-05-01', '2024-10-01', 'Ruby on Rails', 1);

-- Вставка данных в таблицу employee_project
insert into employee_project (employee_id, project_id) values
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4);

-- Вставка данных в таблицу card_project
insert into card_project (employee_id, project_id, name_project, type_project, customer, functional_direction, subject_domain, description, tasks, project_stage, date_end, technology, number_of_stakeholders, team, location, documentation) values
(1, 1, 'Project A', 'Development', 'Customer 1', 'IT', 'System development', 'Project A description', 'Task 1, Task 2', 'In Progress', '2024-06-01', 'Python, Django', 10, 'Team A', 'Moscow', 'Docs A'),
(2, 1, 'Project A', 'Development', 'Customer 1', 'IT', 'System development', 'Project A description', 'Task 1, Task 2', 'In Progress', '2024-06-01', 'Python, Django', 10, 'Team A', 'Saint Petersburg', 'Docs A'),
(3, 2, 'Project B', 'Implementation', 'Customer 2', 'Finance', 'Software implementation', 'Project B description', 'Task 3, Task 4', 'In Progress', '2024-07-01', 'Java, Spring', 8, 'Team B', 'Kazan', 'Docs B'),
(4, 3, 'Project C', 'Support', 'Customer 3', 'Healthcare', 'Product support', 'Project C description', 'Task 5, Task 6', 'Completed', '2024-08-01', 'JavaScript, React', 5, 'Team C', 'Novosibirsk', 'Docs C'),
(5, 4, 'Project D', 'Upgrade', 'Customer 4', 'Retail', 'System upgrade', 'Project D description', 'Task 7, Task 8', 'Planning', '2024-09-01', 'PHP, Laravel', 7, 'Team D', 'Yekaterinburg', 'Docs D');