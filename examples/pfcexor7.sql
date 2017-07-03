-- ============================================================ 
--   This file      :  pfcexor7.sql                             
--   DBMS name      :  ORACLE Version 7.0                       
--   Author         :  Powersoft Corporation                    
--   Created On     :  10/20/97  2:17 PM                        
--                                                              
--   Purpose        :  This is a file of SQL statements you     
--                     can execute against an Oracle 7          
--                     database. It creates the PFC Examples    
--                     DB tables which are used by the          
--                     PowerBuilder PFC Code Examples and then  
--                     inserts data into them. The tables are:  
--                           * customer                         
--                           * department                       
--                           * employee                         
--                           * fin_code                         
--                           * fin_data                         
--                           * product                          
--                           * sales_order                      
--                           * sales_order_items                
--                           * states                           
--                           * sales_regions                    
--                           * examples                         
--                           * examples_categories_list         
--                           * messages                         
--                           * security_apps                    
--                           * security_groupings               
--                           * security_info                    
--                           * security_template                
--                           * security_users                   
--                                                              
--                     After loading data into the tables this  
--                     script will create the indexes and       
--                     the foreign keys used by the PFC Code    
--                     Examples.                                
--                                                              
--   To use it      :  Follow these steps.                      
--                                                              
--                     1) Make sure the target database doesn't 
--                        already contain tables whose names    
--                        conflict with those to be added by    
--                        this file.                            
--                                                              
--                     2) Make sure the target database already 
--                        contains the PowerBuilder repository  
--                        tables (pbcatcol, pbcatedt, pbcatfmt, 
--                        pbcattbl, and pbcatvld).              
--                                                              
--                        If it does not, see the PowerBuilder  
--                        manual "Connecting to Your Database"  
--                        for instructions on creating these    
--                        repository tables.                    
--                                                              
--                     3) After scripts have finished grant the    
--                        proper privileges to the tables.                        
--                        See Script for sample.
--
--                     4) Use SQL*Plus to execute this file     
--                        (pfcexor7.sql).                       
--                                                              
--                                                              
-- ============================================================ 

-- ============================================================ 
-- drop the tables - uncomment if tables already exist
-- ============================================================ 
-- drop table customer cascade constraints
-- ;
-- drop table department cascade constraints
-- ;
-- drop table employee cascade constraints
-- ;
-- drop table fin_code cascade constraints
-- ;
-- drop table fin_data cascade constraints
-- ;
-- drop table product cascade constraints
-- ;
-- drop table sales_order cascade constraints
-- ;
-- drop table sales_order_items cascade constraints
-- ;
-- drop table states cascade constraints
-- ;
-- drop table sales_regions cascade constraints
-- ;
-- drop table examples cascade constraints
-- ;
-- drop table examples_categories_list cascade constraints
-- ;
-- drop table messages cascade constraints
-- ;
-- drop table security_groupings cascade constraints
-- ;
-- drop table security_info cascade constraints
-- ;
-- drop table security_users cascade constraints
-- ;
-- drop table security_apps cascade constraints
-- ;
-- drop table security_template cascade constraints
-- ;
-- commit
-- ;

-- ============================================================ 
--   Table : customer                                           
-- ============================================================ 
create table customer
(
    id                              integer                not null,
    fname                           char(15)               not null,
    lname                           char(20)               not null,
    address                         char(35)               not null,
    city                            char(20)               not null,
    state                           char(3)                not null,
    zip                             char(10)               not null,
    phone                           char(12)               not null,
    company_name                    char(35)                       ,
    constraint pk_customer primary key (id)
)
;
commit
;

-- ============================================================ 
--   Table : department                                         
-- ============================================================ 
create table department
(
    dept_id                         integer                    not null,
    dept_name                       char(40)                   not null,
    dept_head_id                    integer                            ,
    constraint pk_department primary key (dept_id)
)
;
commit
;

-- ============================================================ 
--   Table : employee                                           
-- ============================================================ 
create table employee
(
    emp_id                          integer                not null,
    manager_id                      integer                        ,
    emp_fname                       char(20)               not null,
    emp_lname                       char(20)               not null,
    dept_id                         integer                not null,
    street                          char(40)               not null,
    city                            char(20)               not null,
    state                           char(4)                not null,
    zip_code                        char(9)                not null,
    phone                           char(10)                       ,
    status                          char(1)                        ,
    ss_number                       char(11)               not null,
    salary                          number(20,3)           not null,
    start_date                      date                   not null,
    termination_date                date                           ,
    birth_date                      date                           ,
    bene_health_ins                 char(1)                        ,
    bene_life_ins                   char(1)                        ,
    bene_day_care                   char(1)                        ,
    sex                             char(1)                        ,
    constraint pk_employee primary key (emp_id)
)
;
commit
;

-- ============================================================ 
--   Table : fin_code                                           
-- ============================================================ 
create table fin_code
(
    code                            char(2)                not null,
    type                            char(10)               not null,
    description                     char(50)                       ,
    constraint pk_fin_code primary key (code)
)
;
commit
;

-- ============================================================ 
--   Table : fin_data                                           
-- ============================================================ 
create table fin_data
(
    year                            char(4)                not null,
    quarter                         char(2)                not null,
    code                            char(2)                not null,
    amount                          number(9)                      ,
    constraint pk_fin_data primary key (year, quarter, code)
)
;
commit
;

-- ============================================================ 
--   Table : product                                            
-- ============================================================ 
create table product
(
    id                              integer                    not null,
    name                            varchar2(15)               not null,
    description                     varchar2(30)               not null,
    prod_size                       varchar2(18)               not null,
    color                           char(6)                    not null,
    quantity                        integer                    not null,
    unit_price                      number(15,2)               not null,
    picture_name                    char(12)                           ,
    catalog_picture                 long raw                           ,
    constraint pk_product primary key (id)
)
;
commit
;

-- ============================================================ 
--   Table : sales_order                                        
-- ============================================================ 
create table sales_order
(
    id                              integer                    not null,
    cust_id                         integer                    not null,
    order_date                      date                       not null,
    fin_code_id                     char(2)                            ,
    region                          char(7)                            ,
    sales_rep                       integer                    not null,
    constraint pk_sales_order primary key (id)
)
;
commit
;

-- ============================================================ 
--   Table : sales_order_items                                  
-- ============================================================ 
create table sales_order_items
(
    id                              integer                not null,
    line_id                         smallint               not null,
    prod_id                         integer                not null,
    quantity                        integer                not null,
    ship_date                       date                   not null,
    constraint pk_sales_order_items primary key (id, line_id)
)
;
commit
;

-- ============================================================ 
--   Table : states                                             
-- ============================================================ 
create table states
(
    state_id                        char(3)                not null,
    state_name                      char(24)               not null,
    state_capital                   char(24)               not null,
    country                         char(3)                not null,
    region                          char(7)                not null,
    constraint pk_states primary key (state_id, state_capital)
)
;
commit
;

-- ============================================================ 
--   Table : sales_regions                                      
-- ============================================================ 
create table sales_regions
(
    region                          char(7)                not null,
    constraint pk_sales_regions primary key (region)
)
;
commit
;

-- ============================================================ 
--   Table : examples                                           
-- ============================================================ 
create table examples
(
    example_id                      integer                not null,
    title                           char(60)               not null,
    description                     varchar2(2000)                 ,
    technique                       varchar2(2000)                 ,
    ostype                          varchar2(40)                   ,
    pbtype                          varchar2(17)                   ,
    exhelp                          integer                        ,
    window                          varchar2(128)                  ,
    about                           varchar2(2000)                 ,
    constraint pk_examples primary key (example_id)
)
;
commit
;

-- ============================================================ 
--   Table : examples_categories_list                           
-- ============================================================ 
create table examples_categories_list
(
    category_id                     integer                    not null,
    category_name                   varchar2(60)                       ,
    category_parent_id              integer                            ,
    example_id                      integer                            ,
    picture_idx                     integer                            ,
    selected_picture_idx            integer                            ,
    overlay_picture_idx             integer                            ,
    state_picture_idx               integer                            ,
    constraint pk_examples_categories_list primary key (category_id)
)
;
commit
;

-- ============================================================ 
--   Table : messages                                           
-- ============================================================ 
create table messages
(
    msgid                           varchar2(40)            not null,
    msgtitle                        varchar2(255)           not null,
    msgtext                         varchar2(255)           not null,
    msgicon                         varchar2(12)            not null,
    msgbutton                       varchar2(17)            not null,
    msgdefaultbutton                integer                 not null,
    msgseverity                     integer                 not null,
    msgprint                        char(1)                 not null,
    msguserinput                    char(1)                 not null,
    constraint pk_messages primary key (msgid)
)
;
commit
;

-- ============================================================ 
--   Table : security_groupings                                 
-- ============================================================ 
create table security_groupings
(
    group_name                      varchar2(16)            not null,
    user_name                       varchar2(16)            not null,
    constraint pk_sec_groupings primary key (group_name, user_name)
)
;
commit
;

-- ============================================================ 
--   Table : security_info                                      
-- ============================================================ 
create table security_info
(
    application                     varchar2(32)            not null,
    window                          varchar2(64)            not null,
    control                         varchar2(128)           not null,
    user_name                       varchar2(16)            not null,
    status                          char(1)                 not null,
    constraint pk_sec_info primary key (application, window, control, user_name)
)
;
commit
;

-- ============================================================ 
--   Table : security_users                                     
-- ============================================================ 
create table security_users
(
    name                            varchar2(16)            not null,
    description                     varchar2(32)            not null,
    priority                        integer                 not null,
    user_type                       integer                         ,
    constraint pk_sec_users primary key (name)
)
;
commit
;

-- ============================================================ 
--   Table : security_apps                                      
-- ============================================================ 
create table security_apps
(
    application                     varchar2(32)            not null,
    description                     varchar2(64)            not null,
    constraint pk_sec_apps primary key (application)
)
;
commit
;

-- ============================================================ 
--   Table : security_template                                  
-- ============================================================ 
create table security_template
(
    application                     varchar2(32)            not null,
    window                          varchar2(64)            not null,
    control                         varchar2(128)           not null,
    description                     varchar2(254)           not null,
    object_type                     varchar2(224)           not null,
    constraint pk_sec_template primary key (application, window, control)
)
;
commit
;

-- ============================================================ 
--   Grant privileges                                                  
-- ============================================================ 
-- grant select, insert, update, delete on customer to public
-- ;
-- grant select, insert, update, delete on department to public
-- ;
-- grant select, insert, update, delete on employee to public
-- ;
-- grant select, insert, update, delete on fin_code to public
-- ;
-- grant select, insert, update, delete on fin_data to public
-- ;
-- grant select, insert, update, delete on product to public
-- ;
-- grant select, insert, update, delete on sales_order to public
-- ;
-- grant select, insert, update, delete on sales_order_items to public
-- ;
-- grant select, insert, update, delete on states cascade to public
-- ;
-- grant select, insert, update, delete on sales_regions to public
-- ;
-- grant select, insert, update, delete on examples to public
-- ;
-- grant select, insert, update, delete on examples_categories_list to public
-- ;
-- grant select, insert, update, delete on messages to public
-- ;
-- grant select on security_groupings to public
-- ;
-- grant select on security_info to public
-- ;
-- grant select on security_users to public
-- ;
-- grant select on security_apps to public
-- ;
-- grant select on security_template to public
-- ;


-- ============================================================ 
--   Load PFC Examples DB data                                  
-- ============================================================ 
alter session
	set NLS_DATE_FORMAT = 'YYYY-MM-DD';

set scan off;

-- ============================================================ 
--   Load messages table                                        
-- ============================================================ 
INSERT INTO messages VALUES (
	'pfc_closequery_savechanges',
	'Application',
	'Do you want to save changes?',
	'Exclamation',
	'YesNoCancel',
	1,
	0,
	'N',
	'N')
;
INSERT INTO messages VALUES (
	'pfc_closequery_failsvalidation',
	'Application',
	'The information entered does not pass validation and must be corrected before changes can be saved.~r~n~r~nClose without saving changes?',
	'Exclamation',
	'YesNo',
	2,
	5,
	'N',
	'N')
;
INSERT INTO messages VALUES (
	'pfc_requiredmissing',
	'Application',
	'Required value missing for %s on row %s.  Please enter a value.',
	'Information',
	'Ok',
	1,
	5,
	'N',
	'N')
;
INSERT INTO messages VALUES (
	'pfc_dwdberror',
	'Application',
	'%s',
	'StopSign',
	'Ok',
	1,
	20,
	'N',
	'N')
;
INSERT INTO messages VALUES (
	'pfc_systemerror',
	'System Error',
	'%s',
	'StopSign',
	'Ok',
	1,
	20,
	'N',
	'N')
;
INSERT INTO messages VALUES (
	'pfc_dwlinkage_rowchanging',
	'Application',
	'Updates are pending. ~r~nSave them now?',
	'Exclamation',
	'YesNoCancel',
	1,
	0,
	'N',
	'N')
;
INSERT INTO messages VALUES (
	'pfc_dwlinkage_predelete',
	'Application',
	'Delete row(s)?',
	'Exclamation',
	'OkCancel',
	1,
	0,
	'N',
	'N')
;
INSERT INTO messages VALUES (
	'pfc_dwlinkage_requiredmissing',
	'Application',
	'Required value missing for %s on row %s.  Please enter a value.',
	'Information',
	'Ok',
	1,
	5,
	'N',
	'N')
;
INSERT INTO messages VALUES (
	'pfc_dsaccepttext',
	'Application',
	'Failed accepttext validation on datastore.  Column  %s  on row  %s.',
	'Exclamation',
	'Ok',
	1,
	20,
	'N',
	'Y')
;
INSERT INTO messages VALUES (
	'pfc_requiredmissingondatastore',
	'Application',
	'Required value missing for %s on row %s.',
	'StopSign',
	'Ok',
	1,
	20,
	'N',
	'Y')
;
commit
;
-- ============================================================ 
--   Load sales_regions table                                   
-- ============================================================ 
INSERT INTO sales_regions VALUES (
	'Canada')
;
INSERT INTO sales_regions VALUES (
	'Central')
;
INSERT INTO sales_regions VALUES (
	'Eastern')
;
INSERT INTO sales_regions VALUES (
	'South')
;
INSERT INTO sales_regions VALUES (
	'Western')
;
commit
;
-- ============================================================ 
--   Load examples_categories_list table                          
-- ============================================================ 
INSERT INTO examples_categories_list VALUES (
	0,
	'PFC Examples',
	0,
	0,
	1,
	1,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	1,
	'Application Services',
	0,
	0,
	3,
	4,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	3,
	'Error Services Example',
	1,
	3,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	4,
	'Split Bar 3 Pane Style',
	44,
	4,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	5,
	'Conversion and Numerical Services',
	999,
	20,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	6,
	'DataWindow Services',
	0,
	0,
	3,
	4,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	7,
	'Linkage Services',
	0,
	0,
	3,
	4,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	8,
	'Save Process: All DW Scenarios',
	34,
	1,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	9,
	'Basic Retrieval Arguments',
	7,
	9,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	10,
	'Basic Scrolling',
	7,
	10,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	11,
	'Basic Filters',
	7,
	11,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	12,
	'Filter Service Dialogs',
	6,
	12,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	13,
	'Sort Service Dialogs',
	6,
	13,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	14,
	'Multiple Table Update',
	6,
	14,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	15,
	'Print Preview Service',
	6,
	15,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	17,
	'Row Manager Service',
	6,
	17,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	18,
	'Row Selection Service',
	6,
	18,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	19,
	'Required Column Service',
	6,
	19,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	21,
	'Drop-down Search Services',
	999,
	0,
	3,
	4,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	22,
	'Type Ahead in the DDLB & DDPLB',
	44,
	5,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	23,
	'Drop-down Search Service',
	6,
	6,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	25,
	'Find and Replace Service',
	6,
	7,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	26,
	'Find and Replace in a RTE',
	44,
	8,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	34,
	'Window Services',
	0,
	0,
	3,
	4,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	35,
	'Window Resize Service',
	34,
	26,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	36,
	'Status Bar',
	34,
	27,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	37,
	'Across Tab Pages',
	7,
	28,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	38,
	'Split Bar Explorer Style ',
	44,
	29,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	39,
	'Resize Dynamic Tab Pages',
	34,
	30,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	40,
	'Tab Control Object',
	999,
	0,
	3,
	4,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	41,
	'Filter Service Settings',
	6,
	31,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	42,
	'Refresh Drop-down DataWindows',
	6,
	32,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	43,
	'Dynamic Filter Expressions',
	6,
	33,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	44,
	'Objects',
	0,
	0,
	3,
	4,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	46,
	'Using Rich Text Edits with Files',
	999,
	35,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	47,
	'Using Rich Text Edits with Your Database',
	999,
	36,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	48,
	'Progress Bar Sampler',
	44,
	37,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	49,
	'Retrieval with Auto-updates',
	7,
	38,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	50,
	'Filter with Cascading Keys',
	7,
	39,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	52,
	'Filter with Cascading Deletes',
	7,
	41,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	53,
	'Split Bar Object',
	999,
	0,
	3,
	4,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	55,
	'Split Bars within a Window Object',
	999,
	43,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	56,
	'Progress Bar Object',
	999,
	0,
	3,
	4,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	57,
	'Resize Freeform DataWindow',
	6,
	44,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	58,
	'Resize Grid DataWindow',
	6,
	45,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	59,
	'DDDW Calculator and Calendar',
	6,
	46,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	60,
	'Weighted Resize of a Window',
	34,
	47,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	16,
	'(5.x) Basic Listview',
	27,
	16,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	65,
	'Basic Listview',
	27,
	53,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	27,
	'TreeView and Listview',
	0,
	0,
	3,
	4,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	28,
	'Basic Tree View',
	999,
	21,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	29,
	'(5.x) Treeview and a Listview',
	27,
	22,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	31,
	'(5.x) Update a Treeview',
	27,
	23,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	32,
	'Recursive Tree View',
	999,
	24,
	5,
	6,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	30,
	'Save Process',
	999,
	0,
	3,
	4,
	0,
	0)
;
INSERT INTO examples_categories_list VALUES (
	33,
	'A Logical Unit of Work',
	999,
	48,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	2,
	'Metaclass Example',
	999,
	2,
	5,
	4,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	61,
	'Basic Treeview',
	27,
	49,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	62,
	'Treeview Linked to a Listview',
	27,
	50,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	63,
	'Update a Treeview',
	27,
	51,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	64,
	'Recursive Tree View',
	999,
	52,
	5,
	6,
	1,
	0)
;
INSERT INTO examples_categories_list VALUES (
	20,
	'PFC 5.0 Treeview and Listview',
	999,
	0,
	3,
	4,
	0,
	0)
;
commit
;
-- ============================================================ 
--   Load examples table                                        
-- ============================================================ 
INSERT INTO examples VALUES (
	3,
	'Error Service Example',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_errormsgservice',
	NULL)
;
INSERT INTO examples VALUES (
	4,
	'Split Bar 3 Pane Style',
	NULL,
	NULL,
	'windowswinntsol2',
	'enterprisedesktop',
	0,
	'w_splitbar3panestyle',
	NULL)
;
INSERT INTO examples VALUES (
	1,
	'Save and Close Process for all DW Scenarios',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_dw3types',
	NULL)
;
INSERT INTO examples VALUES (
	23,
	'Updating a Treeview (5.x)',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_treeviewupdate',
	NULL)
;
INSERT INTO examples VALUES (
	24,
	'Recursive Tree View',
	NULL,
	NULL,
	'',
	'enterprisedesktop',
	0,
	'w_treeviewrecursive',
	NULL)
;
INSERT INTO examples VALUES (
	5,
	'Type Ahead in the DDLB & DDPLB',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_dropdownsearchlb',
	NULL)
;
INSERT INTO examples VALUES (
	6,
	'DataWindow Drop-down Search',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_dropdownsearchdw',
	NULL)
;
INSERT INTO examples VALUES (
	7,
	'Find and Replace in a DataWindow',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_findreplacedw',
	NULL)
;
INSERT INTO examples VALUES (
	8,
	'Find and Replace in a RTE Control',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_findreplacerte',
	NULL)
;
INSERT INTO examples VALUES (
	27,
	'Status Bar',
	NULL,
	NULL,
	'windowswinnt',
	'enterprisedesktop',
	0,
	'w_statusbarframe',
	NULL)
;
INSERT INTO examples VALUES (
	9,
	'Basic Linkage with Retrieval Arguments',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_linkageretrieve',
	NULL)
;
INSERT INTO examples VALUES (
	10,
	'Basic Linkage with Scrolling',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_linkagescroll',
	NULL)
;
INSERT INTO examples VALUES (
	11,
	'Basic Linkage with Filters',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_linkagefilter',
	NULL)
;
INSERT INTO examples VALUES (
	12,
	'Filter Service Dialogs Example',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_filterdialogs',
	NULL)
;
INSERT INTO examples VALUES (
	13,
	'Sort Service Dialogs Example',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_sort',
	NULL)
;
INSERT INTO examples VALUES (
	14,
	'Multiple Table Update Service',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_multiupdate',
	NULL)
;
INSERT INTO examples VALUES (
	15,
	'Print Preview Service',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_dwprintpreview',
	NULL)
;
INSERT INTO examples VALUES (
	35,
	'Using Rich Text Edits with Files',
	NULL,
	NULL,
	'',
	'enterprisedesktop',
	0,
	'w_rtewithfiles',
	NULL)
;
INSERT INTO examples VALUES (
	17,
	'Row Manager Service',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_rowmanager',
	NULL)
;
INSERT INTO examples VALUES (
	18,
	'Row Selection Service',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_rowselection',
	NULL)
;
INSERT INTO examples VALUES (
	19,
	'Required Columns Service',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_requiredfields',
	NULL)
;
INSERT INTO examples VALUES (
	20,
	'Conversion and Numerical Services',
	NULL,
	NULL,
	'',
	'enterprisedesktop',
	0,
	'w_conversioncalc',
	NULL)
;
INSERT INTO examples VALUES (
	26,
	'Window Resize Service',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_resizefind',
	NULL)
;
INSERT INTO examples VALUES (
	36,
	'Using Rich Text Edits with Your DataBase',
	NULL,
	NULL,
	'',
	'enterprisedesktop',
	0,
	'w_rtefromdbase',
	NULL)
;
INSERT INTO examples VALUES (
	1001,
	'[Methods Header Record]',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	NULL,
	NULL)
;
INSERT INTO examples VALUES (
	38,
	'Linkage by Retrieval Args:  Auto-updates',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_linkautoupdate',
	NULL)
;
INSERT INTO examples VALUES (
	33,
	'Dynamic Filter Expressions',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_buildfilter',
	NULL)
;
INSERT INTO examples VALUES (
	0,
	'[category Header Record]',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	NULL,
	NULL)
;
INSERT INTO examples VALUES (
	1000,
	'[Major Components Header Record]',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	NULL,
	NULL)
;
INSERT INTO examples VALUES (
	1002,
	'[Variables Header Record]',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	NULL,
	NULL)
;
INSERT INTO examples VALUES (
	37,
	'Progress Bar Sampler',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_progbarsampler',
	NULL)
;
INSERT INTO examples VALUES (
	53,
	'Basic Listview',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_listview6',
	NULL)
;
INSERT INTO examples VALUES (
	29,
	'Split Bar Explorer Style ',
	NULL,
	NULL,
	'windowswinntsol2',
	'enterprisedesktop',
	0,
	'w_splitbarexplorerstyle',
	NULL)
;
INSERT INTO examples VALUES (
	30,
	'Resize Dynamic Tab Pages',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_tabresize',
	NULL)
;
INSERT INTO examples VALUES (
	44,
	'Resize a Freeform DataWindow',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_dwresizeff',
	NULL)
;
INSERT INTO examples VALUES (
	45,
	'Resize a Grid DataWindow',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_dwresizegrid',
	NULL)
;
INSERT INTO examples VALUES (
	47,
	'Weighted Resize of a Window',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_resizedwsyntax',
	NULL)
;
INSERT INTO examples VALUES (
	49,
	'Basic Treeview',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_treeview6',
	NULL)
;
INSERT INTO examples VALUES (
	50,
	'Linking a Treeview with a Listview',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_treeviewlistview6',
	NULL)
;
INSERT INTO examples VALUES (
	51,
	'Updating a Treeview',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_treeviewupdate6',
	NULL)
;
INSERT INTO examples VALUES (
	48,
	'Logical Unit of Work',
	NULL,
	NULL,
	'',
	'enterprisedesktop',
	0,
	'w_luw',
	NULL)
;
INSERT INTO examples VALUES (
	2,
	'Metaclass Example',
	NULL,
	NULL,
	'',
	'enterprisedesktop',
	0,
	'w_metaclass',
	NULL)
;
INSERT INTO examples VALUES (
	28,
	'Linkage Across Tab Pages',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_tablink',
	NULL)
;
INSERT INTO examples VALUES (
	31,
	'Filter Service Settings',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_filtersettings',
	NULL)
;
INSERT INTO examples VALUES (
	32,
	'Refresh Drop-down DataWindows',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_refreshdddws',
	NULL)
;
INSERT INTO examples VALUES (
	21,
	'Basic Tree View',
	NULL,
	NULL,
	'',
	'enterprisedesktop',
	0,
	'w_treeview',
	NULL)
;
INSERT INTO examples VALUES (
	22,
	'Linking a Treeview with a Listview (5.x)',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_treeviewlistview',
	NULL)
;
INSERT INTO examples VALUES (
	41,
	'Linkage by Filter:  Cascading Deletes',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_linkcascadedeletes',
	NULL)
;
INSERT INTO examples VALUES (
	39,
	'Linkage by Filter:  Cascading Keys',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_linkcascadekeys',
	NULL)
;
INSERT INTO examples VALUES (
	46,
	'DDDW Calculator and Calendar Sampler',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_ddcalsamp',
	NULL)
;
INSERT INTO examples VALUES (
	16,
	'Basic Listview (5.x)',
	NULL,
	NULL,
	'windowswinntmacintoshsol2',
	'enterprisedesktop',
	0,
	'w_listview',
	NULL)
;
INSERT INTO examples VALUES (
	43,
	'Split Bars within a Window Object',
	NULL,
	NULL,
	'',
	'enterprisedesktop',
	0,
	'w_splitbarwin',
	NULL)
;
INSERT INTO examples VALUES (
	52,
	'Recursive Tree View',
	NULL,
	NULL,
	'',
	'enterprisedesktop',
	0,
	'w_treeviewrecursive6',
	NULL)
;
commit
;
-- ============================================================ 
--   Load customer table                                        
-- ============================================================ 
INSERT INTO customer VALUES (
	101,
	'Michaels',
	'Devlin',
	'3114 Pioneer Avenue',
	'Rutherford',
	'NJ',
	'07070',
	'2015558966',
	'The Power Group')
;
INSERT INTO customer VALUES (
	102,
	'Beth',
	'Reiser',
	'1033 Whippany Road ',
	'New York',
	'NY',
	'10154',
	'2125558725',
	'AMF Corp.')
;
INSERT INTO customer VALUES (
	103,
	'Erin',
	'Niedringhaus',
	'1990 Windsor Street ',
	'Paoli',
	'PA',
	'19301',
	'2155556513',
	'Darling Associates')
;
INSERT INTO customer VALUES (
	104,
	'Meghan',
	'Mason',
	'550 Dundas Street East',
	'Knoxville',
	'TN',
	'37919',
	'6155555463',
	'P.S.C.')
;
INSERT INTO customer VALUES (
	105,
	'Laura',
	'McCarthy',
	'1210 Highway 36 ',
	'Carmel',
	'IN',
	'46032',
	'3175558437',
	'Amo & Sons')
;
INSERT INTO customer VALUES (
	106,
	'Paul',
	'Phillips',
	'2000 Cherry Creek N. Dr. ',
	'Middletown',
	'CT',
	'64579    ',
	'2035553464',
	'Ralston Inc.')
;
INSERT INTO customer VALUES (
	107,
	'Kelly',
	'Colburn',
	'18131 Vallco Parkway ',
	'Raleigh',
	'NC',
	'27695-7209',
	'9195555152',
	'The Home Club')
;
INSERT INTO customer VALUES (
	108,
	'Matthew',
	'Goforth',
	'11801 Wayzata Blvd. ',
	'Chattanooga',
	'TN',
	'37421',
	'6155558926',
	'Raleigh Co.')
;
INSERT INTO customer VALUES (
	109,
	'Jessie',
	'Gagliardo',
	'2800 Park Avenue ',
	'Hull',
	'PQ',
	'K1A 0H3',
	'8195559539',
	'Newton Ent.')
;
INSERT INTO customer VALUES (
	110,
	'Michael',
	'Agliori',
	'13705 North Glebe Road ',
	'Columbus',
	'OH',
	'43216',
	'6145552496',
	'The Pep Squad')
;
INSERT INTO customer VALUES (
	111,
	'Dylan',
	'Ricci',
	'14700 Prosperity Avenue ',
	'Syracuse',
	'NY',
	'13202',
	'3155554486',
	'Dynamics Inc.')
;
INSERT INTO customer VALUES (
	112,
	'Shawn',
	'McDonough',
	'15175 S Main Street ',
	'Brooklyn Park',
	'MN',
	'55428',
	'6125555603',
	'McManus Inc.')
;
INSERT INTO customer VALUES (
	113,
	'Samuel',
	'Kaiser',
	'404 Bristol Street ',
	'Minneapolis',
	'MN',
	'55041',
	'6125553409',
	'Lakes Inc.')
;
INSERT INTO customer VALUES (
	114,
	'Shane',
	'Chopp',
	'9925 Summer Street ',
	'St Paul',
	'MN',
	'55104',
	'6125556453',
	'Howard Co.')
;
INSERT INTO customer VALUES (
	115,
	'Shannon',
	'Phillips',
	'20555 Cory Road ',
	'St Paul',
	'MN',
	'55114',
	'6125556425',
	'Sterling & Co.')
;
INSERT INTO customer VALUES (
	116,
	'Brian',
	'Gugliuzza',
	'39111 Wyman Street ',
	'Mamaroneck',
	'NY',
	'10543',
	'9145553817',
	'Sampson & Sons')
;
INSERT INTO customer VALUES (
	117,
	'Meredith',
	'Morgan',
	'9191 Galveston Drive ',
	'Westerville',
	'OH',
	'43081',
	'6145558989',
	'Square Sports')
;
INSERT INTO customer VALUES (
	118,
	'Kristina',
	'Sanford',
	'2196th Street ',
	'Raleigh',
	'NC',
	'27695-7209',
	'9195555152',
	'Raleigh Active Wear')
;
INSERT INTO customer VALUES (
	119,
	'Tomm',
	'Smith',
	'3 Post Oak Blvd. ',
	'South Laguna',
	'CA',
	'92677',
	'7145554996',
	'Ocean Sports')
;
INSERT INTO customer VALUES (
	120,
	'Gertrude',
	'Stein',
	'4 Amon Carter Blvd. ',
	'Elmsford',
	'NY',
	'10523',
	'9145553476',
	'Carney Co.')
;
INSERT INTO customer VALUES (
	121,
	'Pete',
	'Elkins',
	'23 Lawerence Street ',
	'Carmel',
	'IN',
	'46032',
	'3175558437',
	'Carmel Industries')
;
INSERT INTO customer VALUES (
	122,
	'Al',
	'Dente',
	'25 N.E. 38th Place ',
	'McLean',
	'VA',
	'22102',
	'7035557491',
	'Virgina Power')
;
INSERT INTO customer VALUES (
	123,
	'Amanda',
	'Lin',
	'25 North Pine Grove ',
	'Winnipeg',
	'MB',
	'R3C 3V6',
	'2045555559',
	'North Land Trading')
;
INSERT INTO customer VALUES (
	124,
	'Fanny',
	'Farmer',
	'110 Barnard Lane ',
	'Wilmington',
	'MA',
	'01887',
	'6175559386',
	'The Ristuccia Center')
;
INSERT INTO customer VALUES (
	125,
	'Sidney',
	'Smelledge',
	'125 Merritt Drive ',
	'St. Louis',
	'MO',
	'63101',
	'3145553426',
	'Bush Pro Shop')
;
INSERT INTO customer VALUES (
	126,
	'Sam',
	'Ovar',
	'5 Lindenwood Drive ',
	'San Francisco',
	'CA',
	'94105',
	'4155555972',
	'Golden Gate Active Wear')
;
INSERT INTO customer VALUES (
	127,
	'Mary',
	'Lamm',
	'10 McKinney',
	'Sarasota',
	'FL',
	'34243',
	'8135557566',
	'The Palms')
;
INSERT INTO customer VALUES (
	128,
	'Hardy',
	'Mums',
	'11 5th Avenue S.W. ',
	'Boston',
	'MA',
	'02106',
	'6175554340',
	'BoSox Club')
;
INSERT INTO customer VALUES (
	129,
	'Heinz',
	'Fahrvergnugen',
	'11 Armagh Street ',
	'Baltimore',
	'MD',
	'21202',
	'3015553322',
	'Camden Sports Apparel')
;
INSERT INTO customer VALUES (
	130,
	'Sal',
	'Monella',
	'20th Eastlake Avenue  ',
	'New Berlin',
	'WI',
	'53141',
	'4145556799',
	'Wyse Corp.')
;
INSERT INTO customer VALUES (
	131,
	'Daljit',
	'Sinnot',
	'145 Presidents Landing ',
	'Bohemia',
	'NY',
	'11716',
	'5165559811',
	'The Pro Shopp')
;
INSERT INTO customer VALUES (
	132,
	'Marilyn',
	'King',
	'167 South Ulster',
	'Fort Wayne',
	'IN',
	'46801',
	'2195554551',
	'Bristol Co.')
;
INSERT INTO customer VALUES (
	133,
	'Moe',
	'Bilhome',
	'180 W. Colfax Avenue ',
	'Burbank',
	'CA',
	'91505',
	'8185558455',
	'Bilhome Industries')
;
INSERT INTO customer VALUES (
	134,
	'Paddy',
	'O''Furniture',
	'1180 W. Las Colinas ',
	'Mogadore',
	'OH',
	'44260',
	'2165556283',
	'Gifts & Things')
;
INSERT INTO customer VALUES (
	135,
	'Belinda',
	'Clarke',
	'204 Constitution Avenue ',
	'New York',
	'NY',
	'10001',
	'2125555026',
	'Hermanns')
;
INSERT INTO customer VALUES (
	136,
	'Tommie',
	'Wooten',
	'1322 Hing Wai Building ',
	'Plymouth',
	'MN',
	'55447',
	'6125553373',
	'Leisure Time')
;
INSERT INTO customer VALUES (
	137,
	'Polly',
	'Morfek',
	'879 Hopyard Road ',
	'Ft. Wayne',
	'IN',
	'46808',
	'2195554297',
	'Sports Plus')
;
INSERT INTO customer VALUES (
	138,
	'Regus',
	'Patoff',
	'22 James Way ',
	'Burlington',
	'ON',
	'L7N 5L1',
	'9065554252',
	'Sports Replay')
;
INSERT INTO customer VALUES (
	139,
	'Jai',
	'Dimitros',
	'236 Marineship Way ',
	'Boston',
	'MA',
	'02201',
	'6175556354',
	'Martins Landing')
;
INSERT INTO customer VALUES (
	140,
	'Thomas',
	'Thumb',
	'250 North Vine Street ',
	'Salt Lake City',
	'UT',
	'84180',
	'8015553550',
	'Ski,Ski,Ski')
;
INSERT INTO customer VALUES (
	141,
	'Peter',
	'Pyper',
	'408 Beta Mall',
	'Fort Wayne',
	'IN',
	'46801',
	'2195554552',
	'Mall Side Sports')
;
INSERT INTO customer VALUES (
	142,
	'Alfredo',
	'Margolis',
	'400 Bloor Street East',
	'Kansas City',
	'MO',
	'64114',
	'8165558543',
	'Creative Customs Inc.')
;
INSERT INTO customer VALUES (
	143,
	'Peter',
	'Piper',
	'3100 Stevens Creek Blvd. ',
	'Winnipeg',
	'MB',
	'R3C 3V6',
	'2045559414',
	'Molly''s')
;
INSERT INTO customer VALUES (
	144,
	'Fangmei',
	'Wan',
	'4513 E. Hillsdale ',
	'Stowe',
	'MA',
	'01775',
	'5085558979',
	'Green Acre''s Custom Tee''s')
;
INSERT INTO customer VALUES (
	145,
	'John',
	'Doe',
	'357 Wellworth Ave ',
	'Fairfax',
	'VA',
	'22030',
	'7035552184',
	'Doe, Rae, Mee')
;
INSERT INTO customer VALUES (
	146,
	'Alberto',
	'Yost',
	'375 White Horse Road ',
	'Spokane',
	'WA',
	'99216',
	'5095559276',
	'Custom Designs')
;
INSERT INTO customer VALUES (
	147,
	'Manoj',
	'Lela',
	'501 Third Avenue North ',
	'Wood Bridge',
	'NJ',
	'07095',
	'9085556021',
	'Norton Co.')
;
INSERT INTO customer VALUES (
	148,
	'Beth',
	'Crooker',
	'501 College Road ',
	'Winnepeg',
	'MB',
	'R3C 2P4',
	'2045555554',
	'Cooper Inc.')
;
INSERT INTO customer VALUES (
	149,
	'Hans',
	'Uhnfitte',
	'3700 West Wacker Dr ',
	'Winnepeg',
	'MB',
	'R3C `2P4',
	'2045554744',
	'The Ultimate ')
;
INSERT INTO customer VALUES (
	150,
	'Carl',
	'Mason',
	'1000 Powell Street ',
	'Don Mills',
	'ON',
	'M3C 3N4',
	'4165555108',
	'Power Play')
;
INSERT INTO customer VALUES (
	151,
	'Balwinder',
	'Sinitskaya',
	'1133 Century Blvd ',
	'Overland Park',
	'KS',
	'66210',
	'9135554519',
	'Toto''s Active Wear')
;
INSERT INTO customer VALUES (
	152,
	'Davey',
	'Jones',
	'1218 Inelt Business Ctr. ',
	'Austin',
	'NY',
	'11746',
	'5165555952',
	'Play it again Sports')
;
INSERT INTO customer VALUES (
	153,
	'Paul',
	'Jones',
	'1221 Innovation Drive ',
	'Cincinnati',
	'OH',
	'45202',
	'5135557622',
	'Three Rivers Pro Shop')
