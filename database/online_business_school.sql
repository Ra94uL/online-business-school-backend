
DROP DATABASE IF EXISTS online_business_school;
CREATE DATABASE online_business_school;
USE online_business_school;


create table Role (
    role_id BIGINT not null auto_increment primary key,
    role_name VARCHAR(100) not null,
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


create table Account (
    account_id BIGINT not null auto_increment primary key,
    email varchar(100) not null  unique,
    password_hash varchar(300) not null,
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


-- Junction table Account & Role
create table AccountRole (
    account_id BIGINT not null,
    foreign key (account_id) references Account(account_id),
    role_id BIGINT not null,
    foreign key (role_id) references Role(role_id),
    primary key (account_id,role_id),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


create table Administrator (
    admin_id BIGINT auto_increment primary key,
    name varchar(100) not null,
    phone_number varchar(20),
    account_id BIGINT unique,
    foreign key (account_id) references Account(account_id),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


create table Teacher (
    teacher_id BIGINT not null auto_increment primary key,
    name varchar(100) not null,
    phone_number varchar(20) not null,
    subject varchar(100) not null,
    country varchar(100) not null,
    account_id BIGINT unique,
    foreign key (account_id) references Account(account_id),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


create table Course (
    course_id BIGINT not null auto_increment primary key,
    title varchar(100) not null,
    description varchar(100) not null,
    duration double not null,
    price decimal(10,2) not null,
    image_url varchar(300),
    teacher_id BIGINT,
    foreign key (teacher_id) references Teacher(teacher_id),
    admin_id BIGINT,
    foreign key (admin_id) references Administrator(admin_id),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


-- Junction table Course & Teacher
create table CourseTeacher (
    course_id BIGINT not null,
    foreign key (course_id) references Course(course_id),
    teacher_id BIGINT not null,
    foreign key (teacher_id) references Teacher(teacher_id),
    primary key (course_id,teacher_id),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


create table CourseModule (
    module_id BIGINT not null auto_increment primary key,
    title varchar(100) not null,
    description varchar(300) not null,
    sequence_number int not null,
    course_id BIGINT not null,
    foreign key (course_id) references Course(course_id),
    unique (course_id, sequence_number),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


create table Lecture (
    lecture_id BIGINT not null auto_increment primary key,
    lecture_title varchar(300) not null,
    lecture_description varchar(300) not null,
    lecture_date timestamp,
    duration_minutes int not null,
    lecture_sequence_number int not null,
    lecture_url varchar(300),
    module_id BIGINT not null,
    foreign key (module_id) references CourseModule(module_id),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


create table Company(
    company_id BIGINT not null auto_increment primary key,
    company_name varchar(300) not null,
    org_number varchar(20) not null unique,
    contact_email varchar(300),
    phone_number varchar(20),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


create table Student (
    student_id BIGINT not null auto_increment primary key,
    name varchar(300) not null,
    date_of_birth DATE not null,
    phone_number varchar(20) not null,
    country varchar(100) not null,
    admin_id BIGINT not null,
    foreign key (admin_id) references Administrator(admin_id),
    company_id BIGINT,
    foreign key (company_id ) references Company(company_id),
    account_id BIGINT unique,
    foreign key (account_id) references Account(account_id),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


create table Orders (
    order_id BIGINT not null auto_increment primary key,
    order_date date not null,
    company_id BIGINT,
    foreign key (company_id) references Company(company_id),
    student_id BIGINT,
    foreign key (student_id ) references Student(student_id),
    check
    (student_id is null and company_id is not null
    or company_id is null and student_id is not null),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

create table OrderItem (
    order_item_id BIGINT not null auto_increment primary key,
    quantity int not null,
    unit_price decimal(10,2) not null,
    order_id BIGINT not null,
    foreign key (order_id) references Orders(order_id),
    course_id BIGINT not null,
    foreign key (course_id) references Course(course_id),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);

create table Enrollment (
    enrollment_id BIGINT not null auto_increment primary key,
    enrollment_date date not null,
    status varchar(20),
    grade varchar(20),
    student_id BIGINT not null,
    foreign key (student_id) references Student(student_id),
    course_id BIGINT not null,
    foreign key (course_id) references Course(course_id),
    order_item_id BIGINT,
    foreign key (order_item_id) references OrderItem(order_item_id),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


create table Payment (
    payment_id BIGINT not null auto_increment primary key,
    payment_date date not null,
    status varchar(100) not null,
    amount decimal(10,2) not null,
    order_id BIGINT not null unique,
    foreign key (order_id) references Orders(order_id),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


create table Assignment (
    assignment_id BIGINT not null auto_increment primary key,
    title varchar(300) not null,
    description varchar(600) not null,
    due_date date,
    module_id BIGINT not null,
    foreign key (module_id) references CourseModule(module_id),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


create table Submission (
    submission_id BIGINT not null auto_increment primary key,
    submission_description varchar(600) not null,
    file_reference varchar(1000),
    assignment_id BIGINT not null,
    foreign key (assignment_id) references Assignment(assignment_id),
    enrollment_id BIGINT not null,
    foreign key (enrollment_id) references Enrollment(enrollment_id),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);


create table Certificate (
    certificate_id BIGINT not null auto_increment primary key,
    date_of_issue date not null,
    certificate_type varchar(100) not null,
    enrollment_id BIGINT not null unique,
    foreign key (enrollment_id) references Enrollment(enrollment_id),
    created timestamp default CURRENT_TIMESTAMP,
    lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
);














