create sequence hibernate_sequence start 1 increment 1

create table author
(
    id   int8         not null,
    name varchar(255) not null,
    primary key (id)
)

create table book
(
    id                 int8 not null,
    added_at           timestamp,
    cover              varchar(255),
    isbn               varchar(255),
    language           varchar(255),
    modified_at        timestamp,
    num_of_pages       int4,
    title              varchar(255),
    designer_id        int8,
    editor_id          int8,
    pricing_id         int8,
    printing_office_id int8,
    publisher_id       int8,
    stock_id           int8,
    translator_id      int8,
    primary key (id)
)

create table book_author
(
    book_isbn int8 not null,
    author_id int8 not null,
    primary key (book_isbn, author_id)
)

create table book_genre
(
    book_isbn int8 not null,
    genre_id  int8 not null,
    primary key (book_isbn, genre_id)
)

create table designer
(
    id   int8         not null,
    name varchar(255) not null,
    primary key (id)
)

create table discount
(
    id         int8 not null,
    end_date   date,
    percentage int2 not null,
    start_date date,
    primary key (id)
)

create table editor
(
    id   int8         not null,
    name varchar(255) not null,
    primary key (id)
)

create table genre
(
    id   int8         not null,
    name varchar(255) not null,
    primary key (id)
)

create table order_item
(
    id        int8 not null,
    currency  varchar(255),
    sub_units int4 not null,
    units     int4 not null,
    quantity  int4 not null,
    book_id   int8,
    order_id  int8,
    primary key (id)
)

create table orders
(
    id int8 not null,
    primary key (id)
)

create table pricing
(
    id        int8 not null,
    currency  varchar(255),
    sub_units int4 not null,
    units     int4 not null,
    primary key (id)
)

create table printing_office
(
    id   int8         not null,
    name varchar(255) not null,
    primary key (id)
)

create table publisher
(
    id     int8         not null,
    city   varchar(255),
    number varchar(255),
    street varchar(255),
    name   varchar(255) not null,
    primary key (id)
)

create table stock
(
    id    int8 not null,
    count int4,
    primary key (id)
)

create table translator
(
    id   int8         not null,
    name varchar(255) not null,
    primary key (id)
)

alter table author
    add constraint uq_author_name unique (name)

alter table book
    add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

alter table designer
    add constraint uq_designer_name unique (name)

alter table editor
    add constraint uq_editor_name unique (name)

alter table genre
    add constraint uq_genre_name unique (name)

alter table printing_office
    add constraint uq_printing_office_name unique (name)

alter table publisher
    add constraint uq_publisher_name unique (name)

alter table translator
    add constraint uq_translator_name unique (name)

alter table book
    add constraint FKh6dsx2pusi9mt834mbdql6p3r
        foreign key (designer_id)
            references designer

alter table book
    add constraint FKpmv0yeqvng13trnm9so4aaq04
        foreign key (editor_id)
            references editor

alter table book
    add constraint FK7b1e70rnskgsdk665um8simwt
        foreign key (pricing_id)
            references pricing

alter table book
    add constraint FKoyonbhenkmipghvrtfmoj3b8q
        foreign key (printing_office_id)
            references printing_office

alter table book
    add constraint FKgtvt7p649s4x80y6f4842pnfq
        foreign key (publisher_id)
            references publisher

alter table book
    add constraint FKcdlp3bj6butapn6ixbomswr6
        foreign key (stock_id)
            references stock

alter table book
    add constraint FK6c6h29rp41xv19vg40rueqv8w
        foreign key (translator_id)
            references translator

alter table book_author
    add constraint FKbjqhp85wjv8vpr0beygh6jsgo
        foreign key (author_id)
            references author

alter table book_author
    add constraint FKlxhwaiinp1xunnqsvnoirba4j
        foreign key (book_isbn)
            references book

alter table book_genre
    add constraint FK8l6ops8exmjrlr89hmfow4mmo
        foreign key (genre_id)
            references genre

alter table book_genre
    add constraint FKh7s58qsl6arq0kylsux020hpj
        foreign key (book_isbn)
            references book

alter table order_item
    add constraint FKb033an1f8qmpbnfl0a6jb5njs
        foreign key (book_id)
            references book

alter table order_item
    add constraint FKt4dc2r9nbvbujrljv3e23iibt
        foreign key (order_id)
            references orders
create sequence hibernate_sequence start 1 increment 1

create table author
(
    id   int8         not null,
    name varchar(255) not null,
    primary key (id)
)