;
INSERT INTO customer VALUES (
	154,
	'Marvin',
	'Smythe',
	'1291 North 27th Ave ',
	'North Miami',
	'FL',
	'33181',
	'3055559457',
	'Marlin Mainia')
;
INSERT INTO customer VALUES (
	155,
	'Milo',
	'Phipps',
	'1380 Osterbrogade ',
	'Lakewood',
	'OH',
	'44107',
	'2165552264',
	'Things Remembered')
;
INSERT INTO customer VALUES (
	156,
	'Sue',
	'DuCode',
	'1515 San Thomas Avenue ',
	'St Louis',
	'MO',
	'63131',
	'3145558227',
	'Ozzie''s Haven')
;
INSERT INTO customer VALUES (
	157,
	'William',
	'Watcom',
	'1615 Silver Lake Road ',
	'Chicago',
	'IL',
	'60645',
	'3125557433',
	'The Cub''s Den')
;
INSERT INTO customer VALUES (
	158,
	'Jack',
	'Cass',
	'3626 West Court Street ',
	'Lexington',
	'MA',
	'02173',
	'6175558610',
	'Jordan''s Basement')
;
INSERT INTO customer VALUES (
	159,
	'Rick',
	'Shaw',
	'3715 West Loop South ',
	'West Bloomfield',
	'MI',
	'48324',
	'3135553638',
	'ScrimShaw''s')
;
INSERT INTO customer VALUES (
	160,
	'Clara',
	'Nette',
	'3773 Wilshire Blvd ',
	'Port Washington',
	'NY',
	'11050',
	'5165556250',
	'Discount Department Store')
;
INSERT INTO customer VALUES (
	161,
	'Gene',
	'Poole',
	'3860 Vreeland Road ',
	'Washington',
	'DC',
	'20581',
	'2025556537',
	'State House Active Wear')
;
INSERT INTO customer VALUES (
	162,
	'Melba',
	'Toste',
	'3930 51st Ave North ',
	'Powell',
	'OH',
	'43065',
	'6145558983',
	'The Real Deal')
;
INSERT INTO customer VALUES (
	163,
	'R.I.',
	'Peese',
	'4199 Buckingham ',
	'Mississauga',
	'ON',
	'L4W 2S6',
	'4165556026',
	'Mount Eastern Sports')
;
INSERT INTO customer VALUES (
	164,
	'Aram',
	'Najarian',
	'200 Cambridge Center ',
	'Danbury',
	'CT',
	'6811',
	'2035557907',
	'Bloomfield''s')
;
INSERT INTO customer VALUES (
	165,
	'Tamara',
	'Mournen',
	'42 Choke Cherry Road ',
	'Ft. Wayne',
	'IN',
	'46808',
	'2195554297',
	'Moran''s Gift Shop')
;
INSERT INTO customer VALUES (
	166,
	'Malcolm',
	'Naddem',
	'4255 Commerce Parkway ',
	'Buford',
	'GA',
	'30518',
	'4045552529',
	'Hospital Gift''s')
;
INSERT INTO customer VALUES (
	167,
	'Nicklas',
	'Cara',
	'1700 State Highway 249 ',
	'Lakewood',
	'OH',
	'44107',
	'2165552264',
	'The Road Side Inn')
;
INSERT INTO customer VALUES (
	168,
	'Almen',
	'de Joie',
	'1750 Sweitzer Lane ',
	'Huntington Beach',
	'CA',
	'92649',
	'7145555475',
	'Surf''s Up!')
;
INSERT INTO customer VALUES (
	169,
	'Laura',
	'Terlemezian',
	'240 First Street',
	'Matthews',
	'NC',
	'28105',
	'7045558411',
	'CoMed')
;
INSERT INTO customer VALUES (
	170,
	'Manh',
	'Neubauer',
	'2140 Haddington Street ',
	'Jacksonville',
	'FL',
	'32206',
	'9045553551',
	'Jason''s Sporting Goods')
;
INSERT INTO customer VALUES (
	171,
	'Vincent',
	'Nahra',
	'2180 Harwin Drive ',
	'West Chicago',
	'IL',
	'60185-1120',
	'3125555551',
	'Iron Mike''s Apparel')
;
INSERT INTO customer VALUES (
	172,
	'Grace',
	'Perez',
	'395 Market Street ',
	'Landover',
	'MA',
	'20785',
	'3015557728',
	'Avon Inc.')
;
INSERT INTO customer VALUES (
	173,
	'Grover',
	'Pendelton',
	'239 Merritt Drive ',
	'Clarksburg',
	'MD',
	'20871',
	'3015554284',
	'Simply Tee''s')
;
INSERT INTO customer VALUES (
	174,
	'Anabai',
	'Zoblotny',
	'12600 N.E. Airport Way ',
	'Denver',
	'CO',
	'80225',
	'3035552757',
	'Hats Etc.')
;
INSERT INTO customer VALUES (
	175,
	'Tawfik',
	'Perkins',
	'1270 N.W. 7th Avenue ',
	'Victoria',
	'BC',
	'V8W 2B7',
	'6045553801',
	'The Hat Company')
;
INSERT INTO customer VALUES (
	176,
	'Helen',
	'Shumovich',
	'2800 Park Plaza #1800 ',
	'Baltimore',
	'MD',
	'21209',
	'4105553322',
	'The Bird''s Loft')
;
INSERT INTO customer VALUES (
	177,
	'Joseph',
	'Zubenko',
	'314 Stonehollow Drive ',
	'Raleigh',
	'NC',
	'27695',
	'9195555152',
	'Avco Ent.')
;
INSERT INTO customer VALUES (
	178,
	'Suresh',
	'Naidu',
	'321 Sycamore Drive',
	'New London',
	'CT',
	'6320',
	'2035554440',
	'Amy''s Silk Screening')
;
INSERT INTO customer VALUES (
	179,
	'Marsha',
	'Nguyen',
	'44 Dunlaney Gate Circle ',
	'Miramar',
	'FL',
	'33027',
	'3055554336',
	'Resco')
;
INSERT INTO customer VALUES (
	180,
	'Edith',
	'Peros',
	'50 Market Street ',
	'Rochester',
	'NY',
	'14624',
	'7165554275',
	'Breswick''s Department Store')
;
INSERT INTO customer VALUES (
	181,
	'Emunah',
	'Teeven',
	'101 Wilshire Blvd. ',
	'Washington',
	'DC',
	'20240',
	'2025552083',
	'Hometown Tee''s')
;
INSERT INTO customer VALUES (
	182,
	'Leilani',
	'Gardner',
	'103 Campus Drive ',
	'Acworth',
	'CA',
	'30102',
	'4045559283',
	'Polly''s Custom Design')
;
INSERT INTO customer VALUES (
	183,
	'Marilyn',
	'Nakagama',
	'105 Central Avenue ',
	'Winter Park',
	'FL',
	'32792',
	'4075556776',
	'Zoo Gift Shop')
;
INSERT INTO customer VALUES (
	184,
	'Anoush',
	'Serafina',
	'4643 Greenway Place ',
	'Overland Park',
	'KS',
	'66210',
	'9135554519',
	'Westend Dealers')
;
INSERT INTO customer VALUES (
	185,
	'Serop',
	'Belmont',
	'4867 Hadley Lane',
	'Hartford',
	'CT',
	'6115',
	'2035555474',
	'The Heartford')
;
INSERT INTO customer VALUES (
	186,
	'Thao',
	'Tenorio',
	'5000 Midway Road ',
	'Kansas City',
	'MO',
	'64105',
	'8165558543',
	'Wally''s World ')
;
INSERT INTO customer VALUES (
	187,
	'Sebouh',
	'Bensoul',
	'8024 Van Ness Way ',
	'Peoria',
	'IL',
	'61614',
	'3095556915',
	'Bensoul''s Boutique')
;
INSERT INTO customer VALUES (
	188,
	'Vartan',
	'Berenberg',
	'1020 110th Avenue N.E. ',
	'Northbrook',
	'IL',
	'60062',
	'7085552914',
	'Diva''s Design')
;
INSERT INTO customer VALUES (
	189,
	'Herbert',
	'Berejiklian',
	'1535 Municiple Drive ',
	'Cambridge',
	'MA',
	'02142',
	'6175553547',
	'Out of Town Sports')
;
INSERT INTO customer VALUES (
	190,
	'Randy',
	'Arlington',
	'1635 N Franklin Turnpike ',
	'Detriot',
	'MI',
	'48214',
	'3135555716',
	'Jim Dandy''s')
;
INSERT INTO customer VALUES (
	191,
	'Marta',
	'Richards',
	'10707 Northridge Road ',
	'Miami',
	'FL',
	'33172',
	'3055554711',
	'Ocean Sports Wear')
;
INSERT INTO customer VALUES (
	192,
	'Rosanna',
	'Beldov',
	'1889 Northside Parkway ',
	'Sioux City',
	'IA',
	'51102',
	'7125552741',
	'Morrell Inc.')
;
INSERT INTO customer VALUES (
	193,
	'Alfred',
	'Newman',
	'2721 Northeast 99th Way ',
	'Kansas City',
	'MO',
	'64114',
	'8165558543',
	'Big Sky Design')
;
INSERT INTO customer VALUES (
	194,
	'Jen-Chang',
	'Chin',
	'2770 Oyster Point Blvd ',
	'Fairfax',
	'VA',
	'02203',
	'7035558037',
	'Cinnamon Rainbow''s')
;
INSERT INTO customer VALUES (
	195,
	'Li-Hui',
	'Jyh-Hwa',
	'301 Potrero Avenue ',
	'Atlanta',
	'GA',
	'30303',
	'4045556762',
	'Peachtree Active Wear')
;
INSERT INTO customer VALUES (
	196,
	'Ling Ling',
	'Andrews',
	'303 Roe Avenue ',
	'Edmonton',
	'AB',
	'T5N 1S5',
	'4035554884',
	'The Igloo')
;
INSERT INTO customer VALUES (
	197,
	'Maio',
	'Chermak',
	'330 Sycamore Road ',
	'Atlanta',
	'GA',
	'30346',
	'4045558046',
	'Southern Sports')
;
INSERT INTO customer VALUES (
	198,
	'Sheng',
	'Chen',
	'1801 W. Six Mile Road ',
	'San Ramon',
	'CA',
	'94583',
	'5105558666',
	'Able Inc.')
;
INSERT INTO customer VALUES (
	199,
	'Ella',
	'Mentary',
	'452 Embarcadero Center ',
	'Rochester',
	'NY',
	'14644',
	'7165554236',
	'Nobel Co.')
;
INSERT INTO customer VALUES (
	200,
	'Helen',
	'Chau',
	'1900 Yamato Road ',
	'North Potomac',
	'MD',
	'20878',
	'3015553099',
	'Stone''s Sporting Goods')
;
INSERT INTO customer VALUES (
	201,
	'Amit',
	'Singh',
	'1986 Yonge Street',
	'Overland Park',
	'KS',
	'66210',
	'9135554519',
	'Overland Army Navy')
;
INSERT INTO customer VALUES (
	202,
	'Bubba',
	'Murphy',
	'2401 N. 44th Street ',
	'White Plains',
	'NY',
	'10604',
	'9145556961',
	'Dane''s World')
;
INSERT INTO customer VALUES (
	203,
	'Salton',
	'Pepper',
	'401 Boylston Street',
	'Madison',
	'WI',
	'53705',
	'6085552673',
	'Salt & Pepper''s')
;
INSERT INTO customer VALUES (
	204,
	'Robert',
	'Spaid',
	'333 Town Center ',
	'Jackson',
	'MI',
	'49202',
	'5175557883',
	'Cognos Sports')
;
INSERT INTO customer VALUES (
	205,
	'Elmo',
	'Smythe',
	'2815 Plaza Street ',
	'East Douglas',
	'MA',
	'01516',
	'5085554761',
	'East Coast Traders')
;
INSERT INTO customer VALUES (
	206,
	'JohnPaul',
	'Jones',
	'2999 Post Oak Blvd. ',
	'Reston',
	'VA',
	'22091',
	'7035556209',
	'Chadwicks')
;
INSERT INTO customer VALUES (
	207,
	'Wen-Chu',
	'Donchek',
	'2406 N. Mission ',
	'Lisle',
	'IL',
	'60532',
	'7085555055',
	'The Country Store')
;
INSERT INTO customer VALUES (
	208,
	'Derek',
	'Suess',
	'234 King George Drive',
	'Albany',
	'NY',
	'12208',
	'5185552623',
	'Capital Center Sports')
;
INSERT INTO customer VALUES (
	209,
	'Laura',
	'Boyle',
	'130 Pillsbury Road',
	'Los Altos',
	'CA',
	'94022',
	'4155559678',
	'Boyle''s Swap Meet')
;
INSERT INTO customer VALUES (
	220,
	'Lewis N.',
	'Clark',
	'245 Expedition Hwy',
	'Laramie',
	'WY',
	'85293',
	'3075556589',
	'Trek Outfitters')
;
INSERT INTO customer VALUES (
	221,
	'Jack ',
	'Johnson',
	'45 Shoebox Lane',
	'Santa Fe',
	'NM',
	'40420',
	'5055554568',
	'Turkey Creek Co.')
;
INSERT INTO customer VALUES (
	222,
	'Jane',
	'Doe',
	'57 Disk Drive',
	'San Jose',
	'CA',
	'94020',
	'4085558796',
	'data Recovery Services')
;
INSERT INTO customer VALUES (
	330,
	'John',
	'Glenn',
	'90 Rocket Pad',
	'Orlando',
	'FL',
	'32200',
	'4075558574',
	'Launch Facilities')
;
INSERT INTO customer VALUES (
	331,
	'Dominic',
	'Johansen',
	'33 West Street',
	'New Orleans',
	'LA',
	'33552',
	'5045558487',
	'Mardi Gras Parties')
;
INSERT INTO customer VALUES (
	332,
	'Stanley',
	'Jue',
	'67 Bronco Circle',
	'Houston',
	'TX',
	'77057',
	'7135558857',
	'Bay Town Bus Co.')
;
INSERT INTO customer VALUES (
	333,
	'Harry',
	'Jones',
	'25 Software Rd',
	'San Jose',
	'CA',
	'94020',
	'4085556689',
	'Bits & Bytes')
;
INSERT INTO customer VALUES (
	440,
	'Marie',
	'Curie',
	'210 Helping Hand Hwy',
	'LeCroix',
	'MA',
	'02140',
	'6175558875',
	'Wind & Rain')
;
INSERT INTO customer VALUES (
	441,
	'Elizibeth',
	'Bordon',
	'87 Grinding Stone Rd',
	'New Bedford',
	'MA',
	'01801',
	'5085558879',
	'Blades & things')
;
INSERT INTO customer VALUES (
	444,
	'Len',
	'Manager',
	'23 Network Way',
	'Dallas',
	'TX',
	'76552',
	'2145552685',
	'Let''s get Connected')
;
INSERT INTO customer VALUES (
	550,
	'Tony',
	'Antolini',
	'6678 Sliver Road',
	'Fargo',
	'ND',
	'60500',
	'7015553259',
	'Flat Landers')
;
INSERT INTO customer VALUES (
	551,
	'Tom',
	'Cruz',
	'789 Far Away Lane',
	'Eugene',
	'OR',
	'98524',
	'5035557462',
	'Raceway Engines')
;
INSERT INTO customer VALUES (
	552,
	'Janice',
	'O''Toole',
	'654 West Hill',
	'Nashville',
	'TN',
	'37320',
	'6155553689',
	'Greensleeves')
;
INSERT INTO customer VALUES (
	553,
	'Stevie',
	'Nickolas',
	'77 Recordings Circle',
	'Tacoma',
	'WA',
	'96521',
	'5095551695',
	'It''s a Hit!')
;
INSERT INTO customer VALUES (
	555,
	'Philipe',
	'Fernandez',
	'99 Main Street',
	'Los Angeles',
	'CA',
	'90205',
	'2135554457',
	'Quaker Fashions')
;
INSERT INTO customer VALUES (
	661,
	'Jennifer',
	'Stutzman',
	'3 Back Pages Lane',
	'Missola',
	'IL',
	'60505',
	'7085556857',
	'Stutzman Advertising')
;
INSERT INTO customer VALUES (
	665,
	'William',
	'Thompson',
	'91 Washington Street',
	'Manchester',
	'NY',
	'11700',
	'5165552549',
	'The Apple Farm')
;
commit
;
-- ============================================================ 
--   Load department table                                      
-- ============================================================ 
INSERT INTO department VALUES (
	100,
	'R & D',
	501)
;
INSERT INTO department VALUES (
	200,
	'Sales',
	902)
;
INSERT INTO department VALUES (
	300,
	'Finance',
	1293)
;
INSERT INTO department VALUES (
	400,
	'Marketing',
	1576)
;
INSERT INTO department VALUES (
	500,
	'Shipping',
	703)
;
commit
;
-- ============================================================ 
--   Load employee table                                        
-- ============================================================ 
INSERT INTO employee VALUES (
	102,
	501,
	'Fran',
	'Whitney',
	100,
	'49 East Washington Street',
	'Needham',
	'MA',
	'02192    ',
	'6175553985',
	'A',
	'017349033',
	45700.000,
	'1986-02-26',
	NULL,
	'1958-06-05',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	105,
	501,
	'Matthew',
	'Cobb',
	100,
	'77 Pleasant Street',
	'Waltham',
	'MA',
	'02154    ',
	'6175553840',
	'A',
	'052345739',
	62000.000,
	'1986-07-02',
	NULL,
	'1960-12-04',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	129,
	902,
	'Philip',
	'Chin',
	200,
	'59 Pond Street',
	'Atlanta',
	'GA',
	'30339    ',
	'4045552341',
	'A',
	'024608923',
	38500.000,
	'1986-08-04',
	NULL,
	'1966-10-30',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	148,
	1293,
	'Julie',
	'Jordan',
	300,
	'144 Great Plain Avenue',
	'Winchester',
	'MA',
	'01890    ',
	'6175557835',
	'A',
	'501704733',
	51432.000,
	'1986-10-04',
	NULL,
	'1951-12-13',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	160,
	501,
	'Robert',
	'Breault',
	100,
	'58 Cherry Street',
	'Milton',
	'MA',
	'02186    ',
	'6175553099',
	'A',
	'025487623',
	57490.000,
	'1986-12-16',
	NULL,
	'1947-05-13',
	'Y',
	'Y',
	'Y',
	'M')
;
INSERT INTO employee VALUES (
	184,
	1576,
	'Melissa',
	'Espinoza',
	400,
	'112 Apple Tree Way',
	'Stow',
	'MA',
	'01775    ',
	'5085552319',
	'A',
	'025481943',
	36490.000,
	'1987-04-18',
	NULL,
	'1939-12-14',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	191,
	703,
	'Jeannette',
	'Bertrand',
	500,
	'209 Concord Street',
	'Acton',
	'MA',
	'01720    ',
	'5085558138',
	'A',
	'017348821',
	32780.000,
	'1987-05-20',
	NULL,
	'1964-12-21',
	'Y',
	'Y',
	'Y',
	'F')
;
INSERT INTO employee VALUES (
	195,
	902,
	'Marc',
	'Dill',
	200,
	'89 Hancock Street',
	'Milton',
	'MA',
	'02186    ',
	'6175552144',
	'A',
	'079486634',
	54800.000,
	'1987-06-06',
	NULL,
	'1963-07-19',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	207,
	1576,
	'Jane',
	'Francis',
	400,
	'12 Hawthorne Drive',
	'Concord',
	'MA',
	'01742    ',
	'5085559022',
	'A',
	'501708992',
	53870.000,
	'1987-08-04',
	NULL,
	'1954-09-12',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	243,
	501,
	'Natasha',
	'Shishov',
	100,
	'15 Milk Street ',
	'Waltham',
	'MA',
	'02154    ',
	'6175552755',
	'A',
	'043216799',
	72995.000,
	'1987-12-06',
	NULL,
	'1949-04-22',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	247,
	501,
	'Kurt',
	'Driscoll',
	100,
	'154 School Street',
	'Waltham',
	'MA',
	'02154',
	'6175551234',
	'L',
	'024601768',
	48023.690,
	'1987-12-30',
	NULL,
	'1955-03-05',
	'Y',
	'Y',
	'Y',
	'M')
;
INSERT INTO employee VALUES (
	249,
	501,
	'Rodrigo',
	'Guevara',
	100,
	'East Main Street',
	'Framingham',
	'MA',
	'01701    ',
	'5085550029',
	'A',
	'084329990',
	42998.000,
	'1988-04-13',
	NULL,
	'1956-11-23',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	266,
	501,
	'Ram',
	'Gowda',
	100,
	'79 Page Street',
	'Natick',
	'MA',
	'01760    ',
	'5085558722',
	'A',
	'017346122',
	59840.000,
	'1988-05-30',
	NULL,
	'1947-10-18',
	'N',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	278,
	501,
	'Terry',
	'Melkisetian',
	100,
	'87 Oxford Road',
	'Watertown',
	'MA',
	'02172    ',
	'6175555188',
	'A',
	'087602311',
	48500.000,
	'1988-06-05',
	NULL,
	'1966-05-17',
	'Y',
	'Y',
	'Y',
	'F')
;
INSERT INTO employee VALUES (
	298,
	902,
	'Rollin',
	'Overbey',
	200,
	'1915 Companion Ct.',
	'Emeryville',
	'CA',
	'94608    ',
	'5105557255',
	'A',
	'025487133',
	39300.000,
	'1988-08-19',
	NULL,
	'1964-03-15',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	299,
	902,
	'Brian',
	'Quant',
	200,
	'5847 Companion Street',
	'Houston',
	'TX',
	'77057    ',
	'7135559211',
	'A',
	'456249031',
	54300.000,
	'1987-06-20',
	NULL,
	'1966-09-16',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	1997,
	1293,
	'Claudio',
	'Grimm',
	300,
	'14 Park Fountain Court',
	'Houston',
	'TX',
	'77063    ',
	'7135551141',
	'A',
	'492301340',
	48320.000,
	'1994-07-20',
	NULL,
	'1966-08-10',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	316,
	501,
	'Lynn',
	'Pastor',
	100,
	'14 Cricklewood Drive',
	'Burlington',
	'MA',
	'01803    ',
	'6175552001',
	'A',
	'048667211',
	74500.000,
	'1988-10-24',
	NULL,
	'1962-07-14',
	'Y',
	'Y',
	'Y',
	'F')
;
INSERT INTO employee VALUES (
	318,
	1576,
	'John',
	'Crow',
	400,
	'531 Main Street',
	'Watertown',
	'MA',
	'02172',
	'6175553332',
	'A',
	'079349168',
	41700.750,
	'1988-11-20',
	NULL,
	'1962-04-24',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	390,
	1293,
	'Jo Ann',
	'Davidson',
	300,
	'27 Mount Vernon Road',
	'Needham',
	'MA',
	'02192    ',
	'6175553870',
	'A',
	'027341657',
	57090.000,
	'1988-11-30',
	NULL,
	'1957-02-17',
	'N',
	'Y',
	'Y',
	'F')
;
INSERT INTO employee VALUES (
	409,
	1576,
	'Bruce',
	'Weaver',
	400,
	'19 Westmoreland Street',
	'Lexington',
	'MA',
	'02173    ',
	'6175554444',
	'A',
	'048781192',
	46550.000,
	'1988-12-08',
	NULL,
	'1946-04-05',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	445,
	501,
	'Kim',
	'Lull',
	100,
	'199 Lincoln Street',
	'Concord',
	'MA',
	'01742    ',
	'5085554444',
	'A',
	'017508821',
	87900.000,
	'1988-12-13',
	NULL,
	'1955-01-19',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	453,
	501,
	'Andrew',
	'Rabkin',
	100,
	'44 Birds Hill Way',
	'Burlington',
	'MA',
	'01803    ',
	'6175554444',
	'A',
	'029458129',
	64500.000,
	'1988-12-13',
	NULL,
	'1957-08-10',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	467,
	902,
	'James',
	'Klobucher',
	200,
	'18 Corning Street',
	'Houston',
	'TX',
	'77079    ',
	'7135558627',
	'A',
	'034281032',
	49500.000,
	'1989-01-07',
	NULL,
	'1952-11-09',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	479,
	501,
	'Linda',
	'Siperstein',
	100,
	'341 Hillside Avenue',
	'Newton',
	'MA',
	'02164    ',
	'6175556588',
	'L',
	'022415639',
	39875.500,
	'1989-01-20',
	NULL,
	'1967-09-21',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	501,
	501,
	'David',
	'Scott',
	100,
	'21 Riverdale Drive',
	'Belmont',
	'MA',
	'02178    ',
	'6175553246',
	'A',
	'064983327',
	96300.000,
	'1989-02-01',
	NULL,
	'1947-03-01',
	'Y',
	'Y',
	'Y',
	'M')
;
INSERT INTO employee VALUES (
	529,
	501,
	'Dorothy',
	'Sullivan',
	100,
	'124 Minuteman Drive',
	'Lexington',
	'MA',
	'02173    ',
	'6175553947',
	'A',
	'501324492',
	67890.000,
	'1989-08-03',
	NULL,
	'1950-04-19',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	582,
	501,
	'Peter',
	'Samuels',
	100,
	'54 Woodlawn Street',
	'Newton',
	'MA',
	'02164    ',
	'6175558342',
	'A',
	'038218867',
	37400.000,
	'1989-09-21',
	NULL,
	'1968-02-28',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	586,
	1293,
	'James',
	'Coleman',
	300,
	'57 Heather Hill Drive',
	'Acton',
	'MA',
	'01720    ',
	'5085554735',
	'L',
	'031281245',
	42300.000,
	'1989-10-04',
	NULL,
	'1966-03-04',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	591,
	1576,
	'Irene',
	'Barletta',
	400,
	'37 Gleason Street',
	'Bedford',
	'MA',
	'01730    ',
	'6175558345',
	'A',
	'056872399',
	45450.000,
	'1990-01-16',
	NULL,
	'1957-01-30',
	'Y',
	'Y',
	'Y',
	'F')
;
INSERT INTO employee VALUES (
	604,
	501,
	'Albert',
	'Wang',
	100,
	'48 Edwin Street',
	'Waltham',
	'MA',
	'02154    ',
	'6175558741',
	'A',
	'023486621',
	68400.000,
	'1990-03-30',
	NULL,
	'1958-12-25',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	641,
	902,
	'Thomas',
	'Powell',
	200,
	'48 Kennedy Court',
	'Newton',
	'MA',
	'02162    ',
	'6175551956',
	'A',
	'038726633',
	54600.000,
	'1990-04-14',
	NULL,
	'1951-10-31',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	667,
	902,
	'Mary',
	'Garcia',
	200,
	'98 Purvis Street',
	'Houston',
	'TX',
	'77079    ',
	'7135553431',
	'A',
	'042706188',
	39800.000,
	'1990-05-23',
	NULL,
	'1963-01-23',
	'N',
	'Y',
	'Y',
	'F')
;
INSERT INTO employee VALUES (
	690,
	902,
	'Kathleen',
	'Poitras',
	200,
	'50 The Fenway',
	'Boston',
	'MA',
	'02118    ',
	'6175553920',
	'A',
	'087236702',
	46200.000,
	'1990-05-29',
	NULL,
	'1965-09-29',
	'N',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	703,
	902,
	'Jose',
	'Martinez',
	500,
	'495 Washington Street',
	'Westwood',
	'MA',
	'02090    ',
	'6175557114',
	'A',
	'012896755',
	61050.880,
	'1990-06-01',
	NULL,
	'1953-07-22',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	750,
	703,
	'Jane',
	'Braun',
	500,
	'45 Wood Street',
	'Cambridge',
	'MA',
	'02140    ',
	'6175557857',
	'A',
	'012459381',
	37730.000,
	'1990-07-04',
	NULL,
	'1939-08-09',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	757,
	1293,
	'Denis',
	'Higgins',
	300,
	'1033 Massachusetts Avenue',
	'Lexington',
	'MA',
	'02173    ',
	'6175553985',
	'A',
	'067829311',
	43700.000,
	'1990-08-24',
	NULL,
	'1968-05-12',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	839,
	501,
	'Dean',
	'Marshall',
	100,
	'44 Mount Pleasant Street',
	'Belmont',
	'MA',
	'02178    ',
	'6175553707',
	'A',
	'034629123',
	42500.000,
	'1990-10-19',
	NULL,
	'1966-05-21',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	856,
	902,
	'Samuel',
	'Singer',
	200,
	'187 Orchard Road',
	'Stow',
	'MA',
	'01775    ',
	'5085553255',
	'A',
	'011349786',
	34892.000,
	'1990-11-30',
	NULL,
	'1959-04-07',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	862,
	501,
	'John',
	'Sheffield',
	100,
	'45 Belleview Drive',
	'Houston',
	'TX',
	'77079    ',
	'7135553877',
	'A',
	'018458291',
	87900.000,
	'1990-12-14',
	NULL,
	'1955-09-25',
	'Y',
	'Y',
	'Y',
	'M')
;
INSERT INTO employee VALUES (
	868,
	703,
	'Felicia',
	'Kuo',
	500,
	'79 Oak Street',
	'Cambridge',
	'MA',
	'02140    ',
	'6175552385',
	'A',
	'043592831',
	28200.000,
	'1991-01-10',
	NULL,
	'1968-07-24',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	879,
	1293,
	'Kristen',
	'Coe',
	300,
	'30 Rainbow Road',
	'West Roxbury',
	'MA',
	'02132    ',
	'6175559192',
	'A',
	'027581035',
	36500.000,
	'1991-01-16',
	NULL,
	'1965-11-11',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	888,
	1576,
	'Doug',
	'Charlton',
	400,
	'57 Webster Street',
	'Concord',
	'MA',
	'01742    ',
	'5085559246',
	'A',
	'036102935',
	28300.000,
	'1991-03-10',
	NULL,
	'1966-01-23',
	'N',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	902,
	1293,
	'Moira',
	'Kelly',
	200,
	'12 Fountain Road',
	'Gloucester',
	'MA',
	'01930',
	'5085553769',
	'A',
	'015923467',
	87500.000,
	'1991-04-01',
	NULL,
	'1950-08-16',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	913,
	902,
	'Ken',
	'Martel',
	200,
	'23 Lincoln Street',
	'Needham',
	'MA',
	'02192    ',
	'6175558474',
	'A',
	'022783569',
	55700.000,
	'1991-04-16',
	NULL,
	'1943-04-23',
	'N',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	921,
	703,
	'Charles',
	'Crowley',
	500,
	'421 Beacon Street',
	'Belmont',
	'MA',
	'02178    ',
	'6175559425',
	'A',
	'034568789',
	41700.000,
	'1991-04-22',
	NULL,
	'1960-09-11',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	930,
	902,
	'Ann',
	'Taylor',
	200,
	'25 Westminster Street',
	'Atlanta',
	'GA',
	'30339    ',
	'4045551515',
	'A',
	'062890293',
	46890.000,
	'1991-05-08',
	NULL,
	'1962-06-06',
	'Y',
	'Y',
	'Y',
	'F')
;
INSERT INTO employee VALUES (
	949,
	902,
	'Pamela',
	'Savarino',
	200,
	'112 Beach Street',
	'Long Beach',
	'CA',
	'90806    ',
	'3105551857',
	'A',
	'018762936',
	72300.000,
	'1991-05-08',
	NULL,
	'1955-07-28',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	958,
	501,
	'Thomas',
	'Sisson',
	100,
	'54 School Street',
	'Houston',
	'TX',
	'77079    ',
	'7135558390',
	'A',
	'017283997',
	42100.000,
	'1991-07-16',
	NULL,
	'1969-10-02',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	992,
	1576,
	'Joyce',
	'Butterfield',
	400,
	'119 Adams Street',
	'Cambridge',
	'MA',
	'02140    ',
	'6175552232',
	'A',
	'023487085',
	34011.000,
	'1991-08-13',
	NULL,
	'1960-04-15',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	1013,
	703,
	'Joseph',
	'Barker',
	500,
	'58 West Drive',
	'Bedford',
	'MA',
	'01730    ',
	'6175558021',
	'A',
	'023470756',
	27290.000,
	'1991-09-10',
	NULL,
	'1969-02-14',
	'N',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	1021,
	902,
	'Paul',
	'Sterling',
	200,
	'112 Endicott Street',
	'Concord',
	'MA',
	'01742    ',
	'5085550295',
	'A',
	'037846595',
	64900.000,
	'1991-10-28',
	NULL,
	'1950-02-27',
	'Y',
	'Y',
	'Y',
	'M')
;
INSERT INTO employee VALUES (
	1039,
	902,
	'Shih Lin',
	'Chao',
	200,
	'59 Holyoke Street',
	'Lexington',
	'MA',
	'02173    ',
	'6175555921',
	'A',
	'046973741',
	33890.000,
	'1991-11-11',
	NULL,
	'1969-12-12',
	'N',
	'Y',
	'Y',
	'M')
;
INSERT INTO employee VALUES (
	1062,
	1576,
	'Barbara',
	'Blaikie',
	400,
	'66 Beaumont Terrace',
	'Needham',
	'MA',
	'02192    ',
	'6175559345',
	'A',
	'019887257',
	54900.000,
	'1991-11-20',
	NULL,
	'1953-11-14',
	'Y',
	'Y',
	'Y',
	'F')
;
INSERT INTO employee VALUES (
	1090,
	501,
	'Susan',
	'Smith',
	100,
	'177 Johnson Street',
	'Houston',
	'TX',
	'77079    ',
	'7135556613',
	'A',
	'013558813',
	51411.000,
	'1991-12-13',
	NULL,
	'1950-11-30',
	'N',
	'Y',
	'Y',
	'F')
;
INSERT INTO employee VALUES (
	1101,
	902,
	'Mark',
	'Preston',
	200,
	'49 Constitution Road',
	'Boston',
	'MA',
	'02124    ',
	'6175555862',
	'A',
	'027663454',
	37803.000,
	'1992-01-09',
	NULL,
	'1966-09-14',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	1142,
	902,
	'Alison',
	'Clark',
	200,
	'56 Carver Street',
	'Emeryville',
	'CA',
	'94608    ',
	'5105559437',
	'A',
	'055913622',
	45000.000,
	'1992-01-19',
	NULL,
	'1957-05-04',
	'N',
	'Y',
	'Y',
	'F')
;
INSERT INTO employee VALUES (
	1157,
	501,
	'Hing',
	'Soo',
	100,
	'19 Glenmeadow Street',
	'Needham',
	'MA',
	'02192    ',
	'6175558748',
	'A',
	'023434587',
	39075.000,
	'1992-01-29',
	NULL,
	'1970-03-07',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	1162,
	902,
	'Kevin',
	'Goggin',
	200,
	'12 Wachusett Road',
	'Wellesley',
	'MA',
	'02181    ',
	'6175553785',
	'A',
	'075679377',
	37900.000,
	'1992-02-03',
	NULL,
	'1952-04-18',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	1191,
	1576,
	'Matthew',
	'Bucceri',
	400,
	'57 Taylor Place',
	'Lexington',
	'MA',
	'02173    ',
	'6175555336',
	'A',
	'023749270',
	45900.000,
	'1992-02-12',
	NULL,
	'1944-11-19',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	1250,
	501,
	'Emilio',
	'Diaz',
	100,
	'112 Evergreen Street',
	'Wellesley',
	'MA',
	'02181    ',
	'6175553567',
	'A',
	'023476492',
	54900.000,
	'1992-02-17',
	NULL,
	'1936-01-02',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	1293,
	1293,
	'Mary Anne',
	'Shea',
	300,
	'197 Camden Road',
	'Lexington',
	'MA',
	'02173',
	'6175554616',
	'A',
	'019641485',
	138948.000,
	'1992-03-01',
	NULL,
	'1955-03-13',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	1336,
	1293,
	'Janet',
	'Bigelow',
	300,
	'84 Lunda Street',
	'Waltham',
	'MA',
	'02154',
	'6175551493',
	'A',
	'017326112',
	31200.000,
	'1993-08-25',
	NULL,
	'1950-07-21',
	'Y',
	'Y',
	'Y',
	'F')
;
INSERT INTO employee VALUES (
	1390,
	1293,
	'Jennifer',
	'Litton',
	300,
	'17 Downing Street',
	'Concord',
	'MA',
	'01742    ',
	'5085553495',
	'A',
	'034786565',
	58930.000,
	'1993-10-05',
	NULL,
	'1948-04-05',
	'N',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	1446,
	902,
	'Caroline',
	'Yeung',
	200,
	'52 Cypress Street',
	'Atlanta',
	'GA',
	'30339    ',
	'4045558347',
	'A',
	'038475825',
	32300.000,
	'1994-04-29',
	NULL,
	'1971-06-21',
	'N',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	1483,
	1293,
	'John',
	'Letiecq',
	300,
	'149 Vista Drive',
	'Burlington',
	'MA',
	'01803    ',
	'6175551167',
	'L',
	'079372285',
	75400.000,
	'1994-08-30',
	NULL,
	'1939-04-27',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	1507,
	1576,
	'Ruth',
	'Wetherby',
	400,
	'82 Aberdeen Road',
	'Needham',
	'MA',
	'02192    ',
	'6175555465',
	'A',
	'035673688',
	35745.000,
	'1994-10-11',
	NULL,
	'1959-07-19',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	1570,
	703,
	'Anthony',
	'Rebeiro',
	500,
	'39 Moody Street',
	'Waltham',
	'MA',
	'02154    ',
	'6175555737',
	'A',
	'034576347',
	34576.000,
	'1994-11-27',
	NULL,
	'1963-04-12',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	1576,
	902,
	'Scott',
	'Evans',
	400,
	'10-A Sunrise Circle',
	'Concord',
	'MA',
	'01742    ',
	'5085550096',
	'A',
	'017429926',
	68940.000,
	'1994-12-30',
	NULL,
	'1960-11-15',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	1596,
	902,
	'Catherine',
	'Pickett',
	200,
	'45 Appleton Road',
	'Bedford',
	'MA',
	'01730    ',
	'6175553478',
	'A',
	'028375086',
	47653.000,
	'1995-02-10',
	NULL,
	'1959-11-18',
	'Y',
	'Y',
	'Y',
	'F')
