
    create table additional_info (
        id int4 not null,
        created_on timestamp,
        enabled boolean not null,
        field_type varchar(255),
        name varchar(255),
        required boolean not null,
        dept_id int4,
        staff_id int4,
        primary key (id)
    );

    create table additionalinfo_records (
        id int4 not null,
        enabled boolean not null,
        value varchar(255),
        additionalInfo_id int4,
        application_id int4,
        user_id int4,
        primary key (id)
    );

    create table applications (
        id int4 not null,
        gpa float8,
        created_on timestamp,
        enabled boolean not null,
        international boolean,
        submit boolean,
        toefl int4,
        transcript varchar(255),
        program_id int4,
        status_id int4,
        term_id int4,
        user_id int4,
        primary key (id)
    );

    create table applicationstatus_records (
        id int4 not null,
        comments varchar(255),
        created_on timestamp,
        enabled boolean not null,
        time timestamp,
        application_id int4,
        staff_id int4,
        status_id int4,
        primary key (id)
    );

    create table department_programs (
        id int4 not null,
        created_on timestamp,
        enabled boolean not null,
        program_name varchar(255),
        dept_id int4,
        primary key (id)
    );

    create table departments (
        id int4 not null,
        created_on timestamp,
        dept_name varchar(255),
        enabled boolean not null,
        primary key (id)
    );

    create table education_info (
        id int4 not null,
        college_name varchar(255),
        degree_earned varchar(255),
        enabled boolean not null,
        major varchar(255),
        time_period varchar(255),
        application_id int4,
        user_id int4,
        primary key (id)
    );

    create table program_terms (
        id int4 not null,
        enabled boolean not null,
        term_name varchar(255),
        primary key (id)
    );

    create table status (
        id int4 not null,
        enabled boolean not null,
        status_description varchar(255),
        status_name varchar(255),
        primary key (id)
    );

    create table students_detail (
        id int4 not null,
        date_of_birth timestamp,
        citizenship varchar(255),
        emailId varchar(255),
        enabled boolean not null,
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        phone_number varchar(255),
        student_cin varchar(255),
        application_id int4,
        user_id int4,
        primary key (id)
    );

    create table users (
        id int4 not null,
        created_on timestamp,
        emailId varchar(255),
        enabled boolean not null,
        first_name varchar(255),
        last_name varchar(255),
        password varchar(255),
        user_roles varchar(255),
        primary key (id)
    );

    alter table additional_info 
        add constraint FK_6pib03m9h1jyq69p1gi3teed2 
        foreign key (dept_id) 
        references departments;

    alter table additional_info 
        add constraint FK_kmofexoi0pf1k2u8kmhtn0v1y 
        foreign key (staff_id) 
        references users;

    alter table additionalinfo_records 
        add constraint FK_fku4obt05v4lg2j2jr3v7jb4t 
        foreign key (additionalInfo_id) 
        references additional_info;

    alter table additionalinfo_records 
        add constraint FK_i2y26vjmf0sv73o3pq43m0yc5 
        foreign key (application_id) 
        references applications;

    alter table additionalinfo_records 
        add constraint FK_m19d35ygmeh04vucdvo8hyyhu 
        foreign key (user_id) 
        references users;

    alter table applications 
        add constraint FK_fvv8mt4q3l0jlgem0374rwfb5 
        foreign key (program_id) 
        references department_programs;

    alter table applications 
        add constraint FK_bmuuaimvfefq39ypbc6y2itdu 
        foreign key (status_id) 
        references status;

    alter table applications 
        add constraint FK_11vghq2iaflf0eqtne7u9ooqa 
        foreign key (term_id) 
        references program_terms;

    alter table applications 
        add constraint FK_il296b7i4a8es7mgs2a79gl8o 
        foreign key (user_id) 
        references users;

    alter table applicationstatus_records 
        add constraint FK_nh942nkxbk1utp3j8727o96hj 
        foreign key (application_id) 
        references applications;

    alter table applicationstatus_records 
        add constraint FK_dxp621mkdtp4gau0kyse9esg2 
        foreign key (staff_id) 
        references users;

    alter table applicationstatus_records 
        add constraint FK_hvyx3dvid4ksmih01817iv94b 
        foreign key (status_id) 
        references status;

    alter table department_programs 
        add constraint FK_icuahxx0w7yxj2cab3nisdmao 
        foreign key (dept_id) 
        references departments;

    alter table education_info 
        add constraint FK_oru6fl7f6p6bmnbey5xueo19n 
        foreign key (application_id) 
        references applications;

    alter table education_info 
        add constraint FK_p6lapb5828l3uv4ggvxrivms6 
        foreign key (user_id) 
        references users;

    alter table students_detail 
        add constraint FK_sh587kyv2r3rs3m21l22tfjtp 
        foreign key (application_id) 
        references applications;

    alter table students_detail 
        add constraint FK_aijkd0fr9o1fy56y27phqf24u 
        foreign key (user_id) 
        references users;

    create sequence hibernate_sequence;