create table book
(
    id                 int8 not null,
    added_at           timestamp,
    cover              varchar(255),
    isbn               varchar(255),
    language           varchar(255),
    modified_at        timestamp,
    num_of_pages       int4,
    title              varchar(255),
    designer_id        int8,
    editor_id          int8,
    pricing_id         int8,
    printing_office_id int8,
    publisher_id       int8,
    stock_id           int8,
    translator_id      int8,
    primary key (id)
)

create table book_author
(
    book_isbn int8 not null,
    author_id int8 not null,
    primary key (book_isbn, author_id)
)

create table book_genre
(
    book_isbn int8 not null,
    genre_id  int8 not null,
    primary key (book_isbn, genre_id)
)

create table designer
(
    id   int8         not null,
    name varchar(255) not null,
    primary key (id)
)

create table discount
(
    id         int8 not null,
    end_date   date,
    percentage int2 not null,
    start_date date,
    primary key (id)
)

create table editor
(
    id   int8         not null,
    name varchar(255) not null,
    primary key (id)
)

create table genre
(
    id   int8         not null,
    name varchar(255) not null,
    primary key (id)
)

create table order_item
(
    id        int8 not null,
    currency  varchar(255),
    sub_units int4 not null,
    units     int4 not null,
    quantity  int4 not null,
    book_id   int8,
    order_id  int8,
    primary key (id)
)

create table orders
(
    id int8 not null,
    primary key (id)
)

create table pricing
(
    id        int8 not null,
    currency  varchar(255),
    sub_units int4 not null,
    units     int4 not null,
    primary key (id)
)

create table printing_office
(
    id   int8         not null,
    name varchar(255) not null,
    primary key (id)
)

create table publisher
(
    id     int8         not null,
    city   varchar(255),
    number varchar(255),
    street varchar(255),
    name   varchar(255) not null,
    primary key (id)
)

create table stock
(
    id    int8 not null,
    count int4,
    primary key (id)
)

create table translator
(
    id   int8         not null,
    name varchar(255) not null,
    primary key (id)
)

alter table author
    add constraint uq_author_name unique (name)

alter table book
    add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

alter table designer
    add constraint uq_designer_name unique (name)

alter table editor
    add constraint uq_editor_name unique (name)

alter table genre
    add constraint uq_genre_name unique (name)

alter table printing_office
    add constraint uq_printing_office_name unique (name)

alter table publisher
    add constraint uq_publisher_name unique (name)

alter table translator
    add constraint uq_translator_name unique (name)

alter table book
    add constraint FKh6dsx2pusi9mt834mbdql6p3r
        foreign key (designer_id)
            references designer

alter table book
    add constraint FKpmv0yeqvng13trnm9so4aaq04
        foreign key (editor_id)
            references editor

alter table book
    add constraint FK7b1e70rnskgsdk665um8simwt
        foreign key (pricing_id)
            references pricing

alter table book
    add constraint FKoyonbhenkmipghvrtfmoj3b8q
        foreign key (printing_office_id)
            references printing_office

alter table book
    add constraint FKgtvt7p649s4x80y6f4842pnfq
        foreign key (publisher_id)
            references publisher

alter table book
    add constraint FKcdlp3bj6butapn6ixbomswr6
        foreign key (stock_id)
            references stock

alter table book
    add constraint FK6c6h29rp41xv19vg40rueqv8w
        foreign key (translator_id)
            references translator

alter table book_author
    add constraint FKbjqhp85wjv8vpr0beygh6jsgo
        foreign key (author_id)
            references author

alter table book_author
    add constraint FKlxhwaiinp1xunnqsvnoirba4j
        foreign key (book_isbn)
            references book

alter table book_genre
    add constraint FK8l6ops8exmjrlr89hmfow4mmo
        foreign key (genre_id)
            references genre

alter table book_genre
    add constraint FKh7s58qsl6arq0kylsux020hpj
        foreign key (book_isbn)
            references book

alter table order_item
    add constraint FKb033an1f8qmpbnfl0a6jb5njs
        foreign key (book_id)
            references book

alter table order_item
    add constraint FKt4dc2r9nbvbujrljv3e23iibt
        foreign key (order_id)
            references orders