;
INSERT INTO employee VALUES (
	1607,
	1576,
	'Mark ',
	'Morris',
	400,
	'1 Example Way ',
	'Waltham',
	'MA',
	'02154    ',
	'6175558344',
	'A',
	'501787474',
	61300.000,
	'1995-04-13',
	NULL,
	'1941-01-08',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	1615,
	703,
	'Sheila',
	'Romero',
	500,
	'1 Oakview Terrace',
	'Bedford',
	'MA',
	'01730    ',
	'6175558138',
	'A',
	'501175874',
	27500.000,
	'1995-05-20',
	NULL,
	'1972-09-12',
	'Y',
	'Y',
	'Y',
	'F')
;
INSERT INTO employee VALUES (
	1643,
	1576,
	'Elizabeth',
	'Lambert',
	400,
	'29 Union Street',
	'Burlington',
	'MA',
	'01803    ',
	'6175552357',
	'A',
	'023857807',
	29384.000,
	'1995-06-15',
	NULL,
	'1968-09-12',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	1658,
	703,
	'Michael',
	'Lynch',
	500,
	'76 Brookside Road',
	'Waltham',
	'MA',
	'02154    ',
	'6175558348',
	'A',
	'023850840',
	24903.000,
	'1995-08-28',
	NULL,
	'1973-01-18',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	1684,
	1576,
	'Janet',
	'Hildebrand',
	400,
	'47 Hilltop Street',
	'Waltham ',
	'MA',
	'02154    ',
	'6175553845',
	'A',
	'038957036',
	45829.000,
	'1995-09-13',
	NULL,
	'1955-10-31',
	'Y',
	'Y',
	'N',
	'F')
;
INSERT INTO employee VALUES (
	1740,
	1576,
	'Robert',
	'Nielsen',
	400,
	'55 Sargent Avenue',
	'Bedford',
	'MA',
	'01730    ',
	'6175558757',
	'A',
	'037534650',
	34889.000,
	'1995-12-23',
	NULL,
	'1965-06-19',
	'Y',
	'Y',
	'N',
	'M')
;
INSERT INTO employee VALUES (
	1751,
	1576,
	'Alex',
	'Ahmed',
	400,
	'114 Cushing Street',
	'Needham',
	'MA',
	'02192    ',
	'6175558748',
	'A',
	'032547384',
	34992.000,
	'1996-01-10',
	NULL,
	'1963-12-12',
	'Y',
	'Y',
	'N',
	'M')
;
commit
;
-- ============================================================ 
--   Load fin_code table                                        
-- ============================================================ 
INSERT INTO fin_code VALUES (
	'e1',
	'expense',
	'Fees')
;
INSERT INTO fin_code VALUES (
	'e2',
	'expense',
	'Services')
;
INSERT INTO fin_code VALUES (
	'e3',
	'expense',
	'Sales & Marketing')
;
INSERT INTO fin_code VALUES (
	'e4',
	'expense',
	'R & D')
;
INSERT INTO fin_code VALUES (
	'e5',
	'expense',
	'Administration')
;
INSERT INTO fin_code VALUES (
	'r1',
	'revenue',
	'Fees')
;
INSERT INTO fin_code VALUES (
	'r2',
	'revenue',
	'Services')
;
commit
;
-- ============================================================ 
--   Load fin_data table                                        
-- ============================================================ 
INSERT INTO fin_data VALUES (
	'1992',
	'Q1',
	'e1',
	101)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q1',
	'e2',
	403)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q1',
	'e3',
	1437)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q1',
	'e4',
	623)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q1',
	'e5',
	381)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q1',
	'r1',
	1023)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q1',
	'r2',
	234)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q2',
	'e1',
	93)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q2',
	'e2',
	459)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q2',
	'e3',
	2033)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q2',
	'e4',
	784)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q2',
	'e5',
	402)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q2',
	'r1',
	2033)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q2',
	'r2',
	459)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q3',
	'e1',
	129)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q3',
	'e2',
	609)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q3',
	'e3',
	2184)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q3',
	'e4',
	856)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q3',
	'e5',
	412)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q3',
	'r1',
	2998)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q3',
	'r2',
	601)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q4',
	'e1',
	145)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q4',
	'e2',
	632)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q4',
	'e3',
	2145)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q4',
	'e4',
	1043)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q4',
	'e5',
	467)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q4',
	'r1',
	3014)
;
INSERT INTO fin_data VALUES (
	'1992',
	'Q4',
	'r2',
	944)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q1',
	'e1',
	153)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q1',
	'e2',
	643)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q1',
	'e3',
	2478)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q1',
	'e4',
	1051)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q1',
	'e5',
	523)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q1',
	'r1',
	3114)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q1',
	'r2',
	992)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q2',
	'e1',
	149)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q2',
	'e2',
	687)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q2',
	'e3',
	2998)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q2',
	'e4',
	1158)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q2',
	'e5',
	749)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q2',
	'r1',
	3998)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q2',
	'r2',
	1195)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q3',
	'e1',
	157)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q3',
	'e2',
	898)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q3',
	'e3',
	3702)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q3',
	'e4',
	1459)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q3',
	'e5',
	723)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q3',
	'r1',
	6523)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q3',
	'r2',
	1704)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q4',
	'e1',
	163)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q4',
	'e2',
	923)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q4',
	'e3',
	3600)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q4',
	'e4',
	1439)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q4',
	'e5',
	748)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q4',
	'r1',
	7267)
;
INSERT INTO fin_data VALUES (
	'1993',
	'Q4',
	'r2',
	1823)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q1',
	'e1',
	198)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q1',
	'e2',
	921)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q1',
	'e3',
	4139)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q1',
	'e4',
	1462)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q1',
	'e5',
	798)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q1',
	'r1',
	9144)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q1',
	'r2',
	1839)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q2',
	'e1',
	204)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q2',
	'e2',
	975)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q2',
	'e3',
	4500)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q2',
	'e4',
	1472)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q2',
	'e5',
	983)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q2',
	'r1',
	10988)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q2',
	'r2',
	2011)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q3',
	'e1',
	214)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q3',
	'e2',
	984)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q3',
	'e3',
	4532)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q3',
	'e4',
	1439)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q3',
	'e5',
	956)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q3',
	'r1',
	13567)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q3',
	'r2',
	2897)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q4',
	'e1',
	231)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q4',
	'e2',
	982)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q4',
	'e3',
	5298)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q4',
	'e4',
	1498)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q4',
	'e5',
	963)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q4',
	'r1',
	15199)
;
INSERT INTO fin_data VALUES (
	'1994',
	'Q4',
	'r2',
	4129)
;
commit
;
-- ============================================================ 
--   Load product table                                         
-- ============================================================ 
INSERT INTO product
	(id,
	name,
	description,
	prod_size,
	color,
	quantity,
	unit_price,
	picture_name)
VALUES (
	300,
	'Tee Shirt',
	'Tank Top',
	'Small',
	'White',
	28,
	9.00,
	'tshirtw.bmp')
;
INSERT INTO product
	(id,
	name,
	description,
	prod_size,
	color,
	quantity,
	unit_price,
	picture_name)
VALUES (
	301,
	'Tee Shirt',
	'V-neck',
	'Medium',
	'Orange',
	54,
	14.00,
	'tshirto.bmp')
;
INSERT INTO product
	(id,
	name,
	description,
	prod_size,
	color,
	quantity,
	unit_price,
	picture_name)
VALUES (
	302,
	'Tee Shirt',
	'Crew Neck',
	'One size fits all',
	'Black',
	75,
	14.00,
	'tshirtb.bmp')
;
INSERT INTO product
	(id,
	name,
	description,
	prod_size,
	color,
	quantity,
	unit_price,
	picture_name)
VALUES (
	400,
	'Baseball Cap',
	'Cotton Cap',
	'One size fits all',
	'Black',
	112,
	9.00,
	'capb.bmp')
;
INSERT INTO product
	(id,
	name,
	description,
	prod_size,
	color,
	quantity,
	unit_price,
	picture_name)
VALUES (
	401,
	'Baseball Cap',
	'Wool cap',
	'One size fits all',
	'White',
	12,
	10.00,
	'capw.bmp')
;
INSERT INTO product
	(id,
	name,
	description,
	prod_size,
	color,
	quantity,
	unit_price,
	picture_name)
VALUES (
	500,
	'Visor',
	'Cloth Visor',
	'One size fits all',
	'White',
	36,
	7.00,
	'visorw.bmp')
;
INSERT INTO product
	(id,
	name,
	description,
	prod_size,
	color,
	quantity,
	unit_price,
	picture_name)
VALUES (
	501,
	'Visor',
	'Plastic Visor',
	'One size fits all',
	'Black',
	28,
	7.00,
	'visorb.bmp')
;
INSERT INTO product
	(id,
	name,
	description,
	prod_size,
	color,
	quantity,
	unit_price,
	picture_name)
VALUES (
	600,
	'Sweatshirt',
	'Hooded Sweatshirt',
	'Large',
	'Green',
	39,
	24.00,
	'sshirtg.bmp')
;
INSERT INTO product
	(id,
	name,
	description,
	prod_size,
	color,
	quantity,
	unit_price,
	picture_name)
VALUES (
	601,
	'Sweatshirt',
	'Zipped Sweatshirt',
	'Large',
	'Blue',
	32,
	24.00,
	'sshirtb.bmp')
;
INSERT INTO product
	(id,
	name,
	description,
	prod_size,
	color,
	quantity,
	unit_price,
	picture_name)
VALUES (
	700,
	'Shorts',
	'Cotton Shorts',
	'Medium',
	'Black',
	80,
	15.00,
	'shortsb.bmp')
;
commit
;
-- ============================================================ 
--   Load sales_order table                                     
-- ============================================================ 
INSERT INTO sales_order VALUES (
	2001,
	101,
	'1994-09-14',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2002,
	102,
	'1994-09-18',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2003,
	103,
	'1994-09-21',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2004,
	104,
	'1994-09-23',
	'r1',
	'South',
	902)
;
INSERT INTO sales_order VALUES (
	2005,
	101,
	'1995-09-24',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2006,
	105,
	'1995-09-28',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2007,
	106,
	'1995-09-28',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2008,
	107,
	'1995-10-01',
	'r1',
	'South',
	129)
;
INSERT INTO sales_order VALUES (
	2009,
	108,
	'1995-10-04',
	'r1',
	'South',
	1142)
;
INSERT INTO sales_order VALUES (
	2010,
	109,
	'1995-10-05',
	'r1',
	'Canada',
	195)
;
INSERT INTO sales_order VALUES (
	2011,
	110,
	'1995-10-06',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2012,
	111,
	'1995-10-06',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2013,
	112,
	'1995-10-06',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2014,
	113,
	'1995-10-07',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2015,
	114,
	'1995-09-30',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2016,
	115,
	'1994-10-01',
	'r1',
	'Central',
	902)
;
INSERT INTO sales_order VALUES (
	2017,
	116,
	'1995-10-01',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2018,
	117,
	'1995-09-07',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2019,
	118,
	'1994-08-13',
	'r1',
	'South',
	667)
;
INSERT INTO sales_order VALUES (
	2020,
	119,
	'1995-09-02',
	'r1',
	'Western',
	129)
;
INSERT INTO sales_order VALUES (
	2021,
	120,
	'1995-10-08',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2022,
	121,
	'1995-11-04',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2023,
	122,
	'1995-12-03',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2024,
	123,
	'1996-01-11',
	'r1',
	'Canada',
	1596)
;
INSERT INTO sales_order VALUES (
	2025,
	124,
	'1995-11-01',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2026,
	125,
	'1995-08-04',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2027,
	126,
	'1995-12-13',
	'r1',
	'Western',
	949)
;
INSERT INTO sales_order VALUES (
	2028,
	127,
	'1994-12-30',
	'r1',
	'South',
	902)
;
INSERT INTO sales_order VALUES (
	2029,
	128,
	'1994-12-11',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2030,
	129,
	'1995-10-06',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2031,
	130,
	'1994-11-27',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2032,
	131,
	'1996-01-03',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2033,
	132,
	'1994-08-14',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2035,
	134,
	'1995-10-29',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2036,
	135,
	'1995-07-06',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2037,
	136,
	'1994-07-24',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2038,
	137,
	'1995-08-02',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2039,
	138,
	'1994-08-31',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2040,
	139,
	'1995-10-26',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2041,
	140,
	'1995-11-01',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2042,
	141,
	'1995-08-27',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2043,
	142,
	'1995-09-13',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2044,
	143,
	'1995-01-13',
	'r1',
	'Canada',
	129)
;
INSERT INTO sales_order VALUES (
	2045,
	144,
	'1994-12-31',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2046,
	145,
	'1995-08-03',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2047,
	146,
	'1995-09-08',
	'r1',
	'Western',
	690)
;
INSERT INTO sales_order VALUES (
	2048,
	147,
	'1995-09-07',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2049,
	148,
	'1995-08-18',
	'r1',
	'Canada',
	299)
;
INSERT INTO sales_order VALUES (
	2050,
	149,
	'1995-08-27',
	'r1',
	'Canada',
	467)
;
INSERT INTO sales_order VALUES (
	2051,
	150,
	'1994-11-13',
	'r1',
	'Canada',
	949)
;
INSERT INTO sales_order VALUES (
	2052,
	151,
	'1995-12-31',
	'r1',
	'Central',
	902)
;
INSERT INTO sales_order VALUES (
	2053,
	152,
	'1995-12-29',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2054,
	153,
	'1995-11-29',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2055,
	154,
	'1995-09-29',
	'r1',
	'South',
	667)
;
INSERT INTO sales_order VALUES (
	2056,
	155,
	'1995-10-14',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2057,
	156,
	'1995-09-20',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2058,
	157,
	'1995-10-06',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2059,
	158,
	'1995-10-05',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2060,
	159,
	'1995-11-01',
	'r1',
	'Central',
	1596)
;
INSERT INTO sales_order VALUES (
	2061,
	160,
	'1995-01-18',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2062,
	161,
	'1995-12-14',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2063,
	162,
	'1995-12-20',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2064,
	163,
	'1995-10-29',
	'r1',
	'Canada',
	902)
;
INSERT INTO sales_order VALUES (
	2065,
	164,
	'1994-07-04',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2067,
	166,
	'1995-10-22',
	'r1',
	'South',
	667)
;
INSERT INTO sales_order VALUES (
	2068,
	167,
	'1995-11-01',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2069,
	168,
	'1995-08-16',
	'r1',
	'Western',
	1142)
;
INSERT INTO sales_order VALUES (
	2070,
	169,
	'1994-08-31',
	'r1',
	'South',
	195)
;
INSERT INTO sales_order VALUES (
	2071,
	170,
	'1995-11-22',
	'r1',
	'South',
	299)
;
INSERT INTO sales_order VALUES (
	2072,
	171,
	'1995-11-15',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2073,
	172,
	'1995-11-29',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2074,
	173,
	'1996-01-20',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2075,
	174,
	'1995-08-17',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2076,
	175,
	'1995-09-16',
	'r1',
	'Canada',
	949)
;
INSERT INTO sales_order VALUES (
	2077,
	176,
	'1995-10-06',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2078,
	177,
	'1995-11-01',
	'r1',
	'South',
	856)
;
INSERT INTO sales_order VALUES (
	2079,
	178,
	'1995-10-01',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2080,
	179,
	'1995-11-01',
	'r1',
	'South',
	667)
;
INSERT INTO sales_order VALUES (
	2081,
	180,
	'1994-12-02',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2082,
	181,
	'1995-12-31',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2083,
	182,
	'1994-07-14',
	'r1',
	'Western',
	195)
;
INSERT INTO sales_order VALUES (
	2084,
	183,
	'1995-08-13',
	'r1',
	'South',
	690)
;
INSERT INTO sales_order VALUES (
	2085,
	184,
	'1994-09-10',
	'r1',
	'Central',
	1596)
;
INSERT INTO sales_order VALUES (
	2086,
	185,
	'1995-10-11',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2087,
	186,
	'1995-11-10',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2089,
	187,
	'1995-12-10',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2090,
	188,
	'1996-01-10',
	'r1',
	'Central',
	902)
;
INSERT INTO sales_order VALUES (
	2091,
	189,
	'1995-12-30',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2092,
	190,
	'1995-07-13',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2093,
	191,
	'1994-08-14',
	'r1',
	'South',
	129)
;
INSERT INTO sales_order VALUES (
	2094,
	192,
	'1995-09-13',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2095,
	193,
	'1995-10-14',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2096,
	194,
	'1995-11-15',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2097,
	195,
	'1994-12-16',
	'r1',
	'South',
	1596)
;
INSERT INTO sales_order VALUES (
	2098,
	196,
	'1996-01-17',
	'r1',
	'Canada',
	299)
;
INSERT INTO sales_order VALUES (
	2099,
	197,
	'1994-07-18',
	'r1',
	'South',
	467)
;
INSERT INTO sales_order VALUES (
	2100,
	198,
	'1995-08-20',
	'r1',
	'Western',
	949)
;
INSERT INTO sales_order VALUES (
	2101,
	198,
	'1994-09-18',
	'r1',
	'Western',
	902)
;
INSERT INTO sales_order VALUES (
	2102,
	199,
	'1995-10-21',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2103,
	200,
	'1995-11-22',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2104,
	201,
	'1994-12-23',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2105,
	202,
	'1996-01-21',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2106,
	203,
	'1995-07-06',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2107,
	204,
	'1994-08-07',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2109,
	206,
	'1994-10-07',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2110,
	207,
	'1995-11-05',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2111,
	208,
	'1995-12-09',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2112,
	165,
	'1995-07-12',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2113,
	209,
	'1995-07-13',
	'r1',
	'Western',
	902)
;
INSERT INTO sales_order VALUES (
	2114,
	206,
	'1995-08-13',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2115,
	201,
	'1994-09-14',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2116,
	209,
	'1995-10-14',
	'r1',
	'Western',
	1142)
;
INSERT INTO sales_order VALUES (
	2117,
	204,
	'1994-11-13',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2118,
	147,
	'1995-12-16',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2119,
	168,
	'1996-01-17',
	'r1',
	'Western',
	1596)
;
INSERT INTO sales_order VALUES (
	2120,
	110,
	'1995-07-20',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2121,
	189,
	'1994-08-21',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2122,
	132,
	'1995-09-20',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2123,
	175,
	'1995-10-21',
	'r1',
	'Canada',
	902)
;
INSERT INTO sales_order VALUES (
	2124,
	134,
	'1994-11-23',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2125,
	101,
	'1995-12-23',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2126,
	136,
	'1994-07-04',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2127,
	142,
	'1994-07-07',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2128,
	155,
	'1994-07-29',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2129,
	166,
	'1994-07-08',
	'r1',
	'South',
	949)
;
INSERT INTO sales_order VALUES (
	2130,
	146,
	'1994-07-18',
	'r1',
	'Western',
	902)
;
INSERT INTO sales_order VALUES (
	2131,
	128,
	'1994-07-03',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2132,
	110,
	'1994-07-09',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2133,
	167,
	'1994-07-11',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2134,
	168,
	'1994-07-15',
	'r1',
	'Western',
	129)
;
INSERT INTO sales_order VALUES (
	2135,
	205,
	'1994-07-07',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2136,
	188,
	'1994-07-10',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2137,
	170,
	'1994-07-15',
	'r1',
	'South',
	690)
;
INSERT INTO sales_order VALUES (
	2138,
	198,
	'1994-07-17',
	'r1',
	'Western',
	1596)
;
INSERT INTO sales_order VALUES (
	2139,
	203,
	'1994-07-18',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2140,
	209,
	'1994-07-21',
	'r1',
	'Western',
	467)
;
INSERT INTO sales_order VALUES (
	2141,
	166,
	'1994-07-22',
	'r1',
	'South',
	949)
;
INSERT INTO sales_order VALUES (
	2142,
	102,
	'1994-07-23',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2143,
	115,
	'1994-07-24',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2144,
	110,
	'1994-07-25',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2145,
	135,
	'1994-07-28',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2146,
	189,
	'1994-07-29',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2147,
	200,
	'1994-07-30',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2148,
	199,
	'1994-07-31',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2149,
	190,
	'1994-08-01',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2150,
	169,
	'1994-08-04',
	'r1',
	'South',
	1596)
;
INSERT INTO sales_order VALUES (
	2151,
	144,
	'1994-08-05',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2152,
	132,
	'1994-08-06',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2153,
	111,
	'1994-08-07',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2154,
	122,
	'1994-08-08',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2155,
	143,
	'1994-08-11',
	'r1',
	'Canada',
	856)
;
INSERT INTO sales_order VALUES (
	2156,
	157,
	'1994-08-12',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2157,
	168,
	'1994-08-13',
	'r1',
	'Western',
	129)
;
INSERT INTO sales_order VALUES (
	2158,
	179,
	'1994-08-14',
	'r1',
	'South',
	1142)
;
INSERT INTO sales_order VALUES (
	2159,
	181,
	'1994-08-15',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2160,
	183,
	'1994-08-15',
	'r1',
	'South',
	195)
;
INSERT INTO sales_order VALUES (
	2161,
	199,
	'1994-08-18',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2162,
	202,
	'1994-08-19',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2163,
	204,
	'1994-08-20',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2164,
	206,
	'1994-08-21',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2165,
	104,
	'1994-08-22',
	'r1',
	'South',
	949)
;
INSERT INTO sales_order VALUES (
	2166,
	113,
	'1994-08-25',
	'r1',
	'Central',
	902)
;
INSERT INTO sales_order VALUES (
	2167,
	121,
	'1994-08-26',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2168,
	137,
	'1994-08-27',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2169,
	148,
	'1994-08-28',
	'r1',
	'Canada',
	667)
;
INSERT INTO sales_order VALUES (
	2170,
	149,
	'1994-08-29',
	'r1',
	'Canada',
	129)
;
INSERT INTO sales_order VALUES (
	2171,
	153,
	'1994-09-01',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2172,
	202,
	'1994-08-31',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2173,
	107,
	'1994-09-01',
	'r1',
	'South',
	1142)
;
INSERT INTO sales_order VALUES (
	2174,
	129,
	'1994-09-02',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2175,
	208,
	'1994-09-03',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2176,
	140,
	'1994-09-04',
	'r1',
	'Western',
	1596)
;
INSERT INTO sales_order VALUES (
	2177,
	134,
	'1994-09-04',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2178,
	103,
	'1994-09-07',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2179,
	119,
	'1994-09-08',
	'r1',
	'Western',
	949)
;
INSERT INTO sales_order VALUES (
	2180,
	209,
	'1994-09-09',
	'r1',
	'Western',
	902)
;
INSERT INTO sales_order VALUES (
	2181,
	136,
	'1994-09-10',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2182,
	195,
	'1994-09-11',
	'r1',
	'South',
	299)
;
INSERT INTO sales_order VALUES (
	2183,
	118,
	'1994-09-15',
	'r1',
	'South',
	667)
;
INSERT INTO sales_order VALUES (
	2184,
	182,
	'1994-09-16',
	'r1',
	'Western',
	129)
;
INSERT INTO sales_order VALUES (
	2185,
	107,
	'1994-09-17',
	'r1',
	'South',
	1142)
;
INSERT INTO sales_order VALUES (
	2186,
	111,
	'1994-09-18',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2187,
	136,
	'1994-09-21',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2188,
	144,
	'1994-09-22',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2189,
	156,
	'1994-09-22',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2190,
	192,
	'1994-09-23',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2191,
	118,
	'1994-09-24',
	'r1',
	'South',
	949)
;
INSERT INTO sales_order VALUES (
	2192,
	158,
	'1994-09-25',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2193,
	183,
	'1994-09-28',
	'r1',
	'South',
	856)
;
INSERT INTO sales_order VALUES (
	2194,
	124,
	'1994-09-29',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2195,
	131,
	'1994-09-30',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2196,
	157,
	'1994-10-01',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2197,
	161,
	'1994-10-02',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2198,
	144,
	'1994-10-05',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2199,
	116,
	'1994-10-06',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2200,
	198,
	'1994-10-07',
	'r1',
	'Western',
	1596)
;
INSERT INTO sales_order VALUES (
	2201,
	139,
	'1994-10-08',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2202,
	166,
	'1994-10-09',
	'r1',
	'South',
	467)
;
INSERT INTO sales_order VALUES (
	2203,
	107,
	'1994-10-12',
	'r1',
	'South',
	949)
;
INSERT INTO sales_order VALUES (
	2204,
	139,
	'1994-10-13',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2205,
	200,
	'1994-10-14',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2206,
	101,
	'1994-10-15',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2207,
	103,
	'1994-10-16',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2208,
	201,
	'1994-10-19',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2209,
	204,
	'1994-10-20',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2210,
	206,
	'1994-10-21',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2211,
	207,
	'1994-10-22',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2212,
	190,
	'1994-10-23',
	'r1',
	'Central',
	1596)
;
INSERT INTO sales_order VALUES (
	2213,
	191,
	'1994-10-26',
	'r1',
	'South',
	299)
;
INSERT INTO sales_order VALUES (
	2214,
	192,
	'1994-10-27',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2215,
	193,
	'1994-10-28',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2216,
	194,
	'1994-10-29',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2217,
	195,
	'1994-10-30',
	'r1',
	'South',
	856)
;
INSERT INTO sales_order VALUES (
	2218,
	196,
	'1994-11-02',
	'r1',
	'Canada',
	299)
;
INSERT INTO sales_order VALUES (
	2219,
	197,
	'1994-11-03',
	'r1',
	'South',
	667)
;
INSERT INTO sales_order VALUES (
	2220,
	198,
	'1994-11-04',
	'r1',
	'Western',
	129)
;
INSERT INTO sales_order VALUES (
	2221,
	199,
	'1994-11-05',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2222,
	200,
	'1994-11-06',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2223,
	201,
	'1994-11-09',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2224,
	202,
	'1994-11-10',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2225,
	203,
	'1994-11-11',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2226,
	204,
	'1994-11-12',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2227,
	205,
	'1994-11-13',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2228,
	107,
	'1994-11-16',
	'r1',
	'South',
	902)
;
INSERT INTO sales_order VALUES (
	2229,
	108,
	'1994-11-17',
	'r1',
	'South',
	856)
;
INSERT INTO sales_order VALUES (
	2230,
	109,
	'1994-11-18',
	'r1',
	'Canada',
	299)
;
INSERT INTO sales_order VALUES (
	2231,
	110,
	'1994-11-19',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2232,
	111,
	'1994-11-20',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2233,
	112,
	'1994-11-23',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2234,
	113,
	'1994-11-24',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2235,
	114,
	'1994-11-25',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2236,
	115,
	'1994-11-26',
	'r1',
	'Central',
	1596)
;
INSERT INTO sales_order VALUES (
	2237,
	116,
	'1994-11-27',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2238,
	117,
	'1994-11-27',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2239,
	121,
	'1994-11-30',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2240,
	122,
	'1994-12-01',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2241,
	123,
	'1994-12-02',
	'r1',
	'Canada',
	856)
;
INSERT INTO sales_order VALUES (
	2242,
	124,
	'1994-12-03',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2243,
	125,
	'1994-12-04',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2244,
	126,
	'1994-12-07',
	'r1',
	'Western',
	129)
;
INSERT INTO sales_order VALUES (
	2245,
	127,
	'1994-12-08',
	'r1',
	'South',
	1142)
;
INSERT INTO sales_order VALUES (
	2246,
	128,
	'1994-12-09',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2247,
	129,
	'1994-12-10',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2248,
	130,
	'1994-12-11',
	'r1',
	'Central',
	1596)
;
INSERT INTO sales_order VALUES (
	2249,
	132,
	'1994-12-14',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2250,
	133,
	'1994-12-15',
	'r1',
	'Western',
	467)
;
INSERT INTO sales_order VALUES (
	2251,
	145,
	'1994-12-16',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2252,
	147,
	'1994-12-17',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2253,
	104,
	'1994-12-18',
	'r1',
	'South',
	856)
;
INSERT INTO sales_order VALUES (
	2254,
	107,
	'1994-12-21',
	'r1',
	'South',
	299)
;
INSERT INTO sales_order VALUES (
	2255,
	182,
	'1994-12-22',
	'r1',
	'Western',
	667)
;
INSERT INTO sales_order VALUES (
	2256,
	170,
	'1994-12-23',
	'r1',
	'South',
	129)
;
INSERT INTO sales_order VALUES (
	2257,
	166,
	'1994-12-24',
	'r1',
	'South',
	1142)
;
INSERT INTO sales_order VALUES (
	2258,
	151,
	'1994-12-25',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2259,
	198,
	'1994-12-28',
	'r1',
	'Western',
	690)
;
INSERT INTO sales_order VALUES (
	2260,
	176,
	'1994-12-29',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2261,
	149,
	'1994-12-30',
	'r1',
	'Canada',
	299)
;
INSERT INTO sales_order VALUES (
	2262,
	185,
	'1994-12-31',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2263,
	201,
	'1995-01-04',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2264,
	209,
	'1995-01-05',
	'r1',
	'Western',
	902)
;
INSERT INTO sales_order VALUES (
	2265,
	199,
	'1995-01-06',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2266,
	104,
	'1995-01-07',
	'r1',
	'South',
	299)
;
INSERT INTO sales_order VALUES (
	2267,
	121,
	'1995-01-08',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2268,
	136,
	'1995-01-11',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2269,
	205,
	'1995-01-12',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2270,
	149,
	'1995-01-13',
	'r1',
	'Canada',
	195)
;
INSERT INTO sales_order VALUES (
	2271,
	150,
	'1995-01-13',
	'r1',
	'Canada',
	690)
;
INSERT INTO sales_order VALUES (
	2272,
	191,
	'1995-01-14',
	'r1',
	'South',
	1596)
;
INSERT INTO sales_order VALUES (
	2273,
	182,
	'1995-01-14',
	'r1',
	'Western',
	299)
;
INSERT INTO sales_order VALUES (
	2274,
	104,
	'1995-01-15',
	'r1',
	'South',
	467)
;
INSERT INTO sales_order VALUES (
	2275,
	127,
	'1995-01-18',
	'r1',
	'South',
	949)
;
INSERT INTO sales_order VALUES (
	2276,
	153,
	'1995-01-19',
	'r1',
	'Central',
	902)
;
INSERT INTO sales_order VALUES (
	2277,
	208,
	'1995-01-20',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2278,
	189,
	'1995-01-20',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2279,
	101,
	'1995-01-21',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2280,
	104,
	'1995-01-21',
	'r1',
	'South',
	667)
;
INSERT INTO sales_order VALUES (
	2281,
	204,
	'1995-01-22',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2282,
	123,
	'1995-01-25',
	'r1',
	'Canada',
	1142)
;
INSERT INTO sales_order VALUES (
	2283,
	201,
	'1995-01-25',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2284,
	113,
	'1995-01-26',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2285,
	139,
	'1995-01-27',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2286,
	142,
	'1995-01-28',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2287,
	154,
	'1995-01-29',
	'r1',
	'South',
	467)
;
INSERT INTO sales_order VALUES (
	2288,
	207,
	'1995-02-01',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2289,
	117,
	'1995-02-01',
	'r1',
	'Central',
	902)
;
INSERT INTO sales_order VALUES (
	2290,
	172,
	'1995-02-02',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2291,
	112,
	'1995-02-05',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2292,
	157,
	'1995-02-08',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2293,
	164,
	'1995-02-09',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2294,
	204,
	'1995-02-09',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2295,
	101,
	'1995-02-10',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2296,
	114,
	'1995-02-11',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2297,
	197,
	'1995-02-11',
	'r1',
	'South',
	1596)
;
INSERT INTO sales_order VALUES (
	2298,
	200,
	'1995-02-12',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2299,
	117,
	'1995-02-15',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2300,
	172,
	'1995-02-16',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2301,
	116,
	'1995-02-16',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2302,
	147,
	'1995-02-17',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2303,
	166,
	'1995-02-18',
	'r1',
	'South',
	299)
;
INSERT INTO sales_order VALUES (
	2304,
	107,
	'1995-02-18',
	'r1',
	'South',
	667)
;
INSERT INTO sales_order VALUES (
	2305,
	201,
	'1995-02-18',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2306,
	199,
	'1995-02-19',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2307,
	103,
	'1995-02-22',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2308,
	111,
	'1995-02-23',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2309,
	129,
	'1995-02-24',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2310,
	147,
	'1995-02-25',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2311,
	152,
	'1995-02-25',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2312,
	209,
	'1995-02-26',
	'r1',
	'Western',
	299)
;
INSERT INTO sales_order VALUES (
	2313,
	110,
	'1995-03-01',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2314,
	161,
	'1995-03-01',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2315,
	190,
	'1995-03-02',
	'r1',
	'Central',
	902)
;
INSERT INTO sales_order VALUES (
	2316,
	138,
	'1995-03-03',
	'r1',
	'Canada',
	856)
;
INSERT INTO sales_order VALUES (
	2317,
	159,
	'1995-03-04',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2318,
	102,
	'1995-03-05',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2319,
	117,
	'1995-03-08',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2320,
	172,
	'1995-03-09',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2321,
	201,
	'1995-03-09',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2322,
	189,
	'1995-03-10',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2323,
	119,
	'1995-03-10',
	'r1',
	'Western',
	1596)
;
INSERT INTO sales_order VALUES (
	2324,
	174,
	'1995-03-11',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2325,
	143,
	'1995-03-12',
	'r1',
	'Canada',
	467)
;
INSERT INTO sales_order VALUES (
	2326,
	205,
	'1995-03-12',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2327,
	121,
	'1995-03-15',
	'r1',
	'Central',
	902)
;
INSERT INTO sales_order VALUES (
	2328,
	137,
	'1995-03-16',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2329,
	169,
	'1995-03-17',
	'r1',
	'South',
	299)
;
INSERT INTO sales_order VALUES (
	2330,
	112,
	'1995-03-18',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2331,
	104,
	'1995-03-18',
	'r1',
	'South',
	129)
;
INSERT INTO sales_order VALUES (
	2332,
	203,
	'1995-03-19',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2333,
	114,
	'1995-03-19',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2334,
	138,
	'1995-03-22',
	'r1',
	'Canada',
	1596)
;
INSERT INTO sales_order VALUES (
	2335,
	146,
	'1995-03-23',
	'r1',
	'Western',
	299)
;
INSERT INTO sales_order VALUES (
	2336,
	207,
	'1995-03-23',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2337,
	101,
	'1995-03-24',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2338,
	102,
	'1995-03-25',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2339,
	209,
	'1995-03-25',
	'r1',
	'Western',
	856)
;
INSERT INTO sales_order VALUES (
	2340,
	103,
	'1995-03-26',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2341,
	208,
	'1995-03-26',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2342,
	104,
	'1995-03-29',
	'r1',
	'South',
	129)
;
INSERT INTO sales_order VALUES (
	2343,
	207,
	'1995-03-29',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2344,
	105,
	'1995-03-30',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2345,
	206,
	'1995-03-30',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2346,
	106,
	'1995-03-31',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2347,
	205,
	'1995-03-31',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2348,
	107,
	'1995-04-01',
	'r1',
	'South',
	467)
;
INSERT INTO sales_order VALUES (
	2349,
	204,
	'1995-04-01',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2350,
	108,
	'1995-04-02',
	'r1',
	'South',
	902)
;
INSERT INTO sales_order VALUES (
	2351,
	203,
	'1995-04-02',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2352,
	109,
	'1995-04-05',
	'r1',
	'Canada',
	299)
;
INSERT INTO sales_order VALUES (
	2353,
	202,
	'1995-04-05',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2354,
	110,
	'1995-04-06',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2355,
	201,
	'1995-04-06',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2356,
	111,
	'1995-04-07',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2357,
	200,
	'1995-04-07',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2358,
	112,
	'1995-04-08',
	'r1',
	'Central',
	1596)
;
INSERT INTO sales_order VALUES (
	2359,
	199,
	'1995-04-08',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2360,
	113,
	'1995-04-09',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2361,
	198,
	'1995-04-09',
	'r1',
	'Western',
	949)
;
INSERT INTO sales_order VALUES (
	2362,
	114,
	'1995-04-12',
	'r1',
	'Central',
	902)
;
INSERT INTO sales_order VALUES (
	2363,
	197,
	'1995-04-12',
	'r1',
	'South',
	856)
;
INSERT INTO sales_order VALUES (
	2364,
	115,
	'1995-04-13',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2365,
	196,
	'1995-04-13',
	'r1',
	'Canada',
	667)
;
INSERT INTO sales_order VALUES (
	2366,
	116,
	'1995-04-14',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2367,
	195,
	'1995-04-15',
	'r1',
	'South',
	1142)
;
INSERT INTO sales_order VALUES (
	2368,
	117,
	'1995-04-15',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2369,
	194,
	'1995-04-16',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2370,
	118,
	'1995-04-16',
	'r1',
	'South',
	1596)
;
INSERT INTO sales_order VALUES (
	2371,
	193,
	'1995-04-19',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2372,
	119,
	'1995-04-19',
	'r1',
	'Western',
	467)
;
INSERT INTO sales_order VALUES (
	2373,
	192,
	'1995-04-20',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2374,
	120,
	'1995-04-20',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2375,
	191,
	'1995-04-21',
	'r1',
	'South',
	856)
;
INSERT INTO sales_order VALUES (
	2376,
	121,
	'1995-04-21',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2377,
	190,
	'1995-04-22',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2378,
	122,
	'1995-04-22',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2379,
	189,
	'1995-04-23',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2380,
	123,
	'1995-04-26',
	'r1',
	'Canada',
	195)
;
INSERT INTO sales_order VALUES (
	2381,
	188,
	'1995-04-26',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2382,
	124,
	'1995-04-27',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2383,
	187,
	'1995-04-27',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2384,
	125,
	'1995-04-28',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2385,
	126,
	'1995-04-29',
	'r1',
	'Western',
	949)
;
INSERT INTO sales_order VALUES (
	2386,
	185,
	'1995-04-29',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2387,
	127,
	'1995-04-30',
	'r1',
	'South',
	856)
;
INSERT INTO sales_order VALUES (
	2388,
	184,
	'1995-04-30',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2389,
	101,
	'1995-04-16',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2390,
	183,
	'1995-05-03',
	'r1',
	'South',
	667)
;
INSERT INTO sales_order VALUES (
	2391,
	128,
	'1995-05-03',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2392,
	182,
	'1995-05-04',
	'r1',
	'Western',
	690)
;
INSERT INTO sales_order VALUES (
	2393,
	129,
	'1995-05-04',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2394,
	181,
	'1995-05-05',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2395,
	130,
	'1995-05-05',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2396,
	180,
	'1995-05-06',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2397,
	131,
	'1995-05-06',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2398,
	132,
	'1995-05-07',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2399,
	178,
	'1995-05-10',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2400,
	133,
	'1995-05-10',
	'r1',
	'Western',
	1142)
