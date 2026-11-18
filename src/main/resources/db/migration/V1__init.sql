create table Role (
                      role_id int not null auto_increment primary key,
                      role_name VARCHAR(100) not null,
                      created timestamp default CURRENT_TIMESTAMP,
                      lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP );


create table Account (
                         account_id int not null auto_increment primary key,
                         email varchar(100) not null  unique,
                         password_hash varchar(300) not null,
                         created timestamp default CURRENT_TIMESTAMP,
                         lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP );


-- Junction table Account & Role
create table AccountRole (
                             account_id int not null,
                             foreign key (account_id) references Account(account_id),
                             role_id int not null,
                             foreign key (role_id) references Role(role_id),
                             primary key (account_id,role_id),
                             created timestamp default CURRENT_TIMESTAMP,
                             lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP );


create table Administrator (
                               admin_id int auto_increment primary key,
                               name varchar(100) not null,
                               phone_number varchar(20),
                               account_id int unique,
                               foreign key (account_id) references Account(account_id),
                               created timestamp default CURRENT_TIMESTAMP,
                               lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);


create table Teacher (
                         teacher_id int not null auto_increment primary key,
                         name varchar(100) not null,
                         phone_number varchar(20) not null,
                         subject varchar(100) not null,
                         country varchar(100) not null,
                         account_id int unique,
                         foreign key (account_id) references Account(account_id),
                         created timestamp default CURRENT_TIMESTAMP,
                         lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);


create table Course (
                        course_id int not null auto_increment primary key,
                        course_code varchar(30) unique,
                        title varchar(100) not null,
                        description varchar(1000) not null,
                        duration double not null,
                        price double not null,
                        image_url varchar(300),
                        teacher_id int,
                        foreign key (teacher_id) references Teacher(teacher_id),
                        admin_id int,
                        foreign key (admin_id) references Administrator(admin_id),
                        created timestamp default CURRENT_TIMESTAMP,
                        lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);


-- Junction table Course & Teacher
create table CourseTeacher (
                               course_id int not null,
                               foreign key (course_id) references Course(course_id),
                               teacher_id int not null,
                               foreign key (teacher_id) references Teacher(teacher_id),
                               primary key (course_id,teacher_id),
                               created timestamp default CURRENT_TIMESTAMP,
                               lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);


create table CourseModule (
                              module_id int not null auto_increment primary key,
                              title varchar(100) not null,
                              description varchar(300) not null,
                              sequence_number int not null,
                              course_id int not null,
                              foreign key (course_id) references Course(course_id),
                              created timestamp default CURRENT_TIMESTAMP,
                              lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);


create table Lecture (
                         lecture_id int not null auto_increment primary key,
                         lecture_title varchar(300) not null,
                         lecture_description varchar(300) not null,
                         lecture_date timestamp,
                         duration_minutes int not null,
                         lecture_sequence_number int not null,
                         lecture_url varchar(300),
                         module_id int not null,
                         foreign key (module_id) references CourseModule(module_id),
                         created timestamp default CURRENT_TIMESTAMP,
                         lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);


create table Company(
                        company_id int not null auto_increment primary key,
                        company_name varchar(300) not null,
                        org_number varchar(20) not null unique,
                        contact_email varchar(300),
                        phone_number varchar(20),
                        created timestamp default CURRENT_TIMESTAMP,
                        lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);


create table Student (
                         student_id int not null auto_increment primary key,
                         name varchar(300) not null,
                         date_of_birth DATE not null,
                         phone_number varchar(20) not null,
                         country varchar(100) not null,
                         admin_id int not null,
                         foreign key (admin_id) references Administrator(admin_id),
                         company_id int,
                         foreign key (company_id ) references Company(company_id),
                         account_id int unique,
                         foreign key (account_id) references Account(account_id),
                         created timestamp default CURRENT_TIMESTAMP,
                         lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);


create table Orders (
                        order_id int not null auto_increment primary key,
                        order_date date not null,
                        company_id int,
                        foreign key (company_id) references Company(company_id),
                        student_id int,
                        foreign key (student_id ) references Student(student_id),
                        check
                            (student_id is null and company_id is not null
                            or company_id is null and student_id is not null),
                        created timestamp default CURRENT_TIMESTAMP,
                        lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);

create table OrderItem (
                           order_item_id int not null auto_increment primary key,
                           quantity int not null,
                           unit_price double not null,
                           order_id int not null,
                           foreign key (order_id) references Orders(order_id),
                           course_id int not null,
                           foreign key (course_id) references Course(course_id),
                           UNIQUE (order_item_id, course_id),
                           created timestamp default CURRENT_TIMESTAMP,
                           lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);

CREATE TABLE Enrollment (
                            enrollment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                            enrollment_date DATE NOT NULL,
                            status VARCHAR(20),
                            grade VARCHAR(20),
                            student_id INT NOT NULL,
                            course_id INT NOT NULL,
                            order_item_id INT,
                            FOREIGN KEY (student_id) REFERENCES Student(student_id),
                            FOREIGN KEY (course_id) REFERENCES Course(course_id),
                            FOREIGN KEY (order_item_id, course_id)
                                REFERENCES OrderItem(order_item_id, course_id),
                            created timestamp default CURRENT_TIMESTAMP,
                            lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);


create table Payment (
                         payment_id int not null auto_increment primary key,
                         payment_date date not null,
                         stats varchar(100) not null,
                         amount double not null,
                         order_id int not null unique,
                         foreign key (order_id) references Orders(order_id),
                         created timestamp default CURRENT_TIMESTAMP,
                         lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);


create table Assignment (
                            assignment_id int not null auto_increment primary key,
                            title varchar(300) not null,
                            description varchar(600) not null,
                            due_date date,
                            module_id int not null,
                            foreign key (module_id) references CourseModule(module_id),
                            created timestamp default CURRENT_TIMESTAMP,
                            lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);


create table Submission (
                            submission_id int not null auto_increment primary key,
                            submission_description varchar(600) not null,
                            file_reference varchar(1000),
                            assignment_id int not null,
                            foreign key (assignment_id) references Assignment(assignment_id),
                            enrollment_id int not null,
                            foreign key (enrollment_id) references Enrollment(enrollment_id),
                            created timestamp default CURRENT_TIMESTAMP,
                            lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);


create table Certificate (
                             certificate_id int not null auto_increment primary key,
                             date_of_issue date not null,
                             certificate_type varchar(100) not null,
                             enrollment_id int not null unique,
                             foreign key (enrollment_id) references Enrollment(enrollment_id),
                             created timestamp default CURRENT_TIMESTAMP,
                             lastUpdate timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP);