create sequence hibernate_sequence start 1 increment 1

    create table author (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id int8 not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages int4,
        title varchar(255),
        designer_id int8,
        editor_id int8,
        pricing_id int8,
        printing_office_id int8,
        publisher_id int8,
        stock_id int8,
        translator_id int8,
        primary key (id)
    )

    create table book_author (
       book_isbn int8 not null,
        author_id int8 not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn int8 not null,
        discount_id int8 not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn int8 not null,
        genre_id int8 not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id int8 not null,
        end_date date,
        percentage int2 not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        quantity int4 not null,
        book_id int8,
        order_id int8,
        primary key (id)
    )

    create table orders (
       id int8 not null,
        primary key (id)
    )

    create table pricing (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        primary key (id)
    )

    create table printing_office (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id int8 not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id int8 not null,
        count int4,
        primary key (id)
    )

    create table translator (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start 1 increment 1

    create table author (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id int8 not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages int4,
        title varchar(255),
        designer_id int8,
        editor_id int8,
        pricing_id int8,
        printing_office_id int8,
        publisher_id int8,
        stock_id int8,
        translator_id int8,
        primary key (id)
    )

    create table book_author (
       book_isbn int8 not null,
        author_id int8 not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn int8 not null,
        discount_id int8 not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn int8 not null,
        genre_id int8 not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id int8 not null,
        end_date date,
        percentage int2 not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        quantity int4 not null,
        book_id int8,
        order_id int8,
        primary key (id)
    )

    create table orders (
       id int8 not null,
        primary key (id)
    )

    create table pricing (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        primary key (id)
    )

    create table printing_office (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id int8 not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id int8 not null,
        count int4,
        primary key (id)
    )

    create table translator (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start 1 increment 1

    create table author (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id int8 not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages int4,
        title varchar(255),
        designer_id int8,
        editor_id int8,
        pricing_id int8,
        printing_office_id int8,
        publisher_id int8,
        stock_id int8,
        translator_id int8,
        primary key (id)
    )

    create table book_author (
       book_isbn int8 not null,
        author_id int8 not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn int8 not null,
        discount_id int8 not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn int8 not null,
        genre_id int8 not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id int8 not null,
        end_date date,
        percentage int2 not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        quantity int4 not null,
        book_id int8,
        order_id int8,
        primary key (id)
    )

    create table orders (
       id int8 not null,
        primary key (id)
    )

    create table pricing (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        primary key (id)
    )

    create table printing_office (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id int8 not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id int8 not null,
        count int4,
        primary key (id)
    )

    create table translator (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start 1 increment 1

    create table author (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id int8 not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages int4,
        title varchar(255),
        designer_id int8,
        editor_id int8,
        pricing_id int8,
        printing_office_id int8,
        publisher_id int8,
        stock_id int8,
        translator_id int8,
        primary key (id)
    )

    create table book_author (
       book_isbn int8 not null,
        author_id int8 not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn int8 not null,
        discount_id int8 not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn int8 not null,
        genre_id int8 not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id int8 not null,
        end_date date,
        percentage int2 not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        quantity int4 not null,
        book_id int8,
        order_id int8,
        primary key (id)
    )

    create table orders (
       id int8 not null,
        primary key (id)
    )

    create table pricing (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        primary key (id)
    )

    create table printing_office (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id int8 not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id int8 not null,
        count int4,
        primary key (id)
    )

    create table translator (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start 1 increment 1

    create table author (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id int8 not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages int4,
        title varchar(255),
        designer_id int8,
        editor_id int8,
        pricing_id int8,
        printing_office_id int8,
        publisher_id int8,
        stock_id int8,
        translator_id int8,
        primary key (id)
    )

    create table book_author (
       book_isbn int8 not null,
        author_id int8 not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn int8 not null,
        discount_id int8 not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn int8 not null,
        genre_id int8 not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id int8 not null,
        end_date date,
        percentage int2 not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        quantity int4 not null,
        book_id int8,
        order_id int8,
        primary key (id)
    )

    create table orders (
       id int8 not null,
        primary key (id)
    )

    create table pricing (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        primary key (id)
    )

    create table printing_office (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id int8 not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id int8 not null,
        count int4,
        primary key (id)
    )

    create table translator (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start 1 increment 1

    create table author (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id int8 not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages int4,
        title varchar(255),
        designer_id int8,
        editor_id int8,
        pricing_id int8,
        printing_office_id int8,
        publisher_id int8,
        stock_id int8,
        translator_id int8,
        primary key (id)
    )

    create table book_author (
       book_isbn int8 not null,
        author_id int8 not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn int8 not null,
        discount_id int8 not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn int8 not null,
        genre_id int8 not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id int8 not null,
        end_date date,
        percentage int2 not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        quantity int4 not null,
        book_id int8,
        order_id int8,
        primary key (id)
    )

    create table orders (
       id int8 not null,
        primary key (id)
    )

    create table pricing (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        primary key (id)
    )

    create table printing_office (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id int8 not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id int8 not null,
        count int4,
        primary key (id)
    )

    create table translator (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start 1 increment 1

    create table author (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id int8 not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages int4,
        title varchar(255),
        designer_id int8,
        editor_id int8,
        pricing_id int8,
        printing_office_id int8,
        publisher_id int8,
        stock_id int8,
        translator_id int8,
        primary key (id)
    )

    create table book_author (
       book_isbn int8 not null,
        author_id int8 not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn int8 not null,
        discount_id int8 not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn int8 not null,
        genre_id int8 not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id int8 not null,
        end_date date,
        percentage int2 not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        quantity int4 not null,
        book_id int8,
        order_id int8,
        primary key (id)
    )

    create table orders (
       id int8 not null,
        primary key (id)
    )

    create table pricing (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        primary key (id)
    )

    create table printing_office (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id int8 not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id int8 not null,
        count int4,
        primary key (id)
    )

    create table translator (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255) not null,
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    alter table author 
       add constraint uq_author_name unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint uq_designer_name unique (name)

    alter table editor 
       add constraint uq_editor_name unique (name)

    alter table genre 
       add constraint uq_genre_name unique (name)

    alter table printing_office 
       add constraint uq_printing_office_name unique (name)

    alter table publisher 
       add constraint uq_publisher_name unique (name)

    alter table translator 
       add constraint uq_translator_name unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start 1 increment 1

    create table author (
       id int8 not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id int8 not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages int4,
        title varchar(255),
        designer_id int8,
        editor_id int8,
        pricing_id int8,
        printing_office_id int8,
        publisher_id int8,
        stock_id int8,
        translator_id int8,
        primary key (id)
    )

    create table book_author (
       book_isbn int8 not null,
        author_id int8 not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn int8 not null,
        discount_id int8 not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn int8 not null,
        genre_id int8 not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id int8 not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id int8 not null,
        end_date date,
        percentage int2 not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id int8 not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        quantity int4 not null,
        book_id int8,
        order_id int8,
        primary key (id)
    )

    create table orders (
       id int8 not null,
        primary key (id)
    )

    create table pricing (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        primary key (id)
    )

    create table printing_office (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id int8 not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id int8 not null,
        count int4,
        primary key (id)
    )

    create table translator (
       id int8 not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start 1 increment 1

    create table author (
       id int8 not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id int8 not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages int4,
        title varchar(255),
        designer_id int8,
        editor_id int8,
        pricing_id int8,
        printing_office_id int8,
        publisher_id int8,
        stock_id int8,
        translator_id int8,
        primary key (id)
    )

    create table book_author (
       book_isbn int8 not null,
        author_id int8 not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn int8 not null,
        discount_id int8 not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn int8 not null,
        genre_id int8 not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id int8 not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id int8 not null,
        end_date date,
        percentage int2 not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id int8 not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        quantity int4 not null,
        book_id int8,
        order_id int8,
        primary key (id)
    )

    create table orders (
       id int8 not null,
        primary key (id)
    )

    create table pricing (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        primary key (id)
    )

    create table printing_office (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id int8 not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id int8 not null,
        count int4,
        primary key (id)
    )

    create table translator (
       id int8 not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start 1 increment 1

    create table author (
       id int8 not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id int8 not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages int4,
        title varchar(255),
        designer_id int8,
        editor_id int8,
        pricing_id int8,
        printing_office_id int8,
        publisher_id int8,
        stock_id int8,
        translator_id int8,
        primary key (id)
    )

    create table book_author (
       book_isbn int8 not null,
        author_id int8 not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn int8 not null,
        discount_id int8 not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn int8 not null,
        genre_id int8 not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id int8 not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id int8 not null,
        end_date date,
        percentage int2 not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id int8 not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        quantity int4 not null,
        book_id int8,
        order_id int8,
        primary key (id)
    )

    create table orders (
       id int8 not null,
        primary key (id)
    )

    create table pricing (
       id int8 not null,
        currency varchar(255),
        sub_units int4 not null,
        units int4 not null,
        primary key (id)
    )

    create table printing_office (
       id int8 not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id int8 not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id int8 not null,
        count int4,
        primary key (id)
    )

    create table translator (
       id int8 not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
create sequence hibernate_sequence start with 1 increment by 1

    create table author (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table book (
       id bigint not null,
        added_at timestamp,
        cover varchar(255),
        isbn varchar(255),
        language varchar(255),
        modified_at timestamp,
        num_of_pages integer,
        title varchar(255),
        designer_id bigint,
        editor_id bigint,
        pricing_id bigint,
        printing_office_id bigint,
        publisher_id bigint,
        stock_id bigint,
        translator_id bigint,
        primary key (id)
    )

    create table book_author (
       book_isbn bigint not null,
        author_id bigint not null,
        primary key (book_isbn, author_id)
    )

    create table book_discount (
       book_isbn bigint not null,
        discount_id bigint not null,
        primary key (book_isbn, discount_id)
    )

    create table book_genre (
       book_isbn bigint not null,
        genre_id bigint not null,
        primary key (book_isbn, genre_id)
    )

    create table designer (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table discount (
       id bigint not null,
        end_date date,
        percentage smallint not null,
        start_date date,
        primary key (id)
    )

    create table editor (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table genre (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    create table order_item (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        quantity integer not null,
        book_id bigint,
        order_id bigint,
        primary key (id)
    )

    create table orders (
       id bigint not null,
        primary key (id)
    )

    create table pricing (
       id bigint not null,
        currency varchar(255),
        sub_units integer not null,
        units integer not null,
        primary key (id)
    )

    create table printing_office (
       id bigint not null,
        name varchar(255) not null,
        primary key (id)
    )

    create table publisher (
       id bigint not null,
        city varchar(255),
        number varchar(255),
        street varchar(255),
        name varchar(255),
        primary key (id)
    )

    create table stock (
       id bigint not null,
        count integer,
        primary key (id)
    )

    create table translator (
       id bigint not null,
        name varchar(255),
        primary key (id)
    )

    alter table author 
       add constraint UK_m9awr9ps5ytumpge1chju51gk unique (name)

    alter table book 
       add constraint UK_2rqqpgnve6gu3ar7prin5qm0i unique (isbn, title)

    alter table designer 
       add constraint UK_n9t65jh397waorqqhfci8uhf8 unique (name)

    alter table editor 
       add constraint UK_aok62tymdsin9ms6d39o6nyo4 unique (name)

    alter table genre 
       add constraint UK_53m2e40c5fst1109f4x4fci7t unique (name)

    alter table printing_office 
       add constraint UK_74oh8awfuhfo4aakspplhlm2t unique (name)

    alter table publisher 
       add constraint UK_g67qqwjsre8ui251dsb3sccgd unique (name)

    alter table translator 
       add constraint UK_sdytx15sn9w60p63aey2wkbkk unique (name)

    alter table book 
       add constraint FKh6dsx2pusi9mt834mbdql6p3r 
       foreign key (designer_id) 
       references designer

    alter table book 
       add constraint FKpmv0yeqvng13trnm9so4aaq04 
       foreign key (editor_id) 
       references editor

    alter table book 
       add constraint FK7b1e70rnskgsdk665um8simwt 
       foreign key (pricing_id) 
       references pricing

    alter table book 
       add constraint FKoyonbhenkmipghvrtfmoj3b8q 
       foreign key (printing_office_id) 
       references printing_office

    alter table book 
       add constraint FKgtvt7p649s4x80y6f4842pnfq 
       foreign key (publisher_id) 
       references publisher

    alter table book 
       add constraint FKcdlp3bj6butapn6ixbomswr6 
       foreign key (stock_id) 
       references stock

    alter table book 
       add constraint FK6c6h29rp41xv19vg40rueqv8w 
       foreign key (translator_id) 
       references translator

    alter table book_author 
       add constraint FKbjqhp85wjv8vpr0beygh6jsgo 
       foreign key (author_id) 
       references author

    alter table book_author 
       add constraint FKlxhwaiinp1xunnqsvnoirba4j 
       foreign key (book_isbn) 
       references book

    alter table book_discount 
       add constraint FK59lov38mw4ewykhwwsh6rwnus 
       foreign key (discount_id) 
       references discount

    alter table book_discount 
       add constraint FKpgnsduq7ktuwru527wyeap8rf 
       foreign key (book_isbn) 
       references book

    alter table book_genre 
       add constraint FK8l6ops8exmjrlr89hmfow4mmo 
       foreign key (genre_id) 
       references genre

    alter table book_genre 
       add constraint FKh7s58qsl6arq0kylsux020hpj 
       foreign key (book_isbn) 
       references book

    alter table order_item 
       add constraint FKb033an1f8qmpbnfl0a6jb5njs 
       foreign key (book_id) 
       references book

    alter table order_item 
       add constraint FKt4dc2r9nbvbujrljv3e23iibt 
       foreign key (order_id) 
       references orders