;
INSERT INTO sales_order VALUES (
	2401,
	177,
	'1995-05-11',
	'r1',
	'South',
	690)
;
INSERT INTO sales_order VALUES (
	2402,
	134,
	'1995-05-11',
	'r1',
	'Central',
	1596)
;
INSERT INTO sales_order VALUES (
	2403,
	176,
	'1995-05-12',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2404,
	135,
	'1995-05-12',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2405,
	175,
	'1995-05-13',
	'r1',
	'Canada',
	949)
;
INSERT INTO sales_order VALUES (
	2406,
	136,
	'1995-05-13',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2407,
	174,
	'1995-05-14',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2408,
	137,
	'1995-05-14',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2409,
	173,
	'1995-05-17',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2410,
	138,
	'1995-05-17',
	'r1',
	'Canada',
	129)
;
INSERT INTO sales_order VALUES (
	2411,
	172,
	'1995-05-18',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2412,
	139,
	'1995-05-19',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2413,
	171,
	'1995-05-19',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2414,
	140,
	'1995-05-20',
	'r1',
	'Western',
	467)
;
INSERT INTO sales_order VALUES (
	2415,
	170,
	'1995-05-20',
	'r1',
	'South',
	949)
;
INSERT INTO sales_order VALUES (
	2416,
	141,
	'1995-05-20',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2417,
	169,
	'1995-05-20',
	'r1',
	'South',
	856)
;
INSERT INTO sales_order VALUES (
	2418,
	142,
	'1995-05-21',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2419,
	168,
	'1995-05-21',
	'r1',
	'Western',
	856)
;
INSERT INTO sales_order VALUES (
	2420,
	143,
	'1995-05-24',
	'r1',
	'Canada',
	667)
;
INSERT INTO sales_order VALUES (
	2421,
	167,
	'1995-05-24',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2422,
	144,
	'1995-05-24',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2423,
	166,
	'1995-05-25',
	'r1',
	'South',
	690)
;
INSERT INTO sales_order VALUES (
	2424,
	143,
	'1995-05-25',
	'r1',
	'Canada',
	1596)
;
INSERT INTO sales_order VALUES (
	2425,
	165,
	'1995-05-26',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2426,
	144,
	'1995-05-26',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2427,
	164,
	'1995-05-26',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2428,
	145,
	'1995-05-31',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2429,
	163,
	'1995-05-31',
	'r1',
	'Canada',
	667)
;
INSERT INTO sales_order VALUES (
	2430,
	146,
	'1995-06-01',
	'r1',
	'Western',
	1142)
;
INSERT INTO sales_order VALUES (
	2431,
	162,
	'1995-06-01',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2432,
	147,
	'1995-06-02',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2433,
	161,
	'1995-06-02',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2434,
	148,
	'1995-06-03',
	'r1',
	'Canada',
	299)
;
INSERT INTO sales_order VALUES (
	2435,
	160,
	'1995-06-03',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2436,
	149,
	'1995-06-04',
	'r1',
	'Canada',
	949)
;
INSERT INTO sales_order VALUES (
	2437,
	159,
	'1995-06-04',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2438,
	150,
	'1995-06-07',
	'r1',
	'Canada',
	856)
;
INSERT INTO sales_order VALUES (
	2439,
	158,
	'1995-06-07',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2440,
	151,
	'1995-06-08',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2441,
	157,
	'1995-06-08',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2442,
	152,
	'1995-06-08',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2443,
	156,
	'1995-06-09',
	'r1',
	'Central',
	1596)
;
INSERT INTO sales_order VALUES (
	2444,
	153,
	'1995-06-09',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2445,
	155,
	'1995-06-10',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2446,
	154,
	'1995-06-10',
	'r1',
	'South',
	949)
;
INSERT INTO sales_order VALUES (
	2447,
	101,
	'1995-06-11',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2448,
	209,
	'1995-06-11',
	'r1',
	'Western',
	299)
;
INSERT INTO sales_order VALUES (
	2449,
	102,
	'1995-06-14',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2450,
	208,
	'1995-06-14',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2451,
	103,
	'1995-06-15',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2452,
	104,
	'1995-06-15',
	'r1',
	'South',
	690)
;
INSERT INTO sales_order VALUES (
	2453,
	206,
	'1995-06-16',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2454,
	105,
	'1995-06-16',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2455,
	205,
	'1995-06-17',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2456,
	106,
	'1995-06-17',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2457,
	204,
	'1995-06-17',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2458,
	107,
	'1995-06-18',
	'r1',
	'South',
	299)
;
INSERT INTO sales_order VALUES (
	2459,
	203,
	'1995-06-21',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2460,
	108,
	'1995-06-21',
	'r1',
	'South',
	1142)
;
INSERT INTO sales_order VALUES (
	2461,
	202,
	'1995-06-22',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2462,
	109,
	'1995-06-22',
	'r1',
	'Canada',
	299)
;
INSERT INTO sales_order VALUES (
	2463,
	200,
	'1995-06-24',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2464,
	110,
	'1995-06-23',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2465,
	199,
	'1995-06-28',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2466,
	112,
	'1995-06-29',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2467,
	198,
	'1995-06-29',
	'r1',
	'Western',
	667)
;
INSERT INTO sales_order VALUES (
	2468,
	113,
	'1995-06-30',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2469,
	197,
	'1995-06-30',
	'r1',
	'South',
	129)
;
INSERT INTO sales_order VALUES (
	2470,
	114,
	'1995-07-01',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2471,
	196,
	'1995-07-01',
	'r1',
	'Canada',
	1596)
;
INSERT INTO sales_order VALUES (
	2472,
	115,
	'1995-07-01',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2473,
	195,
	'1995-07-05',
	'r1',
	'South',
	299)
;
INSERT INTO sales_order VALUES (
	2474,
	116,
	'1995-07-05',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2475,
	194,
	'1995-07-06',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2476,
	117,
	'1995-07-07',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2477,
	193,
	'1995-07-07',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2478,
	118,
	'1995-07-08',
	'r1',
	'South',
	949)
;
INSERT INTO sales_order VALUES (
	2479,
	192,
	'1995-07-08',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2480,
	119,
	'1995-07-09',
	'r1',
	'Western',
	299)
;
INSERT INTO sales_order VALUES (
	2481,
	191,
	'1995-07-09',
	'r1',
	'South',
	667)
;
INSERT INTO sales_order VALUES (
	2482,
	120,
	'1995-07-12',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2483,
	190,
	'1995-07-12',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2484,
	121,
	'1995-07-14',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2485,
	189,
	'1995-07-14',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2486,
	122,
	'1995-07-15',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2487,
	188,
	'1995-07-15',
	'r1',
	'Central',
	1596)
;
INSERT INTO sales_order VALUES (
	2488,
	123,
	'1995-07-16',
	'r1',
	'Canada',
	299)
;
INSERT INTO sales_order VALUES (
	2489,
	187,
	'1995-07-16',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2490,
	124,
	'1995-07-19',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2491,
	186,
	'1995-07-19',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2492,
	125,
	'1995-07-20',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2493,
	185,
	'1995-07-21',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2494,
	126,
	'1995-07-21',
	'r1',
	'Western',
	1142)
;
INSERT INTO sales_order VALUES (
	2495,
	184,
	'1995-07-22',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2496,
	127,
	'1995-07-23',
	'r1',
	'South',
	690)
;
INSERT INTO sales_order VALUES (
	2497,
	183,
	'1995-07-23',
	'r1',
	'South',
	1596)
;
INSERT INTO sales_order VALUES (
	2498,
	128,
	'1995-07-26',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2499,
	182,
	'1995-07-26',
	'r1',
	'Western',
	467)
;
INSERT INTO sales_order VALUES (
	2500,
	129,
	'1995-07-27',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2501,
	181,
	'1995-07-27',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2502,
	130,
	'1995-07-28',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2503,
	180,
	'1995-07-28',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2504,
	131,
	'1995-07-29',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2505,
	179,
	'1995-07-29',
	'r1',
	'South',
	129)
;
INSERT INTO sales_order VALUES (
	2506,
	132,
	'1995-07-30',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2507,
	178,
	'1995-07-30',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2508,
	133,
	'1995-08-02',
	'r1',
	'Western',
	195)
;
INSERT INTO sales_order VALUES (
	2509,
	177,
	'1995-08-03',
	'r1',
	'South',
	1596)
;
INSERT INTO sales_order VALUES (
	2510,
	134,
	'1995-08-04',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2511,
	176,
	'1995-08-05',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2512,
	135,
	'1995-08-05',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2513,
	175,
	'1995-08-06',
	'r1',
	'Canada',
	299)
;
INSERT INTO sales_order VALUES (
	2514,
	136,
	'1995-08-09',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2515,
	174,
	'1995-08-09',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2516,
	137,
	'1995-08-10',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2517,
	173,
	'1995-08-10',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2518,
	138,
	'1995-08-11',
	'r1',
	'Canada',
	195)
;
INSERT INTO sales_order VALUES (
	2519,
	172,
	'1995-08-11',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2520,
	139,
	'1995-08-12',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2521,
	171,
	'1995-08-12',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2522,
	140,
	'1995-08-12',
	'r1',
	'Western',
	195)
;
INSERT INTO sales_order VALUES (
	2523,
	170,
	'1995-08-16',
	'r1',
	'South',
	129)
;
INSERT INTO sales_order VALUES (
	2524,
	133,
	'1995-08-17',
	'r1',
	'Western',
	299)
;
INSERT INTO sales_order VALUES (
	2525,
	169,
	'1995-08-18',
	'r1',
	'South',
	949)
;
INSERT INTO sales_order VALUES (
	2526,
	134,
	'1995-08-19',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2527,
	168,
	'1995-08-19',
	'r1',
	'Western',
	949)
;
INSERT INTO sales_order VALUES (
	2528,
	135,
	'1995-08-20',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2529,
	167,
	'1995-08-23',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2530,
	136,
	'1995-08-23',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2531,
	166,
	'1995-08-24',
	'r1',
	'South',
	667)
;
INSERT INTO sales_order VALUES (
	2532,
	137,
	'1995-08-24',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2533,
	165,
	'1995-08-25',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2534,
	138,
	'1995-08-25',
	'r1',
	'Canada',
	690)
;
INSERT INTO sales_order VALUES (
	2535,
	164,
	'1995-08-26',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2536,
	139,
	'1995-08-26',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2537,
	163,
	'1995-08-27',
	'r1',
	'Canada',
	902)
;
INSERT INTO sales_order VALUES (
	2538,
	142,
	'1995-08-30',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2539,
	162,
	'1995-08-30',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2540,
	143,
	'1995-08-31',
	'r1',
	'Canada',
	949)
;
INSERT INTO sales_order VALUES (
	2541,
	161,
	'1995-08-31',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2542,
	160,
	'1995-09-01',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2543,
	144,
	'1995-09-01',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2544,
	159,
	'1995-09-02',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2545,
	145,
	'1995-09-02',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2546,
	158,
	'1995-09-03',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2547,
	146,
	'1995-09-03',
	'r1',
	'Western',
	1142)
;
INSERT INTO sales_order VALUES (
	2548,
	157,
	'1995-09-03',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2549,
	147,
	'1995-09-06',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2550,
	156,
	'1995-09-06',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2551,
	148,
	'1995-09-07',
	'r1',
	'Canada',
	1596)
;
INSERT INTO sales_order VALUES (
	2552,
	155,
	'1995-09-08',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2553,
	148,
	'1995-09-08',
	'r1',
	'Canada',
	467)
;
INSERT INTO sales_order VALUES (
	2554,
	154,
	'1995-09-09',
	'r1',
	'South',
	949)
;
INSERT INTO sales_order VALUES (
	2555,
	149,
	'1995-09-09',
	'r1',
	'Canada',
	902)
;
INSERT INTO sales_order VALUES (
	2556,
	153,
	'1995-09-09',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2557,
	150,
	'1995-09-10',
	'r1',
	'Canada',
	299)
;
INSERT INTO sales_order VALUES (
	2558,
	152,
	'1995-09-10',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2559,
	151,
	'1995-09-13',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2560,
	101,
	'1995-09-14',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2561,
	209,
	'1995-09-14',
	'r1',
	'Western',
	195)
;
INSERT INTO sales_order VALUES (
	2562,
	102,
	'1995-09-15',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2563,
	208,
	'1995-09-15',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2564,
	103,
	'1995-09-16',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2565,
	207,
	'1995-09-16',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2566,
	104,
	'1995-09-20',
	'r1',
	'South',
	949)
;
INSERT INTO sales_order VALUES (
	2567,
	206,
	'1995-09-20',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2568,
	105,
	'1995-09-21',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2569,
	205,
	'1995-09-21',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2570,
	106,
	'1995-09-22',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2571,
	204,
	'1995-09-22',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2572,
	107,
	'1995-09-22',
	'r1',
	'South',
	1142)
;
INSERT INTO sales_order VALUES (
	2573,
	203,
	'1995-09-23',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2574,
	108,
	'1995-09-23',
	'r1',
	'South',
	690)
;
INSERT INTO sales_order VALUES (
	2575,
	202,
	'1995-09-24',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2576,
	109,
	'1995-09-24',
	'r1',
	'Canada',
	667)
;
INSERT INTO sales_order VALUES (
	2577,
	201,
	'1995-09-27',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2578,
	110,
	'1995-09-27',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2579,
	133,
	'1995-09-29',
	'r1',
	'Western',
	195)
;
INSERT INTO sales_order VALUES (
	2580,
	200,
	'1995-09-28',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2581,
	111,
	'1995-09-29',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2582,
	209,
	'1994-09-30',
	'r1',
	'Western',
	299)
;
INSERT INTO sales_order VALUES (
	2583,
	101,
	'1995-10-04',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2584,
	208,
	'1995-10-05',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2585,
	102,
	'1995-10-07',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2586,
	207,
	'1995-10-08',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2587,
	103,
	'1995-10-11',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2588,
	206,
	'1995-10-12',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2589,
	104,
	'1995-10-12',
	'r1',
	'South',
	1142)
;
INSERT INTO sales_order VALUES (
	2590,
	205,
	'1995-10-13',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2591,
	105,
	'1995-10-13',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2592,
	204,
	'1995-10-13',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2593,
	106,
	'1995-10-15',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2594,
	203,
	'1995-10-15',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2595,
	107,
	'1995-10-15',
	'r1',
	'South',
	467)
;
INSERT INTO sales_order VALUES (
	2596,
	202,
	'1995-10-18',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2597,
	108,
	'1995-10-18',
	'r1',
	'South',
	902)
;
INSERT INTO sales_order VALUES (
	2598,
	201,
	'1995-10-19',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2599,
	109,
	'1995-10-19',
	'r1',
	'Canada',
	299)
;
INSERT INTO sales_order VALUES (
	2600,
	200,
	'1995-10-19',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2601,
	110,
	'1995-10-20',
	'r1',
	'Central',
	1142)
;
INSERT INTO sales_order VALUES (
	2602,
	199,
	'1995-10-20',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2603,
	111,
	'1995-10-21',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2604,
	198,
	'1995-10-22',
	'r1',
	'Western',
	1596)
;
INSERT INTO sales_order VALUES (
	2605,
	112,
	'1995-10-22',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2606,
	197,
	'1995-10-25',
	'r1',
	'South',
	467)
;
INSERT INTO sales_order VALUES (
	2607,
	113,
	'1995-10-25',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2608,
	196,
	'1995-10-25',
	'r1',
	'Canada',
	902)
;
INSERT INTO sales_order VALUES (
	2609,
	114,
	'1995-10-26',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2610,
	195,
	'1995-10-26',
	'r1',
	'South',
	299)
;
INSERT INTO sales_order VALUES (
	2611,
	115,
	'1995-10-27',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2612,
	194,
	'1995-10-27',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2613,
	116,
	'1995-10-28',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2614,
	193,
	'1995-10-28',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2615,
	117,
	'1995-10-28',
	'r1',
	'Central',
	1596)
;
INSERT INTO sales_order VALUES (
	2616,
	192,
	'1995-10-29',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2617,
	118,
	'1995-11-02',
	'r1',
	'South',
	467)
;
INSERT INTO sales_order VALUES (
	2618,
	191,
	'1995-11-02',
	'r1',
	'South',
	902)
;
INSERT INTO sales_order VALUES (
	2619,
	119,
	'1995-11-03',
	'r1',
	'Western',
	856)
;
INSERT INTO sales_order VALUES (
	2620,
	190,
	'1995-11-03',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2621,
	120,
	'1995-11-04',
	'r1',
	'Eastern',
	667)
;
INSERT INTO sales_order VALUES (
	2622,
	189,
	'1995-11-04',
	'r1',
	'Eastern',
	1142)
;
INSERT INTO sales_order VALUES (
	2623,
	121,
	'1995-11-05',
	'r1',
	'Central',
	129)
;
INSERT INTO sales_order VALUES (
	2624,
	188,
	'1995-11-05',
	'r1',
	'Central',
	195)
;
INSERT INTO sales_order VALUES (
	2625,
	122,
	'1995-11-08',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2626,
	187,
	'1995-11-08',
	'r1',
	'Central',
	1596)
;
INSERT INTO sales_order VALUES (
	2627,
	123,
	'1995-11-09',
	'r1',
	'Canada',
	299)
;
INSERT INTO sales_order VALUES (
	2628,
	186,
	'1995-11-09',
	'r1',
	'Central',
	467)
;
INSERT INTO sales_order VALUES (
	2629,
	124,
	'1995-11-10',
	'r1',
	'Eastern',
	949)
;
INSERT INTO sales_order VALUES (
	2630,
	185,
	'1995-11-10',
	'r1',
	'Eastern',
	902)
;
INSERT INTO sales_order VALUES (
	2631,
	125,
	'1995-11-11',
	'r1',
	'Central',
	856)
;
INSERT INTO sales_order VALUES (
	2632,
	184,
	'1995-11-11',
	'r1',
	'Central',
	299)
;
INSERT INTO sales_order VALUES (
	2633,
	126,
	'1995-11-12',
	'r1',
	'Western',
	667)
;
INSERT INTO sales_order VALUES (
	2634,
	183,
	'1995-11-12',
	'r1',
	'South',
	1142)
;
INSERT INTO sales_order VALUES (
	2635,
	127,
	'1995-11-15',
	'r1',
	'South',
	129)
;
INSERT INTO sales_order VALUES (
	2636,
	182,
	'1995-11-16',
	'r1',
	'Western',
	195)
;
INSERT INTO sales_order VALUES (
	2637,
	128,
	'1995-11-16',
	'r1',
	'Eastern',
	690)
;
INSERT INTO sales_order VALUES (
	2638,
	181,
	'1995-11-17',
	'r1',
	'Eastern',
	1596)
;
INSERT INTO sales_order VALUES (
	2639,
	129,
	'1995-11-17',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2640,
	180,
	'1995-11-18',
	'r1',
	'Eastern',
	467)
;
INSERT INTO sales_order VALUES (
	2641,
	130,
	'1995-11-18',
	'r1',
	'Central',
	949)
;
INSERT INTO sales_order VALUES (
	2642,
	179,
	'1995-11-19',
	'r1',
	'South',
	902)
;
INSERT INTO sales_order VALUES (
	2643,
	129,
	'1995-11-19',
	'r1',
	'Eastern',
	856)
;
INSERT INTO sales_order VALUES (
	2644,
	178,
	'1995-11-23',
	'r1',
	'Eastern',
	299)
;
INSERT INTO sales_order VALUES (
	2645,
	130,
	'1995-11-23',
	'r1',
	'Central',
	667)
;
INSERT INTO sales_order VALUES (
	2646,
	177,
	'1995-11-24',
	'r1',
	'South',
	1142)
;
INSERT INTO sales_order VALUES (
	2647,
	131,
	'1995-11-24',
	'r1',
	'Eastern',
	129)
;
INSERT INTO sales_order VALUES (
	2648,
	176,
	'1995-11-25',
	'r1',
	'Eastern',
	195)
;
INSERT INTO sales_order VALUES (
	2649,
	132,
	'1995-11-25',
	'r1',
	'Central',
	690)
;
INSERT INTO sales_order VALUES (
	2650,
	175,
	'1995-11-26',
	'r1',
	'Canada',
	1596)
;
INSERT INTO sales_order VALUES (
	2651,
	133,
	'1995-11-26',
	'r1',
	'Western',
	299)
;
INSERT INTO sales_order VALUES (
	2652,
	174,
	'1995-11-26',
	'r1',
	'Central',
	902)
;
commit
;
-- ============================================================ 
--   Load sales_order_items table                               
-- ============================================================ 
INSERT INTO sales_order_items VALUES (
	2001,
	1,
	300,
	12,
	'1994-09-15')
;
INSERT INTO sales_order_items VALUES (
	2001,
	2,
	301,
	12,
	'1994-09-14')
;
INSERT INTO sales_order_items VALUES (
	2001,
	3,
	302,
	12,
	'1994-09-14')
;
INSERT INTO sales_order_items VALUES (
	2002,
	1,
	400,
	24,
	'1994-09-18')
;
INSERT INTO sales_order_items VALUES (
	2002,
	2,
	401,
	24,
	'1994-09-18')
;
INSERT INTO sales_order_items VALUES (
	2003,
	1,
	500,
	12,
	'1994-09-23')
;
INSERT INTO sales_order_items VALUES (
	2003,
	2,
	501,
	12,
	'1994-09-23')
;
INSERT INTO sales_order_items VALUES (
	2004,
	1,
	600,
	48,
	'1994-09-23')
;
INSERT INTO sales_order_items VALUES (
	2004,
	2,
	601,
	48,
	'1994-09-23')
;
INSERT INTO sales_order_items VALUES (
	2005,
	1,
	700,
	12,
	'1995-09-24')
;
INSERT INTO sales_order_items VALUES (
	2006,
	1,
	300,
	48,
	'1995-09-28')
;
INSERT INTO sales_order_items VALUES (
	2007,
	1,
	301,
	24,
	'1995-09-30')
;
INSERT INTO sales_order_items VALUES (
	2008,
	1,
	302,
	12,
	'1995-10-01')
;
INSERT INTO sales_order_items VALUES (
	2009,
	1,
	400,
	12,
	'1995-10-04')
;
INSERT INTO sales_order_items VALUES (
	2010,
	1,
	401,
	12,
	'1995-10-05')
;
INSERT INTO sales_order_items VALUES (
	2011,
	1,
	500,
	36,
	'1995-10-07')
;
INSERT INTO sales_order_items VALUES (
	2012,
	1,
	501,
	12,
	'1995-10-06')
;
INSERT INTO sales_order_items VALUES (
	2013,
	1,
	600,
	24,
	'1995-10-11')
;
INSERT INTO sales_order_items VALUES (
	2013,
	2,
	601,
	24,
	'1995-10-11')
;
INSERT INTO sales_order_items VALUES (
	2014,
	1,
	700,
	36,
	'1995-10-07')
;
INSERT INTO sales_order_items VALUES (
	2015,
	1,
	300,
	24,
	'1995-10-06')
;
INSERT INTO sales_order_items VALUES (
	2015,
	2,
	301,
	24,
	'1995-10-06')
;
INSERT INTO sales_order_items VALUES (
	2015,
	3,
	302,
	24,
	'1995-10-06')
;
INSERT INTO sales_order_items VALUES (
	2015,
	4,
	700,
	24,
	'1995-10-06')
;
INSERT INTO sales_order_items VALUES (
	2016,
	1,
	400,
	12,
	'1995-10-08')
;
INSERT INTO sales_order_items VALUES (
	2016,
	2,
	401,
	12,
	'1994-10-08')
;
INSERT INTO sales_order_items VALUES (
	2016,
	3,
	500,
	12,
	'1995-10-08')
;
INSERT INTO sales_order_items VALUES (
	2016,
	4,
	501,
	12,
	'1994-10-08')
;
INSERT INTO sales_order_items VALUES (
	2017,
	1,
	302,
	48,
	'1995-09-07')
;
INSERT INTO sales_order_items VALUES (
	2017,
	2,
	600,
	48,
	'1995-10-08')
;
INSERT INTO sales_order_items VALUES (
	2017,
	3,
	601,
	48,
	'1995-10-08')
;
INSERT INTO sales_order_items VALUES (
	2018,
	1,
	700,
	60,
	'1995-09-08')
;
INSERT INTO sales_order_items VALUES (
	2019,
	1,
	300,
	12,
	'1994-08-13')
;
INSERT INTO sales_order_items VALUES (
	2020,
	1,
	700,
	24,
	'1995-09-03')
;
INSERT INTO sales_order_items VALUES (
	2021,
	1,
	600,
	12,
	'1995-10-08')
;
INSERT INTO sales_order_items VALUES (
	2022,
	1,
	500,
	24,
	'1995-11-04')
;
INSERT INTO sales_order_items VALUES (
	2023,
	1,
	401,
	24,
	'1995-12-08')
;
INSERT INTO sales_order_items VALUES (
	2024,
	1,
	302,
	36,
	'1996-01-11')
;
INSERT INTO sales_order_items VALUES (
	2025,
	1,
	501,
	12,
	'1995-11-02')
;
INSERT INTO sales_order_items VALUES (
	2026,
	1,
	301,
	48,
	'1995-08-04')
;
INSERT INTO sales_order_items VALUES (
	2026,
	2,
	700,
	48,
	'1995-08-04')
;
INSERT INTO sales_order_items VALUES (
	2027,
	1,
	401,
	12,
	'1995-12-16')
;
INSERT INTO sales_order_items VALUES (
	2028,
	1,
	601,
	24,
	'1994-12-31')
;
INSERT INTO sales_order_items VALUES (
	2029,
	1,
	302,
	48,
	'1994-12-14')
;
INSERT INTO sales_order_items VALUES (
	2030,
	1,
	300,
	24,
	'1995-10-06')
;
INSERT INTO sales_order_items VALUES (
	2030,
	2,
	301,
	24,
	'1995-10-06')
;
INSERT INTO sales_order_items VALUES (
	2030,
	3,
	302,
	24,
	'1995-10-06')
;
INSERT INTO sales_order_items VALUES (
	2030,
	4,
	700,
	24,
	'1995-10-06')
;
INSERT INTO sales_order_items VALUES (
	2031,
	1,
	400,
	48,
	'1994-12-01')
;
INSERT INTO sales_order_items VALUES (
	2031,
	2,
	401,
	48,
	'1995-12-01')
;
INSERT INTO sales_order_items VALUES (
	2032,
	1,
	501,
	60,
	'1996-01-05')
;
INSERT INTO sales_order_items VALUES (
	2033,
	1,
	400,
	24,
	'1995-08-16')
;
INSERT INTO sales_order_items VALUES (
	2033,
	2,
	401,
	24,
	'1994-08-14')
;
INSERT INTO sales_order_items VALUES (
	2035,
	1,
	501,
	36,
	'1995-10-29')
;
INSERT INTO sales_order_items VALUES (
	2036,
	1,
	600,
	12,
	'1995-07-07')
;
INSERT INTO sales_order_items VALUES (
	2037,
	1,
	601,
	12,
	'1994-07-28')
;
INSERT INTO sales_order_items VALUES (
	2038,
	1,
	700,
	60,
	'1995-08-05')
;
INSERT INTO sales_order_items VALUES (
	2039,
	1,
	300,
	12,
	'1994-08-31')
;
INSERT INTO sales_order_items VALUES (
	2040,
	1,
	301,
	24,
	'1995-10-26')
;
INSERT INTO sales_order_items VALUES (
	2041,
	1,
	302,
	36,
	'1995-11-01')
;
INSERT INTO sales_order_items VALUES (
	2042,
	1,
	400,
	12,
	'1995-08-27')
;
INSERT INTO sales_order_items VALUES (
	2043,
	1,
	401,
	36,
	'1995-09-20')
;
INSERT INTO sales_order_items VALUES (
	2044,
	1,
	500,
	48,
	'1995-01-15')
;
INSERT INTO sales_order_items VALUES (
	2045,
	1,
	501,
	36,
	'1995-01-04')
;
INSERT INTO sales_order_items VALUES (
	2046,
	1,
	600,
	12,
	'1995-08-03')
;
INSERT INTO sales_order_items VALUES (
	2047,
	1,
	601,
	24,
	'1995-09-10')
;
INSERT INTO sales_order_items VALUES (
	2048,
	1,
	700,
	12,
	'1995-09-10')
;
INSERT INTO sales_order_items VALUES (
	2049,
	1,
	300,
	24,
	'1995-08-19')
;
INSERT INTO sales_order_items VALUES (
	2050,
	1,
	301,
	24,
	'1995-08-30')
;
INSERT INTO sales_order_items VALUES (
	2051,
	1,
	302,
	36,
	'1994-11-16')
;
INSERT INTO sales_order_items VALUES (
	2052,
	1,
	400,
	48,
	'1996-01-03')
;
INSERT INTO sales_order_items VALUES (
	2053,
	1,
	401,
	60,
	'1995-12-29')
;
INSERT INTO sales_order_items VALUES (
	2054,
	1,
	500,
	12,
	'1995-11-29')
;
INSERT INTO sales_order_items VALUES (
	2055,
	1,
	501,
	12,
	'1995-09-29')
;
INSERT INTO sales_order_items VALUES (
	2056,
	1,
	600,
	24,
	'1995-10-15')
;
INSERT INTO sales_order_items VALUES (
	2057,
	1,
	700,
	24,
	'1995-09-20')
;
INSERT INTO sales_order_items VALUES (
	2058,
	1,
	300,
	12,
	'1995-10-06')
;
INSERT INTO sales_order_items VALUES (
	2059,
	1,
	301,
	12,
	'1995-10-06')
;
INSERT INTO sales_order_items VALUES (
	2060,
	1,
	302,
	12,
	'1995-11-02')
;
INSERT INTO sales_order_items VALUES (
	2061,
	1,
	400,
	24,
	'1995-01-19')
;
INSERT INTO sales_order_items VALUES (
	2062,
	1,
	401,
	36,
	'1995-12-16')
;
INSERT INTO sales_order_items VALUES (
	2063,
	1,
	500,
	48,
	'1995-12-20')
;
INSERT INTO sales_order_items VALUES (
	2064,
	1,
	501,
	60,
	'1995-11-01')
;
INSERT INTO sales_order_items VALUES (
	2065,
	1,
	600,
	12,
	'1994-07-07')
;
INSERT INTO sales_order_items VALUES (
	2067,
	1,
	700,
	72,
	'1995-10-25')
;
INSERT INTO sales_order_items VALUES (
	2068,
	1,
	300,
	36,
	'1995-11-01')
;
INSERT INTO sales_order_items VALUES (
	2069,
	1,
	301,
	12,
	'1995-08-17')
;
INSERT INTO sales_order_items VALUES (
	2070,
	1,
	302,
	24,
	'1994-08-31')
;
INSERT INTO sales_order_items VALUES (
	2071,
	1,
	400,
	60,
	'1995-11-24')
;
INSERT INTO sales_order_items VALUES (
	2072,
	1,
	400,
	24,
	'1995-11-15')
;
INSERT INTO sales_order_items VALUES (
	2073,
	1,
	401,
	24,
	'1995-12-01')
;
INSERT INTO sales_order_items VALUES (
	2074,
	1,
	500,
	12,
	'1996-01-20')
;
INSERT INTO sales_order_items VALUES (
	2074,
	2,
	501,
	12,
	'1996-01-20')
;
INSERT INTO sales_order_items VALUES (
	2075,
	1,
	600,
	12,
	'1995-08-18')
;
INSERT INTO sales_order_items VALUES (
	2076,
	1,
	601,
	36,
	'1995-09-20')
;
INSERT INTO sales_order_items VALUES (
	2077,
	1,
	700,
	48,
	'1995-10-06')
;
INSERT INTO sales_order_items VALUES (
	2078,
	1,
	300,
	12,
	'1995-11-01')
;
INSERT INTO sales_order_items VALUES (
	2079,
	1,
	301,
	24,
	'1995-10-04')
;
INSERT INTO sales_order_items VALUES (
	2080,
	1,
	302,
	12,
	'1995-11-01')
;
INSERT INTO sales_order_items VALUES (
	2081,
	1,
	400,
	36,
	'1994-12-04')
;
INSERT INTO sales_order_items VALUES (
	2082,
	1,
	401,
	48,
	'1996-01-07')
;
INSERT INTO sales_order_items VALUES (
	2083,
	1,
	500,
	60,
	'1994-07-16')
;
INSERT INTO sales_order_items VALUES (
	2084,
	1,
	501,
	60,
	'1995-08-13')
;
INSERT INTO sales_order_items VALUES (
	2085,
	1,
	600,
	24,
	'1994-09-11')
;
INSERT INTO sales_order_items VALUES (
	2086,
	1,
	601,
	12,
	'1995-10-12')
;
INSERT INTO sales_order_items VALUES (
	2087,
	1,
	700,
	36,
	'1995-11-10')
;
INSERT INTO sales_order_items VALUES (
	2089,
	1,
	300,
	12,
	'1995-12-14')
;
INSERT INTO sales_order_items VALUES (
	2090,
	1,
	301,
	24,
	'1996-01-14')
;
INSERT INTO sales_order_items VALUES (
	2091,
	1,
	302,
	60,
	'1995-12-31')
;
INSERT INTO sales_order_items VALUES (
	2092,
	1,
	400,
	12,
	'1995-07-13')
;
INSERT INTO sales_order_items VALUES (
	2093,
	1,
	401,
	24,
	'1994-08-15')
;
INSERT INTO sales_order_items VALUES (
	2094,
	1,
	500,
	24,
	'1995-09-15')
;
INSERT INTO sales_order_items VALUES (
	2095,
	1,
	300,
	36,
	'1995-10-19')
;
INSERT INTO sales_order_items VALUES (
	2095,
	2,
	301,
	36,
	'1995-10-19')
;
INSERT INTO sales_order_items VALUES (
	2095,
	3,
	302,
	36,
	'1995-10-19')
;
INSERT INTO sales_order_items VALUES (
	2096,
	1,
	501,
	12,
	'1995-11-17')
;
INSERT INTO sales_order_items VALUES (
	2097,
	1,
	600,
	48,
	'1994-12-21')
;
INSERT INTO sales_order_items VALUES (
	2098,
	1,
	601,
	60,
	'1996-01-17')
;
INSERT INTO sales_order_items VALUES (
	2099,
	1,
	700,
	12,
	'1994-07-22')
;
INSERT INTO sales_order_items VALUES (
	2100,
	1,
	400,
	36,
	'1995-08-23')
;
INSERT INTO sales_order_items VALUES (
	2101,
	1,
	401,
	24,
	'1994-09-22')
;
INSERT INTO sales_order_items VALUES (
	2102,
	1,
	500,
	12,
	'1995-10-25')
;
INSERT INTO sales_order_items VALUES (
	2103,
	1,
	501,
	48,
	'1995-11-23')
;
INSERT INTO sales_order_items VALUES (
	2104,
	1,
	600,
	12,
	'1994-12-23')
;
INSERT INTO sales_order_items VALUES (
	2105,
	1,
	700,
	24,
	'1996-01-24')
;
INSERT INTO sales_order_items VALUES (
	2106,
	1,
	300,
	12,
	'1995-07-08')
;
INSERT INTO sales_order_items VALUES (
	2107,
	1,
	301,
	36,
	'1994-08-08')
;
INSERT INTO sales_order_items VALUES (
	2109,
	1,
	400,
	60,
	'1994-10-07')
;
INSERT INTO sales_order_items VALUES (
	2110,
	1,
	401,
	24,
	'1995-11-09')
;
INSERT INTO sales_order_items VALUES (
	2111,
	1,
	500,
	36,
	'1995-12-13')
;
INSERT INTO sales_order_items VALUES (
	2112,
	1,
	501,
	12,
	'1996-01-10')
;
INSERT INTO sales_order_items VALUES (
	2112,
	2,
	601,
	12,
	'1995-07-13')
;
INSERT INTO sales_order_items VALUES (
	2113,
	1,
	600,
	12,
	'1995-07-16')
;
INSERT INTO sales_order_items VALUES (
	2114,
	1,
	600,
	24,
	'1995-08-16')
;
INSERT INTO sales_order_items VALUES (
	2114,
	2,
	601,
	24,
	'1995-08-16')
;
INSERT INTO sales_order_items VALUES (
	2115,
	1,
	600,
	36,
	'1994-09-14')
;
INSERT INTO sales_order_items VALUES (
	2115,
	2,
	700,
	36,
	'1994-09-14')
;
INSERT INTO sales_order_items VALUES (
	2116,
	1,
	300,
	48,
	'1995-10-15')
;
INSERT INTO sales_order_items VALUES (
	2117,
	1,
	301,
	60,
	'1994-11-13')
;
INSERT INTO sales_order_items VALUES (
	2118,
	1,
	302,
	12,
	'1995-12-20')
;
INSERT INTO sales_order_items VALUES (
	2119,
	1,
	400,
	24,
	'1996-01-17')
;
INSERT INTO sales_order_items VALUES (
	2120,
	1,
	401,
	24,
	'1995-07-22')
;
INSERT INTO sales_order_items VALUES (
	2121,
	1,
	500,
	12,
	'1994-08-22')
;
INSERT INTO sales_order_items VALUES (
	2122,
	1,
	501,
	48,
	'1995-09-23')
;
INSERT INTO sales_order_items VALUES (
	2123,
	1,
	600,
	60,
	'1995-10-22')
;
INSERT INTO sales_order_items VALUES (
	2124,
	1,
	601,
	60,
	'1994-11-23')
;
INSERT INTO sales_order_items VALUES (
	2125,
	1,
	400,
	36,
	'1995-12-27')
;
INSERT INTO sales_order_items VALUES (
	2125,
	2,
	401,
	36,
	'1995-12-27')
;
INSERT INTO sales_order_items VALUES (
	2125,
	3,
	500,
	36,
	'1995-12-27')
;
INSERT INTO sales_order_items VALUES (
	2126,
	1,
	301,
	24,
	'1994-07-04')
;
INSERT INTO sales_order_items VALUES (
	2127,
	1,
	400,
	36,
	'1995-07-08')
;
INSERT INTO sales_order_items VALUES (
	2128,
	1,
	400,
	24,
	'1994-07-30')
;
INSERT INTO sales_order_items VALUES (
	2128,
	2,
	700,
	36,
	'1994-07-30')
;
INSERT INTO sales_order_items VALUES (
	2129,
	1,
	300,
	12,
	'1994-07-09')
;
INSERT INTO sales_order_items VALUES (
	2130,
	1,
	501,
	24,
	'1994-07-21')
;
INSERT INTO sales_order_items VALUES (
	2131,
	1,
	300,
	12,
	'1994-07-04')
;
INSERT INTO sales_order_items VALUES (
	2131,
	2,
	301,
	12,
	'1994-07-04')
;
INSERT INTO sales_order_items VALUES (
	2131,
	3,
	302,
	12,
	'1994-07-04')
;
INSERT INTO sales_order_items VALUES (
	2132,
	1,
	400,
	48,
	'1994-07-10')
;
INSERT INTO sales_order_items VALUES (
	2132,
	2,
	401,
	48,
	'1994-07-10')
;
INSERT INTO sales_order_items VALUES (
	2133,
	1,
	500,
	24,
	'1994-07-14')
;
INSERT INTO sales_order_items VALUES (
	2134,
	1,
	600,
	12,
	'1994-07-16')
;
INSERT INTO sales_order_items VALUES (
	2135,
	1,
	300,
	12,
	'1994-07-08')
;
INSERT INTO sales_order_items VALUES (
	2135,
	2,
	301,
	12,
	'1994-07-08')
;
INSERT INTO sales_order_items VALUES (
	2135,
	3,
	302,
	12,
	'1994-07-08')
;
INSERT INTO sales_order_items VALUES (
	2136,
	1,
	400,
	24,
	'1994-07-14')
;
INSERT INTO sales_order_items VALUES (
	2136,
	2,
	401,
	24,
	'1994-07-14')
;
INSERT INTO sales_order_items VALUES (
	2137,
	1,
	500,
	60,
	'1994-07-15')
;
INSERT INTO sales_order_items VALUES (
	2137,
	2,
	501,
	60,
	'1994-07-15')
;
INSERT INTO sales_order_items VALUES (
	2138,
	1,
	600,
	36,
	'1994-07-18')
;
INSERT INTO sales_order_items VALUES (
	2138,
	2,
	601,
	36,
	'1994-07-18')
;
INSERT INTO sales_order_items VALUES (
	2139,
	1,
	700,
	60,
	'1994-07-21')
;
INSERT INTO sales_order_items VALUES (
	2140,
	1,
	300,
	36,
	'1994-07-22')
;
INSERT INTO sales_order_items VALUES (
	2140,
	2,
	301,
	36,
	'1994-07-22')
;
INSERT INTO sales_order_items VALUES (
	2140,
	3,
	302,
	36,
	'1994-07-22')
;
INSERT INTO sales_order_items VALUES (
	2141,
	1,
	400,
	12,
	'1994-07-23')
;
INSERT INTO sales_order_items VALUES (
	2141,
	2,
	401,
	12,
	'1994-07-23')
;
INSERT INTO sales_order_items VALUES (
	2142,
	1,
	500,
	24,
	'1994-07-24')
;
INSERT INTO sales_order_items VALUES (
	2142,
	2,
	501,
	24,
	'1994-07-24')
;
INSERT INTO sales_order_items VALUES (
	2143,
	1,
	600,
	48,
	'1994-07-25')
;
INSERT INTO sales_order_items VALUES (
	2143,
	2,
	601,
	48,
	'1994-07-25')
;
INSERT INTO sales_order_items VALUES (
	2144,
	1,
	400,
	12,
	'1994-07-25')
;
INSERT INTO sales_order_items VALUES (
	2144,
	2,
	700,
	12,
	'1994-07-25')
;
INSERT INTO sales_order_items VALUES (
	2145,
	1,
	500,
	24,
	'1994-07-29')
;
INSERT INTO sales_order_items VALUES (
	2145,
	2,
	501,
	24,
	'1994-07-29')
;
INSERT INTO sales_order_items VALUES (
	2146,
	1,
	600,
	12,
	'1994-07-29')
;
INSERT INTO sales_order_items VALUES (
	2146,
	2,
	601,
	12,
	'1994-07-29')
;
INSERT INTO sales_order_items VALUES (
	2146,
	3,
	700,
	12,
	'1994-07-29')
;
INSERT INTO sales_order_items VALUES (
	2147,
	1,
	300,
	36,
	'1994-07-30')
;
INSERT INTO sales_order_items VALUES (
	2147,
	2,
	301,
	36,
	'1994-07-30')
;
INSERT INTO sales_order_items VALUES (
	2147,
	3,
	302,
	36,
	'1994-07-30')
;
INSERT INTO sales_order_items VALUES (
	2148,
	1,
	400,
	12,
	'1994-08-01')
;
INSERT INTO sales_order_items VALUES (
	2148,
	2,
	401,
	12,
	'1994-08-01')
;
INSERT INTO sales_order_items VALUES (
	2149,
	1,
	500,
	24,
	'1994-08-04')
;
INSERT INTO sales_order_items VALUES (
	2149,
	2,
	501,
	24,
	'1994-08-04')
;
INSERT INTO sales_order_items VALUES (
	2150,
	1,
	600,
	12,
	'1994-08-05')
;
INSERT INTO sales_order_items VALUES (
	2150,
	2,
	601,
	12,
	'1994-08-05')
;
INSERT INTO sales_order_items VALUES (
	2151,
	1,
	700,
	72,
	'1994-08-06')
;
INSERT INTO sales_order_items VALUES (
	2152,
	1,
	400,
	12,
	'1994-08-07')
;
INSERT INTO sales_order_items VALUES (
	2152,
	2,
	401,
	12,
	'1994-08-07')
;
INSERT INTO sales_order_items VALUES (
	2153,
	1,
	500,
	24,
	'1994-08-08')
;
INSERT INTO sales_order_items VALUES (
	2153,
	2,
	501,
	24,
	'1994-08-08')
;
INSERT INTO sales_order_items VALUES (
	2154,
	1,
	600,
	36,
	'1994-08-11')
;
INSERT INTO sales_order_items VALUES (
	2154,
	2,
	601,
	36,
	'1994-08-11')
;
INSERT INTO sales_order_items VALUES (
	2155,
	1,
	700,
	60,
	'1994-08-11')
;
INSERT INTO sales_order_items VALUES (
	2156,
	1,
	300,
	12,
	'1994-08-13')
;
INSERT INTO sales_order_items VALUES (
	2156,
	2,
	301,
	12,
	'1994-08-13')
;
INSERT INTO sales_order_items VALUES (
	2156,
	3,
	302,
	12,
	'1994-08-13')
;
INSERT INTO sales_order_items VALUES (
	2156,
	4,
	700,
	12,
	'1994-08-13')
;
INSERT INTO sales_order_items VALUES (
	2157,
	1,
	400,
	24,
	'1994-08-14')
;
INSERT INTO sales_order_items VALUES (
	2157,
	2,
	401,
	24,
	'1994-08-14')
;
INSERT INTO sales_order_items VALUES (
	2157,
	3,
	500,
	24,
	'1994-08-14')
;
INSERT INTO sales_order_items VALUES (
	2157,
	4,
	501,
	24,
	'1994-08-14')
;
INSERT INTO sales_order_items VALUES (
	2158,
	1,
	500,
	12,
	'1994-08-15')
;
INSERT INTO sales_order_items VALUES (
	2158,
	2,
	501,
	12,
	'1994-08-15')
;
INSERT INTO sales_order_items VALUES (
	2158,
	3,
	600,
	36,
	'1994-08-15')
;
INSERT INTO sales_order_items VALUES (
	2158,
	4,
	601,
	36,
	'1994-08-15')
;
INSERT INTO sales_order_items VALUES (
	2159,
	1,
	600,
	24,
	'1994-08-15')
;
INSERT INTO sales_order_items VALUES (
	2160,
	1,
	601,
	24,
	'1994-08-15')
;
INSERT INTO sales_order_items VALUES (
	2161,
	1,
	300,
	36,
	'1994-08-19')
;
INSERT INTO sales_order_items VALUES (
	2161,
	2,
	301,
	36,
	'1994-08-19')
;
INSERT INTO sales_order_items VALUES (
	2161,
	3,
	302,
	12,
	'1994-08-19')
;
INSERT INTO sales_order_items VALUES (
	2162,
	1,
	400,
	24,
	'1994-08-20')
;
INSERT INTO sales_order_items VALUES (
	2162,
	2,
	401,
	12,
	'1994-08-20')
;
INSERT INTO sales_order_items VALUES (
	2162,
	3,
	500,
	36,
	'1994-08-20')
;
INSERT INTO sales_order_items VALUES (
	2163,
	1,
	600,
	24,
	'1994-08-21')
;
INSERT INTO sales_order_items VALUES (
	2163,
	2,
	601,
	24,
	'1994-08-21')
;
INSERT INTO sales_order_items VALUES (
	2164,
	1,
	600,
	60,
	'1994-08-22')
;
INSERT INTO sales_order_items VALUES (
	2164,
	2,
	601,
	60,
	'1994-08-22')
;
INSERT INTO sales_order_items VALUES (
	2164,
	3,
	700,
	36,
	'1994-08-22')
;
INSERT INTO sales_order_items VALUES (
	2165,
	1,
	300,
	12,
	'1994-08-25')
;
INSERT INTO sales_order_items VALUES (
	2165,
	2,
	301,
	24,
	'1994-08-25')
;
INSERT INTO sales_order_items VALUES (
	2165,
	3,
	302,
	12,
	'1994-08-25')
;
INSERT INTO sales_order_items VALUES (
	2166,
	1,
	400,
	36,
	'1994-08-26')
;
INSERT INTO sales_order_items VALUES (
	2166,
	2,
	401,
	36,
	'1994-08-26')
;
INSERT INTO sales_order_items VALUES (
	2167,
	1,
	400,
	12,
	'1994-08-27')
;
INSERT INTO sales_order_items VALUES (
	2167,
	2,
	401,
	12,
	'1994-08-27')
;
INSERT INTO sales_order_items VALUES (
	2167,
	3,
	500,
	12,
	'1994-08-27')
;
INSERT INTO sales_order_items VALUES (
	2167,
	4,
	501,
	24,
	'1994-08-27')
;
INSERT INTO sales_order_items VALUES (
	2168,
	1,
	600,
	24,
	'1994-08-28')
;
INSERT INTO sales_order_items VALUES (
	2168,
	2,
	601,
	24,
	'1994-08-28')
;
INSERT INTO sales_order_items VALUES (
	2169,
	1,
	300,
	36,
	'1994-08-29')
;
INSERT INTO sales_order_items VALUES (
	2169,
	2,
	301,
	36,
	'1995-08-29')
;
INSERT INTO sales_order_items VALUES (
	2169,
	3,
	302,
	24,
	'1994-08-29')
;
INSERT INTO sales_order_items VALUES (
	2170,
	1,
	400,
	60,
	'1994-08-31')
;
INSERT INTO sales_order_items VALUES (
	2170,
	2,
	401,
	24,
	'1994-08-31')
;
INSERT INTO sales_order_items VALUES (
	2170,
	3,
	500,
	24,
	'1994-08-31')
;
INSERT INTO sales_order_items VALUES (
	2171,
	1,
	600,
	12,
	'1994-09-02')
;
INSERT INTO sales_order_items VALUES (
	2171,
	2,
	601,
	12,
	'1994-09-02')
;
INSERT INTO sales_order_items VALUES (
	2172,
	1,
	300,
	24,
	'1994-08-31')
;
INSERT INTO sales_order_items VALUES (
	2172,
	2,
	301,
	24,
	'1995-08-31')
;
INSERT INTO sales_order_items VALUES (
	2172,
	3,
	302,
	24,
	'1995-08-31')
;
INSERT INTO sales_order_items VALUES (
	2173,
	1,
	400,
	12,
	'1994-09-02')
;
INSERT INTO sales_order_items VALUES (
	2173,
	2,
	401,
	12,
	'1994-09-02')
;
INSERT INTO sales_order_items VALUES (
	2174,
	1,
	500,
	36,
	'1994-09-03')
;
INSERT INTO sales_order_items VALUES (
	2174,
	2,
	501,
	36,
	'1994-09-03')
;
INSERT INTO sales_order_items VALUES (
	2175,
	1,
	600,
	48,
	'1994-09-04')
;
INSERT INTO sales_order_items VALUES (
	2175,
	2,
	601,
	48,
	'1994-09-04')
;
INSERT INTO sales_order_items VALUES (
	2176,
	1,
	700,
	60,
	'1994-09-04')
;
INSERT INTO sales_order_items VALUES (
	2177,
	1,
	300,
	12,
	'1994-09-04')
;
INSERT INTO sales_order_items VALUES (
	2178,
	1,
	300,
	24,
	'1994-09-08')
;
INSERT INTO sales_order_items VALUES (
	2178,
	2,
	301,
	24,
	'1994-09-08')
;
INSERT INTO sales_order_items VALUES (
	2178,
	3,
	400,
	12,
	'1994-09-08')
;
INSERT INTO sales_order_items VALUES (
	2179,
	1,
	500,
	36,
	'1994-09-09')
;
INSERT INTO sales_order_items VALUES (
	2179,
	2,
	501,
	36,
	'1994-09-09')
;
INSERT INTO sales_order_items VALUES (
	2180,
	1,
	600,
	12,
	'1994-09-10')
;
INSERT INTO sales_order_items VALUES (
	2180,
	2,
	601,
	12,
	'1994-09-10')
;
INSERT INTO sales_order_items VALUES (
	2180,
	3,
	700,
	24,
	'1994-09-10')
;
INSERT INTO sales_order_items VALUES (
	2181,
	1,
	400,
	36,
	'1994-09-11')
;
INSERT INTO sales_order_items VALUES (
	2181,
	2,
	401,
	36,
	'1994-09-11')
;
INSERT INTO sales_order_items VALUES (
	2182,
	1,
	500,
	12,
	'1994-09-11')
;
INSERT INTO sales_order_items VALUES (
	2182,
	2,
	501,
	12,
	'1994-09-11')
;
INSERT INTO sales_order_items VALUES (
	2183,
	1,
	600,
	24,
	'1994-09-16')
;
INSERT INTO sales_order_items VALUES (
	2183,
	2,
	601,
	24,
	'1994-09-16')
;
INSERT INTO sales_order_items VALUES (
	2184,
	1,
	300,
	12,
	'1994-09-17')
;
INSERT INTO sales_order_items VALUES (
	2184,
	2,
	301,
	12,
	'1994-09-17')
;
INSERT INTO sales_order_items VALUES (
	2184,
	3,
	700,
	12,
	'1994-09-17')
;
INSERT INTO sales_order_items VALUES (
	2185,
	1,
	400,
	24,
	'1994-09-18')
;
INSERT INTO sales_order_items VALUES (
	2185,
	2,
	401,
	24,
	'1994-09-18')
;
INSERT INTO sales_order_items VALUES (
	2186,
	1,
	500,
	36,
	'1994-09-21')
;
INSERT INTO sales_order_items VALUES (
	2186,
	2,
	501,
	36,
	'1994-09-21')
;
INSERT INTO sales_order_items VALUES (
	2187,
	1,
	600,
	48,
	'1994-09-22')
;
INSERT INTO sales_order_items VALUES (
	2187,
	2,
	601,
	48,
	'1994-09-22')
;
INSERT INTO sales_order_items VALUES (
	2188,
	1,
	700,
	60,
	'1994-09-23')
;
INSERT INTO sales_order_items VALUES (
	2189,
	1,
	300,
	12,
	'1994-09-23')
;
INSERT INTO sales_order_items VALUES (
	2189,
	2,
	302,
	12,
	'1994-09-23')
;
INSERT INTO sales_order_items VALUES (
	2190,
	1,
	301,
	24,
	'1994-09-24')
;
INSERT INTO sales_order_items VALUES (
	2190,
	2,
	400,
	24,
	'1994-09-24')
;
INSERT INTO sales_order_items VALUES (
	2190,
	3,
	501,
	24,
	'1994-09-24')
;
INSERT INTO sales_order_items VALUES (
	2191,
	1,
	302,
	36,
	'1994-09-25')
;
INSERT INTO sales_order_items VALUES (
	2191,
	2,
	601,
	36,
	'1994-09-25')
;
INSERT INTO sales_order_items VALUES (
	2191,
	3,
	700,
	36,
	'1994-09-25')
;
INSERT INTO sales_order_items VALUES (
	2192,
	1,
	301,
	12,
	'1994-09-28')
;
INSERT INTO sales_order_items VALUES (
	2192,
	2,
	401,
	12,
	'1994-09-28')
;
INSERT INTO sales_order_items VALUES (
	2192,
	3,
	600,
	12,
	'1994-09-28')
;
INSERT INTO sales_order_items VALUES (
	2193,
	1,
	600,
	24,
	'1994-09-29')
;
INSERT INTO sales_order_items VALUES (
	2193,
	2,
	601,
	24,
	'1994-09-29')
;
INSERT INTO sales_order_items VALUES (
	2193,
	3,
	700,
	24,
	'1994-09-29')
;
INSERT INTO sales_order_items VALUES (
	2194,
	1,
	300,
	12,
	'1994-09-30')
;
INSERT INTO sales_order_items VALUES (
	2194,
	2,
	301,
	12,
	'1994-09-30')
;
INSERT INTO sales_order_items VALUES (
	2194,
	3,
	302,
	12,
	'1994-09-30')
;
INSERT INTO sales_order_items VALUES (
	2195,
	1,
	400,
	12,
	'1994-10-01')
;
INSERT INTO sales_order_items VALUES (
	2195,
	2,
	500,
	24,
	'1994-10-01')
;
INSERT INTO sales_order_items VALUES (
	2195,
	3,
	501,
	24,
	'1994-10-01')
;
INSERT INTO sales_order_items VALUES (
	2196,
	1,
	400,
	36,
	'1994-10-02')
;
INSERT INTO sales_order_items VALUES (
	2196,
	2,
	401,
	36,
	'1994-10-02')
;
INSERT INTO sales_order_items VALUES (
	2196,
	3,
	500,
	24,
	'1994-10-02')
;
INSERT INTO sales_order_items VALUES (
	2197,
	1,
	600,
	48,
	'1994-10-05')
;
INSERT INTO sales_order_items VALUES (
	2197,
	2,
	601,
	48,
	'1994-10-05')
;
INSERT INTO sales_order_items VALUES (
	2197,
	3,
	700,
	48,
	'1994-10-05')
;
INSERT INTO sales_order_items VALUES (
	2198,
	1,
	300,
	12,
	'1994-10-06')
;
INSERT INTO sales_order_items VALUES (
	2198,
	2,
	301,
	12,
	'1994-10-06')
;
INSERT INTO sales_order_items VALUES (
	2198,
	3,
	302,
	12,
	'1994-10-06')
;
INSERT INTO sales_order_items VALUES (
	2199,
	1,
	400,
	36,
	'1994-10-07')
;
INSERT INTO sales_order_items VALUES (
	2199,
	2,
	401,
	36,
	'1994-10-07')
;
INSERT INTO sales_order_items VALUES (
	2199,
	3,
	600,
	12,
	'1994-10-07')
;
INSERT INTO sales_order_items VALUES (
	2200,
	1,
	400,
	24,
	'1994-10-08')
;
INSERT INTO sales_order_items VALUES (
	2200,
	2,
	401,
	24,
	'1994-10-08')
;
INSERT INTO sales_order_items VALUES (
	2200,
	3,
	500,
	24,
	'1994-10-08')
;
INSERT INTO sales_order_items VALUES (
	2201,
	1,
	600,
	60,
	'1994-10-09')
;
INSERT INTO sales_order_items VALUES (
	2201,
	2,
	601,
	60,
	'1994-10-09')
;
INSERT INTO sales_order_items VALUES (
	2201,
	3,
	700,
	60,
	'1994-10-09')
;
INSERT INTO sales_order_items VALUES (
	2202,
	1,
	300,
	12,
	'1994-10-12')
;
INSERT INTO sales_order_items VALUES (
	2202,
	2,
	301,
	12,
	'1994-10-12')
;
INSERT INTO sales_order_items VALUES (
	2202,
	3,
	302,
	12,
	'1994-10-12')
;
INSERT INTO sales_order_items VALUES (
	2203,
	1,
	400,
	24,
	'1994-10-13')
;
INSERT INTO sales_order_items VALUES (
	2203,
	2,
	401,
	24,
	'1994-10-13')
;
INSERT INTO sales_order_items VALUES (
	2204,
	1,
	400,
	24,
	'1994-10-14')
;
INSERT INTO sales_order_items VALUES (
	2204,
	2,
	401,
	24,
	'1994-10-14')
;
INSERT INTO sales_order_items VALUES (
	2204,
	3,
	500,
	36,
	'1994-10-14')
;
INSERT INTO sales_order_items VALUES (
	2204,
	4,
	501,
	36,
	'1994-10-14')
;
INSERT INTO sales_order_items VALUES (
	2205,
	1,
	500,
	12,
	'1994-10-15')
;
INSERT INTO sales_order_items VALUES (
	2205,
	2,
	501,
	12,
	'1994-10-15')
;
INSERT INTO sales_order_items VALUES (
	2205,
	3,
	700,
	24,
	'1994-10-15')
;
INSERT INTO sales_order_items VALUES (
	2206,
	1,
	300,
	12,
	'1994-10-16')
;
INSERT INTO sales_order_items VALUES (
	2206,
	2,
	301,
	12,
	'1994-10-16')
;
INSERT INTO sales_order_items VALUES (
	2206,
	3,
	302,
	12,
	'1994-10-16')
;
INSERT INTO sales_order_items VALUES (
	2206,
	4,
	700,
	12,
	'1994-10-16')
;
INSERT INTO sales_order_items VALUES (
	2207,
	1,
	400,
	24,
	'1994-10-19')
;
INSERT INTO sales_order_items VALUES (
	2207,
	2,
	401,
	24,
	'1994-10-19')
;
INSERT INTO sales_order_items VALUES (
	2207,
	3,
	501,
	12,
	'1994-10-19')
;
INSERT INTO sales_order_items VALUES (
	2208,
	1,
	400,
	36,
	'1994-10-20')
;
INSERT INTO sales_order_items VALUES (
	2208,
	2,
	401,
	36,
	'1994-10-20')
;
INSERT INTO sales_order_items VALUES (
	2208,
	3,
	500,
	36,
	'1994-10-20')
;
INSERT INTO sales_order_items VALUES (
	2208,
	4,
	501,
	36,
	'1994-10-20')
;
INSERT INTO sales_order_items VALUES (
	2209,
	1,
	500,
	12,
	'1994-10-21')
;
INSERT INTO sales_order_items VALUES (
	2209,
	2,
	501,
	12,
	'1994-10-21')
;
INSERT INTO sales_order_items VALUES (
	2209,
	3,
	600,
	12,
	'1994-10-21')
;
INSERT INTO sales_order_items VALUES (
	2209,
	4,
	601,
	12,
	'1994-10-21')
;
INSERT INTO sales_order_items VALUES (
	2210,
	1,
	300,
	24,
	'1994-10-22')
;
INSERT INTO sales_order_items VALUES (
	2210,
	2,
	301,
	24,
	'1994-10-22')
;
INSERT INTO sales_order_items VALUES (
	2210,
	3,
	302,
	24,
	'1994-10-22')
;
INSERT INTO sales_order_items VALUES (
	2210,
	4,
	700,
	24,
	'1994-10-22')
;
INSERT INTO sales_order_items VALUES (
	2211,
	1,
	400,
	36,
	'1994-10-23')
;
INSERT INTO sales_order_items VALUES (
	2211,
	2,
	501,
	24,
	'1994-10-23')
;
INSERT INTO sales_order_items VALUES (
	2211,
	3,
	600,
	12,
	'1994-10-23')
;
INSERT INTO sales_order_items VALUES (
	2212,
	1,
	401,
	36,
	'1994-10-26')
;
INSERT INTO sales_order_items VALUES (
	2212,
	2,
	500,
	24,
	'1994-10-26')
;
INSERT INTO sales_order_items VALUES (
	2212,
	3,
	601,
	12,
	'1994-10-26')
;
INSERT INTO sales_order_items VALUES (
	2213,
	1,
	300,
	48,
	'1994-10-27')
;
INSERT INTO sales_order_items VALUES (
	2213,
	2,
	301,
	36,
	'1994-10-27')
;
INSERT INTO sales_order_items VALUES (
	2213,
	3,
	600,
	24,
	'1994-10-27')
;
INSERT INTO sales_order_items VALUES (
	2213,
	4,
	601,
	24,
	'1994-10-27')
;
INSERT INTO sales_order_items VALUES (
	2214,
	1,
	302,
	12,
	'1994-10-28')
;
INSERT INTO sales_order_items VALUES (
	2214,
	2,
	401,
	12,
	'1994-10-28')
;
INSERT INTO sales_order_items VALUES (
	2214,
	3,
	700,
	24,
	'1994-10-28')
;
INSERT INTO sales_order_items VALUES (
	2215,
	1,
	301,
	12,
	'1994-10-29')
;
INSERT INTO sales_order_items VALUES (
	2215,
	2,
	500,
	12,
	'1994-10-29')
;
INSERT INTO sales_order_items VALUES (
	2215,
	3,
	700,
	36,
	'1994-10-29')
;
INSERT INTO sales_order_items VALUES (
	2216,
	1,
	400,
	24,
	'1994-10-30')
;
INSERT INTO sales_order_items VALUES (
	2216,
	2,
	401,
	24,
	'1994-10-30')
;
INSERT INTO sales_order_items VALUES (
	2217,
	1,
	400,
	24,
	'1994-11-02')
;
INSERT INTO sales_order_items VALUES (
	2217,
	2,
	500,
	36,
	'1994-11-02')
;
INSERT INTO sales_order_items VALUES (
	2217,
	3,
	501,
	36,
	'1994-11-02')
;
INSERT INTO sales_order_items VALUES (
	2218,
	1,
	600,
	24,
	'1994-11-03')
;
INSERT INTO sales_order_items VALUES (
	2218,
	2,
	601,
	24,
	'1994-11-03')
;
INSERT INTO sales_order_items VALUES (
	2219,
	3,
	300,
	24,
	'1994-11-04')
;
INSERT INTO sales_order_items VALUES (
	2219,
	4,
	401,
	12,
	'1994-11-04')
;
INSERT INTO sales_order_items VALUES (
	2219,
	5,
	700,
	48,
	'1994-11-04')
;
INSERT INTO sales_order_items VALUES (
	2220,
	1,
	301,
	24,
	'1994-11-05')
;
INSERT INTO sales_order_items VALUES (
	2220,
	2,
	700,
	36,
	'1994-11-05')
;
INSERT INTO sales_order_items VALUES (
	2221,
	1,
	401,
	12,
	'1994-11-06')
;
INSERT INTO sales_order_items VALUES (
	2221,
	2,
	601,
	24,
	'1994-11-06')
;
INSERT INTO sales_order_items VALUES (
	2222,
	1,
	500,
	12,
	'1994-11-09')
;
INSERT INTO sales_order_items VALUES (
	2222,
	2,
	501,
	12,
	'1994-11-09')
;
INSERT INTO sales_order_items VALUES (
	2223,
	1,
	600,
	24,
	'1994-11-10')
;
INSERT INTO sales_order_items VALUES (
	2223,
	2,
	601,
	24,
	'1994-11-10')
;
INSERT INTO sales_order_items VALUES (
	2223,
	3,
	700,
	12,
	'1994-11-10')
;
INSERT INTO sales_order_items VALUES (
	2224,
	1,
	300,
	24,
	'1994-11-11')
;
INSERT INTO sales_order_items VALUES (
	2224,
	2,
	301,
	24,
	'1994-11-11')
;
INSERT INTO sales_order_items VALUES (
	2224,
	3,
	302,
	24,
	'1994-11-11')
;
INSERT INTO sales_order_items VALUES (
	2225,
	1,
	400,
	36,
	'1994-11-12')
;
INSERT INTO sales_order_items VALUES (
	2225,
	2,
	401,
	36,
	'1994-11-12')
;
INSERT INTO sales_order_items VALUES (
	2226,
	1,
	500,
	12,
	'1994-11-13')
;
INSERT INTO sales_order_items VALUES (
	2226,
	2,
	501,
	12,
	'1994-11-13')
;
INSERT INTO sales_order_items VALUES (
	2227,
	1,
	600,
	12,
	'1994-11-16')
;
INSERT INTO sales_order_items VALUES (
	2227,
	2,
	601,
	12,
	'1994-11-16')
;
INSERT INTO sales_order_items VALUES (
	2228,
	1,
	300,
	36,
	'1994-11-17')
;
INSERT INTO sales_order_items VALUES (
	2228,
	2,
	302,
	36,
	'1994-11-17')
;
INSERT INTO sales_order_items VALUES (
	2229,
	1,
	301,
	24,
	'1994-11-18')
;
INSERT INTO sales_order_items VALUES (
	2229,
	2,
	400,
	24,
	'1994-11-18')
;
INSERT INTO sales_order_items VALUES (
	2229,
	3,
	700,
	12,
	'1994-11-18')
;
INSERT INTO sales_order_items VALUES (
	2230,
	1,
	600,
	60,
	'1994-11-19')
;
INSERT INTO sales_order_items VALUES (
	2230,
	2,
	601,
	60,
	'1994-11-19')
;
INSERT INTO sales_order_items VALUES (
	2231,
	1,
	500,
	72,
	'1994-11-20')
;
INSERT INTO sales_order_items VALUES (
	2231,
	2,
	501,
	60,
	'1994-11-20')
;
INSERT INTO sales_order_items VALUES (
	2232,
	1,
	400,
	36,
	'1994-11-23')
;
INSERT INTO sales_order_items VALUES (
	2232,
	2,
	401,
	36,
	'1994-11-23')
;
INSERT INTO sales_order_items VALUES (
	2233,
	1,
	500,
	12,
	'1994-11-24')
;
INSERT INTO sales_order_items VALUES (
	2233,
	2,
	501,
	12,
	'1994-11-24')
;
INSERT INTO sales_order_items VALUES (
	2234,
	1,
	600,
	24,
	'1994-11-25')
;
INSERT INTO sales_order_items VALUES (
	2234,
	2,
	601,
	24,
	'1994-11-25')
;
INSERT INTO sales_order_items VALUES (
	2235,
	1,
	300,
	36,
	'1994-11-26')
;
INSERT INTO sales_order_items VALUES (
	2235,
	2,
	302,
	36,
	'1994-11-26')
;
INSERT INTO sales_order_items VALUES (
	2236,
	1,
	301,
	12,
	'1994-11-27')
;
INSERT INTO sales_order_items VALUES (
	2236,
	2,
	700,
	60,
	'1994-11-27')
;
INSERT INTO sales_order_items VALUES (
	2237,
	1,
	400,
	36,
	'1994-11-30')
;
INSERT INTO sales_order_items VALUES (
	2237,
	2,
	401,
	36,
	'1994-11-30')
;
INSERT INTO sales_order_items VALUES (
	2238,
	1,
	500,
	24,
	'1994-11-27')
;
INSERT INTO sales_order_items VALUES (
	2239,
	1,
	600,
	72,
	'1994-12-01')
;
INSERT INTO sales_order_items VALUES (
	2239,
	2,
	601,
	60,
	'1994-12-01')
;
INSERT INTO sales_order_items VALUES (
	2240,
	1,
	300,
	12,
	'1994-12-02')
;
INSERT INTO sales_order_items VALUES (
	2240,
	2,
	301,
	12,
	'1994-12-02')
;
INSERT INTO sales_order_items VALUES (
	2240,
	3,
	302,
	12,
	'1994-12-02')
;
INSERT INTO sales_order_items VALUES (
	2241,
	1,
	400,
	24,
	'1994-12-03')
;
INSERT INTO sales_order_items VALUES (
	2241,
	2,
	401,
	24,
	'1994-12-03')
;
INSERT INTO sales_order_items VALUES (
	2242,
	1,
	600,
	60,
	'1994-12-04')
;
INSERT INTO sales_order_items VALUES (
	2242,
	2,
	601,
	48,
	'1994-12-04')
;
INSERT INTO sales_order_items VALUES (
	2243,
	1,
	500,
	24,
	'1994-12-07')
;
INSERT INTO sales_order_items VALUES (
	2243,
	2,
	501,
	12,
	'1994-12-07')
;
INSERT INTO sales_order_items VALUES (
	2244,
	1,
	300,
	24,
	'1994-12-08')
;
INSERT INTO sales_order_items VALUES (
	2244,
	2,
	302,
	24,
	'1994-12-08')
;
INSERT INTO sales_order_items VALUES (
	2245,
	1,
	301,
	36,
	'1994-12-09')
;
INSERT INTO sales_order_items VALUES (
	2245,
	2,
	400,
	24,
	'1994-12-09')
;
INSERT INTO sales_order_items VALUES (
	2246,
	1,
	600,
	48,
	'1994-12-10')
;
INSERT INTO sales_order_items VALUES (
	2246,
	2,
	601,
	60,
	'1994-12-10')
;
INSERT INTO sales_order_items VALUES (
	2247,
	1,
	300,
	12,
	'1994-12-11')
;
INSERT INTO sales_order_items VALUES (
	2247,
	2,
	700,
	24,
	'1994-12-11')
;
INSERT INTO sales_order_items VALUES (
	2248,
	1,
	301,
	12,
	'1994-12-14')
;
INSERT INTO sales_order_items VALUES (
	2248,
	2,
	400,
	12,
	'1994-12-14')
;
INSERT INTO sales_order_items VALUES (
	2249,
	1,
	302,
	12,
	'1994-12-14')
;
INSERT INTO sales_order_items VALUES (
	2249,
	2,
	401,
	24,
	'1994-12-14')
;
INSERT INTO sales_order_items VALUES (
	2250,
	1,
	300,
	24,
	'1994-12-15')
;
INSERT INTO sales_order_items VALUES (
	2250,
	2,
	700,
	36,
	'1994-12-15')
;
INSERT INTO sales_order_items VALUES (
	2251,
	1,
	500,
	12,
	'1994-12-17')
;
INSERT INTO sales_order_items VALUES (
	2251,
	2,
	501,
	24,
	'1994-12-17')
;
INSERT INTO sales_order_items VALUES (
	2252,
	1,
	300,
	12,
	'1994-12-18')
;
INSERT INTO sales_order_items VALUES (
	2252,
	2,
	302,
	12,
	'1994-12-18')
;
INSERT INTO sales_order_items VALUES (
	2253,
	1,
	301,
	24,
	'1994-12-21')
;
INSERT INTO sales_order_items VALUES (
	2253,
	2,
	400,
	12,
	'1994-12-21')
;
INSERT INTO sales_order_items VALUES (
	2254,
	1,
	500,
	36,
	'1994-12-22')
;
INSERT INTO sales_order_items VALUES (
	2254,
	2,
	501,
	24,
	'1994-12-22')
;
INSERT INTO sales_order_items VALUES (
	2255,
	1,
	600,
	48,
	'1994-12-23')
;
INSERT INTO sales_order_items VALUES (
	2255,
	2,
	601,
	36,
	'1994-12-23')
;
INSERT INTO sales_order_items VALUES (
	2256,
	1,
	400,
	12,
	'1994-12-24')
;
INSERT INTO sales_order_items VALUES (
	2256,
	2,
	401,
	12,
	'1994-12-24')
;
INSERT INTO sales_order_items VALUES (
	2257,
	1,
	302,
	24,
	'1994-12-25')
;
INSERT INTO sales_order_items VALUES (
	2257,
	2,
	400,
	12,
	'1994-12-25')
;
INSERT INTO sales_order_items VALUES (
	2257,
	3,
	700,
	24,
	'1994-12-25')
;
INSERT INTO sales_order_items VALUES (
	2258,
	1,
	300,
	36,
	'1994-12-28')
;
INSERT INTO sales_order_items VALUES (
	2258,
	2,
	301,
	24,
	'1994-12-28')
;
INSERT INTO sales_order_items VALUES (
	2258,
	3,
	302,
	12,
	'1994-12-28')
;
INSERT INTO sales_order_items VALUES (
	2259,
	1,
	400,
	36,
	'1994-12-29')
;
INSERT INTO sales_order_items VALUES (
	2259,
	2,
	401,
	36,
	'1994-12-29')
;
INSERT INTO sales_order_items VALUES (
	2260,
	1,
	600,
	48,
	'1994-12-30')
;
INSERT INTO sales_order_items VALUES (
	2260,
	2,
	601,
	48,
	'1994-12-30')
;
INSERT INTO sales_order_items VALUES (
	2261,
	1,
	300,
	12,
	'1994-12-31')
;
INSERT INTO sales_order_items VALUES (
	2261,
	2,
	700,
	48,
	'1994-12-31')
;
INSERT INTO sales_order_items VALUES (
	2262,
	1,
	301,
	24,
	'1995-01-04')
;
INSERT INTO sales_order_items VALUES (
	2262,
	2,
	400,
	12,
	'1995-01-04')
;
INSERT INTO sales_order_items VALUES (
	2263,
	1,
	300,
	24,
	'1995-01-05')
;
INSERT INTO sales_order_items VALUES (
	2263,
	2,
	302,
	24,
	'1995-01-05')
;
INSERT INTO sales_order_items VALUES (
	2264,
	1,
	401,
	36,
	'1995-01-06')
;
INSERT INTO sales_order_items VALUES (
	2264,
	2,
	501,
	48,
	'1995-01-06')
;
INSERT INTO sales_order_items VALUES (
	2264,
	3,
	600,
	12,
	'1995-01-06')
;
INSERT INTO sales_order_items VALUES (
	2265,
	1,
	400,
	24,
	'1995-01-07')
;
INSERT INTO sales_order_items VALUES (
	2265,
	2,
	401,
	24,
	'1995-01-07')
;
INSERT INTO sales_order_items VALUES (
	2266,
	1,
	500,
	12,
	'1995-01-08')
;
INSERT INTO sales_order_items VALUES (
	2266,
	2,
	501,
	12,
	'1995-01-08')
;
INSERT INTO sales_order_items VALUES (
	2267,
	1,
	600,
	24,
	'1995-01-11')
;
INSERT INTO sales_order_items VALUES (
	2267,
	2,
	601,
	12,
	'1995-01-11')
;
INSERT INTO sales_order_items VALUES (
	2267,
	3,
	700,
	48,
	'1995-01-11')
;
INSERT INTO sales_order_items VALUES (
	2268,
	1,
	300,
	12,
	'1995-01-12')
;
INSERT INTO sales_order_items VALUES (
	2268,
	2,
	301,
	12,
	'1995-01-12')
;
INSERT INTO sales_order_items VALUES (
	2269,
	1,
	300,
	24,
	'1995-01-13')
;
INSERT INTO sales_order_items VALUES (
	2269,
	2,
	400,
	48,
	'1995-01-13')
;
INSERT INTO sales_order_items VALUES (
	2269,
	3,
	601,
	12,
	'1995-01-13')
;
INSERT INTO sales_order_items VALUES (
	2270,
	1,
	400,
	36,
	'1995-01-14')
;
INSERT INTO sales_order_items VALUES (
	2270,
	2,
	401,
	24,
	'1995-01-14')
;
INSERT INTO sales_order_items VALUES (
	2271,
	1,
	500,
	12,
	'1995-01-15')
;
INSERT INTO sales_order_items VALUES (
	2272,
	1,
	600,
	24,
	'1995-01-15')
;
INSERT INTO sales_order_items VALUES (
	2272,
	2,
	601,
	12,
	'1995-01-15')
;
INSERT INTO sales_order_items VALUES (
	2273,
	1,
	700,
	60,
	'1995-01-14')
;
INSERT INTO sales_order_items VALUES (
	2274,
	1,
	300,
	48,
	'1995-01-18')
;
INSERT INTO sales_order_items VALUES (
	2274,
	2,
	301,
	36,
	'1995-01-18')
;
INSERT INTO sales_order_items VALUES (
	2275,
	1,
	400,
	12,
	'1995-01-19')
;
INSERT INTO sales_order_items VALUES (
	2275,
	2,
	401,
	24,
	'1995-01-19')
;
INSERT INTO sales_order_items VALUES (
	2276,
	1,
	500,
	36,
	'1995-01-20')
;
INSERT INTO sales_order_items VALUES (
	2276,
	2,
	501,
	24,
	'1995-01-20')
;
INSERT INTO sales_order_items VALUES (
	2277,
	1,
	600,
	12,
	'1995-01-21')
;
INSERT INTO sales_order_items VALUES (
	2277,
	2,
	601,
	24,
	'1995-01-21')
;
INSERT INTO sales_order_items VALUES (
	2278,
	1,
	700,
	48,
	'1995-01-21')
;
INSERT INTO sales_order_items VALUES (
	2279,
	1,
	300,
	12,
	'1995-01-22')
;
INSERT INTO sales_order_items VALUES (
	2280,
	1,
	301,
	24,
	'1995-01-22')
;
INSERT INTO sales_order_items VALUES (
	2280,
	2,
	700,
	48,
	'1995-01-22')
;
INSERT INTO sales_order_items VALUES (
	2281,
	1,
	400,
	12,
	'1995-01-25')
;
INSERT INTO sales_order_items VALUES (
	2281,
	2,
	401,
	12,
	'1995-01-25')
;
INSERT INTO sales_order_items VALUES (
	2282,
	1,
	600,
	24,
	'1995-01-26')
;
INSERT INTO sales_order_items VALUES (
	2282,
	2,
	601,
	12,
	'1995-01-26')
;
INSERT INTO sales_order_items VALUES (
	2283,
	1,
	700,
	48,
	'1995-01-25')
;
INSERT INTO sales_order_items VALUES (
	2284,
	1,
	301,
	12,
	'1995-01-27')
;
INSERT INTO sales_order_items VALUES (
	2284,
	2,
	700,
	60,
	'1995-01-27')
;
INSERT INTO sales_order_items VALUES (
	2285,
	1,
	300,
	24,
	'1995-01-28')
;
INSERT INTO sales_order_items VALUES (
	2285,
	2,
	302,
	12,
	'1995-01-28')
;
INSERT INTO sales_order_items VALUES (
	2286,
	1,
	301,
	24,
	'1995-01-29')
;
INSERT INTO sales_order_items VALUES (
	2286,
	2,
	400,
	12,
	'1995-01-29')
;
INSERT INTO sales_order_items VALUES (
	2287,
	1,
	500,
	12,
	'1995-01-29')
;
INSERT INTO sales_order_items VALUES (
	2287,
	2,
	501,
	24,
	'1995-01-29')
;
INSERT INTO sales_order_items VALUES (
	2288,
	1,
	600,
	12,
	'1995-02-02')
;
INSERT INTO sales_order_items VALUES (
	2288,
	2,
	601,
	24,
	'1995-02-02')
;
INSERT INTO sales_order_items VALUES (
	2289,
	1,
	700,
	48,
	'1995-02-01')
;
INSERT INTO sales_order_items VALUES (
	2290,
	1,
	300,
	12,
	'1995-02-05')
;
INSERT INTO sales_order_items VALUES (
	2290,
	2,
	301,
	12,
	'1995-02-05')
;
INSERT INTO sales_order_items VALUES (
	2290,
	3,
	600,
	24,
	'1995-02-05')
;
INSERT INTO sales_order_items VALUES (
	2291,
	1,
	601,
	12,
	'1995-02-08')
;
INSERT INTO sales_order_items VALUES (
	2291,
	2,
	700,
	12,
	'1995-02-08')
;
INSERT INTO sales_order_items VALUES (
	2292,
	1,
	500,
	24,
	'1995-02-09')
;
INSERT INTO sales_order_items VALUES (
	2292,
	2,
	501,
	12,
	'1995-02-09')
;
INSERT INTO sales_order_items VALUES (
	2293,
	1,
	600,
	24,
	'1995-02-10')
;
INSERT INTO sales_order_items VALUES (
	2293,
	2,
	601,
	12,
	'1995-02-10')
;
INSERT INTO sales_order_items VALUES (
	2294,
	1,
	700,
	36,
	'1995-02-09')
;
INSERT INTO sales_order_items VALUES (
	2295,
	1,
	500,
	12,
	'1995-02-11')
;
INSERT INTO sales_order_items VALUES (
	2295,
	2,
	501,
	24,
	'1995-02-11')
;
INSERT INTO sales_order_items VALUES (
	2296,
	1,
	600,
	36,
	'1995-02-12')
;
INSERT INTO sales_order_items VALUES (
	2296,
	2,
	601,
	24,
	'1995-02-12')
;
INSERT INTO sales_order_items VALUES (
	2297,
	1,
	700,
	12,
	'1995-02-11')
;
INSERT INTO sales_order_items VALUES (
	2298,
	1,
	300,
	60,
	'1995-02-15')
;
INSERT INTO sales_order_items VALUES (
	2298,
	2,
	301,
	36,
	'1995-02-15')
;
INSERT INTO sales_order_items VALUES (
	2299,
	1,
	400,
	12,
	'1995-02-16')
;
INSERT INTO sales_order_items VALUES (
	2299,
	2,
	401,
	12,
	'1995-02-16')
;
INSERT INTO sales_order_items VALUES (
	2300,
	1,
	600,
	36,
	'1995-02-17')
;
INSERT INTO sales_order_items VALUES (
	2300,
	2,
	601,
	24,
	'1995-02-17')
;
INSERT INTO sales_order_items VALUES (
	2301,
	1,
	700,
	36,
	'1995-02-17')
;
INSERT INTO sales_order_items VALUES (
	2302,
	1,
	400,
	12,
	'1995-02-18')
;
INSERT INTO sales_order_items VALUES (
	2302,
	2,
	401,
	24,
	'1995-02-18')
;
INSERT INTO sales_order_items VALUES (
	2303,
	1,
	500,
	36,
	'1995-02-19')
;
INSERT INTO sales_order_items VALUES (
	2303,
	2,
	501,
	36,
	'1995-02-19')
;
INSERT INTO sales_order_items VALUES (
	2304,
	1,
	700,
	60,
	'1995-02-18')
;
INSERT INTO sales_order_items VALUES (
	2305,
	1,
	301,
	12,
	'1995-02-19')
;
INSERT INTO sales_order_items VALUES (
	2306,
	1,
	300,
	24,
	'1995-02-22')
;
INSERT INTO sales_order_items VALUES (
	2306,
	2,
	302,
	12,
	'1995-02-22')
;
INSERT INTO sales_order_items VALUES (
	2307,
	1,
	301,
	36,
	'1995-02-23')
;
INSERT INTO sales_order_items VALUES (
	2307,
	2,
	700,
	12,
	'1995-02-23')
;
INSERT INTO sales_order_items VALUES (
	2308,
	1,
	400,
	24,
	'1995-02-24')
;
INSERT INTO sales_order_items VALUES (
	2308,
	2,
	401,
	24,
	'1995-02-24')
;
INSERT INTO sales_order_items VALUES (
	2309,
	1,
	500,
	12,
	'1995-02-25')
;
INSERT INTO sales_order_items VALUES (
	2309,
	2,
	501,
	12,
	'1995-02-25')
;
INSERT INTO sales_order_items VALUES (
	2310,
	1,
	600,
	24,
	'1995-02-26')
;
INSERT INTO sales_order_items VALUES (
	2310,
	2,
	601,
	24,
	'1995-02-26')
;
INSERT INTO sales_order_items VALUES (
	2311,
	1,
	700,
	36,
	'1995-02-25')
;
INSERT INTO sales_order_items VALUES (
	2312,
	1,
	300,
	12,
	'1995-03-01')
;
INSERT INTO sales_order_items VALUES (
	2312,
	2,
	301,
	12,
	'1995-03-01')
;
INSERT INTO sales_order_items VALUES (
	2312,
	3,
	302,
	12,
	'1995-03-01')
;
INSERT INTO sales_order_items VALUES (
	2313,
	1,
	300,
	12,
	'1995-03-02')
;
INSERT INTO sales_order_items VALUES (
	2313,
	2,
	700,
	24,
	'1995-03-02')
;
INSERT INTO sales_order_items VALUES (
	2314,
	1,
	301,
	24,
	'1995-03-02')
;
INSERT INTO sales_order_items VALUES (
	2315,
	1,
	400,
	12,
	'1995-03-03')
;
INSERT INTO sales_order_items VALUES (
	2315,
	2,
	401,
	12,
	'1995-03-03')
;
INSERT INTO sales_order_items VALUES (
	2316,
	1,
	500,
	24,
	'1995-03-04')
;
INSERT INTO sales_order_items VALUES (
	2316,
	2,
	501,
	12,
	'1995-03-04')
;
INSERT INTO sales_order_items VALUES (
	2317,
	1,
	600,
	36,
	'1995-03-05')
;
INSERT INTO sales_order_items VALUES (
	2317,
	2,
	601,
	48,
	'1995-03-05')
;
INSERT INTO sales_order_items VALUES (
	2318,
	1,
	300,
	12,
	'1995-03-08')
;
INSERT INTO sales_order_items VALUES (
	2318,
	2,
	301,
	12,
	'1995-03-08')
;
INSERT INTO sales_order_items VALUES (
	2319,
	1,
	302,
	24,
	'1995-03-09')
;
INSERT INTO sales_order_items VALUES (
	2319,
	2,
	700,
	36,
	'1995-03-09')
;
INSERT INTO sales_order_items VALUES (
	2320,
	1,
	400,
	12,
	'1995-03-10')
;
INSERT INTO sales_order_items VALUES (
	2320,
	2,
	401,
	12,
	'1995-03-10')
;
INSERT INTO sales_order_items VALUES (
	2321,
	1,
	501,
	24,
	'1995-03-10')
;
INSERT INTO sales_order_items VALUES (
	2322,
	1,
	700,
	60,
	'1995-03-11')
;
INSERT INTO sales_order_items VALUES (
	2323,
	1,
	600,
	48,
	'1995-03-10')
;
INSERT INTO sales_order_items VALUES (
	2324,
	1,
	601,
	24,
	'1995-03-12')
;
INSERT INTO sales_order_items VALUES (
	2324,
	2,
	700,
	12,
	'1995-03-12')
;
INSERT INTO sales_order_items VALUES (
	2325,
	1,
	400,
	24,
	'1995-03-15')
;
INSERT INTO sales_order_items VALUES (
	2326,
	1,
	600,
	12,
	'1995-03-15')
;
INSERT INTO sales_order_items VALUES (
	2327,
	1,
	300,
	24,
	'1995-03-16')
;
INSERT INTO sales_order_items VALUES (
	2327,
	2,
	302,
	12,
	'1995-03-16')
;
INSERT INTO sales_order_items VALUES (
	2328,
	1,
	301,
	36,
	'1995-03-17')
;
INSERT INTO sales_order_items VALUES (
	2328,
	2,
	302,
	24,
	'1995-03-17')
;
INSERT INTO sales_order_items VALUES (
	2329,
	1,
	300,
	12,
	'1995-03-18')
;
INSERT INTO sales_order_items VALUES (
	2329,
	2,
	700,
	48,
	'1995-03-18')
;
INSERT INTO sales_order_items VALUES (
	2330,
	1,
	400,
	24,
	'1995-03-19')
;
INSERT INTO sales_order_items VALUES (
	2331,
	1,
	501,
	12,
	'1995-03-18')
;
INSERT INTO sales_order_items VALUES (
	2332,
	1,
	600,
	72,
	'1995-03-22')
;
INSERT INTO sales_order_items VALUES (
	2333,
	1,
	700,
	12,
	'1995-03-19')
;
INSERT INTO sales_order_items VALUES (
	2334,
	1,
	301,
	24,
	'1995-03-23')
;
INSERT INTO sales_order_items VALUES (
	2334,
	2,
	302,
	12,
	'1995-03-23')
;
INSERT INTO sales_order_items VALUES (
	2335,
	1,
	300,
	36,
	'1995-03-24')
;
INSERT INTO sales_order_items VALUES (
	2336,
	1,
	700,
	36,
	'1995-03-24')
;
INSERT INTO sales_order_items VALUES (
	2337,
	1,
	300,
	12,
	'1995-03-25')
;
INSERT INTO sales_order_items VALUES (
	2337,
	2,
	301,
	24,
	'1995-03-25')
;
INSERT INTO sales_order_items VALUES (
	2338,
	1,
	302,
	12,
	'1995-03-25')
;
INSERT INTO sales_order_items VALUES (
	2339,
	1,
	400,
	24,
	'1995-03-26')
;
INSERT INTO sales_order_items VALUES (
	2340,
	1,
	500,
	36,
	'1995-03-29')
;
INSERT INTO sales_order_items VALUES (
	2341,
	1,
	601,
	12,
	'1995-03-26')
;
INSERT INTO sales_order_items VALUES (
	2342,
	1,
	700,
	24,
	'1995-03-30')
;
INSERT INTO sales_order_items VALUES (
	2343,
	1,
	400,
	12,
	'1995-03-30')
;
INSERT INTO sales_order_items VALUES (
	2344,
	1,
	501,
	36,
	'1995-03-31')
;
INSERT INTO sales_order_items VALUES (
	2345,
	1,
	600,
	24,
	'1995-03-30')
;
INSERT INTO sales_order_items VALUES (
	2346,
	1,
	302,
	12,
	'1995-03-31')
;
INSERT INTO sales_order_items VALUES (
	2347,
	1,
	400,
	38,
	'1995-04-01')
;
INSERT INTO sales_order_items VALUES (
	2348,
	1,
	500,
	24,
	'1995-04-02')
;
INSERT INTO sales_order_items VALUES (
	2349,
	1,
	302,
	60,
	'1995-04-01')
;
INSERT INTO sales_order_items VALUES (
	2350,
	1,
	401,
	48,
	'1995-04-05')
;
INSERT INTO sales_order_items VALUES (
	2351,
	1,
	500,
	12,
	'1995-04-02')
;
INSERT INTO sales_order_items VALUES (
	2352,
	1,
	300,
	36,
	'1995-04-06')
;
INSERT INTO sales_order_items VALUES (
	2353,
	1,
	501,
	24,
	'1995-04-05')
;
INSERT INTO sales_order_items VALUES (
	2354,
	1,
	600,
	12,
	'1995-04-07')
;
INSERT INTO sales_order_items VALUES (
	2355,
	1,
	601,
	36,
	'1995-04-07')
;
INSERT INTO sales_order_items VALUES (
	2355,
	2,
	700,
	24,
	'1995-04-07')
;
INSERT INTO sales_order_items VALUES (
	2356,
	1,
	300,
	12,
	'1995-04-08')
;
INSERT INTO sales_order_items VALUES (
	2357,
	1,
	302,
	24,
	'1995-04-07')
;
INSERT INTO sales_order_items VALUES (
	2358,
	1,
	401,
	36,
	'1995-04-09')
;
INSERT INTO sales_order_items VALUES (
	2359,
	1,
	500,
	12,
	'1995-04-09')
;
INSERT INTO sales_order_items VALUES (
	2360,
	1,
	301,
	24,
	'1995-04-12')
;
INSERT INTO sales_order_items VALUES (
	2360,
	2,
	302,
	12,
	'1995-04-12')
;
INSERT INTO sales_order_items VALUES (
	2361,
	1,
	400,
	36,
	'1995-04-09')
;
INSERT INTO sales_order_items VALUES (
	2362,
	1,
	501,
	24,
	'1995-04-13')
;
INSERT INTO sales_order_items VALUES (
	2363,
	1,
	601,
	36,
	'1995-04-13')
;
INSERT INTO sales_order_items VALUES (
	2364,
	1,
	700,
	72,
	'1995-04-14')
;
INSERT INTO sales_order_items VALUES (
	2365,
	1,
	300,
	12,
	'1995-04-13')
;
INSERT INTO sales_order_items VALUES (
	2366,
	1,
	500,
	36,
	'1995-04-15')
;
INSERT INTO sales_order_items VALUES (
	2366,
	2,
	501,
	24,
	'1995-04-15')
;
INSERT INTO sales_order_items VALUES (
	2367,
	1,
	400,
	12,
	'1995-04-16')
;
INSERT INTO sales_order_items VALUES (
	2368,
	1,
	401,
	24,
	'1995-04-15')
;
INSERT INTO sales_order_items VALUES (
	2369,
	1,
	700,
	48,
	'1995-04-19')
;
INSERT INTO sales_order_items VALUES (
	2370,
	1,
	600,
	12,
	'1995-04-19')
;
INSERT INTO sales_order_items VALUES (
	2371,
	1,
	501,
	36,
	'1995-04-20')
;
INSERT INTO sales_order_items VALUES (
	2372,
	1,
	300,
	24,
	'1995-04-20')
;
INSERT INTO sales_order_items VALUES (
	2373,
	1,
	302,
	12,
	'1995-04-21')
;
INSERT INTO sales_order_items VALUES (
	2374,
	1,
	501,
	36,
	'1995-04-21')
;
INSERT INTO sales_order_items VALUES (
	2375,
	1,
	500,
	24,
	'1995-04-22')
;
INSERT INTO sales_order_items VALUES (
	2376,
	1,
	600,
	12,
	'1995-04-22')
;
INSERT INTO sales_order_items VALUES (
	2377,
	1,
	700,
	48,
	'1995-04-23')
;
INSERT INTO sales_order_items VALUES (
	2378,
	1,
	301,
	36,
	'1995-04-23')
;
INSERT INTO sales_order_items VALUES (
	2379,
	1,
	401,
	24,
	'1995-04-23')
;
INSERT INTO sales_order_items VALUES (
	2379,
	2,
	600,
	12,
	'1995-04-23')
;
INSERT INTO sales_order_items VALUES (
	2380,
	1,
	400,
	36,
	'1995-04-27')
;
INSERT INTO sales_order_items VALUES (
	2381,
	1,
	302,
	24,
	'1995-04-27')
;
INSERT INTO sales_order_items VALUES (
	2382,
	1,
	400,
	12,
	'1995-04-28')
;
INSERT INTO sales_order_items VALUES (
	2383,
	1,
	601,
	24,
	'1995-04-28')
;
INSERT INTO sales_order_items VALUES (
	2384,
	1,
	300,
	48,
	'1995-04-29')
;
INSERT INTO sales_order_items VALUES (
	2384,
	2,
	401,
	36,
	'1995-04-29')
;
INSERT INTO sales_order_items VALUES (
	2385,
	1,
	700,
	24,
	'1995-04-30')
;
INSERT INTO sales_order_items VALUES (
	2386,
	1,
	500,
	12,
	'1995-04-30')
;
INSERT INTO sales_order_items VALUES (
	2387,
	1,
	302,
	24,
	'1995-04-30')
;
INSERT INTO sales_order_items VALUES (
	2387,
	2,
	700,
	36,
	'1995-04-30')
;
INSERT INTO sales_order_items VALUES (
	2388,
	1,
	401,
	12,
	'1995-04-30')
;
INSERT INTO sales_order_items VALUES (
	2388,
	2,
	501,
	24,
	'1995-04-30')
;
INSERT INTO sales_order_items VALUES (
	2388,
	3,
	700,
	60,
	'1995-04-30')
;
INSERT INTO sales_order_items VALUES (
	2389,
	1,
	600,
	24,
	'1995-04-19')
;
INSERT INTO sales_order_items VALUES (
	2389,
	2,
	601,
	12,
	'1995-04-19')
;
INSERT INTO sales_order_items VALUES (
	2390,
	1,
	400,
	36,
	'1995-05-04')
;
INSERT INTO sales_order_items VALUES (
	2390,
	2,
	401,
	24,
	'1995-05-04')
;
INSERT INTO sales_order_items VALUES (
	2391,
	1,
	300,
	12,
	'1995-05-04')
;
INSERT INTO sales_order_items VALUES (
	2392,
	1,
	500,
	24,
	'1995-05-05')
;
INSERT INTO sales_order_items VALUES (
	2392,
	2,
	501,
	24,
	'1995-05-05')
;
INSERT INTO sales_order_items VALUES (
	2393,
	1,
	600,
	12,
	'1995-05-04')
;
INSERT INTO sales_order_items VALUES (
	2394,
	1,
	700,
	48,
	'1995-05-05')
;
INSERT INTO sales_order_items VALUES (
	2395,
	1,
	301,
	60,
	'1995-05-06')
;
INSERT INTO sales_order_items VALUES (
	2395,
	2,
	302,
	24,
	'1995-05-06')
;
INSERT INTO sales_order_items VALUES (
	2396,
	1,
	500,
	12,
	'1995-05-07')
;
INSERT INTO sales_order_items VALUES (
	2396,
	2,
	501,
	12,
	'1995-05-07')
;
INSERT INTO sales_order_items VALUES (
	2397,
	1,
	700,
	36,
	'1995-05-07')
;
INSERT INTO sales_order_items VALUES (
	2398,
	1,
	400,
	24,
	'1995-05-07')
;
INSERT INTO sales_order_items VALUES (
	2398,
	2,
	500,
	12,
	'1995-05-10')
;
INSERT INTO sales_order_items VALUES (
	2398,
	3,
	501,
	24,
	'1995-05-10')
;
INSERT INTO sales_order_items VALUES (
	2399,
	1,
	401,
	48,
	'1995-05-11')
;
INSERT INTO sales_order_items VALUES (
	2399,
	2,
	700,
	12,
	'1995-05-11')
;
INSERT INTO sales_order_items VALUES (
	2400,
	1,
	300,
	24,
	'1995-05-11')
;
INSERT INTO sales_order_items VALUES (
	2400,
	2,
	301,
	24,
	'1995-05-11')
;
INSERT INTO sales_order_items VALUES (
	2401,
	1,
	600,
	12,
	'1995-05-12')
;
INSERT INTO sales_order_items VALUES (
	2401,
	2,
	601,
	24,
	'1995-05-12')
;
INSERT INTO sales_order_items VALUES (
	2402,
	1,
	302,
	36,
	'1995-05-11')
;
INSERT INTO sales_order_items VALUES (
	2403,
	1,
	400,
	12,
	'1995-05-12')
;
INSERT INTO sales_order_items VALUES (
	2403,
	2,
	401,
	12,
	'1995-05-12')
;
INSERT INTO sales_order_items VALUES (
	2404,
	1,
	500,
	24,
	'1995-05-13')
;
INSERT INTO sales_order_items VALUES (
	2404,
	2,
	501,
	12,
	'1995-05-13')
;
INSERT INTO sales_order_items VALUES (
	2405,
	1,
	300,
	36,
	'1995-05-14')
;
INSERT INTO sales_order_items VALUES (
	2405,
	2,
	301,
	36,
	'1995-05-14')
;
INSERT INTO sales_order_items VALUES (
	2406,
	1,
	400,
	24,
	'1995-05-14')
;
INSERT INTO sales_order_items VALUES (
	2406,
	2,
	401,
	12,
	'1995-05-14')
;
INSERT INTO sales_order_items VALUES (
	2407,
	1,
	302,
	36,
	'1995-05-17')
;
INSERT INTO sales_order_items VALUES (
	2407,
	2,
	700,
	24,
	'1995-05-17')
;
INSERT INTO sales_order_items VALUES (
	2408,
	1,
	500,
	36,
	'1995-05-14')
;
INSERT INTO sales_order_items VALUES (
	2408,
	2,
	501,
	24,
	'1995-05-14')
;
INSERT INTO sales_order_items VALUES (
	2409,
	1,
	600,
	12,
	'1995-05-18')
;
INSERT INTO sales_order_items VALUES (
	2409,
	2,
	601,
	24,
	'1995-05-18')
;
INSERT INTO sales_order_items VALUES (
	2410,
	1,
	400,
	12,
	'1995-05-17')
;
INSERT INTO sales_order_items VALUES (
	2411,
	1,
	300,
	36,
	'1995-05-19')
;
INSERT INTO sales_order_items VALUES (
	2411,
	2,
	301,
	24,
	'1995-05-19')
;
INSERT INTO sales_order_items VALUES (
	2411,
	3,
	302,
	12,
	'1995-05-19')
;
INSERT INTO sales_order_items VALUES (
	2412,
	1,
	400,
	24,
	'1995-05-20')
;
INSERT INTO sales_order_items VALUES (
	2412,
	2,
	401,
	24,
	'1995-05-20')
;
INSERT INTO sales_order_items VALUES (
	2413,
	1,
	500,
	60,
	'1995-05-19')
;
INSERT INTO sales_order_items VALUES (
	2414,
	1,
	501,
	36,
	'1995-05-21')
;
INSERT INTO sales_order_items VALUES (
	2414,
	2,
	600,
	24,
	'1995-05-21')
;
INSERT INTO sales_order_items VALUES (
	2415,
	1,
	601,
	12,
	'1995-05-21')
;
INSERT INTO sales_order_items VALUES (
	2416,
	1,
	700,
	36,
	'1995-05-20')
;
INSERT INTO sales_order_items VALUES (
	2417,
	1,
	302,
	12,
	'1995-05-20')
;
INSERT INTO sales_order_items VALUES (
	2418,
	1,
	300,
	24,
	'1995-05-24')
;
INSERT INTO sales_order_items VALUES (
	2418,
	2,
	301,
	12,
	'1995-05-24')
;
INSERT INTO sales_order_items VALUES (
	2419,
	1,
	302,
	24,
	'1995-05-21')
;
INSERT INTO sales_order_items VALUES (
	2420,
	1,
	400,
	36,
	'1995-05-25')
;
INSERT INTO sales_order_items VALUES (
	2421,
	1,
	401,
	48,
	'1995-05-25')
;
INSERT INTO sales_order_items VALUES (
	2422,
	1,
	500,
	36,
	'1995-05-24')
;
INSERT INTO sales_order_items VALUES (
	2423,
	1,
	501,
	12,
	'1995-05-26')
;
INSERT INTO sales_order_items VALUES (
	2423,
	2,
	600,
	24,
	'1995-05-26')
;
INSERT INTO sales_order_items VALUES (
	2424,
	1,
	601,
	36,
	'1995-05-26')
;
INSERT INTO sales_order_items VALUES (
	2425,
	1,
	600,
	24,
	'1995-05-26')
;
INSERT INTO sales_order_items VALUES (
	2425,
	2,
	700,
	12,
	'1995-05-26')
;
INSERT INTO sales_order_items VALUES (
	2426,
	1,
	300,
	12,
	'1995-05-31')
;
INSERT INTO sales_order_items VALUES (
	2426,
	2,
	301,
	24,
	'1995-05-31')
;
INSERT INTO sales_order_items VALUES (
	2426,
	3,
	302,
	24,
	'1995-05-31')
;
INSERT INTO sales_order_items VALUES (
	2427,
	1,
	700,
	36,
	'1995-05-26')
;
INSERT INTO sales_order_items VALUES (
	2428,
	1,
	400,
	12,
	'1995-06-01')
;
INSERT INTO sales_order_items VALUES (
	2428,
	2,
	401,
	24,
	'1995-06-01')
;
INSERT INTO sales_order_items VALUES (
	2429,
	1,
	500,
	24,
	'1995-05-31')
;
INSERT INTO sales_order_items VALUES (
	2430,
	1,
	501,
	12,
	'1995-06-02')
;
INSERT INTO sales_order_items VALUES (
	2430,
	2,
	600,
	24,
	'1995-06-02')
;
INSERT INTO sales_order_items VALUES (
	2431,
	1,
	601,
	36,
	'1995-06-01')
;
INSERT INTO sales_order_items VALUES (
	2432,
	1,
	300,
	24,
	'1995-06-03')
;
INSERT INTO sales_order_items VALUES (
	2432,
	2,
	700,
	12,
	'1995-06-03')
;
INSERT INTO sales_order_items VALUES (
	2433,
	1,
	301,
	36,
	'1995-06-03')
;
INSERT INTO sales_order_items VALUES (
	2434,
	1,
	302,
	12,
	'1995-06-04')
;
INSERT INTO sales_order_items VALUES (
	2434,
	2,
	400,
	24,
	'1995-06-04')
;
INSERT INTO sales_order_items VALUES (
	2435,
	1,
	401,
	24,
	'1995-06-04')
;
INSERT INTO sales_order_items VALUES (
	2436,
	1,
	500,
	36,
	'1995-06-07')
;
INSERT INTO sales_order_items VALUES (
	2436,
	2,
	501,
	24,
	'1995-06-07')
;
INSERT INTO sales_order_items VALUES (
	2437,
	1,
	600,
	12,
	'1995-06-04')
;
INSERT INTO sales_order_items VALUES (
	2438,
	1,
	601,
	24,
	'1995-06-08')
;
INSERT INTO sales_order_items VALUES (
	2438,
	2,
	700,
	36,
	'1995-06-08')
;
INSERT INTO sales_order_items VALUES (
	2439,
	1,
	300,
	12,
	'1995-06-07')
;
INSERT INTO sales_order_items VALUES (
	2439,
	2,
	301,
	12,
	'1995-06-07')
;
INSERT INTO sales_order_items VALUES (
	2440,
	1,
	400,
	24,
	'1995-06-09')
;
INSERT INTO sales_order_items VALUES (
	2440,
	2,
	401,
	12,
	'1995-06-09')
;
INSERT INTO sales_order_items VALUES (
	2441,
	1,
	500,
	36,
	'1995-06-08')
;
INSERT INTO sales_order_items VALUES (
	2441,
	2,
	501,
	36,
	'1995-06-08')
;
INSERT INTO sales_order_items VALUES (
	2442,
	1,
	700,
	12,
	'1995-06-09')
;
INSERT INTO sales_order_items VALUES (
	2443,
	1,
	600,
	24,
	'1995-06-10')
;
INSERT INTO sales_order_items VALUES (
	2443,
	2,
	601,
	12,
	'1995-06-10')
;
INSERT INTO sales_order_items VALUES (
	2444,
	1,
	300,
	24,
	'1995-06-09')
;
INSERT INTO sales_order_items VALUES (
	2445,
	1,
	301,
	36,
	'1995-06-11')
;
INSERT INTO sales_order_items VALUES (
	2445,
	2,
	302,
	24,
	'1995-06-11')
;
INSERT INTO sales_order_items VALUES (
	2446,
	1,
	400,
	36,
	'1995-06-11')
;
INSERT INTO sales_order_items VALUES (
	2446,
	2,
	401,
	24,
	'1995-06-11')
;
INSERT INTO sales_order_items VALUES (
	2447,
	1,
	500,
	12,
	'1995-06-14')
;
INSERT INTO sales_order_items VALUES (
	2447,
	2,
	501,
	24,
	'1995-06-14')
;
INSERT INTO sales_order_items VALUES (
	2448,
	1,
	600,
	12,
	'1995-06-11')
;
INSERT INTO sales_order_items VALUES (
	2449,
	1,
	601,
	24,
	'1995-06-15')
;
INSERT INTO sales_order_items VALUES (
	2449,
	2,
	700,
	36,
	'1995-06-15')
;
INSERT INTO sales_order_items VALUES (
	2450,
	1,
	300,
	12,
	'1995-06-14')
;
INSERT INTO sales_order_items VALUES (
	2451,
	1,
	301,
	24,
	'1995-06-16')
;
INSERT INTO sales_order_items VALUES (
	2451,
	2,
	302,
	12,
	'1995-06-16')
;
INSERT INTO sales_order_items VALUES (
	2452,
	1,
	400,
	24,
	'1995-06-16')
;
INSERT INTO sales_order_items VALUES (
	2453,
	1,
	401,
	12,
	'1995-06-17')
;
INSERT INTO sales_order_items VALUES (
	2453,
	2,
	500,
	12,
	'1995-06-17')
;
INSERT INTO sales_order_items VALUES (
	2454,
	1,
	501,
	36,
	'1995-06-17')
;
INSERT INTO sales_order_items VALUES (
	2455,
	1,
	600,
	24,
	'1995-06-18')
;
INSERT INTO sales_order_items VALUES (
	2455,
	2,
	601,
	24,
	'1995-06-18')
;
INSERT INTO sales_order_items VALUES (
	2456,
	1,
	700,
	12,
	'1995-06-17')
;
INSERT INTO sales_order_items VALUES (
	2457,
	1,
	300,
	12,
	'1995-06-17')
;
INSERT INTO sales_order_items VALUES (
	2458,
	1,
	301,
	24,
	'1995-06-18')
;
INSERT INTO sales_order_items VALUES (
	2458,
	2,
	302,
	24,
	'1995-06-18')
;
INSERT INTO sales_order_items VALUES (
	2459,
	1,
	400,
	12,
	'1995-06-22')
;
INSERT INTO sales_order_items VALUES (
	2459,
	2,
	401,
	24,
	'1995-06-22')
;
INSERT INTO sales_order_items VALUES (
	2460,
	1,
	500,
	12,
	'1995-06-22')
;
INSERT INTO sales_order_items VALUES (
	2460,
	2,
	501,
	24,
	'1995-06-22')
;
INSERT INTO sales_order_items VALUES (
	2461,
	1,
	600,
	36,
	'1995-06-23')
;
INSERT INTO sales_order_items VALUES (
	2461,
	2,
	601,
	48,
	'1995-06-23')
;
INSERT INTO sales_order_items VALUES (
	2462,
	1,
	401,
	12,
	'1995-06-24')
;
INSERT INTO sales_order_items VALUES (
	2462,
	2,
	700,
	60,
	'1995-06-22')
;
INSERT INTO sales_order_items VALUES (
	2463,
	1,
	300,
	36,
	'1995-06-23')
;
INSERT INTO sales_order_items VALUES (
	2463,
	2,
	301,
	24,
	'1995-06-23')
;
INSERT INTO sales_order_items VALUES (
	2463,
	3,
	500,
	24,
	'1995-06-28')
;
INSERT INTO sales_order_items VALUES (
	2463,
	4,
	501,
	12,
	'1995-06-28')
;
INSERT INTO sales_order_items VALUES (
	2464,
	1,
	400,
	12,
	'1995-06-24')
;
INSERT INTO sales_order_items VALUES (
	2464,
	2,
	600,
	36,
	'1995-06-29')
;
INSERT INTO sales_order_items VALUES (
	2464,
	3,
	601,
	48,
	'1995-06-29')
;
INSERT INTO sales_order_items VALUES (
	2465,
	1,
	400,
	12,
	'1995-06-29')
;
INSERT INTO sales_order_items VALUES (
	2465,
	2,
	700,
	24,
	'1995-06-29')
;
INSERT INTO sales_order_items VALUES (
	2466,
	1,
	500,
	12,
	'1995-06-30')
;
INSERT INTO sales_order_items VALUES (
	2466,
	2,
	501,
	24,
	'1995-06-29')
;
INSERT INTO sales_order_items VALUES (
	2467,
	1,
	600,
	36,
	'1995-06-29')
;
INSERT INTO sales_order_items VALUES (
	2468,
	1,
	300,
	24,
	'1995-07-01')
;
INSERT INTO sales_order_items VALUES (
	2468,
	2,
	700,
	24,
	'1995-07-01')
;
INSERT INTO sales_order_items VALUES (
	2469,
	1,
	400,
	12,
	'1995-06-20')
;
INSERT INTO sales_order_items VALUES (
	2470,
	1,
	500,
	12,
	'1995-07-01')
;
INSERT INTO sales_order_items VALUES (
	2471,
	1,
	600,
	24,
	'1995-07-01')
;
INSERT INTO sales_order_items VALUES (
	2472,
	1,
	700,
	60,
	'1995-07-01')
;
INSERT INTO sales_order_items VALUES (
	2473,
	1,
	300,
	12,
	'1995-07-06')
;
INSERT INTO sales_order_items VALUES (
	2473,
	2,
	301,
	24,
	'1995-07-06')
;
INSERT INTO sales_order_items VALUES (
	2474,
	1,
	400,
	36,
	'1995-07-05')
;
INSERT INTO sales_order_items VALUES (
	2474,
	2,
	401,
	24,
	'1995-07-05')
;
INSERT INTO sales_order_items VALUES (
	2475,
	1,
	500,
	36,
	'1995-07-07')
;
INSERT INTO sales_order_items VALUES (
	2475,
	2,
	501,
	24,
	'1995-07-07')
;
INSERT INTO sales_order_items VALUES (
	2476,
	1,
	700,
	60,
	'1995-07-08')
;
INSERT INTO sales_order_items VALUES (
	2477,
	1,
	300,
	36,
	'1995-07-08')
;
INSERT INTO sales_order_items VALUES (
	2477,
	2,
	302,
	24,
	'1995-07-08')
;
INSERT INTO sales_order_items VALUES (
	2478,
	1,
	400,
	12,
	'1995-07-09')
;
INSERT INTO sales_order_items VALUES (
	2478,
	2,
	401,
	24,
	'1995-07-09')
;
INSERT INTO sales_order_items VALUES (
	2479,
	1,
	500,
	36,
	'1995-07-08')
;
INSERT INTO sales_order_items VALUES (
	2479,
	2,
	501,
	24,
	'1995-07-08')
;
INSERT INTO sales_order_items VALUES (
	2480,
	1,
	600,
	24,
	'1995-07-12')
;
INSERT INTO sales_order_items VALUES (
	2480,
	2,
	601,
	12,
	'1995-07-12')
;
INSERT INTO sales_order_items VALUES (
	2481,
	1,
	302,
	12,
	'1995-07-12')
;
INSERT INTO sales_order_items VALUES (
	2481,
	2,
	700,
	72,
	'1995-07-12')
;
INSERT INTO sales_order_items VALUES (
	2482,
	1,
	300,
	24,
	'1995-07-13')
;
INSERT INTO sales_order_items VALUES (
	2482,
	2,
	301,
	24,
	'1995-07-13')
;
INSERT INTO sales_order_items VALUES (
	2483,
	1,
	700,
	36,
	'1995-07-13')
;
INSERT INTO sales_order_items VALUES (
	2484,
	1,
	401,
	24,
	'1995-07-15')
;
INSERT INTO sales_order_items VALUES (
	2485,
	1,
	500,
	24,
	'1995-07-15')
;
INSERT INTO sales_order_items VALUES (
	2485,
	2,
	501,
	12,
	'1995-07-15')
;
INSERT INTO sales_order_items VALUES (
	2486,
	1,
	600,
	36,
	'1995-07-16')
;
INSERT INTO sales_order_items VALUES (
	2486,
	2,
	601,
	24,
	'1995-07-16')
;
INSERT INTO sales_order_items VALUES (
	2487,
	1,
	700,
	48,
	'1995-07-16')
;
INSERT INTO sales_order_items VALUES (
	2488,
	1,
	300,
	12,
	'1995-07-19')
;
INSERT INTO sales_order_items VALUES (
	2488,
	2,
	301,
	12,
	'1995-07-19')
;
INSERT INTO sales_order_items VALUES (
	2489,
	1,
	400,
	24,
	'1995-07-19')
;
INSERT INTO sales_order_items VALUES (
	2489,
	2,
	401,
	24,
	'1995-07-19')
;
INSERT INTO sales_order_items VALUES (
	2490,
	1,
	500,
	36,
	'1995-07-20')
;
INSERT INTO sales_order_items VALUES (
	2490,
	2,
	501,
	36,
	'1995-07-20')
;
INSERT INTO sales_order_items VALUES (
	2491,
	1,
	600,
	24,
	'1995-07-20')
;
INSERT INTO sales_order_items VALUES (
	2491,
	2,
	601,
	24,
	'1995-07-20')
;
INSERT INTO sales_order_items VALUES (
	2492,
	1,
	300,
	12,
	'1995-07-21')
;
INSERT INTO sales_order_items VALUES (
	2492,
	2,
	301,
	12,
	'1995-07-21')
;
INSERT INTO sales_order_items VALUES (
	2493,
	1,
	400,
	24,
	'1995-07-22')
;
INSERT INTO sales_order_items VALUES (
	2493,
	2,
	401,
	12,
	'1995-07-22')
;
INSERT INTO sales_order_items VALUES (
	2494,
	1,
	500,
	36,
	'1995-07-22')
;
INSERT INTO sales_order_items VALUES (
	2495,
	1,
	600,
	24,
	'1995-07-23')
;
INSERT INTO sales_order_items VALUES (
	2495,
	2,
	601,
	12,
	'1995-07-23')
;
INSERT INTO sales_order_items VALUES (
	2496,
	1,
	500,
	24,
	'1995-07-26')
;
INSERT INTO sales_order_items VALUES (
	2496,
	2,
	501,
	12,
	'1995-07-26')
;
INSERT INTO sales_order_items VALUES (
	2497,
	1,
	700,
	48,
	'1995-07-26')
;
INSERT INTO sales_order_items VALUES (
	2498,
	1,
	300,
	12,
	'1995-07-27')
;
INSERT INTO sales_order_items VALUES (
	2498,
	2,
	301,
	12,
	'1995-07-27')
;
INSERT INTO sales_order_items VALUES (
	2499,
	1,
	400,
	24,
	'1995-07-27')
;
INSERT INTO sales_order_items VALUES (
	2499,
	2,
	401,
	24,
	'1995-07-27')
;
INSERT INTO sales_order_items VALUES (
	2500,
	1,
	302,
	36,
	'1995-07-28')
;
INSERT INTO sales_order_items VALUES (
	2500,
	2,
	700,
	48,
	'1995-07-28')
;
INSERT INTO sales_order_items VALUES (
	2501,
	1,
	500,
	12,
	'1995-07-27')
;
INSERT INTO sales_order_items VALUES (
	2501,
	2,
	501,
	12,
	'1995-07-27')
;
INSERT INTO sales_order_items VALUES (
	2502,
	1,
	600,
	24,
	'1995-07-29')
;
INSERT INTO sales_order_items VALUES (
	2502,
	2,
	601,
	24,
	'1995-07-29')
;
INSERT INTO sales_order_items VALUES (
	2503,
	1,
	700,
	12,
	'1995-07-28')
;
INSERT INTO sales_order_items VALUES (
	2504,
	1,
	300,
	24,
	'1995-07-30')
;
INSERT INTO sales_order_items VALUES (
	2504,
	2,
	301,
	24,
	'1995-07-30')
;
INSERT INTO sales_order_items VALUES (
	2505,
	1,
	700,
	12,
	'1995-07-29')
;
INSERT INTO sales_order_items VALUES (
	2506,
	1,
	400,
	36,
	'1995-07-30')
;
INSERT INTO sales_order_items VALUES (
	2506,
	2,
	401,
	24,
	'1995-07-30')
;
INSERT INTO sales_order_items VALUES (
	2507,
	1,
	500,
	12,
	'1995-08-02')
;
INSERT INTO sales_order_items VALUES (
	2507,
	2,
	501,
	12,
	'1995-08-02')
;
INSERT INTO sales_order_items VALUES (
	2508,
	1,
	300,
	36,
	'1995-08-03')
;
INSERT INTO sales_order_items VALUES (
	2508,
	2,
	302,
	36,
	'1995-08-03')
;
INSERT INTO sales_order_items VALUES (
	2509,
	1,
	301,
	24,
	'1995-08-04')
;
INSERT INTO sales_order_items VALUES (
	2509,
	2,
	400,
	12,
	'1995-08-04')
;
INSERT INTO sales_order_items VALUES (
	2510,
	1,
	500,
	36,
	'1995-08-05')
;
INSERT INTO sales_order_items VALUES (
	2510,
	2,
	501,
	24,
	'1995-08-05')
;
INSERT INTO sales_order_items VALUES (
	2511,
	1,
	600,
	12,
	'1995-08-06')
;
INSERT INTO sales_order_items VALUES (
	2511,
	2,
	601,
	24,
	'1995-08-06')
;
INSERT INTO sales_order_items VALUES (
	2512,
	1,
	700,
	60,
	'1995-08-06')
;
INSERT INTO sales_order_items VALUES (
	2513,
	1,
	300,
	12,
	'1995-08-09')
;
INSERT INTO sales_order_items VALUES (
	2513,
	2,
	301,
	12,
	'1995-08-09')
;
INSERT INTO sales_order_items VALUES (
	2513,
	3,
	302,
	12,
	'1995-08-09')
;
INSERT INTO sales_order_items VALUES (
	2514,
	1,
	400,
	24,
	'1995-08-10')
;
INSERT INTO sales_order_items VALUES (
	2514,
	2,
	401,
	24,
	'1995-08-10')
;
INSERT INTO sales_order_items VALUES (
	2515,
	1,
	500,
	36,
	'1995-08-10')
;
INSERT INTO sales_order_items VALUES (
	2515,
	2,
	501,
	36,
	'1995-08-10')
;
INSERT INTO sales_order_items VALUES (
	2516,
	1,
	600,
	12,
	'1995-08-11')
;
INSERT INTO sales_order_items VALUES (
	2516,
	2,
	601,
	12,
	'1995-08-11')
;
INSERT INTO sales_order_items VALUES (
	2517,
	1,
	700,
	48,
	'1995-08-11')
;
INSERT INTO sales_order_items VALUES (
	2518,
	1,
	300,
	24,
	'1995-08-11')
;
INSERT INTO sales_order_items VALUES (
	2518,
	2,
	301,
	24,
	'1995-08-11')
;
INSERT INTO sales_order_items VALUES (
	2519,
	1,
	400,
	36,
	'1995-08-12')
;
INSERT INTO sales_order_items VALUES (
	2520,
	1,
	500,
	12,
	'1995-08-13')
;
INSERT INTO sales_order_items VALUES (
	2520,
	2,
	501,
	24,
	'1995-08-13')
;
INSERT INTO sales_order_items VALUES (
	2521,
	1,
	600,
	36,
	'1995-08-13')
;
INSERT INTO sales_order_items VALUES (
	2521,
	2,
	601,
	36,
	'1995-08-13')
;
INSERT INTO sales_order_items VALUES (
	2522,
	1,
	700,
	60,
	'1995-08-13')
;
INSERT INTO sales_order_items VALUES (
	2523,
	1,
	700,
	12,
	'1995-08-17')
;
INSERT INTO sales_order_items VALUES (
	2524,
	1,
	300,
	24,
	'1995-08-18')
;
INSERT INTO sales_order_items VALUES (
	2524,
	2,
	302,
	24,
	'1995-08-18')
;
INSERT INTO sales_order_items VALUES (
	2525,
	1,
	400,
	24,
	'1995-08-19')
;
INSERT INTO sales_order_items VALUES (
	2525,
	2,
	401,
	25,
	'1995-08-19')
;
INSERT INTO sales_order_items VALUES (
	2526,
	1,
	302,
	12,
	'1995-08-20')
;
INSERT INTO sales_order_items VALUES (
	2526,
	2,
	700,
	12,
	'1995-08-20')
;
INSERT INTO sales_order_items VALUES (
	2527,
	1,
	400,
	36,
	'1995-08-20')
;
INSERT INTO sales_order_items VALUES (
	2528,
	1,
	500,
	48,
	'1995-08-23')
;
INSERT INTO sales_order_items VALUES (
	2528,
	2,
	700,
	36,
	'1995-08-23')
;
INSERT INTO sales_order_items VALUES (
	2529,
	1,
	300,
	12,
	'1995-08-24')
;
INSERT INTO sales_order_items VALUES (
	2529,
	2,
	301,
	12,
	'1995-08-24')
;
INSERT INTO sales_order_items VALUES (
	2530,
	1,
	400,
	24,
	'1995-08-24')
;
INSERT INTO sales_order_items VALUES (
	2531,
	1,
	500,
	36,
	'1995-08-25')
;
INSERT INTO sales_order_items VALUES (
	2531,
	2,
	501,
	36,
	'1995-08-25')
;
INSERT INTO sales_order_items VALUES (
	2532,
	1,
	600,
	12,
	'1995-08-24')
;
INSERT INTO sales_order_items VALUES (
	2533,
	1,
	400,
	24,
	'1995-08-26')
;
INSERT INTO sales_order_items VALUES (
	2533,
	2,
	401,
	24,
	'1995-08-26')
;
INSERT INTO sales_order_items VALUES (
	2534,
	1,
	301,
	12,
	'1995-08-26')
;
INSERT INTO sales_order_items VALUES (
	2535,
	1,
	300,
	24,
	'1995-08-27')
;
INSERT INTO sales_order_items VALUES (
	2535,
	2,
	301,
	24,
	'1995-08-27')
;
INSERT INTO sales_order_items VALUES (
	2535,
	3,
	302,
	24,
	'1995-08-27')
;
INSERT INTO sales_order_items VALUES (
	2536,
	1,
	700,
	48,
	'1995-08-27')
;
INSERT INTO sales_order_items VALUES (
	2537,
	1,
	600,
	24,
	'1995-08-30')
;
INSERT INTO sales_order_items VALUES (
	2537,
	2,
	601,
	12,
	'1995-08-30')
;
INSERT INTO sales_order_items VALUES (
	2538,
	1,
	300,
	12,
	'1995-08-31')
;
INSERT INTO sales_order_items VALUES (
	2538,
	2,
	301,
	24,
	'1995-08-31')
;
INSERT INTO sales_order_items VALUES (
	2539,
	1,
	400,
	36,
	'1995-08-31')
;
INSERT INTO sales_order_items VALUES (
	2539,
	2,
	401,
	36,
	'1995-08-31')
;
INSERT INTO sales_order_items VALUES (
	2540,
	1,
	500,
	12,
	'1995-09-01')
;
INSERT INTO sales_order_items VALUES (
	2540,
	2,
	501,
	12,
	'1995-09-01')
;
INSERT INTO sales_order_items VALUES (
	2541,
	1,
	700,
	24,
	'1995-08-31')
;
INSERT INTO sales_order_items VALUES (
	2542,
	1,
	400,
	48,
	'1995-09-02')
;
INSERT INTO sales_order_items VALUES (
	2542,
	2,
	401,
	48,
	'1995-09-02')
;
INSERT INTO sales_order_items VALUES (
	2543,
	1,
	500,
	12,
	'1995-09-02')
;
INSERT INTO sales_order_items VALUES (
	2544,
	1,
	300,
	12,
	'1995-09-03')
;
INSERT INTO sales_order_items VALUES (
	2544,
	2,
	301,
	12,
	'1995-09-03')
;
INSERT INTO sales_order_items VALUES (
	2545,
	1,
	302,
	24,
	'1995-09-03')
;
INSERT INTO sales_order_items VALUES (
	2546,
	1,
	400,
	36,
	'1995-09-06')
;
INSERT INTO sales_order_items VALUES (
	2546,
	2,
	401,
	36,
	'1995-09-06')
;
INSERT INTO sales_order_items VALUES (
	2547,
	1,
	500,
	24,
	'1995-09-06')
;
INSERT INTO sales_order_items VALUES (
	2547,
	2,
	501,
	12,
	'1995-09-06')
;
INSERT INTO sales_order_items VALUES (
	2548,
	1,
	600,
	24,
	'1995-09-06')
;
INSERT INTO sales_order_items VALUES (
	2549,
	1,
	300,
	12,
	'1995-09-07')
;
INSERT INTO sales_order_items VALUES (
	2549,
	2,
	301,
	12,
	'1995-09-07')
;
INSERT INTO sales_order_items VALUES (
	2550,
	1,
	302,
	24,
	'1995-09-07')
;
INSERT INTO sales_order_items VALUES (
	2551,
	1,
	700,
	12,
	'1995-09-08')
;
INSERT INTO sales_order_items VALUES (
	2552,
	1,
	300,
	36,
	'1995-09-09')
;
INSERT INTO sales_order_items VALUES (
	2552,
	2,
	301,
	36,
	'1995-09-09')
;
INSERT INTO sales_order_items VALUES (
	2553,
	1,
	302,
	24,
	'1995-09-09')
;
INSERT INTO sales_order_items VALUES (
	2554,
	1,
	400,
	12,
	'1995-09-10')
;
INSERT INTO sales_order_items VALUES (
	2554,
	2,
	401,
	12,
	'1995-09-10')
;
INSERT INTO sales_order_items VALUES (
	2555,
	1,
	500,
	36,
	'1995-09-10')
;
INSERT INTO sales_order_items VALUES (
	2556,
	1,
	600,
	24,
	'1995-09-10')
;
INSERT INTO sales_order_items VALUES (
	2556,
	2,
	601,
	24,
	'1995-09-10')
;
INSERT INTO sales_order_items VALUES (
	2557,
	1,
	300,
	12,
	'1995-09-13')
;
INSERT INTO sales_order_items VALUES (
	2557,
	2,
	301,
	12,
	'1995-09-13')
;
INSERT INTO sales_order_items VALUES (
	2558,
	1,
	400,
	24,
	'1995-09-13')
;
INSERT INTO sales_order_items VALUES (
	2559,
	1,
	700,
	60,
	'1995-09-14')
;
INSERT INTO sales_order_items VALUES (
	2560,
	1,
	300,
	24,
	'1995-09-15')
;
INSERT INTO sales_order_items VALUES (
	2560,
	2,
	301,
	24,
	'1995-09-15')
;
INSERT INTO sales_order_items VALUES (
	2561,
	1,
	400,
	12,
	'1995-09-15')
;
INSERT INTO sales_order_items VALUES (
	2561,
	2,
	401,
	12,
	'1995-09-15')
;
INSERT INTO sales_order_items VALUES (
	2562,
	1,
	302,
	48,
	'1995-09-16')
;
INSERT INTO sales_order_items VALUES (
	2562,
	2,
	400,
	36,
	'1995-09-16')
;
INSERT INTO sales_order_items VALUES (
	2563,
	1,
	302,
	12,
	'1995-09-16')
;
INSERT INTO sales_order_items VALUES (
	2563,
	2,
	700,
	24,
	'1995-09-16')
;
INSERT INTO sales_order_items VALUES (
	2564,
	1,
	301,
	12,
	'1995-09-20')
;
INSERT INTO sales_order_items VALUES (
	2564,
	2,
	302,
	12,
	'1995-09-20')
;
INSERT INTO sales_order_items VALUES (
	2565,
	1,
	400,
	36,
	'1995-09-20')
;
INSERT INTO sales_order_items VALUES (
	2566,
	1,
	500,
	24,
	'1995-09-21')
;
INSERT INTO sales_order_items VALUES (
	2566,
	2,
	501,
	24,
	'1995-09-21')
;
INSERT INTO sales_order_items VALUES (
	2567,
	1,
	401,
	48,
	'1995-09-20')
;
INSERT INTO sales_order_items VALUES (
	2568,
	1,
	600,
	36,
	'1995-09-22')
;
INSERT INTO sales_order_items VALUES (
	2568,
	2,
	601,
	36,
	'1995-09-22')
;
INSERT INTO sales_order_items VALUES (
	2569,
	1,
	300,
	12,
	'1995-09-22')
;
INSERT INTO sales_order_items VALUES (
	2569,
	2,
	700,
	24,
	'1995-09-22')
;
INSERT INTO sales_order_items VALUES (
	2570,
	1,
	400,
	36,
	'1995-09-23')
;
INSERT INTO sales_order_items VALUES (
	2570,
	2,
	401,
	24,
	'1995-09-23')
;
INSERT INTO sales_order_items VALUES (
	2571,
	1,
	302,
	12,
	'1995-09-23')
;
INSERT INTO sales_order_items VALUES (
	2571,
	2,
	700,
	12,
	'1995-09-23')
;
INSERT INTO sales_order_items VALUES (
	2572,
	1,
	600,
	72,
	'1995-09-23')
;
INSERT INTO sales_order_items VALUES (
	2573,
	1,
	300,
	24,
	'1995-09-24')
;
INSERT INTO sales_order_items VALUES (
	2573,
	2,
	302,
	24,
	'1995-09-24')
;
INSERT INTO sales_order_items VALUES (
	2574,
	1,
	301,
	48,
	'1995-09-23')
;
INSERT INTO sales_order_items VALUES (
	2575,
	1,
	400,
	24,
	'1995-09-27')
;
INSERT INTO sales_order_items VALUES (
	2575,
	2,
	401,
	12,
	'1995-09-27')
;
INSERT INTO sales_order_items VALUES (
	2576,
	1,
	500,
	36,
	'1995-09-27')
;
INSERT INTO sales_order_items VALUES (
	2576,
	2,
	501,
	24,
	'1995-09-27')
;
INSERT INTO sales_order_items VALUES (
	2577,
	1,
	300,
	12,
	'1995-09-28')
;
INSERT INTO sales_order_items VALUES (
	2577,
	2,
	301,
	12,
	'1995-09-28')
;
INSERT INTO sales_order_items VALUES (
	2577,
	3,
	302,
	12,
	'1995-09-28')
;
INSERT INTO sales_order_items VALUES (
	2578,
	1,
	700,
	36,
	'1995-09-18')
;
INSERT INTO sales_order_items VALUES (
	2579,
	1,
	500,
	60,
	'1995-10-01')
;
INSERT INTO sales_order_items VALUES (
	2580,
	1,
	700,
	12,
	'1995-09-28')
;
INSERT INTO sales_order_items VALUES (
	2581,
	1,
	400,
	24,
	'1995-09-30')
;
INSERT INTO sales_order_items VALUES (
	2582,
	1,
	400,
	12,
	'1995-10-01')
;
INSERT INTO sales_order_items VALUES (
	2583,
	1,
	600,
	24,
	'1995-10-05')
;
INSERT INTO sales_order_items VALUES (
	2583,
	2,
	601,
	24,
	'1995-10-05')
;
INSERT INTO sales_order_items VALUES (
	2584,
	1,
	600,
	36,
	'1995-10-06')
;
INSERT INTO sales_order_items VALUES (
	2584,
	2,
	601,
	24,
	'1995-10-06')
;
INSERT INTO sales_order_items VALUES (
	2585,
	1,
	300,
	12,
	'1995-10-08')
;
INSERT INTO sales_order_items VALUES (
	2585,
	2,
	301,
	12,
	'1995-10-08')
;
INSERT INTO sales_order_items VALUES (
	2586,
	1,
	400,
	24,
	'1995-10-11')
;
INSERT INTO sales_order_items VALUES (
	2586,
	2,
	401,
	12,
	'1995-10-11')
;
INSERT INTO sales_order_items VALUES (
	2587,
	1,
	300,
	36,
	'1995-10-12')
;
INSERT INTO sales_order_items VALUES (
	2587,
	2,
	301,
	36,
	'1995-10-12')
;
INSERT INTO sales_order_items VALUES (
	2588,
	1,
	400,
	24,
	'1995-10-13')
;
INSERT INTO sales_order_items VALUES (
	2588,
	2,
	401,
	24,
	'1995-10-13')
;
INSERT INTO sales_order_items VALUES (
	2589,
	1,
	500,
	12,
	'1995-10-13')
;
INSERT INTO sales_order_items VALUES (
	2589,
	2,
	501,
	12,
	'1995-10-13')
;
INSERT INTO sales_order_items VALUES (
	2590,
	1,
	700,
	36,
	'1995-10-14')
;
INSERT INTO sales_order_items VALUES (
	2591,
	1,
	300,
	24,
	'1995-10-14')
;
INSERT INTO sales_order_items VALUES (
	2591,
	2,
	301,
	24,
	'1995-10-14')
;
INSERT INTO sales_order_items VALUES (
	2592,
	1,
	302,
	12,
	'1995-10-13')
;
INSERT INTO sales_order_items VALUES (
	2593,
	1,
	400,
	12,
	'1995-10-18')
;
INSERT INTO sales_order_items VALUES (
	2593,
	2,
	401,
	24,
	'1995-10-18')
;
INSERT INTO sales_order_items VALUES (
	2594,
	1,
	600,
	12,
	'1995-10-18')
;
INSERT INTO sales_order_items VALUES (
	2594,
	2,
	601,
	12,
	'1995-10-18')
;
INSERT INTO sales_order_items VALUES (
	2595,
	1,
	700,
	48,
	'1995-10-18')
;
INSERT INTO sales_order_items VALUES (
	2596,
	1,
	500,
	24,
	'1995-10-19')
;
INSERT INTO sales_order_items VALUES (
	2596,
	2,
	501,
	24,
	'1995-10-19')
;
INSERT INTO sales_order_items VALUES (
	2597,
	1,
	300,
	12,
	'1995-10-19')
;
INSERT INTO sales_order_items VALUES (
	2597,
	2,
	301,
	12,
	'1995-10-19')
;
INSERT INTO sales_order_items VALUES (
	2598,
	1,
	400,
	24,
	'1995-10-20')
;
INSERT INTO sales_order_items VALUES (
	2598,
	2,
	401,
	36,
	'1995-10-20')
;
INSERT INTO sales_order_items VALUES (
	2599,
	1,
	302,
	72,
	'1995-10-19')
;
INSERT INTO sales_order_items VALUES (
	2600,
	1,
	601,
	24,
	'1995-10-20')
;
INSERT INTO sales_order_items VALUES (
	2601,
	1,
	400,
	36,
	'1995-10-21')
;
INSERT INTO sales_order_items VALUES (
	2601,
	2,
	401,
	36,
	'1995-10-21')
;
INSERT INTO sales_order_items VALUES (
	2602,
	1,
	500,
	12,
	'1995-10-21')
;
INSERT INTO sales_order_items VALUES (
	2602,
	2,
	601,
	24,
	'1995-10-21')
;
INSERT INTO sales_order_items VALUES (
	2603,
	1,
	301,
	12,
	'1995-10-22')
;
INSERT INTO sales_order_items VALUES (
	2603,
	2,
	700,
	36,
	'1995-10-22')
;
INSERT INTO sales_order_items VALUES (
	2604,
	1,
	400,
	24,
	'1995-10-25')
;
INSERT INTO sales_order_items VALUES (
	2604,
	2,
	401,
	24,
	'1995-10-25')
;
INSERT INTO sales_order_items VALUES (
	2605,
	1,
	700,
	36,
	'1995-10-22')
;
INSERT INTO sales_order_items VALUES (
	2606,
	1,
	500,
	12,
	'1995-10-26')
;
INSERT INTO sales_order_items VALUES (
	2606,
	2,
	501,
	24,
	'1995-10-26')
;
INSERT INTO sales_order_items VALUES (
	2607,
	1,
	302,
	48,
	'1995-10-26')
;
INSERT INTO sales_order_items VALUES (
	2608,
	1,
	601,
	12,
	'1995-10-25')
;
INSERT INTO sales_order_items VALUES (
	2609,
	1,
	600,
	36,
	'1995-10-27')
;
INSERT INTO sales_order_items VALUES (
	2609,
	2,
	601,
	24,
	'1995-10-27')
;
INSERT INTO sales_order_items VALUES (
	2610,
	1,
	300,
	12,
	'1995-10-27')
;
INSERT INTO sales_order_items VALUES (
	2610,
	2,
	301,
	12,
	'1995-10-27')
;
INSERT INTO sales_order_items VALUES (
	2611,
	1,
	302,
	24,
	'1995-10-28')
;
INSERT INTO sales_order_items VALUES (
	2611,
	2,
	700,
	48,
	'1995-10-28')
;
INSERT INTO sales_order_items VALUES (
	2612,
	1,
	400,
	24,
	'1995-10-28')
;
INSERT INTO sales_order_items VALUES (
	2613,
	1,
	500,
	36,
	'1995-10-29')
;
INSERT INTO sales_order_items VALUES (
	2613,
	2,
	501,
	36,
	'1995-10-29')
;
INSERT INTO sales_order_items VALUES (
	2614,
	1,
	600,
	24,
	'1995-10-28')
;
INSERT INTO sales_order_items VALUES (
	2615,
	1,
	700,
	60,
	'1995-10-29')
;
INSERT INTO sales_order_items VALUES (
	2616,
	1,
	301,
	12,
	'1995-11-01')
;
INSERT INTO sales_order_items VALUES (
	2616,
	2,
	501,
	24,
	'1995-11-01')
;
INSERT INTO sales_order_items VALUES (
	2617,
	1,
	400,
	24,
	'1995-11-03')
;
INSERT INTO sales_order_items VALUES (
	2617,
	2,
	401,
	12,
	'1995-11-03')
;
INSERT INTO sales_order_items VALUES (
	2618,
	1,
	600,
	12,
	'1995-11-03')
;
INSERT INTO sales_order_items VALUES (
	2618,
	2,
	601,
	24,
	'1995-11-03')
;
INSERT INTO sales_order_items VALUES (
	2619,
	1,
	300,
	12,
	'1995-11-04')
;
INSERT INTO sales_order_items VALUES (
	2619,
	2,
	700,
	36,
	'1995-11-04')
;
INSERT INTO sales_order_items VALUES (
	2620,
	1,
	301,
	24,
	'1995-11-04')
;
INSERT INTO sales_order_items VALUES (
	2620,
	2,
	302,
	24,
	'1995-11-04')
;
INSERT INTO sales_order_items VALUES (
	2621,
	1,
	400,
	12,
	'1995-11-05')
;
INSERT INTO sales_order_items VALUES (
	2621,
	2,
	401,
	12,
	'1995-11-05')
;
INSERT INTO sales_order_items VALUES (
	2622,
	1,
	302,
	24,
	'1995-11-05')
;
INSERT INTO sales_order_items VALUES (
	2623,
	1,
	600,
	12,
	'1995-11-08')
;
INSERT INTO sales_order_items VALUES (
	2623,
	2,
	700,
	12,
	'1995-11-08')
;
INSERT INTO sales_order_items VALUES (
	2624,
	1,
	601,
	24,
	'1995-11-08')
;
INSERT INTO sales_order_items VALUES (
	2625,
	1,
	302,
	12,
	'1995-11-09')
;
INSERT INTO sales_order_items VALUES (
	2625,
	2,
	501,
	24,
	'1995-11-09')
;
INSERT INTO sales_order_items VALUES (
	2625,
	3,
	700,
	24,
	'1995-11-09')
;
INSERT INTO sales_order_items VALUES (
	2626,
	1,
	400,
	12,
	'1995-11-09')
;
INSERT INTO sales_order_items VALUES (
	2626,
	2,
	500,
	12,
	'1995-11-09')
;
INSERT INTO sales_order_items VALUES (
	2627,
	1,
	300,
	24,
	'1995-11-10')
;
INSERT INTO sales_order_items VALUES (
	2627,
	2,
	301,
	24,
	'1995-11-10')
;
INSERT INTO sales_order_items VALUES (
	2627,
	3,
	302,
	12,
	'1995-11-10')
;
INSERT INTO sales_order_items VALUES (
	2628,
	1,
	400,
	36,
	'1995-11-10')
;
INSERT INTO sales_order_items VALUES (
	2629,
	1,
	600,
	12,
	'1995-11-11')
;
INSERT INTO sales_order_items VALUES (
	2629,
	2,
	601,
	24,
	'1995-11-11')
;
INSERT INTO sales_order_items VALUES (
	2630,
	1,
	302,
	36,
	'1995-11-11')
;
INSERT INTO sales_order_items VALUES (
	2631,
	1,
	400,
	12,
	'1995-11-12')
;
INSERT INTO sales_order_items VALUES (
	2631,
	2,
	401,
	12,
	'1995-11-12')
;
INSERT INTO sales_order_items VALUES (
	2632,
	1,
	600,
	24,
	'1995-11-12')
;
INSERT INTO sales_order_items VALUES (
	2632,
	2,
	601,
	24,
	'1995-11-12')
;
INSERT INTO sales_order_items VALUES (
	2633,
	1,
	300,
	12,
	'1995-11-15')
;
INSERT INTO sales_order_items VALUES (
	2633,
	2,
	301,
	12,
	'1995-11-15')
;
INSERT INTO sales_order_items VALUES (
	2634,
	1,
	400,
	24,
	'1995-11-15')
;
INSERT INTO sales_order_items VALUES (
	2635,
	1,
	700,
	72,
	'1995-11-16')
;
INSERT INTO sales_order_items VALUES (
	2636,
	1,
	600,
	24,
	'1995-11-17')
;
INSERT INTO sales_order_items VALUES (
	2636,
	2,
	601,
	24,
	'1995-11-17')
;
INSERT INTO sales_order_items VALUES (
	2637,
	1,
	501,
	48,
	'1995-11-16')
;
INSERT INTO sales_order_items VALUES (
	2638,
	1,
	300,
	24,
	'1995-11-18')
;
INSERT INTO sales_order_items VALUES (
	2639,
	1,
	401,
	36,
	'1995-11-17')
;
INSERT INTO sales_order_items VALUES (
	2640,
	1,
	600,
	24,
	'1995-11-19')
;
INSERT INTO sales_order_items VALUES (
	2641,
	1,
	501,
	36,
	'1995-11-18')
;
INSERT INTO sales_order_items VALUES (
	2641,
	2,
	700,
	24,
	'1995-11-18')
;
INSERT INTO sales_order_items VALUES (
	2642,
	1,
	300,
	12,
	'1995-11-22')
;
INSERT INTO sales_order_items VALUES (
	2643,
	1,
	301,
	24,
	'1995-11-22')
;
INSERT INTO sales_order_items VALUES (
	2644,
	1,
	600,
	36,
	'1995-11-23')
;
INSERT INTO sales_order_items VALUES (
	2645,
	1,
	601,
	12,
	'1995-11-23')
;
INSERT INTO sales_order_items VALUES (
	2646,
	1,
	302,
	24,
	'1995-11-25')
;
INSERT INTO sales_order_items VALUES (
	2647,
	1,
	401,
	36,
	'1995-11-24')
;
INSERT INTO sales_order_items VALUES (
	2648,
	1,
	600,
	12,
	'1995-11-26')
;
INSERT INTO sales_order_items VALUES (
	2649,
	1,
	700,
	36,
	'1995-11-26')
;
INSERT INTO sales_order_items VALUES (
	2650,
	1,
	600,
	24,
	'1995-11-29')
;
INSERT INTO sales_order_items VALUES (
	2650,
	2,
	601,
	36,
	'1995-11-29')
;
INSERT INTO sales_order_items VALUES (
	2651,
	1,
	700,
	48,
	'1995-11-29')
;
INSERT INTO sales_order_items VALUES (
	2652,
	1,
	400,
	36,
	'1995-11-26')
;
commit
;
-- ============================================================ 
--   Load states table                                          
-- ============================================================ 
INSERT INTO states VALUES (
	'AB',
	'Alberta',
	'Edmonton',
	'CAN',
	'Canada')
;
INSERT INTO states VALUES (
	'AK',
	'Alaska',
	'Juneau',
	'USA',
	'Western')
;
INSERT INTO states VALUES (
	'AL',
	'Alabama',
	'Montgomery',
	'USA',
	'South')
;
INSERT INTO states VALUES (
	'AR',
	'Arkansas',
	'Little Rock',
	'USA',
	'South')
;
INSERT INTO states VALUES (
	'AZ',
	'Arizona',
	'Phoenix',
	'USA',
	'Western')
;
INSERT INTO states VALUES (
	'BC',
	'British Columbia',
	'Victoria',
	'CAN',
	'Canada')
;
INSERT INTO states VALUES (
	'CA',
	'California',
	'Sacramento',
	'USA',
	'Western')
;
INSERT INTO states VALUES (
	'CO',
	'Colorado',
	'Denver',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'CT',
	'Connecticut',
	'Hartford',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'DC',
	'District of Columbia',
	'Washington',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'DE',
	'Delaware',
	'Dover',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'FL',
	'Florida',
	'Tallahassee',
	'USA',
	'South')
;
INSERT INTO states VALUES (
	'GA',
	'Georgia',
	'Atlanta',
	'USA',
	'South')
;
INSERT INTO states VALUES (
	'HI',
	'Hawaii',
	'Honolulu',
	'USA',
	'Western')
;
INSERT INTO states VALUES (
	'IA',
	'Iowa',
	'Des Moines',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'ID',
	'Idaho',
	'Boise',
	'USA',
	'Western')
;
INSERT INTO states VALUES (
	'IL',
	'Illinois',
	'Springfield',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'IN',
	'Indiana',
	'Indianapolis',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'KS',
	'Kansas',
	'Topeka',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'KY',
	'Kentucky',
	'Frankfort',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'LA',
	'Louisiana',
	'Baton Rouge',
	'USA',
	'South')
;
INSERT INTO states VALUES (
	'MA',
	'Massachusetts',
	'Boston',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'MB',
	'Manitoba',
	'Winnipeg',
	'CAN',
	'Canada')
;
INSERT INTO states VALUES (
	'MD',
	'Maryland',
	'Annapolis',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'ME',
	'Maine',
	'Augusta',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'MI',
	'Michigan',
	'Lansing',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'MN',
	'Minnesota',
	'St. Paul',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'MO',
	'Missouri',
	'Jefferson City',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'MS',
	'Mississippi',
	'Jackson',
	'USA',
	'South')
;
INSERT INTO states VALUES (
	'MT',
	'Montana',
	'Helena',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'NB',
	'New Brunswick',
	'Fredericton',
	'CAN',
	'Canada')
;
INSERT INTO states VALUES (
	'NC',
	'North Carolina',
	'Raleigh',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'ND',
	'North Dakota',
	'Bismarck',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'NE',
	'Nebraska',
	'Lincoln',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'NF',
	'Newfoundland',
	'St. John''s',
	'CAN',
	'Canada')
;
INSERT INTO states VALUES (
	'NH',
	'New Hampshire',
	'Concord',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'NJ',
	'New Jersey',
	'Trenton',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'NM',
	'New Mexico',
	'Santa Fe',
	'USA',
	'Western')
;
INSERT INTO states VALUES (
	'NS',
	'Nova Scotia',
	'Halifax',
	'CAN',
	'Canada')
;
INSERT INTO states VALUES (
	'NT',
	'Northwest Territories',
	'Yellowknife',
	'CAN',
	'Canada')
;
INSERT INTO states VALUES (
	'NV',
	'Nevada',
	'Carson City',
	'USA',
	'Western')
;
INSERT INTO states VALUES (
	'NY',
	'New York',
	'Albany',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'OH',
	'Ohio',
	'Columbus',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'OK',
	'Oklahoma',
	'Oklahoma City',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'ON',
	'Ontario',
	'Toronto',
	'CAN',
	'Canada')
;
INSERT INTO states VALUES (
	'OR',
	'Oregon',
	'Salem',
	'USA',
	'Western')
;
INSERT INTO states VALUES (
	'PA',
	'Pennsylvania',
	'Harrisburg',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'PE',
	'Prince Edward Island',
	'Charlottetown',
	'CAN',
	'Canada')
;
INSERT INTO states VALUES (
	'PQ',
	'Québec',
	'Québec',
	'CAN',
	'Canada')
;
INSERT INTO states VALUES (
	'RI',
	'Rhode Island',
	'Providence',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'SC',
	'South Carolina',
	'Columbia',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'SD',
	'South Dakota',
	'Pierre',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'SK',
	'Saskatchewan',
	'Regina',
	'CAN',
	'Canada')
;
INSERT INTO states VALUES (
	'TN',
	'Tennessee',
	'Nashville',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'TX',
	'Texas',
	'Austin',
	'USA',
	'South')
;
INSERT INTO states VALUES (
	'UT',
	'Utah',
	'Salt Lake City',
	'USA',
	'Western')
;
INSERT INTO states VALUES (
	'VA',
	'Virginia',
	'Richmond',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'VT',
	'Vermont',
	'Montpelier',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'WA',
	'Washington',
	'Olympia',
	'USA',
	'Western')
;
INSERT INTO states VALUES (
	'WI',
	'Wisconsin',
	'Madison',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'WV',
	'West Virginia',
	'Charleston',
	'USA',
	'Eastern')
;
INSERT INTO states VALUES (
	'WY',
	'Wyoming',
	'Cheyenne',
	'USA',
	'Central')
;
INSERT INTO states VALUES (
	'YT',
	'Yukon Territory',
	'Whitehorse',
	'CAN',
	'Canada')
;
commit
;
-- ============================================================ 
--   Build Indexes                                              
-- ============================================================ 
create index ix_cust_name on customer (lname, fname)
;

create index ix_fin_data on fin_data (code)
;

create index ix_prod_color on product (color)
;

create index ix_prod_desc on product (description)
;

create index ix_prod_name on product (name)
;

create index ix_prod_size on product (prod_size)
;

create index ix_sales_cust on sales_order (cust_id)
;

create index ix_item_prod on sales_order_items (prod_id)
;

create index ix_category_parent on examples_categories_list (category_id, category_parent_id)
;

create index ix_catparent_example on examples_categories_list (category_parent_id, example_id)
;

commit
;
-- ============================================================ 
--   Build foreign keys                                         
-- ============================================================ 
alter table department
    add constraint fk1_department foreign key (dept_head_id)
       references employee (emp_id)
;

alter table employee
    add constraint fk1_employee foreign key (dept_id)
       references department (dept_id)
;

alter table fin_data
    add constraint fk1_fin_data foreign key (code)
       references fin_code (code)
;

alter table sales_order
    add constraint fk1_sales_order foreign key (cust_id)
       references customer (id)
;

alter table sales_order
    add constraint fk2_sales_order foreign key (sales_rep)
       references employee (emp_id)
;

alter table sales_order
    add constraint fk3_sales_order foreign key (fin_code_id)
       references fin_code (code)
;

alter table sales_order_items
    add constraint fk1_sales_order_items foreign key (prod_id)
       references product (id)
;

alter table sales_order_items
    add constraint fk2_sales_order_items foreign key (id)
       references sales_order (id)
;

alter table states
    add constraint fk1_states foreign key (region)
       references sales_regions (region)
;

alter table examples_categories_list
    add constraint fk1_examples foreign key (example_id)
       references examples (example_id)
;
alter table security_groupings
    add constraint security_groupings_group foreign key (group_name)
       references security_users (name)
;

alter table security_groupings
    add constraint security_groupings_user foreign key (user_name)
       references security_users (name)
;

alter table security_info
    add constraint security_info_template foreign key (application, window, control)
       references security_template (application, window, control)
;

alter table security_info
    add constraint security_info_users foreign key (user_name)
       references security_users (name)
;

alter table security_template
    add constraint security_template_app foreign key (application)
       references security_apps (application)
;
commit
;
-- ============================================================ 
--   Load PowerBuilder Repository Tables                        
-- ============================================================ 
-- ============================================================ 
--   Load pbcatcol table                                        
-- ============================================================ 
DELETE FROM pbcatcol
WHERE pbc_tnam IN ('states', 'customer', 'fin_code', 'fin_data', 'employee',
		'department', 'product', 'sales_order_items', 'sales_order',
		'examples', 'examples_categories_list', 'messages',
		'security_apps', 'security_groupings', 'security_info',
		'security_template', 'security_users')
;
INSERT INTO pbcatcol VALUES (
	'messages',
	'',
	USER,
	'msgid',
	1,
	'msgid',
	0,
	'msgid',
	0,
	0,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'messages',
	'',
	USER,
	'msgtitle',
	2,
	'msgtitle',
	0,
	'msgtitle',
	0,
	0,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'messages',
	'',
	USER,
	'msgtext',
	3,
	'msgtext',
	0,
	'msgtext',
	0,
	0,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'messages',
	'',
	USER,
	'msgicon',
	4,
	'msgicon',
	0,
	'msgicon',
	0,
	0,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'messages',
	'',
	USER,
	'msgbutton',
	5,
	'msgbutton',
	0,
	'msgbutton',
	0,
	0,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'messages',
	'',
	USER,
	'msgdefaultbutton',
	6,
	'msgdefaultbutton',
	0,
	'msgdefaultbutton',
	0,
	0,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'messages',
	'',
	USER,
	'msgseverity',
	7,
	'msgseverity',
	0,
	'msgseverity',
	0,
	0,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'messages',
	'',
	USER,
	'msgprint',
	8,
	'msgprint',
	0,
	'msgprint',
	0,
	0,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'messages',
	'',
	USER,
	'msguserinput',
	9,
	'msguserinput',
	0,
	'msguserinput',
	0,
	0,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_groupings',
	'',
	USER,
	'group_name',
	1,
	'Group Name',
	0,
	'Group Name',
	0,
	23,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'security_groups',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_groupings',
	'',
	USER,
	'user_name',
	2,
	'User Name',
	0,
	'User Name',
	0,
	23,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'security_users',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_info',
	'',
	USER,
	'application',
	1,
	'Application : ',
	0,
	'Application',
	0,
	0,
	'',
	0,
	0,
	659,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_info',
	'',
	USER,
	'window',
	2,
	'Window: ',
	0,
	'Window',
	0,
	23,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_info',
	'',
	USER,
	'control',
	3,
	'Control: ',
	0,
	'Control',
	0,
	23,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_info',
	'',
	USER,
	'user_name',
	4,
	'Id: ',
	0,
	'User ID',
	0,
	23,
	'[General]',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_info',
	'',
	USER,
	'status',
	5,
	'Status:',
	0,
	'Status',
	0,
	23,
	'',
	0,
	0,
	439,
	'',
	'N',
	'',
	'',
	'security_statustypes',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_template',
	'',
	USER,
	'application',
	1,
	'application',
	0,
	'application',
	0,
	0,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_template',
	'',
	USER,
	'window',
	2,
	'window',
	0,
	'window',
	0,
	0,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_template',
	'',
	USER,
	'control',
	3,
	'control',
	0,
	'control',
	0,
	0,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_template',
	'',
	USER,
	'description',
	4,
	'description',
	0,
	'description',
	0,
	0,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_template',
	'',
	USER,
	'object_type',
	5,
	'object_type',
	0,
	'object_type',
	0,
	0,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_users',
	'',
	USER,
	'name',
	1,
	'User/Group Name:',
	0,
	'User/Group Name',
	0,
	23,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_users',
	'',
	USER,
	'description',
	2,
	'Description:',
	0,
	'Description',
	0,
	23,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_users',
	'',
	USER,
	'priority',
	3,
	'Priority:',
	0,
	'Priority',
	0,
	24,
	'[General]',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_users',
	'',
	USER,
	'user_type',
	4,
	'Entry Type:',
	0,
	'Entry Type',
	0,
	25,
	'[General]',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_apps',
	'',
	USER,
	'application',
	1,
	'Application:',
	0,
	'Application',
	0,
	23,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'security_apps',
	'',
	USER,
	'description',
	2,
	'Description:',
	0,
	'Description',
	0,
	23,
	'',
	0,
	0,
	0,
	'',
	'N',
	'',
	'',
	'',
	'')
;
INSERT INTO pbcatcol VALUES (
	'states',
	'',
	USER,
	'state_id',
	1,
	'ID:',
	23,
	'ID',
	25,
	23,
	NULL,
	26,
	61,
	170,
	NULL,
	'N',
	NULL,
	'State Identification Code',
	'',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'states',
	'',
	USER,
	'state_name',
	2,
	'Name:',
	23,
	'Name',
	25,
	23,
	NULL,
	26,
	61,
	618,
	NULL,
	'N',
	NULL,
	'Name of the state',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'states',
	'',
	USER,
	'state_capital',
	3,
	'Capital:',
	23,
	'Capital',
	25,
	23,
	NULL,
	26,
	61,
	618,
	NULL,
	'N',
	NULL,
	'Capital city of the state',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'states',
	'',
	USER,
	'country',
	4,
	'Country:',
	23,
	'Country',
	25,
	23,
	NULL,
	26,
	61,
	618,
	NULL,
	'N',
	NULL,
	'Country the state is located in',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'states',
	'',
	USER,
	'region',
	5,
	'Region:',
	23,
	'Region',
	25,
	23,
	NULL,
	0,
	65,
	183,
	NULL,
	'N',
	NULL,
	NULL,
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'customer',
	'',
	USER,
	'id',
	1,
	'Customer ID:',
	23,
	'Customer~r~nID',
	25,
	24,
	NULL,
	26,
	61,
	206,
	NULL,
	'N',
	NULL,
	'Unique Identification number of the customer',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'customer',
	'',
	USER,
	'fname',
	2,
	'First Name:',
	23,
	'First Name',
	25,
	23,
	NULL,
	26,
	61,
	412,
	NULL,
	'N',
	NULL,
	'First name of the customer',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'customer',
	'',
	USER,
	'lname',
	3,
	'Last Name:',
	23,
	'Last Name',
	25,
	23,
	NULL,
	26,
	61,
	526,
	NULL,
	'N',
	NULL,
	'Last name of the customer',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'customer',
	'',
	USER,
	'address',
	4,
	'Address:',
	23,
	'Address',
	25,
	23,
	NULL,
	26,
	61,
	869,
	NULL,
	'N',
	NULL,
	'Mailing address of the customer',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'customer',
	'',
	USER,
	'city',
	5,
	'City:',
	23,
	'City',
	25,
	23,
	NULL,
	26,
	61,
	526,
	NULL,
	'N',
	NULL,
	'City where the customer is located',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'customer',
	'',
	USER,
	'state',
	6,
	'State:',
	23,
	'State',
	25,
	23,
	NULL,
	26,
	61,
	170,
	NULL,
	'N',
	NULL,
	'State where the customer is located',
	'StateCode',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'customer',
	'',
	USER,
	'zip',
	7,
	'Zip Code:',
	23,
	'Zip Code',
	25,
	23,
	NULL,
	26,
	61,
	350,
	NULL,
	'N',
	NULL,
	'Zip Code where the customer is located',
	'ZipCode',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'customer',
	'',
	USER,
	'phone',
	8,
	'Phone Number:',
	23,
	'Phone Number',
	25,
	23,
	NULL,
	26,
	61,
	400,
	NULL,
	'N',
	NULL,
	'Phone number of the customer',
	'TelephoneNumber',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'customer',
	'',
	USER,
	'company_name',
	9,
	'Company Name:',
	23,
	'Company Name',
	25,
	23,
	NULL,
	26,
	61,
	869,
	NULL,
	'N',
	NULL,
	'Name of the company',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'fin_code',
	'',
	USER,
	'code',
	1,
	'Code:',
	23,
	'Code',
	25,
	23,
	NULL,
	26,
	61,
	115,
	NULL,
	'N',
	NULL,
	'Unique financial identification code',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'fin_code',
	'',
	USER,
	'type',
	2,
	'Type:',
	23,
	'Type',
	25,
	23,
	NULL,
	26,
	61,
	298,
	NULL,
	'N',
	NULL,
	'Financial Code type',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'fin_code',
	'',
	USER,
	'description',
	3,
	'Description:',
	23,
	'Description',
	25,
	23,
	NULL,
	26,
	61,
	1212,
	NULL,
	'N',
	NULL,
	'Financial Code description',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'fin_data',
	'',
	USER,
	'year',
	1,
	'Year:',
	23,
	'Year',
	25,
	23,
	NULL,
	26,
	61,
	161,
	'must_be_number',
	'N',
	NULL,
	'Year financial data applies to',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'fin_data',
	'',
	USER,
	'quarter',
	2,
	'Quarter:',
	23,
	'Quarter',
	25,
	23,
	NULL,
	26,
	61,
	115,
	'must_be_number',
	'N',
	NULL,
	'The quarter that the financial data applies to',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'fin_data',
	'',
	USER,
	'code',
	3,
	'Code:',
	23,
	'Code',
	25,
	23,
	NULL,
	26,
	61,
	160,
	NULL,
	'N',
	NULL,
	'Financial Identification Code',
	'Financial Codes',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'fin_data',
	'',
	USER,
	'amount',
	4,
	'Amount in thousands:',
	23,
	'Amount in thousands',
	25,
	24,
	NULL,
	26,
	61,
	206,
	NULL,
	'N',
	NULL,
	'Dollar amount recorded for year, quarter, and financial code',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'emp_id',
	1,
	'Employee ID:',
	23,
	'Employee~r~nID',
	25,
	24,
	NULL,
	26,
	61,
	206,
	NULL,
	'N',
	NULL,
	'Identification Number of the employee',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'manager_id',
	2,
	'Manager ID:',
	23,
	'Manager~r~nID',
	25,
	24,
	NULL,
	26,
	61,
	206,
	NULL,
	'N',
	NULL,
	'Identification number of the employee''s manager',
	'employees',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'emp_fname',
	3,
	'First Name:',
	23,
	'First Name',
	25,
	23,
	NULL,
	26,
	61,
	412,
	NULL,
	'N',
	NULL,
	'First name of the employee',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'emp_lname',
	4,
	'Last Name:',
	23,
	'Last Name',
	25,
	23,
	NULL,
	26,
	61,
	526,
	NULL,
	'N',
	NULL,
	'Last name of the employee',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'dept_id',
	5,
	'Department ID:',
	23,
	'Department~r~nID',
	25,
	24,
	NULL,
	26,
	61,
	206,
	NULL,
	'N',
	NULL,
	'Identification Number for the department where the employee works',
	'Department List',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'street',
	6,
	'Street:',
	23,
	'Street',
	25,
	23,
	NULL,
	26,
	61,
	869,
	NULL,
	'N',
	NULL,
	'Street address of the employee',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'city',
	7,
	'City:',
	23,
	'City',
	25,
	23,
	NULL,
	26,
	61,
	526,
	NULL,
	'N',
	NULL,
	'City where the employee resides',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'state',
	8,
	'State:',
	23,
	'State',
	25,
	23,
	NULL,
	26,
	61,
	170,
	NULL,
	'N',
	NULL,
	'State where the employee resides',
	'StateCode',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'zip_code',
	9,
	'Zip Code:',
	23,
	'Zip Code',
	25,
	23,
	NULL,
	26,
	61,
	350,
	NULL,
	'N',
	NULL,
	'Zip Code where the employee resides',
	'ZipCode',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'phone',
	10,
	'Phone:',
	23,
	'Phone',
	25,
	23,
	'phone_number',
	26,
	61,
	400,
	NULL,
	'N',
	NULL,
	'Phone number of the employee',
	'TelephoneNumber',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'status',
	11,
	'Status:',
	23,
	'Status',
	25,
	23,
	NULL,
	26,
	233,
	503,
	'valid_status',
	'N',
	'A',
	'Status of the employee (active, on leave, or terminated)',
	'Employee Status',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'ss_number',
	12,
	'Social Security Number:',
	23,
	'SSN',
	25,
	23,
	NULL,
	26,
	61,
	370,
	NULL,
	'N',
	NULL,
	'Social Security Number of the employee',
	'SocSecNumber',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'salary',
	13,
	'Salary:',
	23,
	'Salary',
	25,
	24,
	'salary',
	0,
	61,
	343,
	'Positive_number',
	'N',
	NULL,
	'Annual salary of the employee',
	'Dollars with cents',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'start_date',
	14,
	'Start Date:',
	23,
	'Start Date',
	25,
	23,
	NULL,
	26,
	61,
	310,
	NULL,
	'N',
	NULL,
	'Date the employee began working',
	'MM/DD/YYYY',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'termination_date',
	15,
	'Termination Date:',
	23,
	'Termination~r~nDate',
	25,
	23,
	NULL,
	26,
	61,
	310,
	NULL,
	'N',
	NULL,
	'Date the employee was terminated',
	'MM/DD/YYYY',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'birth_date',
	16,
	'Birth Date:',
	23,
	'Birth Date',
	25,
	23,
	NULL,
	26,
	61,
	310,
	NULL,
	'N',
	NULL,
	'Birth Date of the employee',
	'MM/DD/YYYY',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'bene_health_ins',
	17,
	'Health Insurance:',
	23,
	'Health~r~nInsurance',
	25,
	23,
	NULL,
	26,
	61,
	540,
	'Y_or_N',
	'N',
	NULL,
	'Determines if the employee has health insurance',
	'Health Insurance',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'bene_life_ins',
	18,
	'Life Insurance:',
	23,
	'Life~r~nInsurance',
	25,
	23,
	NULL,
	26,
	61,
	499,
	'Y_or_N',
	'N',
	NULL,
	'Determines if the employee has life insurance',
	'Life Insurance',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'bene_day_care',
	19,
	'Day Care:',
	23,
	'Day~r~nCare',
	25,
	23,
	NULL,
	26,
	61,
	499,
	'Y_or_N',
	'N',
	NULL,
	'Determines if the employee is entitled to day care insurance',
	'Day Care',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'employee',
	'',
	USER,
	'sex',
	20,
	'Sex:',
	23,
	'Sex',
	25,
	23,
	NULL,
	26,
	140,
	330,
	NULL,
	'N',
	NULL,
	'Male or Female',
	'sex',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'department',
	'',
	USER,
	'dept_id',
	1,
	'Department ID:',
	23,
	'Department~r~nID',
	25,
	24,
	NULL,
	26,
	61,
	206,
	'Multiple_of_100',
	'N',
	NULL,
	'Unique Identification Code of the department',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'department',
	'',
	USER,
	'dept_name',
	2,
	'Department Name:',
	23,
	'Department Name',
	23,
	23,
	NULL,
	26,
	61,
	900,
	NULL,
	'N',
	NULL,
	'Name of the department',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'department',
	'',
	USER,
	'dept_head_id',
	3,
	'Manager ID:',
	23,
	'Manager~r~nID',
	25,
	24,
	NULL,
	26,
	61,
	206,
	NULL,
	'N',
	NULL,
	'Identification number of the department manager',
	'employees',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples',
	'',
	USER,
	'title',
	1,
	'Title',
	0,
	'Title',
	0,
	23,
	NULL,
	0,
	0,
	1317,
	NULL,
	'N',
	NULL,
	'Title of the example',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples',
	'',
	USER,
	'window',
	2,
	'Window',
	0,
	'Window',
	0,
	23,
	NULL,
	0,
	0,
	878,
	NULL,
	'N',
	NULL,
	'Window that is opened when the example runs',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples',
	'',
	USER,
	'description',
	3,
	'Description:',
	23,
	'Description',
	25,
	23,
	NULL,
	26,
	0,
	1756,
	NULL,
	'N',
	NULL,
	'A summary of what the code example does',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples',
	'',
	USER,
	'technique',
	4,
	'Technique:',
	23,
	'Technique',
	25,
	23,
	NULL,
	26,
	0,
	1756,
	NULL,
	'N',
	NULL,
	'A technical summary of what the code example is showing',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples',
	'',
	USER,
	'ostype',
	5,
	'Platform:',
	23,
	'Platform',
	25,
	23,
	NULL,
	26,
	0,
	0,
	NULL,
	'N',
	NULL,
	'Determines what operating systems the example will run on',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples',
	'',
	USER,
	'pbtype',
	6,
	'Pbtype:',
	23,
	'Pbtype',
	25,
	23,
	NULL,
	26,
	0,
	0,
	NULL,
	'N',
	NULL,
	'Determines whether the example will run on desktop or enterprise',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples',
	'',
	USER,
	'exhelp',
	7,
	'Example Help:',
	0,
	'Example Help',
	0,
	24,
	'[General]',
	0,
	0,
	0,
	NULL,
	'N',
	NULL,
	'Determine if the example has help associated with it in the Help File.',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples',
	'',
	USER,
	'example_id',
	8,
	'Example Id:',
	0,
	'Example Id',
	0,
	0,
	NULL,
	0,
	0,
	0,
	NULL,
	'N',
	NULL,
	'Unique identifier for an example.',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples_categories_list',
	'',
	USER,
	'picture_idx',
	5,
	'Picture Idx:',
	0,
	'Picture Idx',
	0,
	24,
	'[General]',
	0,
	65,
	165,
	NULL,
	'N',
	NULL,
	NULL,
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples_categories_list',
	'',
	USER,
	'state_picture_idx',
	6,
	'State Picture Idx:',
	0,
	'State Picture Idx',
	0,
	24,
	'[General]',
	0,
	65,
	165,
	NULL,
	'N',
	NULL,
	NULL,
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples_categories_list',
	'',
	USER,
	'category_parent_id',
	3,
	'category Parent Id:',
	0,
	'category Parent Id',
	0,
	24,
	'[General]',
	0,
	65,
	165,
	NULL,
	'N',
	NULL,
	NULL,
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples_categories_list',
	'',
	USER,
	'example_id',
	4,
	'Example Id:',
	0,
	'Example Id',
	0,
	24,
	'[General]',
	0,
	65,
	165,
	NULL,
	'N',
	NULL,
	NULL,
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples_categories_list',
	'',
	USER,
	'category_name',
	2,
	'category Name:',
	0,
	'category Name',
	0,
	23,
	NULL,
	0,
	65,
	787,
	NULL,
	'N',
	NULL,
	NULL,
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples_categories_list',
	'',
	USER,
	'overlay_picture_idx',
	7,
	'Overlay Picture Idx:',
	0,
	'Overlay Picture Idx',
	0,
	24,
	'[General]',
	0,
	65,
	165,
	NULL,
	'N',
	NULL,
	NULL,
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples_categories_list',
	'',
	USER,
	'selected_picture_idx',
	8,
	'Selected Picture Idx:',
	0,
	'Selected Picture Idx',
	0,
	24,
	'[General]',
	0,
	65,
	165,
	NULL,
	'N',
	NULL,
	NULL,
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'examples_categories_list',
	'',
	USER,
	'category_id',
	1,
	'category Id:',
	0,
	'category Id',
	0,
	24,
	'[General]',
	0,
	65,
	165,
	NULL,
	'N',
	NULL,
	NULL,
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'product',
	'',
	USER,
	'id',
	1,
	'Product ID:',
	23,
	'Product~r~nID',
	25,
	24,
	NULL,
	26,
	61,
	206,
	NULL,
	'N',
	NULL,
	'Unique Identification Code of the product',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'product',
	'',
	USER,
	'name',
	2,
	'Product Name:',
	23,
	'Product Name',
	25,
	23,
	NULL,
	26,
	61,
	412,
	NULL,
	'N',
	NULL,
	'Name of the product',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'product',
	'',
	USER,
	'description',
	3,
	'Product Description:',
	23,
	'Product Description',
	25,
	23,
	NULL,
	26,
	61,
	755,
	NULL,
	'N',
	NULL,
	'Describes what the product is',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'product',
	'',
	USER,
	'prod_size',
	4,
	'Size:',
	23,
	'Size',
	25,
	23,
	NULL,
	26,
	61,
	500,
	NULL,
	'N',
	NULL,
	'Measurements of the product',
	'Size List',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'product',
	'',
	USER,
	'color',
	5,
	'Color:',
	23,
	'Color',
	25,
	23,
	NULL,
	26,
	61,
	340,
	NULL,
	'N',
	NULL,
	'Color of the product',
	'Color List',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'product',
	'',
	USER,
	'quantity',
	6,
	'Quantity:',
	23,
	'Quantity',
	25,
	24,
	NULL,
	26,
	61,
	206,
	'positive_number',
	'N',
	NULL,
	'Amount of the product in stock',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'product',
	'',
	USER,
	'unit_price',
	7,
	'Unit Price:',
	23,
	'Unit Price',
	25,
	24,
	'$#,##0.00;[RED]($#,##0.00)',
	26,
	61,
	343,
	NULL,
	'N',
	NULL,
	'Unit price per product',
	'dollars width cents',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'product',
	'',
	USER,
	'picture_name',
	8,
	'Picture Name:',
	23,
	'Picture Name',
	23,
	23,
	NULL,
	26,
	343,
	343,
	NULL,
	'Y',
	NULL,
	'.bmp filename that shows what the product looks like',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'product',
	'',
	USER,
	'catalog_picture',
	9,
	'Catalog Picture:',
	0,
	'Catalog Picture',
	0,
	24,
	'[General]',
	0,
	0,
	0,
	NULL,
	'N',
	NULL,
	'Blob containing a catalog picture of the product in RLE format',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'sales_order_items',
	'',
	USER,
	'id',
	1,
	'Sales Order ID:',
	23,
	'Sales~r~nOrder ID',
	25,
	24,
	NULL,
	26,
	61,
	250,
	NULL,
	'N',
	NULL,
	'Sales order Identification Number',
	'Sales Orders',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'sales_order_items',
	'',
	USER,
	'line_id',
	2,
	'Line #:',
	23,
	'Line #',
	25,
	24,
	NULL,
	26,
	61,
	206,
	NULL,
	'N',
	NULL,
	'Line item Identification Number',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'sales_order_items',
	'',
	USER,
	'prod_id',
	3,
	'Product ID:',
	23,
	'Product~r~nID',
	25,
	24,
	NULL,
	26,
	61,
	206,
	NULL,
	'N',
	NULL,
	'Product Identification Number',
	'Products',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'sales_order_items',
	'',
	USER,
	'ship_date',
	5,
	'Date Shipped:',
	23,
	'Date~r~nShipped',
	25,
	23,
	NULL,
	26,
	61,
	310,
	NULL,
	'N',
	NULL,
	'Date shipped',
	'MM/DD/YY',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'sales_order_items',
	'',
	USER,
	'quantity',
	4,
	'Quantity:',
	23,
	'Quantity',
	25,
	24,
	NULL,
	26,
	61,
	206,
	'positive_number',
	'N',
	NULL,
	'Quantity ordered',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'sales_order',
	'',
	USER,
	'id',
	1,
	'Sales Order ID:',
	23,
	'Sales~r~nOrder ID',
	25,
	24,
	NULL,
	26,
	61,
	206,
	NULL,
	'N',
	NULL,
	'Unique Identification Number of the sales order',
	NULL,
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'sales_order',
	'',
	USER,
	'cust_id',
	2,
	'Customer ID:',
	23,
	'Customer~r~nID',
	25,
	24,
	NULL,
	26,
	61,
	270,
	NULL,
	'N',
	NULL,
	'Identification Number of the customer that the sales order is for',
	'Customers',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'sales_order',
	'',
	USER,
	'order_date',
	3,
	'Order Date:',
	23,
	'Order Date',
	25,
	23,
	NULL,
	26,
	61,
	310,
	NULL,
	'N',
	NULL,
	'Date Ordered',
	'MM/DD/YY',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'sales_order',
	'',
	USER,
	'fin_code_id',
	4,
	'Financial Code:',
	23,
	'Financial~r~nCode',
	25,
	24,
	NULL,
	26,
	61,
	170,
	NULL,
	'N',
	NULL,
	'Financial Code',
	'Financial Codes',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'sales_order',
	'',
	USER,
	'region',
	5,
	'Region:',
	23,
	'Region',
	25,
	23,
	NULL,
	26,
	61,
	300,
	NULL,
	'N',
	NULL,
	'Sales Region',
	'region',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'sales_order',
	'',
	USER,
	'sales_rep',
	6,
	'Sales Rep ID:',
	23,
	'Sales~r~nRep ID',
	25,
	24,
	NULL,
	26,
	61,
	260,
	NULL,
	'N',
	NULL,
	'Identification Number of the Sales Representative',
	'employees',
	NULL)
;
INSERT INTO pbcatcol VALUES (
	'sales_regions',
	'',
	USER,
	'region',
	1,
	'Region:',
	0,
	'Region',
	0,
	23,
	NULL,
	0,
	65,
	183,
	NULL,
	'N',
	NULL,
	NULL,
	NULL,
	NULL)
;
commit
;
-- ============================================================ 
--   Load pbcatedt table                                        
-- ============================================================ 
DELETE FROM pbcatedt
;
INSERT INTO pbcatedt VALUES (
	'###,###.00',
	'###,###.00',
	90,
	1,
	1,
	32,
	'10')
;
INSERT INTO pbcatedt VALUES (
	'#####',
	'#####',
	90,
	1,
	1,
	32,
	'10')
;
INSERT INTO pbcatedt VALUES (
	'###-##-####',
	'###-##-####',
	90,
	1,
	1,
	32,
	'00')
;
INSERT INTO pbcatedt VALUES (
	'MM/DD/YY',
	'MM/DD/YY',
	90,
	1,
	1,
	32,
	'20')
;
INSERT INTO pbcatedt VALUES (
	'DD/MM/YY',
	'DD/MM/YY',
	90,
	1,
	1,
	32,
	'20')
;
INSERT INTO pbcatedt VALUES (
	'MM/DD/YYYY',
	'MM/DD/YYYY',
	90,
	1,
	1,
	32,
	'20')
;
INSERT INTO pbcatedt VALUES (
	'DD/MM/YYYY',
	'DD/MM/YYYY',
	90,
	1,
	1,
	32,
	'20')
;
INSERT INTO pbcatedt VALUES (
	'DD/MMM/YY',
	'DD/MMM/YY',
	90,
	1,
	1,
	32,
	'20')
;
INSERT INTO pbcatedt VALUES (
	'DDD/YY',
	'DDD/YY',
	90,
	1,
	1,
	32,
	'20')
;
INSERT INTO pbcatedt VALUES (
	'DDD/YYYY',
	'DDD/YYYY',
	90,
	1,
	1,
	32,
	'20')
;
INSERT INTO pbcatedt VALUES (
	'HH:MM:SS',
	'HH:MM:SS',
	90,
	1,
	1,
	32,
	'30')
;
INSERT INTO pbcatedt VALUES (
	'HH:MM:SS:FFF',
	'HH:MM:SS:FFF',
	90,
	1,
	1,
	32,
	'30')
;
INSERT INTO pbcatedt VALUES (
	'HH:MM:SS:FFFFFF',
	'HH:MM:SS:FFFFFF',
	90,
	1,
	1,
	32,
	'30')
;
INSERT INTO pbcatedt VALUES (
	'MM/DD/YY HH:MM:SS',
	'MM/DD/YY HH:MM:SS',
	90,
	1,
	1,
	32,
	'40')
;
INSERT INTO pbcatedt VALUES (
	'DD/MM/YY HH:MM:SS',
	'DD/MM/YY HH:MM:SS',
	90,
	1,
	1,
	32,
	'40')
;
INSERT INTO pbcatedt VALUES (
	'MM/DD/YYYY HH:MM:SS',
	'MM/DD/YYYY HH:MM:SS',
	90,
	1,
	1,
	32,
	'40')
;
INSERT INTO pbcatedt VALUES (
	'DD/MM/YYYY HH:MM:SS',
	'DD/MM/YYYY HH:MM:SS',
	90,
	1,
	1,
	32,
	'40')
;
INSERT INTO pbcatedt VALUES (
	'DD/MMM/YY HH:MM:SS',
	'DD/MMM/YY HH:MM:SS',
	90,
	1,
	1,
	32,
	'40')
;
INSERT INTO pbcatedt VALUES (
	'DDD/YY HH:MM:SS',
	'DDD/YY HH:MM:SS',
	90,
	1,
	1,
	32,
	'40')
;
INSERT INTO pbcatedt VALUES (
	'DDD/YYYY HH:MM:SS',
	'DDD/YYYY HH:MM:SS',
	90,
	1,
	1,
	32,
	'40')
;
INSERT INTO pbcatedt VALUES (
	'DD/MM/YY HH:MM:SS:FFFFFF',
	'DD/MM/YY HH:MM:SS:FFFFFF',
	90,
	1,
	1,
	32,
	'40')
;
INSERT INTO pbcatedt VALUES (
	'security_usertypes',
	'0',
	87,
	1,
	1,
	71303170,
	NULL)
;
INSERT INTO pbcatedt VALUES (
	'security_usertypes',
	'User',
	87,
	1,
	2,
	0,
	NULL)
;
INSERT INTO pbcatedt VALUES (
	'security_usertypes',
	'0',
	87,
	1,
	3,
	0,
	NULL)
;
INSERT INTO pbcatedt VALUES (
	'security_usertypes',
	'Group',
	87,
	1,
	4,
	0,
	NULL)
;
INSERT INTO pbcatedt VALUES (
	'security_usertypes',
	'1',
	87,
	1,
	5,
	0,
	NULL)
;
INSERT INTO pbcatedt VALUES (
	'security_statustypes',
	'0',
	87,
	1,
	1,
	-2076180478,
	NULL)
;
INSERT INTO pbcatedt VALUES (
	'security_statustypes',
	'Invisible',
	87,
	1,
	2,
	0,
	NULL)
;
INSERT INTO pbcatedt VALUES (
	'security_statustypes',
	'I',
	87,
	1,
	3,
	0,
	NULL)
;
INSERT INTO pbcatedt VALUES (
	'security_statustypes',
	'Enabled',
	87,
	1,
	4,
	0,
	NULL)
;
INSERT INTO pbcatedt VALUES (
	'security_statustypes',
	'E',
	87,
	1,
	5,
	0,
	NULL)
;
INSERT INTO pbcatedt VALUES (
	'security_statustypes',
	'Disabled',
	87,
	1,
	6,
	0,
	NULL)
;
INSERT INTO pbcatedt VALUES (
	'security_statustypes',
	'D',
	87,
	1,
	7,
	0,
	NULL)
;
INSERT INTO pbcatedt VALUES (
	'Dollars with cents',
	'$###,###,###.00',
	90,
	2,
	1,
	32,
	'00')
;
commit
;

-- ============================================================ 
--   Load pbcatfmt table                                        
-- ============================================================ 
DELETE FROM pbcatfmt
;
INSERT INTO pbcatfmt VALUES (
	'[General]',
	'[General]',
	81,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'0',
	'0',
	81,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'0.00',
	'0.00',
	81,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'#,##0',
	'#,##0',
	81,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'#,##0.00',
	'#,##0.00',
	81,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'$#,##0;($#,##0)',
	'$#,##0;($#,##0)',
	81,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'$#,##0;[RED]($#,##0)',
	'$#,##0;[RED]($#,##0)',
	81,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'$#,##0.00;($#,##0.00)',
	'$#,##0.00;($#,##0.00)',
	81,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'$#,##0.00;[RED]($#,##0.00)',
	'$#,##0.00;[RED]($#,##0.00)',
	81,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'0%',
	'0%',
	81,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'0.00%',
	'0.00%',
	81,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'0.00E+00',
	'0.00E+00',
	81,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'm/d/yy',
	'm/d/yy',
	84,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'd-mmm-yy',
	'd-mmm-yy',
	84,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'd-mmm',
	'd-mmm',
	84,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'mmm-yy',
	'mmm-yy',
	84,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'h:mm AM/PM',
	'h:mm AM/PM',
	84,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'h:mm:ss AM/PM',
	'h:mm:ss AM/PM',
	84,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'h:mm:ss',
	'h:mm:ss',
	84,
	0)
;
INSERT INTO pbcatfmt VALUES (
	'm/d/yy h:mm',
	'm/d/yy h:mm',
	84,
	0)
;
commit
;

-- ============================================================ 
--   Load pbcattbl table                                        
-- ============================================================ 
DELETE FROM pbcattbl
WHERE pbt_tnam IN ('states', 'customer', 'fin_code', 'fin_data', 'employee',
		'department', 'product', 'sales_order_items', 'sales_order',
		'examples', 'examples_categories_list', 'messages',
		'security_apps', 'security_groupings', 'security_info',
		'security_template', 'security_users')
;
INSERT INTO pbcattbl VALUES (
	'messages',
	'',
	USER,
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	'')
;
INSERT INTO pbcattbl VALUES (
	'security_groupings',
	'',
	USER,
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	'')
;
INSERT INTO pbcattbl VALUES (
	'security_info',
	'',
	USER,
	-10,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-10,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-10,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	NULL)
;
INSERT INTO pbcattbl VALUES (
	'security_template',
	'',
	USER,
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	'')
;
INSERT INTO pbcattbl VALUES (
	'security_users',
	'',
	USER,
	-10,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-10,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-10,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	NULL)
;
INSERT INTO pbcattbl VALUES (
	'security_apps',
	'',
	USER,
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	'')
;
INSERT INTO pbcattbl VALUES (
	'states',
	'',
	USER,
	-9,
	400,
	'N',
	'N',
	0,
	34,
	'MS Sans Serif',
	-8,
	700,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-9,
	700,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	'The states table contains information about the states of the U.S. (plus the District of Columbia)')
;
INSERT INTO pbcattbl VALUES (
	'customer',
	'',
	USER,
	-9,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-8,
	700,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-9,
	700,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	'A list of customers')
;
INSERT INTO pbcattbl VALUES (
	'fin_code',
	'',
	USER,
	-9,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-8,
	700,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-9,
	700,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	'Financial Codes table')
;
INSERT INTO pbcattbl VALUES (
	'fin_data',
	'',
	USER,
	-9,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-8,
	700,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-9,
	700,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	'Financial data')
;
INSERT INTO pbcattbl VALUES (
	'department',
	'',
	USER,
	-9,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-8,
	700,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-9,
	700,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	'Contains all departments within the company')
;
INSERT INTO pbcattbl VALUES (
	'employee',
	'',
	USER,
	-9,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-8,
	700,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-9,
	700,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	'A list of all employees within the company')
;
INSERT INTO pbcattbl VALUES (
	'examples',
	'',
	USER,
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	0,
	0,
	'N',
	'N',
	0,
	0,
	'',
	'Used for the front-end to the PFC Code Examples')
;
INSERT INTO pbcattbl VALUES (
	'sales_order',
	'',
	USER,
	0,
	0,
	'N',
	'N',
	0,
	0,
	NULL,
	0,
	0,
	'N',
	'N',
	0,
	0,
	NULL,
	0,
	0,
	'N',
	'N',
	0,
	0,
	NULL,
	'Master sales orders table')
;
INSERT INTO pbcattbl VALUES (
	'product',
	'',
	USER,
	-8,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-8,
	700,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-8,
	700,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	'Products that are sold to customers')
;
INSERT INTO pbcattbl VALUES (
	'sales_order_items',
	'',
	USER,
	0,
	0,
	'N',
	'N',
	0,
	0,
	NULL,
	0,
	0,
	'N',
	'N',
	0,
	0,
	NULL,
	0,
	0,
	'N',
	'N',
	0,
	0,
	NULL,
	'Contains line items for sales orders')
;
INSERT INTO pbcattbl VALUES (
	'examples_categories_list',
	'',
	USER,
	-10,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-10,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-10,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	NULL)
;
INSERT INTO pbcattbl VALUES (
	'sales_regions',
	'',
	USER,
	-10,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-10,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	-10,
	400,
	'N',
	'N',
	0,
	34,
	'Tahoma',
	'')
;
commit
;


