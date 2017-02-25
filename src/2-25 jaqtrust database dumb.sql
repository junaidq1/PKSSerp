--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: access_useraccess; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE access_useraccess (
    id integer NOT NULL,
    access_level character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE access_useraccess OWNER TO pkss_admin;

--
-- Name: access_useraccess_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE access_useraccess_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE access_useraccess_id_seq OWNER TO pkss_admin;

--
-- Name: access_useraccess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE access_useraccess_id_seq OWNED BY access_useraccess.id;


--
-- Name: attendance_attendance; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE attendance_attendance (
    id integer NOT NULL,
    attendance_date date NOT NULL,
    datestamp date NOT NULL,
    status character varying(7) NOT NULL,
    notes character varying(100),
    student_id integer NOT NULL,
    datestamp_change timestamp with time zone NOT NULL
);


ALTER TABLE attendance_attendance OWNER TO pkss_admin;

--
-- Name: attendance_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE attendance_attendance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attendance_attendance_id_seq OWNER TO pkss_admin;

--
-- Name: attendance_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE attendance_attendance_id_seq OWNED BY attendance_attendance.id;


--
-- Name: attendance_attendancecalendar; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE attendance_attendancecalendar (
    id integer NOT NULL,
    first_day_of_month date NOT NULL,
    workdays_in_month integer NOT NULL,
    non_weekend_workdays_off integer,
    school_id integer NOT NULL
);


ALTER TABLE attendance_attendancecalendar OWNER TO pkss_admin;

--
-- Name: attendance_attendancecalendar_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE attendance_attendancecalendar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attendance_attendancecalendar_id_seq OWNER TO pkss_admin;

--
-- Name: attendance_attendancecalendar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE attendance_attendancecalendar_id_seq OWNED BY attendance_attendancecalendar.id;


--
-- Name: attendance_nonscheduledholidays; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE attendance_nonscheduledholidays (
    id integer NOT NULL,
    holiday_date date NOT NULL,
    reason_for_holiday text NOT NULL,
    school_id integer NOT NULL
);


ALTER TABLE attendance_nonscheduledholidays OWNER TO pkss_admin;

--
-- Name: attendance_nonscheduledholidays_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE attendance_nonscheduledholidays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attendance_nonscheduledholidays_id_seq OWNER TO pkss_admin;

--
-- Name: attendance_nonscheduledholidays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE attendance_nonscheduledholidays_id_seq OWNED BY attendance_nonscheduledholidays.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO pkss_admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO pkss_admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO pkss_admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO pkss_admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO pkss_admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO pkss_admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO pkss_admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO pkss_admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO pkss_admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO pkss_admin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO pkss_admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO pkss_admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: classes_class; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE classes_class (
    id integer NOT NULL,
    class_name character varying(255) NOT NULL,
    section character varying(255) NOT NULL,
    school_class_section character varying(255),
    teacher_id integer NOT NULL,
    school_id integer NOT NULL,
    shift character varying(255) NOT NULL
);


ALTER TABLE classes_class OWNER TO pkss_admin;

--
-- Name: classes_class_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE classes_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE classes_class_id_seq OWNER TO pkss_admin;

--
-- Name: classes_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE classes_class_id_seq OWNED BY classes_class.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO pkss_admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO pkss_admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO pkss_admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO pkss_admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO pkss_admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO pkss_admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO pkss_admin;

--
-- Name: donors_donor; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE donors_donor (
    id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    middle_name character varying(120),
    last_name character varying(255) NOT NULL,
    notes text,
    city character varying(120),
    country character varying(120),
    email character varying(120),
    address character varying(120),
    phone character varying(120),
    title character varying(120),
    organization character varying(120),
    flagged boolean NOT NULL,
    tier character varying(24),
    added timestamp with time zone NOT NULL,
    cycle character varying(12),
    last_donation_date date,
    next_expected_date date,
    regular_donor boolean NOT NULL,
    reg integer NOT NULL
);


ALTER TABLE donors_donor OWNER TO pkss_admin;

--
-- Name: donors_donor_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE donors_donor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE donors_donor_id_seq OWNER TO pkss_admin;

--
-- Name: donors_donor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE donors_donor_id_seq OWNED BY donors_donor.id;


--
-- Name: donors_donor_log; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE donors_donor_log (
    id integer NOT NULL,
    donation_date date NOT NULL,
    fiscal_year character varying(24) NOT NULL,
    currency character varying(10) NOT NULL,
    amount_local_currency integer NOT NULL,
    "conversion_rate_if_not_PKR" integer NOT NULL,
    amount_pkr integer,
    donation_notes text,
    contact_name_id integer NOT NULL
);


ALTER TABLE donors_donor_log OWNER TO pkss_admin;

--
-- Name: donors_donor_log_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE donors_donor_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE donors_donor_log_id_seq OWNER TO pkss_admin;

--
-- Name: donors_donor_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE donors_donor_log_id_seq OWNED BY donors_donor_log.id;


--
-- Name: schools_school; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE schools_school (
    id integer NOT NULL,
    school_name character varying(255) NOT NULL,
    school_address character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    date_opened date NOT NULL,
    school_notes text
);


ALTER TABLE schools_school OWNER TO pkss_admin;

--
-- Name: schools_school_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE schools_school_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schools_school_id_seq OWNER TO pkss_admin;

--
-- Name: schools_school_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE schools_school_id_seq OWNED BY schools_school.id;


--
-- Name: students_student; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE students_student (
    id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    gender character varying(12) NOT NULL,
    date_of_birth date NOT NULL,
    place_of_birth character varying(255),
    fathers_name character varying(255),
    mothers_name character varying(255),
    address_current character varying(255),
    address_origin character varying(255),
    contact_number character varying(255),
    emergency_contact_number character varying(255),
    date_joined date NOT NULL,
    enrollment_notes text,
    pkss_class_id integer NOT NULL,
    pkss_school_id integer NOT NULL,
    currently_enrolled boolean NOT NULL,
    date_left date,
    registration_number integer NOT NULL,
    reason_left character varying(30),
    updated_last date NOT NULL,
    updated_last_by character varying(255),
    fathers_occupation character varying(255),
    fee_percent_rate_fixed integer NOT NULL,
    mothers_occupation character varying(255),
    pkss_class_original_id integer NOT NULL
);


ALTER TABLE students_student OWNER TO pkss_admin;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE students_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE students_student_id_seq OWNER TO pkss_admin;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE students_student_id_seq OWNED BY students_student.id;


--
-- Name: students_studenthistory; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE students_studenthistory (
    id integer NOT NULL,
    date date NOT NULL,
    pkss_class character varying(255) NOT NULL,
    created date NOT NULL,
    student_name_id integer NOT NULL
);


ALTER TABLE students_studenthistory OWNER TO pkss_admin;

--
-- Name: students_studenthistory_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE students_studenthistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE students_studenthistory_id_seq OWNER TO pkss_admin;

--
-- Name: students_studenthistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE students_studenthistory_id_seq OWNED BY students_studenthistory.id;


--
-- Name: tattendance_teacherattendance; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE tattendance_teacherattendance (
    id integer NOT NULL,
    attendance_date date NOT NULL,
    datestamp date NOT NULL,
    status character varying(7) NOT NULL,
    notes character varying(150),
    att_taker character varying(120),
    teacher_id integer NOT NULL,
    school_id integer NOT NULL
);


ALTER TABLE tattendance_teacherattendance OWNER TO pkss_admin;

--
-- Name: tattendance_teacherattendance_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE tattendance_teacherattendance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tattendance_teacherattendance_id_seq OWNER TO pkss_admin;

--
-- Name: tattendance_teacherattendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE tattendance_teacherattendance_id_seq OWNED BY tattendance_teacherattendance.id;


--
-- Name: teachers_teacher; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE teachers_teacher (
    id integer NOT NULL,
    level character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    gender character varying(12) NOT NULL,
    date_joined date NOT NULL,
    starting_salary integer,
    current_salary integer,
    address character varying(200) NOT NULL,
    user_id integer,
    current_qualifications character varying(200) NOT NULL,
    phone_number character varying(15) NOT NULL,
    starting_qualifications character varying(200) NOT NULL,
    starting_years_experience integer
);


ALTER TABLE teachers_teacher OWNER TO pkss_admin;

--
-- Name: teachers_teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE teachers_teacher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teachers_teacher_id_seq OWNER TO pkss_admin;

--
-- Name: teachers_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE teachers_teacher_id_seq OWNED BY teachers_teacher.id;


--
-- Name: teachers_teacher_pkss_school; Type: TABLE; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE TABLE teachers_teacher_pkss_school (
    id integer NOT NULL,
    teacher_id integer NOT NULL,
    school_id integer NOT NULL
);


ALTER TABLE teachers_teacher_pkss_school OWNER TO pkss_admin;

--
-- Name: teachers_teacher_pkss_school_id_seq; Type: SEQUENCE; Schema: public; Owner: pkss_admin
--

CREATE SEQUENCE teachers_teacher_pkss_school_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teachers_teacher_pkss_school_id_seq OWNER TO pkss_admin;

--
-- Name: teachers_teacher_pkss_school_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pkss_admin
--

ALTER SEQUENCE teachers_teacher_pkss_school_id_seq OWNED BY teachers_teacher_pkss_school.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY access_useraccess ALTER COLUMN id SET DEFAULT nextval('access_useraccess_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY attendance_attendance ALTER COLUMN id SET DEFAULT nextval('attendance_attendance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY attendance_attendancecalendar ALTER COLUMN id SET DEFAULT nextval('attendance_attendancecalendar_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY attendance_nonscheduledholidays ALTER COLUMN id SET DEFAULT nextval('attendance_nonscheduledholidays_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY classes_class ALTER COLUMN id SET DEFAULT nextval('classes_class_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY donors_donor ALTER COLUMN id SET DEFAULT nextval('donors_donor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY donors_donor_log ALTER COLUMN id SET DEFAULT nextval('donors_donor_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY schools_school ALTER COLUMN id SET DEFAULT nextval('schools_school_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY students_student ALTER COLUMN id SET DEFAULT nextval('students_student_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY students_studenthistory ALTER COLUMN id SET DEFAULT nextval('students_studenthistory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY tattendance_teacherattendance ALTER COLUMN id SET DEFAULT nextval('tattendance_teacherattendance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY teachers_teacher ALTER COLUMN id SET DEFAULT nextval('teachers_teacher_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY teachers_teacher_pkss_school ALTER COLUMN id SET DEFAULT nextval('teachers_teacher_pkss_school_id_seq'::regclass);


--
-- Data for Name: access_useraccess; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO access_useraccess VALUES (1, 'super', '2017-02-10 00:06:39.800389+00', '2017-02-10 00:06:39.800434+00', 1);
INSERT INTO access_useraccess VALUES (2, 'staff', '2017-02-10 00:06:50.399163+00', '2017-02-10 00:06:50.399188+00', 3);
INSERT INTO access_useraccess VALUES (3, 'accountant', '2017-02-10 00:07:00.435867+00', '2017-02-10 00:07:00.435903+00', 2);


--
-- Name: access_useraccess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('access_useraccess_id_seq', 3, true);


--
-- Data for Name: attendance_attendance; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO attendance_attendance VALUES (1, '2017-01-15', '2017-01-15', 'present', '', 7, '2017-01-15 22:46:55.491248+00');
INSERT INTO attendance_attendance VALUES (2, '2017-01-15', '2017-01-15', 'present', '', 6, '2017-01-15 22:46:55.495984+00');
INSERT INTO attendance_attendance VALUES (3, '2017-01-15', '2017-01-15', 'present', '', 5, '2017-01-15 22:46:55.500166+00');
INSERT INTO attendance_attendance VALUES (4, '2017-01-15', '2017-01-15', 'present', '', 2, '2017-01-15 22:46:55.549441+00');
INSERT INTO attendance_attendance VALUES (5, '2017-01-15', '2017-01-15', 'present', '', 1, '2017-01-15 22:46:55.553806+00');
INSERT INTO attendance_attendance VALUES (6, '2017-01-15', '2017-01-15', 'present', '', 4, '2017-01-15 22:46:55.594059+00');
INSERT INTO attendance_attendance VALUES (7, '2017-01-15', '2017-01-15', 'absent', '', 3, '2017-01-15 22:46:55.597651+00');
INSERT INTO attendance_attendance VALUES (15, '2017-01-13', '2017-01-15', 'absent', '', 7, '2017-01-15 22:58:32.45927+00');
INSERT INTO attendance_attendance VALUES (16, '2017-01-13', '2017-01-15', 'present', '', 6, '2017-01-15 22:58:32.466499+00');
INSERT INTO attendance_attendance VALUES (17, '2017-01-13', '2017-01-15', 'absent', '', 5, '2017-01-15 22:58:32.471858+00');
INSERT INTO attendance_attendance VALUES (18, '2017-01-13', '2017-01-15', 'present', '', 2, '2017-01-15 22:58:32.51656+00');
INSERT INTO attendance_attendance VALUES (19, '2017-01-13', '2017-01-15', 'present', '', 1, '2017-01-15 22:58:32.520073+00');
INSERT INTO attendance_attendance VALUES (20, '2017-01-13', '2017-01-15', 'absent', '', 4, '2017-01-15 22:58:32.556259+00');
INSERT INTO attendance_attendance VALUES (21, '2017-01-13', '2017-01-15', 'present', '', 3, '2017-01-15 22:58:32.559683+00');
INSERT INTO attendance_attendance VALUES (8, '2017-01-14', '2017-01-15', 'present', '', 7, '2017-01-15 23:25:04.663665+00');
INSERT INTO attendance_attendance VALUES (9, '2017-01-14', '2017-01-15', 'present', '', 6, '2017-01-15 23:25:04.667759+00');
INSERT INTO attendance_attendance VALUES (10, '2017-01-14', '2017-01-15', 'absent', '', 5, '2017-01-15 23:25:04.671416+00');
INSERT INTO attendance_attendance VALUES (11, '2017-01-14', '2017-01-15', 'present', '', 2, '2017-01-15 23:25:04.724228+00');
INSERT INTO attendance_attendance VALUES (12, '2017-01-14', '2017-01-15', 'present', '', 1, '2017-01-15 23:25:04.728333+00');
INSERT INTO attendance_attendance VALUES (13, '2017-01-14', '2017-01-15', 'present', '', 4, '2017-01-15 23:25:04.777265+00');
INSERT INTO attendance_attendance VALUES (14, '2017-01-14', '2017-01-15', 'present', '', 3, '2017-01-15 23:25:04.781077+00');
INSERT INTO attendance_attendance VALUES (22, '2017-01-16', '2017-01-16', 'absent', '', 7, '2017-01-16 19:13:27.413811+00');
INSERT INTO attendance_attendance VALUES (23, '2017-01-16', '2017-01-16', 'absent', '', 6, '2017-01-16 19:13:27.532487+00');
INSERT INTO attendance_attendance VALUES (24, '2017-01-16', '2017-01-16', 'present', '', 5, '2017-01-16 19:13:27.564949+00');
INSERT INTO attendance_attendance VALUES (25, '2017-01-16', '2017-01-16', 'absent', '', 2, '2017-01-16 19:13:28.100226+00');
INSERT INTO attendance_attendance VALUES (26, '2017-01-16', '2017-01-16', 'absent', '', 1, '2017-01-16 19:13:28.152051+00');
INSERT INTO attendance_attendance VALUES (27, '2017-01-16', '2017-01-16', 'absent', '', 4, '2017-01-16 19:13:28.749763+00');
INSERT INTO attendance_attendance VALUES (28, '2017-01-16', '2017-01-16', 'absent', '', 3, '2017-01-16 19:13:28.787047+00');
INSERT INTO attendance_attendance VALUES (29, '2017-01-16', '2017-01-16', 'present', '', 10, '2017-01-16 21:55:39.570438+00');
INSERT INTO attendance_attendance VALUES (30, '2017-01-16', '2017-01-16', 'present', '', 9, '2017-01-16 21:55:39.618631+00');
INSERT INTO attendance_attendance VALUES (31, '2017-01-16', '2017-01-16', 'absent', '', 8, '2017-01-16 21:55:39.680914+00');
INSERT INTO attendance_attendance VALUES (32, '2017-01-16', '2017-01-16', 'present', '', 14, '2017-01-16 21:55:40.564303+00');
INSERT INTO attendance_attendance VALUES (33, '2017-01-16', '2017-01-16', 'absent', '', 13, '2017-01-16 21:55:40.629495+00');
INSERT INTO attendance_attendance VALUES (34, '2017-01-16', '2017-01-16', 'absent', '', 12, '2017-01-16 21:55:40.688672+00');
INSERT INTO attendance_attendance VALUES (35, '2017-01-16', '2017-01-16', 'absent', '', 11, '2017-01-16 21:55:40.801531+00');
INSERT INTO attendance_attendance VALUES (36, '2017-01-15', '2017-01-16', 'present', '', 10, '2017-01-16 21:56:17.792056+00');
INSERT INTO attendance_attendance VALUES (37, '2017-01-15', '2017-01-16', 'present', '', 9, '2017-01-16 21:56:17.878931+00');
INSERT INTO attendance_attendance VALUES (38, '2017-01-15', '2017-01-16', 'absent', '', 8, '2017-01-16 21:56:17.955489+00');
INSERT INTO attendance_attendance VALUES (39, '2017-01-15', '2017-01-16', 'present', '', 14, '2017-01-16 21:56:18.877643+00');
INSERT INTO attendance_attendance VALUES (40, '2017-01-15', '2017-01-16', 'present', '', 13, '2017-01-16 21:56:18.916017+00');
INSERT INTO attendance_attendance VALUES (41, '2017-01-15', '2017-01-16', 'present', '', 12, '2017-01-16 21:56:18.958832+00');
INSERT INTO attendance_attendance VALUES (42, '2017-01-15', '2017-01-16', 'absent', '', 11, '2017-01-16 21:56:19.003531+00');
INSERT INTO attendance_attendance VALUES (43, '2017-01-14', '2017-01-16', 'present', '', 10, '2017-01-16 21:56:52.655834+00');
INSERT INTO attendance_attendance VALUES (44, '2017-01-14', '2017-01-16', 'present', '', 9, '2017-01-16 21:56:52.687431+00');
INSERT INTO attendance_attendance VALUES (45, '2017-01-14', '2017-01-16', 'present', '', 8, '2017-01-16 21:56:52.72055+00');
INSERT INTO attendance_attendance VALUES (46, '2017-01-14', '2017-01-16', 'present', '', 14, '2017-01-16 21:56:53.323546+00');
INSERT INTO attendance_attendance VALUES (47, '2017-01-14', '2017-01-16', 'present', '', 13, '2017-01-16 21:56:53.394121+00');
INSERT INTO attendance_attendance VALUES (48, '2017-01-14', '2017-01-16', 'present', '', 12, '2017-01-16 21:56:53.438431+00');
INSERT INTO attendance_attendance VALUES (49, '2017-01-14', '2017-01-16', 'present', '', 11, '2017-01-16 21:56:53.483422+00');
INSERT INTO attendance_attendance VALUES (50, '2017-01-13', '2017-01-16', 'present', '', 10, '2017-01-16 21:57:37.630793+00');
INSERT INTO attendance_attendance VALUES (51, '2017-01-13', '2017-01-16', 'present', '', 9, '2017-01-16 21:57:37.69942+00');
INSERT INTO attendance_attendance VALUES (52, '2017-01-13', '2017-01-16', 'absent', '', 8, '2017-01-16 21:57:37.727916+00');
INSERT INTO attendance_attendance VALUES (53, '2017-01-13', '2017-01-16', 'present', '', 14, '2017-01-16 21:57:38.482349+00');
INSERT INTO attendance_attendance VALUES (54, '2017-01-13', '2017-01-16', 'absent', '', 13, '2017-01-16 21:57:38.53174+00');
INSERT INTO attendance_attendance VALUES (55, '2017-01-13', '2017-01-16', 'present', '', 12, '2017-01-16 21:57:38.58215+00');
INSERT INTO attendance_attendance VALUES (56, '2017-01-13', '2017-01-16', 'absent', '', 11, '2017-01-16 21:57:38.62823+00');
INSERT INTO attendance_attendance VALUES (57, '2017-01-12', '2017-01-16', 'present', '', 10, '2017-01-16 21:58:19.029368+00');
INSERT INTO attendance_attendance VALUES (58, '2017-01-12', '2017-01-16', 'present', '', 9, '2017-01-16 21:58:19.078978+00');
INSERT INTO attendance_attendance VALUES (59, '2017-01-12', '2017-01-16', 'absent', '', 8, '2017-01-16 21:58:19.110658+00');
INSERT INTO attendance_attendance VALUES (60, '2017-01-12', '2017-01-16', 'absent', '', 14, '2017-01-16 21:58:20.241161+00');
INSERT INTO attendance_attendance VALUES (61, '2017-01-12', '2017-01-16', 'present', '', 13, '2017-01-16 21:58:20.346179+00');
INSERT INTO attendance_attendance VALUES (62, '2017-01-12', '2017-01-16', 'present', '', 12, '2017-01-16 21:58:20.409982+00');
INSERT INTO attendance_attendance VALUES (63, '2017-01-12', '2017-01-16', 'present', '', 11, '2017-01-16 21:58:20.448817+00');
INSERT INTO attendance_attendance VALUES (64, '2016-12-14', '2017-01-16', 'present', '', 10, '2017-01-16 21:59:36.277909+00');
INSERT INTO attendance_attendance VALUES (65, '2016-12-14', '2017-01-16', 'present', '', 9, '2017-01-16 21:59:36.425279+00');
INSERT INTO attendance_attendance VALUES (66, '2016-12-14', '2017-01-16', 'present', '', 8, '2017-01-16 21:59:36.582534+00');
INSERT INTO attendance_attendance VALUES (67, '2016-12-14', '2017-01-16', 'absent', '', 14, '2017-01-16 21:59:37.386593+00');
INSERT INTO attendance_attendance VALUES (68, '2016-12-14', '2017-01-16', 'present', '', 13, '2017-01-16 21:59:37.467759+00');
INSERT INTO attendance_attendance VALUES (69, '2016-12-14', '2017-01-16', 'absent', '', 12, '2017-01-16 21:59:37.526013+00');
INSERT INTO attendance_attendance VALUES (70, '2016-12-14', '2017-01-16', 'present', '', 11, '2017-01-16 21:59:37.554833+00');
INSERT INTO attendance_attendance VALUES (71, '2016-12-10', '2017-01-16', 'present', '', 10, '2017-01-16 22:00:22.27342+00');
INSERT INTO attendance_attendance VALUES (72, '2016-12-10', '2017-01-16', 'absent', '', 9, '2017-01-16 22:00:22.349452+00');
INSERT INTO attendance_attendance VALUES (73, '2016-12-10', '2017-01-16', 'present', '', 8, '2017-01-16 22:00:22.387849+00');
INSERT INTO attendance_attendance VALUES (74, '2016-12-10', '2017-01-16', 'present', '', 14, '2017-01-16 22:00:23.403188+00');
INSERT INTO attendance_attendance VALUES (75, '2016-12-10', '2017-01-16', 'present', '', 13, '2017-01-16 22:00:23.481605+00');
INSERT INTO attendance_attendance VALUES (76, '2016-12-10', '2017-01-16', 'present', '', 12, '2017-01-16 22:00:23.549243+00');
INSERT INTO attendance_attendance VALUES (77, '2016-12-10', '2017-01-16', 'absent', '', 11, '2017-01-16 22:00:23.615691+00');
INSERT INTO attendance_attendance VALUES (78, '2016-12-08', '2017-01-16', 'present', '', 7, '2017-01-16 22:01:22.523425+00');
INSERT INTO attendance_attendance VALUES (79, '2016-12-08', '2017-01-16', 'absent', '', 6, '2017-01-16 22:01:22.586293+00');
INSERT INTO attendance_attendance VALUES (80, '2016-12-08', '2017-01-16', 'present', '', 5, '2017-01-16 22:01:22.603942+00');
INSERT INTO attendance_attendance VALUES (81, '2016-12-08', '2017-01-16', 'present', '', 2, '2017-01-16 22:01:23.339759+00');
INSERT INTO attendance_attendance VALUES (82, '2016-12-08', '2017-01-16', 'present', '', 1, '2017-01-16 22:01:23.422203+00');
INSERT INTO attendance_attendance VALUES (83, '2016-12-08', '2017-01-16', 'present', '', 4, '2017-01-16 22:01:23.946225+00');
INSERT INTO attendance_attendance VALUES (84, '2016-12-08', '2017-01-16', 'present', '', 3, '2017-01-16 22:01:24.010886+00');
INSERT INTO attendance_attendance VALUES (85, '2016-12-09', '2017-01-16', 'present', '', 7, '2017-01-16 22:02:35.002399+00');
INSERT INTO attendance_attendance VALUES (86, '2016-12-09', '2017-01-16', 'absent', '', 6, '2017-01-16 22:02:35.061818+00');
INSERT INTO attendance_attendance VALUES (87, '2016-12-09', '2017-01-16', 'present', '', 5, '2017-01-16 22:02:35.10974+00');
INSERT INTO attendance_attendance VALUES (88, '2016-12-09', '2017-01-16', 'absent', '', 2, '2017-01-16 22:02:35.688195+00');
INSERT INTO attendance_attendance VALUES (89, '2016-12-09', '2017-01-16', 'present', '', 1, '2017-01-16 22:02:35.779942+00');
INSERT INTO attendance_attendance VALUES (90, '2016-12-09', '2017-01-16', 'present', '', 4, '2017-01-16 22:02:36.457598+00');
INSERT INTO attendance_attendance VALUES (92, '2016-11-10', '2017-01-17', 'present', '', 7, '2017-01-17 22:40:58.564434+00');
INSERT INTO attendance_attendance VALUES (93, '2016-11-10', '2017-01-17', 'present', '', 6, '2017-01-17 22:40:58.57255+00');
INSERT INTO attendance_attendance VALUES (94, '2016-11-10', '2017-01-17', 'present', '', 5, '2017-01-17 22:40:58.578159+00');
INSERT INTO attendance_attendance VALUES (95, '2016-11-10', '2017-01-17', 'present', '', 2, '2017-01-17 22:40:58.631728+00');
INSERT INTO attendance_attendance VALUES (96, '2016-11-10', '2017-01-17', 'present', '', 1, '2017-01-17 22:40:58.635963+00');
INSERT INTO attendance_attendance VALUES (97, '2016-11-10', '2017-01-17', 'present', '', 4, '2017-01-17 22:40:58.711141+00');
INSERT INTO attendance_attendance VALUES (98, '2016-11-10', '2017-01-17', 'absent', '', 3, '2017-01-17 22:40:58.717435+00');
INSERT INTO attendance_attendance VALUES (99, '2016-11-11', '2017-01-17', 'present', '', 7, '2017-01-17 22:41:20.123796+00');
INSERT INTO attendance_attendance VALUES (100, '2016-11-11', '2017-01-17', 'absent', '', 6, '2017-01-17 22:41:20.138975+00');
INSERT INTO attendance_attendance VALUES (101, '2016-11-11', '2017-01-17', 'present', '', 5, '2017-01-17 22:41:20.145414+00');
INSERT INTO attendance_attendance VALUES (102, '2016-11-11', '2017-01-17', 'absent', '', 2, '2017-01-17 22:41:20.224151+00');
INSERT INTO attendance_attendance VALUES (103, '2016-11-11', '2017-01-17', 'present', '', 1, '2017-01-17 22:41:20.230529+00');
INSERT INTO attendance_attendance VALUES (104, '2016-11-11', '2017-01-17', 'present', '', 4, '2017-01-17 22:41:20.306473+00');
INSERT INTO attendance_attendance VALUES (105, '2016-11-11', '2017-01-17', 'present', '', 3, '2017-01-17 22:41:20.311389+00');
INSERT INTO attendance_attendance VALUES (106, '2016-11-12', '2017-01-17', 'absent', '', 7, '2017-01-17 22:41:35.576833+00');
INSERT INTO attendance_attendance VALUES (107, '2016-11-12', '2017-01-17', 'present', '', 6, '2017-01-17 22:41:35.58351+00');
INSERT INTO attendance_attendance VALUES (108, '2016-11-12', '2017-01-17', 'present', '', 5, '2017-01-17 22:41:35.587984+00');
INSERT INTO attendance_attendance VALUES (109, '2016-11-12', '2017-01-17', 'present', '', 2, '2017-01-17 22:41:35.648231+00');
INSERT INTO attendance_attendance VALUES (110, '2016-11-12', '2017-01-17', 'absent', '', 1, '2017-01-17 22:41:35.654618+00');
INSERT INTO attendance_attendance VALUES (111, '2016-11-12', '2017-01-17', 'present', '', 4, '2017-01-17 22:41:35.708344+00');
INSERT INTO attendance_attendance VALUES (112, '2016-11-12', '2017-01-17', 'present', '', 3, '2017-01-17 22:41:35.715073+00');
INSERT INTO attendance_attendance VALUES (113, '2016-11-09', '2017-01-17', 'present', '', 7, '2017-01-17 22:41:57.457327+00');
INSERT INTO attendance_attendance VALUES (114, '2016-11-09', '2017-01-17', 'present', '', 6, '2017-01-17 22:41:57.461438+00');
INSERT INTO attendance_attendance VALUES (115, '2016-11-09', '2017-01-17', 'present', '', 5, '2017-01-17 22:41:57.465153+00');
INSERT INTO attendance_attendance VALUES (116, '2016-11-09', '2017-01-17', 'absent', '', 2, '2017-01-17 22:41:57.504107+00');
INSERT INTO attendance_attendance VALUES (117, '2016-11-09', '2017-01-17', 'present', '', 1, '2017-01-17 22:41:57.508412+00');
INSERT INTO attendance_attendance VALUES (118, '2016-11-09', '2017-01-17', 'present', '', 4, '2017-01-17 22:41:57.562134+00');
INSERT INTO attendance_attendance VALUES (119, '2016-11-09', '2017-01-17', 'present', '', 3, '2017-01-17 22:41:57.568333+00');
INSERT INTO attendance_attendance VALUES (120, '2016-10-05', '2017-01-17', 'present', '', 7, '2017-01-17 22:42:33.049485+00');
INSERT INTO attendance_attendance VALUES (121, '2016-10-05', '2017-01-17', 'present', '', 6, '2017-01-17 22:42:33.056263+00');
INSERT INTO attendance_attendance VALUES (122, '2016-10-05', '2017-01-17', 'present', '', 5, '2017-01-17 22:42:33.062597+00');
INSERT INTO attendance_attendance VALUES (123, '2016-10-05', '2017-01-17', 'present', '', 2, '2017-01-17 22:42:33.123208+00');
INSERT INTO attendance_attendance VALUES (124, '2016-10-05', '2017-01-17', 'present', '', 1, '2017-01-17 22:42:33.127107+00');
INSERT INTO attendance_attendance VALUES (125, '2016-10-05', '2017-01-17', 'present', '', 4, '2017-01-17 22:42:33.164632+00');
INSERT INTO attendance_attendance VALUES (126, '2016-10-05', '2017-01-17', 'present', '', 3, '2017-01-17 22:42:33.16819+00');
INSERT INTO attendance_attendance VALUES (127, '2016-10-06', '2017-01-17', 'present', '', 7, '2017-01-17 22:42:57.629649+00');
INSERT INTO attendance_attendance VALUES (128, '2016-10-06', '2017-01-17', 'present', '', 6, '2017-01-17 22:42:57.633933+00');
INSERT INTO attendance_attendance VALUES (129, '2016-10-06', '2017-01-17', 'present', '', 5, '2017-01-17 22:42:57.637692+00');
INSERT INTO attendance_attendance VALUES (130, '2016-10-06', '2017-01-17', 'present', '', 2, '2017-01-17 22:42:57.676771+00');
INSERT INTO attendance_attendance VALUES (131, '2016-10-06', '2017-01-17', 'present', '', 1, '2017-01-17 22:42:57.68068+00');
INSERT INTO attendance_attendance VALUES (132, '2016-10-06', '2017-01-17', 'present', '', 4, '2017-01-17 22:42:57.718002+00');
INSERT INTO attendance_attendance VALUES (133, '2016-10-06', '2017-01-17', 'present', '', 3, '2017-01-17 22:42:57.721641+00');
INSERT INTO attendance_attendance VALUES (134, '2016-10-07', '2017-01-17', 'present', '', 7, '2017-01-17 22:43:37.105291+00');
INSERT INTO attendance_attendance VALUES (135, '2016-10-07', '2017-01-17', 'present', '', 6, '2017-01-17 22:43:37.109742+00');
INSERT INTO attendance_attendance VALUES (136, '2016-10-07', '2017-01-17', 'present', '', 5, '2017-01-17 22:43:37.114085+00');
INSERT INTO attendance_attendance VALUES (137, '2016-10-07', '2017-01-17', 'absent', '', 2, '2017-01-17 22:43:37.18908+00');
INSERT INTO attendance_attendance VALUES (138, '2016-10-07', '2017-01-17', 'present', '', 1, '2017-01-17 22:43:37.198248+00');
INSERT INTO attendance_attendance VALUES (139, '2016-10-07', '2017-01-17', 'present', '', 4, '2017-01-17 22:43:37.242504+00');
INSERT INTO attendance_attendance VALUES (140, '2016-10-07', '2017-01-17', 'present', '', 3, '2017-01-17 22:43:37.245895+00');
INSERT INTO attendance_attendance VALUES (141, '2016-09-18', '2017-01-17', 'present', '', 7, '2017-01-17 22:44:11.337636+00');
INSERT INTO attendance_attendance VALUES (142, '2016-09-18', '2017-01-17', 'present', '', 6, '2017-01-17 22:44:11.344429+00');
INSERT INTO attendance_attendance VALUES (143, '2016-09-18', '2017-01-17', 'present', '', 5, '2017-01-17 22:44:11.350632+00');
INSERT INTO attendance_attendance VALUES (144, '2016-09-18', '2017-01-17', 'present', '', 2, '2017-01-17 22:44:11.417172+00');
INSERT INTO attendance_attendance VALUES (145, '2016-09-18', '2017-01-17', 'present', '', 1, '2017-01-17 22:44:11.422942+00');
INSERT INTO attendance_attendance VALUES (146, '2016-09-18', '2017-01-17', 'present', '', 4, '2017-01-17 22:44:11.479595+00');
INSERT INTO attendance_attendance VALUES (147, '2016-09-18', '2017-01-17', 'present', '', 3, '2017-01-17 22:44:11.485618+00');
INSERT INTO attendance_attendance VALUES (148, '2016-09-19', '2017-01-17', 'present', '', 7, '2017-01-17 22:44:27.312512+00');
INSERT INTO attendance_attendance VALUES (149, '2016-09-19', '2017-01-17', 'present', '', 6, '2017-01-17 22:44:27.318931+00');
INSERT INTO attendance_attendance VALUES (150, '2016-09-19', '2017-01-17', 'absent', '', 5, '2017-01-17 22:44:27.32485+00');
INSERT INTO attendance_attendance VALUES (151, '2016-09-19', '2017-01-17', 'absent', '', 2, '2017-01-17 22:44:27.390665+00');
INSERT INTO attendance_attendance VALUES (152, '2016-09-19', '2017-01-17', 'present', '', 1, '2017-01-17 22:44:27.397176+00');
INSERT INTO attendance_attendance VALUES (153, '2016-09-19', '2017-01-17', 'present', '', 4, '2017-01-17 22:44:27.459775+00');
INSERT INTO attendance_attendance VALUES (154, '2016-09-19', '2017-01-17', 'absent', '', 3, '2017-01-17 22:44:27.466078+00');
INSERT INTO attendance_attendance VALUES (155, '2016-09-20', '2017-01-17', 'present', '', 7, '2017-01-17 22:44:45.589314+00');
INSERT INTO attendance_attendance VALUES (156, '2016-09-20', '2017-01-17', 'present', '', 6, '2017-01-17 22:44:45.598124+00');
INSERT INTO attendance_attendance VALUES (157, '2016-09-20', '2017-01-17', 'present', '', 5, '2017-01-17 22:44:45.604434+00');
INSERT INTO attendance_attendance VALUES (158, '2016-09-20', '2017-01-17', 'present', '', 2, '2017-01-17 22:44:45.667679+00');
INSERT INTO attendance_attendance VALUES (159, '2016-09-20', '2017-01-17', 'present', '', 1, '2017-01-17 22:44:45.674164+00');
INSERT INTO attendance_attendance VALUES (160, '2016-09-20', '2017-01-17', 'absent', '', 4, '2017-01-17 22:44:45.746114+00');
INSERT INTO attendance_attendance VALUES (161, '2016-09-20', '2017-01-17', 'present', '', 3, '2017-01-17 22:44:45.753161+00');
INSERT INTO attendance_attendance VALUES (169, '2017-01-12', '2017-01-17', 'present', '', 7, '2017-01-17 22:49:52.84082+00');
INSERT INTO attendance_attendance VALUES (170, '2017-01-12', '2017-01-17', 'present', '', 6, '2017-01-17 22:49:52.845135+00');
INSERT INTO attendance_attendance VALUES (171, '2017-01-12', '2017-01-17', 'present', '', 5, '2017-01-17 22:49:52.848887+00');
INSERT INTO attendance_attendance VALUES (172, '2017-01-12', '2017-01-17', 'present', '', 2, '2017-01-17 22:49:52.892207+00');
INSERT INTO attendance_attendance VALUES (173, '2017-01-12', '2017-01-17', 'present', '', 1, '2017-01-17 22:49:52.897011+00');
INSERT INTO attendance_attendance VALUES (174, '2017-01-12', '2017-01-17', 'present', '', 4, '2017-01-17 22:49:52.945149+00');
INSERT INTO attendance_attendance VALUES (175, '2017-01-12', '2017-01-17', 'present', '', 3, '2017-01-17 22:49:52.95045+00');
INSERT INTO attendance_attendance VALUES (176, '2017-01-17', '2017-01-17', 'present', '', 16, '2017-01-17 23:59:52.176452+00');
INSERT INTO attendance_attendance VALUES (177, '2017-01-17', '2017-01-17', 'absent', '', 15, '2017-01-17 23:59:52.181243+00');
INSERT INTO attendance_attendance VALUES (178, '2017-01-17', '2017-01-17', 'present', '', 19, '2017-01-17 23:59:52.235351+00');
INSERT INTO attendance_attendance VALUES (179, '2017-01-17', '2017-01-17', 'present', '', 18, '2017-01-17 23:59:52.239343+00');
INSERT INTO attendance_attendance VALUES (180, '2017-01-17', '2017-01-17', 'present', '', 17, '2017-01-17 23:59:52.242988+00');
INSERT INTO attendance_attendance VALUES (181, '2017-01-17', '2017-01-17', 'present', '', 22, '2017-01-17 23:59:52.306284+00');
INSERT INTO attendance_attendance VALUES (182, '2017-01-17', '2017-01-17', 'present', '', 21, '2017-01-17 23:59:52.310284+00');
INSERT INTO attendance_attendance VALUES (183, '2017-01-17', '2017-01-17', 'present', '', 20, '2017-01-17 23:59:52.314791+00');
INSERT INTO attendance_attendance VALUES (184, '2017-01-16', '2017-01-17', 'present', '', 16, '2017-01-18 00:00:12.142072+00');
INSERT INTO attendance_attendance VALUES (185, '2017-01-16', '2017-01-17', 'absent', '', 15, '2017-01-18 00:00:12.152944+00');
INSERT INTO attendance_attendance VALUES (186, '2017-01-16', '2017-01-17', 'present', '', 19, '2017-01-18 00:00:12.31728+00');
INSERT INTO attendance_attendance VALUES (187, '2017-01-16', '2017-01-17', 'present', '', 18, '2017-01-18 00:00:12.328909+00');
INSERT INTO attendance_attendance VALUES (188, '2017-01-16', '2017-01-17', 'present', '', 17, '2017-01-18 00:00:12.343345+00');
INSERT INTO attendance_attendance VALUES (189, '2017-01-16', '2017-01-17', 'present', '', 22, '2017-01-18 00:00:12.459705+00');
INSERT INTO attendance_attendance VALUES (190, '2017-01-16', '2017-01-17', 'absent', '', 21, '2017-01-18 00:00:12.467935+00');
INSERT INTO attendance_attendance VALUES (191, '2017-01-16', '2017-01-17', 'present', '', 20, '2017-01-18 00:00:12.474507+00');
INSERT INTO attendance_attendance VALUES (192, '2017-01-15', '2017-01-17', 'present', '', 16, '2017-01-18 00:00:29.869208+00');
INSERT INTO attendance_attendance VALUES (193, '2017-01-15', '2017-01-17', 'present', '', 15, '2017-01-18 00:00:29.8757+00');
INSERT INTO attendance_attendance VALUES (194, '2017-01-15', '2017-01-17', 'present', '', 19, '2017-01-18 00:00:29.968488+00');
INSERT INTO attendance_attendance VALUES (195, '2017-01-15', '2017-01-17', 'present', '', 18, '2017-01-18 00:00:29.973719+00');
INSERT INTO attendance_attendance VALUES (196, '2017-01-15', '2017-01-17', 'present', '', 17, '2017-01-18 00:00:29.979501+00');
INSERT INTO attendance_attendance VALUES (197, '2017-01-15', '2017-01-17', 'present', '', 22, '2017-01-18 00:00:30.045197+00');
INSERT INTO attendance_attendance VALUES (198, '2017-01-15', '2017-01-17', 'present', '', 21, '2017-01-18 00:00:30.049337+00');
INSERT INTO attendance_attendance VALUES (199, '2017-01-15', '2017-01-17', 'absent', '', 20, '2017-01-18 00:00:30.053251+00');
INSERT INTO attendance_attendance VALUES (200, '2017-01-14', '2017-01-17', 'absent', '', 16, '2017-01-18 00:00:51.324817+00');
INSERT INTO attendance_attendance VALUES (201, '2017-01-14', '2017-01-17', 'present', '', 15, '2017-01-18 00:00:51.328901+00');
INSERT INTO attendance_attendance VALUES (202, '2017-01-14', '2017-01-17', 'absent', '', 19, '2017-01-18 00:00:51.388245+00');
INSERT INTO attendance_attendance VALUES (203, '2017-01-14', '2017-01-17', 'present', '', 18, '2017-01-18 00:00:51.391908+00');
INSERT INTO attendance_attendance VALUES (204, '2017-01-14', '2017-01-17', 'present', '', 17, '2017-01-18 00:00:51.395499+00');
INSERT INTO attendance_attendance VALUES (205, '2017-01-14', '2017-01-17', 'present', '', 22, '2017-01-18 00:00:51.444808+00');
INSERT INTO attendance_attendance VALUES (206, '2017-01-14', '2017-01-17', 'present', '', 21, '2017-01-18 00:00:51.448858+00');
INSERT INTO attendance_attendance VALUES (207, '2017-01-14', '2017-01-17', 'present', '', 20, '2017-01-18 00:00:51.452559+00');
INSERT INTO attendance_attendance VALUES (208, '2017-01-12', '2017-01-17', 'absent', '', 16, '2017-01-18 00:01:12.684768+00');
INSERT INTO attendance_attendance VALUES (209, '2017-01-12', '2017-01-17', 'present', '', 15, '2017-01-18 00:01:12.6889+00');
INSERT INTO attendance_attendance VALUES (210, '2017-01-12', '2017-01-17', 'present', '', 19, '2017-01-18 00:01:12.740289+00');
INSERT INTO attendance_attendance VALUES (211, '2017-01-12', '2017-01-17', 'present', '', 18, '2017-01-18 00:01:12.743968+00');
INSERT INTO attendance_attendance VALUES (212, '2017-01-12', '2017-01-17', 'present', '', 17, '2017-01-18 00:01:12.74755+00');
INSERT INTO attendance_attendance VALUES (213, '2017-01-12', '2017-01-17', 'present', '', 22, '2017-01-18 00:01:12.800316+00');
INSERT INTO attendance_attendance VALUES (214, '2017-01-12', '2017-01-17', 'present', '', 21, '2017-01-18 00:01:12.804788+00');
INSERT INTO attendance_attendance VALUES (215, '2017-01-12', '2017-01-17', 'present', '', 20, '2017-01-18 00:01:12.808537+00');
INSERT INTO attendance_attendance VALUES (216, '2016-12-05', '2017-01-17', 'absent', '', 16, '2017-01-18 00:02:27.484341+00');
INSERT INTO attendance_attendance VALUES (217, '2016-12-05', '2017-01-17', 'present', '', 15, '2017-01-18 00:02:27.491977+00');
INSERT INTO attendance_attendance VALUES (218, '2016-12-05', '2017-01-17', 'present', '', 19, '2017-01-18 00:02:27.629242+00');
INSERT INTO attendance_attendance VALUES (219, '2016-12-05', '2017-01-17', 'present', '', 18, '2017-01-18 00:02:27.632909+00');
INSERT INTO attendance_attendance VALUES (220, '2016-12-05', '2017-01-17', 'absent', '', 17, '2017-01-18 00:02:27.637021+00');
INSERT INTO attendance_attendance VALUES (221, '2016-12-05', '2017-01-17', 'present', '', 22, '2017-01-18 00:02:27.725472+00');
INSERT INTO attendance_attendance VALUES (222, '2016-12-05', '2017-01-17', 'present', '', 21, '2017-01-18 00:02:27.729295+00');
INSERT INTO attendance_attendance VALUES (223, '2016-12-05', '2017-01-17', 'present', '', 20, '2017-01-18 00:02:27.732731+00');
INSERT INTO attendance_attendance VALUES (224, '2016-12-06', '2017-01-17', 'present', '', 16, '2017-01-18 00:02:44.295841+00');
INSERT INTO attendance_attendance VALUES (225, '2016-12-06', '2017-01-17', 'absent', '', 15, '2017-01-18 00:02:44.301601+00');
INSERT INTO attendance_attendance VALUES (226, '2016-12-06', '2017-01-17', 'present', '', 19, '2017-01-18 00:02:44.385119+00');
INSERT INTO attendance_attendance VALUES (227, '2016-12-06', '2017-01-17', 'present', '', 18, '2017-01-18 00:02:44.392381+00');
INSERT INTO attendance_attendance VALUES (228, '2016-12-06', '2017-01-17', 'absent', '', 17, '2017-01-18 00:02:44.398785+00');
INSERT INTO attendance_attendance VALUES (229, '2016-12-06', '2017-01-17', 'present', '', 22, '2017-01-18 00:02:44.493111+00');
INSERT INTO attendance_attendance VALUES (230, '2016-12-06', '2017-01-17', 'present', '', 21, '2017-01-18 00:02:44.499875+00');
INSERT INTO attendance_attendance VALUES (231, '2016-12-06', '2017-01-17', 'absent', '', 20, '2017-01-18 00:02:44.506095+00');
INSERT INTO attendance_attendance VALUES (232, '2016-12-07', '2017-01-17', 'absent', '', 16, '2017-01-18 00:03:04.58712+00');
INSERT INTO attendance_attendance VALUES (233, '2016-12-07', '2017-01-17', 'present', '', 15, '2017-01-18 00:03:04.593406+00');
INSERT INTO attendance_attendance VALUES (234, '2016-12-07', '2017-01-17', 'present', '', 19, '2017-01-18 00:03:04.712253+00');
INSERT INTO attendance_attendance VALUES (235, '2016-12-07', '2017-01-17', 'present', '', 18, '2017-01-18 00:03:04.719628+00');
INSERT INTO attendance_attendance VALUES (236, '2016-12-07', '2017-01-17', 'absent', '', 17, '2017-01-18 00:03:04.726237+00');
INSERT INTO attendance_attendance VALUES (237, '2016-12-07', '2017-01-17', 'present', '', 22, '2017-01-18 00:03:04.816075+00');
INSERT INTO attendance_attendance VALUES (238, '2016-12-07', '2017-01-17', 'present', '', 21, '2017-01-18 00:03:04.822423+00');
INSERT INTO attendance_attendance VALUES (239, '2016-12-07', '2017-01-17', 'present', '', 20, '2017-01-18 00:03:04.828647+00');
INSERT INTO attendance_attendance VALUES (240, '2016-11-04', '2017-01-17', 'present', '', 16, '2017-01-18 00:03:38.82173+00');
INSERT INTO attendance_attendance VALUES (241, '2016-11-04', '2017-01-17', 'present', '', 15, '2017-01-18 00:03:38.825746+00');
INSERT INTO attendance_attendance VALUES (242, '2016-11-04', '2017-01-17', 'absent', '', 19, '2017-01-18 00:03:38.898163+00');
INSERT INTO attendance_attendance VALUES (243, '2016-11-04', '2017-01-17', 'present', '', 18, '2017-01-18 00:03:38.904335+00');
INSERT INTO attendance_attendance VALUES (244, '2016-11-04', '2017-01-17', 'absent', '', 17, '2017-01-18 00:03:38.910363+00');
INSERT INTO attendance_attendance VALUES (245, '2016-11-04', '2017-01-17', 'present', '', 22, '2017-01-18 00:03:38.980224+00');
INSERT INTO attendance_attendance VALUES (163, '2017-01-17', '2017-01-17', 'present', '', 6, '2017-01-18 03:31:39.654927+00');
INSERT INTO attendance_attendance VALUES (164, '2017-01-17', '2017-01-17', 'present', '', 5, '2017-01-18 03:31:39.659747+00');
INSERT INTO attendance_attendance VALUES (165, '2017-01-17', '2017-01-17', 'present', '', 2, '2017-01-18 03:31:39.747917+00');
INSERT INTO attendance_attendance VALUES (246, '2016-11-04', '2017-01-17', 'present', '', 21, '2017-01-18 00:03:38.983719+00');
INSERT INTO attendance_attendance VALUES (247, '2016-11-04', '2017-01-17', 'present', '', 20, '2017-01-18 00:03:38.987304+00');
INSERT INTO attendance_attendance VALUES (248, '2016-11-05', '2017-01-17', 'present', '', 16, '2017-01-18 00:04:02.934557+00');
INSERT INTO attendance_attendance VALUES (249, '2016-11-05', '2017-01-17', 'present', '', 15, '2017-01-18 00:04:02.940615+00');
INSERT INTO attendance_attendance VALUES (250, '2016-11-05', '2017-01-17', 'present', '', 19, '2017-01-18 00:04:03.06226+00');
INSERT INTO attendance_attendance VALUES (251, '2016-11-05', '2017-01-17', 'present', '', 18, '2017-01-18 00:04:03.081709+00');
INSERT INTO attendance_attendance VALUES (252, '2016-11-05', '2017-01-17', 'present', '', 17, '2017-01-18 00:04:03.088015+00');
INSERT INTO attendance_attendance VALUES (253, '2016-11-05', '2017-01-17', 'present', '', 22, '2017-01-18 00:04:03.21949+00');
INSERT INTO attendance_attendance VALUES (254, '2016-11-05', '2017-01-17', 'present', '', 21, '2017-01-18 00:04:03.22678+00');
INSERT INTO attendance_attendance VALUES (255, '2016-11-05', '2017-01-17', 'present', '', 20, '2017-01-18 00:04:03.23305+00');
INSERT INTO attendance_attendance VALUES (256, '2016-11-06', '2017-01-17', 'absent', '', 16, '2017-01-18 00:04:29.034033+00');
INSERT INTO attendance_attendance VALUES (257, '2016-11-06', '2017-01-17', 'present', '', 15, '2017-01-18 00:04:29.037946+00');
INSERT INTO attendance_attendance VALUES (258, '2016-11-06', '2017-01-17', 'present', '', 19, '2017-01-18 00:04:29.091348+00');
INSERT INTO attendance_attendance VALUES (259, '2016-11-06', '2017-01-17', 'present', '', 18, '2017-01-18 00:04:29.095952+00');
INSERT INTO attendance_attendance VALUES (260, '2016-11-06', '2017-01-17', 'present', '', 17, '2017-01-18 00:04:29.100727+00');
INSERT INTO attendance_attendance VALUES (261, '2016-11-06', '2017-01-17', 'present', '', 22, '2017-01-18 00:04:29.156919+00');
INSERT INTO attendance_attendance VALUES (262, '2016-11-06', '2017-01-17', 'present', '', 21, '2017-01-18 00:04:29.160939+00');
INSERT INTO attendance_attendance VALUES (263, '2016-11-06', '2017-01-17', 'present', '', 20, '2017-01-18 00:04:29.166713+00');
INSERT INTO attendance_attendance VALUES (264, '2016-06-01', '2017-01-17', 'present', '', 16, '2017-01-18 00:04:52.976363+00');
INSERT INTO attendance_attendance VALUES (265, '2016-06-01', '2017-01-17', 'present', '', 15, '2017-01-18 00:04:52.981604+00');
INSERT INTO attendance_attendance VALUES (266, '2016-06-01', '2017-01-17', 'present', '', 19, '2017-01-18 00:04:53.034444+00');
INSERT INTO attendance_attendance VALUES (267, '2016-06-01', '2017-01-17', 'present', '', 18, '2017-01-18 00:04:53.038156+00');
INSERT INTO attendance_attendance VALUES (268, '2016-06-01', '2017-01-17', 'present', '', 17, '2017-01-18 00:04:53.041744+00');
INSERT INTO attendance_attendance VALUES (269, '2016-06-01', '2017-01-17', 'present', '', 22, '2017-01-18 00:04:53.092148+00');
INSERT INTO attendance_attendance VALUES (270, '2016-06-01', '2017-01-17', 'present', '', 21, '2017-01-18 00:04:53.095879+00');
INSERT INTO attendance_attendance VALUES (271, '2016-06-01', '2017-01-17', 'present', '', 20, '2017-01-18 00:04:53.099419+00');
INSERT INTO attendance_attendance VALUES (272, '2016-06-02', '2017-01-17', 'present', '', 16, '2017-01-18 00:05:14.280769+00');
INSERT INTO attendance_attendance VALUES (273, '2016-06-02', '2017-01-17', 'absent', '', 15, '2017-01-18 00:05:14.285755+00');
INSERT INTO attendance_attendance VALUES (274, '2016-06-02', '2017-01-17', 'present', '', 19, '2017-01-18 00:05:14.3671+00');
INSERT INTO attendance_attendance VALUES (275, '2016-06-02', '2017-01-17', 'absent', '', 18, '2017-01-18 00:05:14.373213+00');
INSERT INTO attendance_attendance VALUES (276, '2016-06-02', '2017-01-17', 'present', '', 17, '2017-01-18 00:05:14.380389+00');
INSERT INTO attendance_attendance VALUES (277, '2016-06-02', '2017-01-17', 'present', '', 22, '2017-01-18 00:05:14.448373+00');
INSERT INTO attendance_attendance VALUES (278, '2016-06-02', '2017-01-17', 'present', '', 21, '2017-01-18 00:05:14.45214+00');
INSERT INTO attendance_attendance VALUES (279, '2016-06-02', '2017-01-17', 'present', '', 20, '2017-01-18 00:05:14.455644+00');
INSERT INTO attendance_attendance VALUES (280, '2016-06-03', '2017-01-17', 'present', '', 16, '2017-01-18 00:05:32.526995+00');
INSERT INTO attendance_attendance VALUES (281, '2016-06-03', '2017-01-17', 'absent', '', 15, '2017-01-18 00:05:32.533363+00');
INSERT INTO attendance_attendance VALUES (282, '2016-06-03', '2017-01-17', 'present', '', 19, '2017-01-18 00:05:32.603327+00');
INSERT INTO attendance_attendance VALUES (283, '2016-06-03', '2017-01-17', 'present', '', 18, '2017-01-18 00:05:32.609675+00');
INSERT INTO attendance_attendance VALUES (284, '2016-06-03', '2017-01-17', 'present', '', 17, '2017-01-18 00:05:32.616335+00');
INSERT INTO attendance_attendance VALUES (285, '2016-06-03', '2017-01-17', 'present', '', 22, '2017-01-18 00:05:32.705115+00');
INSERT INTO attendance_attendance VALUES (286, '2016-06-03', '2017-01-17', 'absent', '', 21, '2017-01-18 00:05:32.711544+00');
INSERT INTO attendance_attendance VALUES (287, '2016-06-03', '2017-01-17', 'present', '', 20, '2017-01-18 00:05:32.717934+00');
INSERT INTO attendance_attendance VALUES (288, '2017-01-17', '2017-01-17', 'absent', '', 29, '2017-01-18 02:26:45.735825+00');
INSERT INTO attendance_attendance VALUES (289, '2017-01-17', '2017-01-17', 'present', '', 28, '2017-01-18 02:26:45.747087+00');
INSERT INTO attendance_attendance VALUES (290, '2017-01-17', '2017-01-17', 'present', '', 27, '2017-01-18 02:26:45.787128+00');
INSERT INTO attendance_attendance VALUES (291, '2017-01-17', '2017-01-17', 'absent', '', 26, '2017-01-18 02:26:45.791388+00');
INSERT INTO attendance_attendance VALUES (292, '2017-01-17', '2017-01-17', 'present', '', 30, '2017-01-18 02:26:45.858188+00');
INSERT INTO attendance_attendance VALUES (293, '2017-01-17', '2017-01-17', 'present', '', 25, '2017-01-18 02:26:45.861782+00');
INSERT INTO attendance_attendance VALUES (294, '2017-01-17', '2017-01-17', 'present', '', 24, '2017-01-18 02:26:45.865482+00');
INSERT INTO attendance_attendance VALUES (295, '2017-01-17', '2017-01-17', 'present', '', 23, '2017-01-18 02:26:45.871165+00');
INSERT INTO attendance_attendance VALUES (296, '2017-01-16', '2017-01-17', 'present', '', 29, '2017-01-18 02:27:06.436908+00');
INSERT INTO attendance_attendance VALUES (297, '2017-01-16', '2017-01-17', 'absent', '', 28, '2017-01-18 02:27:06.44355+00');
INSERT INTO attendance_attendance VALUES (298, '2017-01-16', '2017-01-17', 'present', '', 27, '2017-01-18 02:27:06.496002+00');
INSERT INTO attendance_attendance VALUES (299, '2017-01-16', '2017-01-17', 'absent', '', 26, '2017-01-18 02:27:06.499693+00');
INSERT INTO attendance_attendance VALUES (300, '2017-01-16', '2017-01-17', 'present', '', 30, '2017-01-18 02:27:06.598436+00');
INSERT INTO attendance_attendance VALUES (301, '2017-01-16', '2017-01-17', 'present', '', 25, '2017-01-18 02:27:06.604726+00');
INSERT INTO attendance_attendance VALUES (302, '2017-01-16', '2017-01-17', 'absent', '', 24, '2017-01-18 02:27:06.612282+00');
INSERT INTO attendance_attendance VALUES (303, '2017-01-16', '2017-01-17', 'absent', '', 23, '2017-01-18 02:27:06.617994+00');
INSERT INTO attendance_attendance VALUES (304, '2017-01-15', '2017-01-17', 'present', '', 29, '2017-01-18 02:27:21.009921+00');
INSERT INTO attendance_attendance VALUES (305, '2017-01-15', '2017-01-17', 'absent', '', 28, '2017-01-18 02:27:21.013543+00');
INSERT INTO attendance_attendance VALUES (306, '2017-01-15', '2017-01-17', 'present', '', 27, '2017-01-18 02:27:21.047226+00');
INSERT INTO attendance_attendance VALUES (307, '2017-01-15', '2017-01-17', 'absent', '', 26, '2017-01-18 02:27:21.050758+00');
INSERT INTO attendance_attendance VALUES (308, '2017-01-15', '2017-01-17', 'present', '', 30, '2017-01-18 02:27:21.117555+00');
INSERT INTO attendance_attendance VALUES (309, '2017-01-15', '2017-01-17', 'present', '', 25, '2017-01-18 02:27:21.121165+00');
INSERT INTO attendance_attendance VALUES (310, '2017-01-15', '2017-01-17', 'present', '', 24, '2017-01-18 02:27:21.125656+00');
INSERT INTO attendance_attendance VALUES (311, '2017-01-15', '2017-01-17', 'present', '', 23, '2017-01-18 02:27:21.130012+00');
INSERT INTO attendance_attendance VALUES (312, '2017-01-05', '2017-01-17', 'present', '', 7, '2017-01-18 02:28:58.033672+00');
INSERT INTO attendance_attendance VALUES (313, '2017-01-05', '2017-01-17', 'present', '', 6, '2017-01-18 02:28:58.037686+00');
INSERT INTO attendance_attendance VALUES (314, '2017-01-05', '2017-01-17', 'present', '', 5, '2017-01-18 02:28:58.040959+00');
INSERT INTO attendance_attendance VALUES (315, '2017-01-05', '2017-01-17', 'present', '', 2, '2017-01-18 02:28:58.079666+00');
INSERT INTO attendance_attendance VALUES (316, '2017-01-05', '2017-01-17', 'present', '', 1, '2017-01-18 02:28:58.085394+00');
INSERT INTO attendance_attendance VALUES (317, '2017-01-05', '2017-01-17', 'present', '', 4, '2017-01-18 02:28:58.131729+00');
INSERT INTO attendance_attendance VALUES (318, '2017-01-05', '2017-01-17', 'present', '', 3, '2017-01-18 02:28:58.135884+00');
INSERT INTO attendance_attendance VALUES (162, '2017-01-17', '2017-01-17', 'present', '', 7, '2017-01-18 03:31:39.648405+00');
INSERT INTO attendance_attendance VALUES (319, '2017-01-17', '2017-01-17', 'present', '', 31, '2017-01-18 03:31:39.668168+00');
INSERT INTO attendance_attendance VALUES (166, '2017-01-17', '2017-01-17', 'present', '', 1, '2017-01-18 03:31:39.751748+00');
INSERT INTO attendance_attendance VALUES (167, '2017-01-17', '2017-01-17', 'present', '', 4, '2017-01-18 03:31:39.804062+00');
INSERT INTO attendance_attendance VALUES (168, '2017-01-17', '2017-01-17', 'present', '', 3, '2017-01-18 03:31:39.808039+00');
INSERT INTO attendance_attendance VALUES (320, '2017-01-20', '2017-01-20', 'absent', '', 23, '2017-01-20 18:40:54.517775+00');
INSERT INTO attendance_attendance VALUES (321, '2017-01-20', '2017-01-20', 'absent', '', 24, '2017-01-20 18:40:54.524911+00');
INSERT INTO attendance_attendance VALUES (322, '2017-01-20', '2017-01-20', 'present', '', 25, '2017-01-20 18:40:54.53027+00');
INSERT INTO attendance_attendance VALUES (323, '2017-01-20', '2017-01-20', 'absent', '', 30, '2017-01-20 18:40:54.536264+00');
INSERT INTO attendance_attendance VALUES (324, '2017-01-20', '2017-01-20', 'present', '', 26, '2017-01-20 18:40:54.613004+00');
INSERT INTO attendance_attendance VALUES (325, '2017-01-20', '2017-01-20', 'absent', '', 27, '2017-01-20 18:40:54.619299+00');
INSERT INTO attendance_attendance VALUES (326, '2017-01-20', '2017-01-20', 'present', '', 28, '2017-01-20 18:40:54.699462+00');
INSERT INTO attendance_attendance VALUES (327, '2017-01-20', '2017-01-20', 'absent', '', 29, '2017-01-20 18:40:54.706334+00');
INSERT INTO attendance_attendance VALUES (328, '2017-01-21', '2017-01-22', 'present', '', 1, '2017-01-22 09:15:26.970588+00');
INSERT INTO attendance_attendance VALUES (329, '2017-01-21', '2017-01-22', 'present', '', 2, '2017-01-22 09:15:26.977029+00');
INSERT INTO attendance_attendance VALUES (330, '2017-01-21', '2017-01-22', 'absent', '', 3, '2017-01-22 09:15:27.048297+00');
INSERT INTO attendance_attendance VALUES (331, '2017-01-21', '2017-01-22', 'present', '', 4, '2017-01-22 09:15:27.053167+00');
INSERT INTO attendance_attendance VALUES (332, '2017-01-21', '2017-01-22', 'present', '', 5, '2017-01-22 09:15:27.169567+00');
INSERT INTO attendance_attendance VALUES (333, '2017-01-21', '2017-01-22', 'present', '', 6, '2017-01-22 09:15:27.174498+00');
INSERT INTO attendance_attendance VALUES (334, '2017-01-21', '2017-01-22', 'absent', '', 7, '2017-01-22 09:15:27.179913+00');
INSERT INTO attendance_attendance VALUES (335, '2017-01-21', '2017-01-22', 'absent', '', 31, '2017-01-22 09:15:27.185317+00');
INSERT INTO attendance_attendance VALUES (336, '2017-01-20', '2017-01-22', 'present', '', 1, '2017-01-22 09:15:44.742838+00');
INSERT INTO attendance_attendance VALUES (337, '2017-01-20', '2017-01-22', 'present', '', 2, '2017-01-22 09:15:44.757024+00');
INSERT INTO attendance_attendance VALUES (338, '2017-01-20', '2017-01-22', 'present', '', 3, '2017-01-22 09:15:44.842023+00');
INSERT INTO attendance_attendance VALUES (339, '2017-01-20', '2017-01-22', 'present', '', 4, '2017-01-22 09:15:44.850147+00');
INSERT INTO attendance_attendance VALUES (340, '2017-01-20', '2017-01-22', 'present', '', 5, '2017-01-22 09:15:44.993177+00');
INSERT INTO attendance_attendance VALUES (341, '2017-01-20', '2017-01-22', 'present', '', 6, '2017-01-22 09:15:45.001414+00');
INSERT INTO attendance_attendance VALUES (342, '2017-01-20', '2017-01-22', 'present', '', 7, '2017-01-22 09:15:45.01047+00');
INSERT INTO attendance_attendance VALUES (343, '2017-01-20', '2017-01-22', 'absent', '', 31, '2017-01-22 09:15:45.018384+00');
INSERT INTO attendance_attendance VALUES (353, '2017-01-19', '2017-01-22', 'absent', '', 1, '2017-01-22 09:18:39.860896+00');
INSERT INTO attendance_attendance VALUES (354, '2017-01-19', '2017-01-22', 'absent', '', 2, '2017-01-22 09:18:39.866728+00');
INSERT INTO attendance_attendance VALUES (355, '2017-01-19', '2017-01-22', 'present', '', 3, '2017-01-22 09:18:39.937583+00');
INSERT INTO attendance_attendance VALUES (356, '2017-01-19', '2017-01-22', 'absent', '', 4, '2017-01-22 09:18:39.942899+00');
INSERT INTO attendance_attendance VALUES (357, '2017-01-19', '2017-01-22', 'absent', '', 5, '2017-01-22 09:18:40.077489+00');
INSERT INTO attendance_attendance VALUES (358, '2017-01-19', '2017-01-22', 'present', '', 6, '2017-01-22 09:18:40.083024+00');
INSERT INTO attendance_attendance VALUES (359, '2017-01-19', '2017-01-22', 'present', '', 7, '2017-01-22 09:18:40.088794+00');
INSERT INTO attendance_attendance VALUES (360, '2017-01-19', '2017-01-22', 'present', '', 31, '2017-01-22 09:18:40.094135+00');
INSERT INTO attendance_attendance VALUES (344, '2017-01-18', '2017-01-22', 'present', '', 8, '2017-01-22 09:19:25.176169+00');
INSERT INTO attendance_attendance VALUES (345, '2017-01-18', '2017-01-22', 'present', '', 9, '2017-01-22 09:19:25.181345+00');
INSERT INTO attendance_attendance VALUES (346, '2017-01-18', '2017-01-22', 'present', '', 10, '2017-01-22 09:19:25.186579+00');
INSERT INTO attendance_attendance VALUES (347, '2017-01-18', '2017-01-22', 'present', '', 11, '2017-01-22 09:19:25.341655+00');
INSERT INTO attendance_attendance VALUES (348, '2017-01-18', '2017-01-22', 'present', '', 12, '2017-01-22 09:19:25.346501+00');
INSERT INTO attendance_attendance VALUES (349, '2017-01-18', '2017-01-22', 'present', '', 13, '2017-01-22 09:19:25.351609+00');
INSERT INTO attendance_attendance VALUES (350, '2017-01-18', '2017-01-22', 'present', '', 14, '2017-01-22 09:19:25.356625+00');
INSERT INTO attendance_attendance VALUES (351, '2017-01-18', '2017-01-22', 'present', '', 32, '2017-01-22 09:19:25.361397+00');
INSERT INTO attendance_attendance VALUES (352, '2017-01-18', '2017-01-22', 'present', '', 33, '2017-01-22 09:19:25.367575+00');
INSERT INTO attendance_attendance VALUES (361, '2017-01-22', '2017-01-22', 'present', '', 1, '2017-01-23 02:55:13.275738+00');
INSERT INTO attendance_attendance VALUES (362, '2017-01-22', '2017-01-22', 'present', '', 2, '2017-01-23 02:55:13.27981+00');
INSERT INTO attendance_attendance VALUES (363, '2017-01-22', '2017-01-22', 'present', '', 3, '2017-01-23 02:55:13.298368+00');
INSERT INTO attendance_attendance VALUES (364, '2017-01-22', '2017-01-22', 'present', '', 4, '2017-01-23 02:55:13.29981+00');
INSERT INTO attendance_attendance VALUES (365, '2017-01-22', '2017-01-22', 'present', '', 5, '2017-01-23 02:55:13.331673+00');
INSERT INTO attendance_attendance VALUES (366, '2017-01-22', '2017-01-22', 'present', '', 6, '2017-01-23 02:55:13.332611+00');
INSERT INTO attendance_attendance VALUES (367, '2017-01-22', '2017-01-22', 'present', '', 7, '2017-01-23 02:55:13.333464+00');
INSERT INTO attendance_attendance VALUES (368, '2017-01-22', '2017-01-22', 'absent', '', 31, '2017-01-23 02:55:13.334327+00');
INSERT INTO attendance_attendance VALUES (369, '2017-01-23', '2017-01-22', 'present', '', 1, '2017-01-23 03:06:46.728105+00');
INSERT INTO attendance_attendance VALUES (370, '2017-01-23', '2017-01-22', 'present', '', 2, '2017-01-23 03:06:46.730433+00');
INSERT INTO attendance_attendance VALUES (371, '2017-01-23', '2017-01-22', 'present', '', 3, '2017-01-23 03:06:46.748844+00');
INSERT INTO attendance_attendance VALUES (372, '2017-01-23', '2017-01-22', 'present', '', 4, '2017-01-23 03:06:46.749834+00');
INSERT INTO attendance_attendance VALUES (373, '2017-01-23', '2017-01-22', 'present', '', 5, '2017-01-23 03:06:46.78032+00');
INSERT INTO attendance_attendance VALUES (374, '2017-01-23', '2017-01-22', 'present', '', 6, '2017-01-23 03:06:46.781372+00');
INSERT INTO attendance_attendance VALUES (375, '2017-01-23', '2017-01-22', 'present', '', 7, '2017-01-23 03:06:46.782349+00');
INSERT INTO attendance_attendance VALUES (376, '2017-01-23', '2017-01-22', 'present', '', 31, '2017-01-23 03:06:46.783313+00');
INSERT INTO attendance_attendance VALUES (377, '2017-01-24', '2017-01-22', 'present', '', 1, '2017-01-23 03:24:17.390224+00');
INSERT INTO attendance_attendance VALUES (378, '2017-01-24', '2017-01-22', 'present', '', 2, '2017-01-23 03:24:17.392166+00');
INSERT INTO attendance_attendance VALUES (379, '2017-01-24', '2017-01-22', 'present', '', 3, '2017-01-23 03:24:17.411735+00');
INSERT INTO attendance_attendance VALUES (380, '2017-01-24', '2017-01-22', 'present', '', 4, '2017-01-23 03:24:17.412757+00');
INSERT INTO attendance_attendance VALUES (381, '2017-01-24', '2017-01-22', 'present', '', 5, '2017-01-23 03:24:17.441992+00');
INSERT INTO attendance_attendance VALUES (382, '2017-01-24', '2017-01-22', 'present', '', 6, '2017-01-23 03:24:17.443309+00');
INSERT INTO attendance_attendance VALUES (383, '2017-01-24', '2017-01-22', 'absent', '', 7, '2017-01-23 03:24:17.445057+00');
INSERT INTO attendance_attendance VALUES (384, '2017-01-24', '2017-01-22', 'absent', '', 31, '2017-01-23 03:24:17.446057+00');
INSERT INTO attendance_attendance VALUES (385, '2017-01-30', '2017-01-29', 'present', '', 3, '2017-01-29 08:50:53.376192+00');
INSERT INTO attendance_attendance VALUES (386, '2017-01-30', '2017-01-29', 'present', '', 4, '2017-01-29 08:50:53.378572+00');
INSERT INTO attendance_attendance VALUES (387, '2017-01-30', '2017-01-29', 'present', '', 5, '2017-01-29 08:50:53.404045+00');
INSERT INTO attendance_attendance VALUES (388, '2017-01-30', '2017-01-29', 'present', '', 6, '2017-01-29 08:50:53.405086+00');
INSERT INTO attendance_attendance VALUES (389, '2017-01-30', '2017-01-29', 'present', '', 7, '2017-01-29 08:50:53.405821+00');
INSERT INTO attendance_attendance VALUES (390, '2017-01-30', '2017-01-29', 'absent', '', 31, '2017-01-29 08:50:53.406654+00');
INSERT INTO attendance_attendance VALUES (391, '2017-01-30', '2017-01-29', 'present', '', 1, '2017-01-29 08:53:19.591768+00');
INSERT INTO attendance_attendance VALUES (392, '2017-01-30', '2017-01-29', 'present', '', 2, '2017-01-29 08:53:19.59467+00');
INSERT INTO attendance_attendance VALUES (393, '2017-01-30', '2017-01-29', 'present', '', 8, '2017-01-29 09:30:46.538238+00');
INSERT INTO attendance_attendance VALUES (394, '2017-01-30', '2017-01-29', 'present', '', 9, '2017-01-29 09:30:46.540202+00');
INSERT INTO attendance_attendance VALUES (395, '2017-01-30', '2017-01-29', 'present', '', 10, '2017-01-29 09:30:46.541119+00');
INSERT INTO attendance_attendance VALUES (396, '2017-01-30', '2017-01-29', 'present', '', 11, '2017-01-29 09:35:03.81376+00');
INSERT INTO attendance_attendance VALUES (397, '2017-01-30', '2017-01-29', 'present', '', 12, '2017-01-29 09:35:03.815669+00');
INSERT INTO attendance_attendance VALUES (398, '2017-01-30', '2017-01-29', 'present', '', 13, '2017-01-29 09:35:03.816827+00');
INSERT INTO attendance_attendance VALUES (399, '2017-01-30', '2017-01-29', 'present', '', 14, '2017-01-29 09:35:03.81776+00');
INSERT INTO attendance_attendance VALUES (400, '2017-01-30', '2017-01-29', 'present', '', 32, '2017-01-29 09:35:03.81865+00');
INSERT INTO attendance_attendance VALUES (401, '2017-01-30', '2017-01-29', 'absent', '', 33, '2017-01-29 09:35:03.819568+00');
INSERT INTO attendance_attendance VALUES (402, '2017-01-29', '2017-01-29', 'present', '', 11, '2017-01-29 17:55:43.096112+00');
INSERT INTO attendance_attendance VALUES (403, '2017-01-29', '2017-01-29', 'present', '', 12, '2017-01-29 17:55:43.097757+00');
INSERT INTO attendance_attendance VALUES (404, '2017-01-29', '2017-01-29', 'present', '', 13, '2017-01-29 17:55:43.098656+00');
INSERT INTO attendance_attendance VALUES (405, '2017-01-29', '2017-01-29', 'present', '', 14, '2017-01-29 17:55:43.09956+00');
INSERT INTO attendance_attendance VALUES (406, '2017-01-29', '2017-01-29', 'present', '', 32, '2017-01-29 17:55:43.100419+00');
INSERT INTO attendance_attendance VALUES (407, '2017-01-29', '2017-01-29', 'present', '', 33, '2017-01-29 17:55:43.10125+00');
INSERT INTO attendance_attendance VALUES (408, '2017-02-05', '2017-02-04', 'present', '', 3, '2017-02-05 04:02:58.14081+00');
INSERT INTO attendance_attendance VALUES (409, '2017-02-05', '2017-02-04', 'present', '', 4, '2017-02-05 04:02:58.144592+00');
INSERT INTO attendance_attendance VALUES (410, '2017-02-05', '2017-02-04', 'present', '', 5, '2017-02-05 04:02:58.185398+00');
INSERT INTO attendance_attendance VALUES (411, '2017-02-05', '2017-02-04', 'present', '', 6, '2017-02-05 04:02:58.186673+00');
INSERT INTO attendance_attendance VALUES (412, '2017-02-05', '2017-02-04', 'present', '', 7, '2017-02-05 04:02:58.187767+00');
INSERT INTO attendance_attendance VALUES (413, '2017-02-05', '2017-02-04', 'present', '', 31, '2017-02-05 04:02:58.188681+00');
INSERT INTO attendance_attendance VALUES (414, '2017-02-05', '2017-02-04', 'present', '', 1, '2017-02-05 04:03:12.620643+00');
INSERT INTO attendance_attendance VALUES (415, '2017-02-05', '2017-02-04', 'present', '', 2, '2017-02-05 04:03:12.622091+00');
INSERT INTO attendance_attendance VALUES (416, '2017-02-05', '2017-02-04', 'present', '', 35, '2017-02-05 04:03:12.623719+00');
INSERT INTO attendance_attendance VALUES (417, '2017-02-03', '2017-02-04', 'present', '', 8, '2017-02-05 04:03:22.52179+00');
INSERT INTO attendance_attendance VALUES (418, '2017-02-03', '2017-02-04', 'present', '', 9, '2017-02-05 04:03:22.525578+00');
INSERT INTO attendance_attendance VALUES (419, '2017-02-03', '2017-02-04', 'present', '', 11, '2017-02-05 04:03:37.39611+00');
INSERT INTO attendance_attendance VALUES (420, '2017-02-03', '2017-02-04', 'present', '', 12, '2017-02-05 04:03:37.39785+00');
INSERT INTO attendance_attendance VALUES (421, '2017-02-03', '2017-02-04', 'present', '', 13, '2017-02-05 04:03:37.399074+00');
INSERT INTO attendance_attendance VALUES (422, '2017-02-03', '2017-02-04', 'present', '', 14, '2017-02-05 04:03:37.399908+00');
INSERT INTO attendance_attendance VALUES (423, '2017-02-03', '2017-02-04', 'present', '', 32, '2017-02-05 04:03:37.400778+00');
INSERT INTO attendance_attendance VALUES (424, '2017-02-03', '2017-02-04', 'present', '', 33, '2017-02-05 04:03:37.401651+00');
INSERT INTO attendance_attendance VALUES (425, '2017-02-02', '2017-02-04', 'present', '', 11, '2017-02-05 04:03:50.103952+00');
INSERT INTO attendance_attendance VALUES (426, '2017-02-02', '2017-02-04', 'present', '', 12, '2017-02-05 04:03:50.10541+00');
INSERT INTO attendance_attendance VALUES (427, '2017-02-02', '2017-02-04', 'present', '', 13, '2017-02-05 04:03:50.106337+00');
INSERT INTO attendance_attendance VALUES (428, '2017-02-02', '2017-02-04', 'present', '', 14, '2017-02-05 04:03:50.10751+00');
INSERT INTO attendance_attendance VALUES (429, '2017-02-02', '2017-02-04', 'present', '', 32, '2017-02-05 04:03:50.108395+00');
INSERT INTO attendance_attendance VALUES (430, '2017-02-02', '2017-02-04', 'present', '', 33, '2017-02-05 04:03:50.109254+00');
INSERT INTO attendance_attendance VALUES (431, '2017-02-05', '2017-02-04', 'present', '', 23, '2017-02-05 04:04:06.015302+00');
INSERT INTO attendance_attendance VALUES (432, '2017-02-05', '2017-02-04', 'present', '', 24, '2017-02-05 04:04:06.016926+00');
INSERT INTO attendance_attendance VALUES (433, '2017-02-05', '2017-02-04', 'present', '', 25, '2017-02-05 04:04:06.018011+00');
INSERT INTO attendance_attendance VALUES (434, '2017-02-05', '2017-02-04', 'present', '', 30, '2017-02-05 04:04:06.019207+00');
INSERT INTO attendance_attendance VALUES (435, '2017-02-05', '2017-02-04', 'present', '', 26, '2017-02-05 04:04:06.04021+00');
INSERT INTO attendance_attendance VALUES (436, '2017-02-05', '2017-02-04', 'present', '', 27, '2017-02-05 04:04:06.041599+00');
INSERT INTO attendance_attendance VALUES (437, '2017-02-05', '2017-02-04', 'present', '', 28, '2017-02-05 04:04:20.250611+00');
INSERT INTO attendance_attendance VALUES (438, '2017-02-05', '2017-02-04', 'present', '', 29, '2017-02-05 04:04:20.252198+00');
INSERT INTO attendance_attendance VALUES (736, '2017-02-05', '2017-02-06', 'present', '', 160, '2017-02-06 06:42:49.009747+00');
INSERT INTO attendance_attendance VALUES (737, '2017-02-05', '2017-02-06', 'present', '', 167, '2017-02-06 06:42:49.01162+00');
INSERT INTO attendance_attendance VALUES (738, '2017-02-05', '2017-02-06', 'present', '', 169, '2017-02-06 06:42:49.013282+00');
INSERT INTO attendance_attendance VALUES (739, '2017-02-05', '2017-02-06', 'present', '', 170, '2017-02-06 06:42:49.015329+00');
INSERT INTO attendance_attendance VALUES (740, '2017-02-05', '2017-02-06', 'absent', '', 180, '2017-02-06 06:42:49.016176+00');
INSERT INTO attendance_attendance VALUES (741, '2017-02-05', '2017-02-06', 'present', '', 181, '2017-02-06 06:42:49.017194+00');
INSERT INTO attendance_attendance VALUES (742, '2017-02-05', '2017-02-06', 'present', '', 187, '2017-02-06 06:42:49.018197+00');
INSERT INTO attendance_attendance VALUES (743, '2017-02-05', '2017-02-06', 'present', '', 193, '2017-02-06 06:42:49.019357+00');
INSERT INTO attendance_attendance VALUES (744, '2017-02-05', '2017-02-06', 'present', '', 194, '2017-02-06 06:42:49.020156+00');
INSERT INTO attendance_attendance VALUES (745, '2017-02-05', '2017-02-06', 'present', '', 203, '2017-02-06 06:42:49.021048+00');
INSERT INTO attendance_attendance VALUES (746, '2017-02-05', '2017-02-06', 'present', '', 212, '2017-02-06 06:42:49.021973+00');
INSERT INTO attendance_attendance VALUES (747, '2017-02-05', '2017-02-06', 'present', '', 215, '2017-02-06 06:42:49.023008+00');
INSERT INTO attendance_attendance VALUES (748, '2017-02-05', '2017-02-06', 'absent', '', 217, '2017-02-06 06:42:49.025302+00');
INSERT INTO attendance_attendance VALUES (749, '2017-02-05', '2017-02-06', 'present', '', 218, '2017-02-06 06:42:49.02609+00');
INSERT INTO attendance_attendance VALUES (750, '2017-02-05', '2017-02-06', 'present', '', 237, '2017-02-06 06:42:49.027413+00');
INSERT INTO attendance_attendance VALUES (751, '2017-02-05', '2017-02-06', 'present', '', 238, '2017-02-06 06:42:49.02845+00');
INSERT INTO attendance_attendance VALUES (752, '2017-02-05', '2017-02-06', 'present', '', 239, '2017-02-06 06:42:49.029402+00');
INSERT INTO attendance_attendance VALUES (753, '2017-02-05', '2017-02-06', 'absent', '', 240, '2017-02-06 06:42:49.030213+00');
INSERT INTO attendance_attendance VALUES (754, '2017-02-05', '2017-02-06', 'present', '', 242, '2017-02-06 06:42:49.031246+00');
INSERT INTO attendance_attendance VALUES (755, '2017-02-05', '2017-02-06', 'present', '', 243, '2017-02-06 06:42:49.032114+00');
INSERT INTO attendance_attendance VALUES (756, '2017-02-05', '2017-02-06', 'absent', '', 253, '2017-02-06 06:42:49.035071+00');
INSERT INTO attendance_attendance VALUES (757, '2017-02-05', '2017-02-06', 'present', '', 259, '2017-02-06 06:42:49.03589+00');
INSERT INTO attendance_attendance VALUES (758, '2017-02-05', '2017-02-06', 'present', '', 260, '2017-02-06 06:42:49.036853+00');
INSERT INTO attendance_attendance VALUES (759, '2017-02-05', '2017-02-06', 'absent', '', 261, '2017-02-06 06:42:49.038103+00');
INSERT INTO attendance_attendance VALUES (760, '2017-02-05', '2017-02-06', 'present', '', 268, '2017-02-06 06:42:49.038933+00');
INSERT INTO attendance_attendance VALUES (761, '2017-02-05', '2017-02-06', 'present', '', 273, '2017-02-06 06:42:49.039729+00');
INSERT INTO attendance_attendance VALUES (762, '2017-02-05', '2017-02-06', 'absent', '', 274, '2017-02-06 06:42:49.040505+00');
INSERT INTO attendance_attendance VALUES (763, '2017-02-05', '2017-02-06', 'present', '', 275, '2017-02-06 06:42:49.041299+00');
INSERT INTO attendance_attendance VALUES (764, '2017-02-05', '2017-02-06', 'present', '', 283, '2017-02-06 06:42:49.042162+00');
INSERT INTO attendance_attendance VALUES (765, '2017-02-05', '2017-02-06', 'present', '', 287, '2017-02-06 06:42:49.045151+00');
INSERT INTO attendance_attendance VALUES (766, '2017-02-05', '2017-02-06', 'present', '', 288, '2017-02-06 06:42:49.046044+00');
INSERT INTO attendance_attendance VALUES (767, '2017-02-05', '2017-02-06', 'absent', '', 289, '2017-02-06 06:42:49.046869+00');
INSERT INTO attendance_attendance VALUES (768, '2017-02-05', '2017-02-06', 'present', '', 302, '2017-02-06 06:42:49.047731+00');
INSERT INTO attendance_attendance VALUES (769, '2017-02-05', '2017-02-06', 'present', '', 306, '2017-02-06 06:42:49.048574+00');
INSERT INTO attendance_attendance VALUES (770, '2017-02-05', '2017-02-06', 'present', '', 307, '2017-02-06 06:42:49.049412+00');
INSERT INTO attendance_attendance VALUES (771, '2017-02-05', '2017-02-06', 'absent', '', 309, '2017-02-06 06:42:49.050248+00');
INSERT INTO attendance_attendance VALUES (772, '2017-02-05', '2017-02-06', 'absent', '', 314, '2017-02-06 06:42:49.05121+00');
INSERT INTO attendance_attendance VALUES (773, '2017-02-05', '2017-02-06', 'present', '', 88, '2017-02-06 06:42:49.256772+00');
INSERT INTO attendance_attendance VALUES (774, '2017-02-05', '2017-02-06', 'present', '', 111, '2017-02-06 06:42:49.258023+00');
INSERT INTO attendance_attendance VALUES (775, '2017-02-05', '2017-02-06', 'present', '', 124, '2017-02-06 06:42:49.258865+00');
INSERT INTO attendance_attendance VALUES (776, '2017-02-05', '2017-02-06', 'present', '', 125, '2017-02-06 06:42:49.259747+00');
INSERT INTO attendance_attendance VALUES (777, '2017-02-05', '2017-02-06', 'present', '', 129, '2017-02-06 06:42:49.26057+00');
INSERT INTO attendance_attendance VALUES (778, '2017-02-05', '2017-02-06', 'present', '', 134, '2017-02-06 06:42:49.261385+00');
INSERT INTO attendance_attendance VALUES (779, '2017-02-05', '2017-02-06', 'present', '', 135, '2017-02-06 06:42:49.262114+00');
INSERT INTO attendance_attendance VALUES (780, '2017-02-05', '2017-02-06', 'present', '', 136, '2017-02-06 06:42:49.264202+00');
INSERT INTO attendance_attendance VALUES (781, '2017-02-05', '2017-02-06', 'present', '', 139, '2017-02-06 06:42:49.265277+00');
INSERT INTO attendance_attendance VALUES (782, '2017-02-05', '2017-02-06', 'present', '', 140, '2017-02-06 06:42:49.267015+00');
INSERT INTO attendance_attendance VALUES (783, '2017-02-05', '2017-02-06', 'present', '', 143, '2017-02-06 06:42:49.267792+00');
INSERT INTO attendance_attendance VALUES (784, '2017-02-05', '2017-02-06', 'present', '', 146, '2017-02-06 06:42:49.268562+00');
INSERT INTO attendance_attendance VALUES (785, '2017-02-05', '2017-02-06', 'present', '', 147, '2017-02-06 06:42:49.269522+00');
INSERT INTO attendance_attendance VALUES (786, '2017-02-05', '2017-02-06', 'present', '', 148, '2017-02-06 06:42:49.270282+00');
INSERT INTO attendance_attendance VALUES (787, '2017-02-05', '2017-02-06', 'present', '', 168, '2017-02-06 06:42:49.271204+00');
INSERT INTO attendance_attendance VALUES (788, '2017-02-05', '2017-02-06', 'present', '', 171, '2017-02-06 06:42:49.272123+00');
INSERT INTO attendance_attendance VALUES (789, '2017-02-05', '2017-02-06', 'present', '', 172, '2017-02-06 06:42:49.274088+00');
INSERT INTO attendance_attendance VALUES (790, '2017-02-05', '2017-02-06', 'present', '', 183, '2017-02-06 06:42:49.274845+00');
INSERT INTO attendance_attendance VALUES (791, '2017-02-05', '2017-02-06', 'present', '', 190, '2017-02-06 06:42:49.27557+00');
INSERT INTO attendance_attendance VALUES (792, '2017-02-05', '2017-02-06', 'present', '', 191, '2017-02-06 06:42:49.276522+00');
INSERT INTO attendance_attendance VALUES (793, '2017-02-05', '2017-02-06', 'present', '', 196, '2017-02-06 06:42:49.277364+00');
INSERT INTO attendance_attendance VALUES (794, '2017-02-05', '2017-02-06', 'present', '', 206, '2017-02-06 06:42:49.278091+00');
INSERT INTO attendance_attendance VALUES (795, '2017-02-05', '2017-02-06', 'present', '', 207, '2017-02-06 06:42:49.278837+00');
INSERT INTO attendance_attendance VALUES (796, '2017-02-05', '2017-02-06', 'absent', '', 213, '2017-02-06 06:42:49.279707+00');
INSERT INTO attendance_attendance VALUES (797, '2017-02-05', '2017-02-06', 'absent', '', 224, '2017-02-06 06:42:49.280628+00');
INSERT INTO attendance_attendance VALUES (798, '2017-02-05', '2017-02-06', 'present', '', 235, '2017-02-06 06:42:49.281369+00');
INSERT INTO attendance_attendance VALUES (799, '2017-02-05', '2017-02-06', 'absent', '', 250, '2017-02-06 06:42:49.282105+00');
INSERT INTO attendance_attendance VALUES (800, '2017-02-05', '2017-02-06', 'present', '', 254, '2017-02-06 06:42:49.283567+00');
INSERT INTO attendance_attendance VALUES (801, '2017-02-05', '2017-02-06', 'present', '', 255, '2017-02-06 06:42:49.284673+00');
INSERT INTO attendance_attendance VALUES (802, '2017-02-05', '2017-02-06', 'present', '', 267, '2017-02-06 06:42:49.285419+00');
INSERT INTO attendance_attendance VALUES (803, '2017-02-05', '2017-02-06', 'present', '', 327, '2017-02-06 06:42:49.286138+00');
INSERT INTO attendance_attendance VALUES (804, '2017-02-05', '2017-02-06', 'present', '', 51, '2017-02-06 06:42:49.446772+00');
INSERT INTO attendance_attendance VALUES (805, '2017-02-05', '2017-02-06', 'present', '', 57, '2017-02-06 06:42:49.447998+00');
INSERT INTO attendance_attendance VALUES (806, '2017-02-05', '2017-02-06', 'absent', '', 68, '2017-02-06 06:42:49.448907+00');
INSERT INTO attendance_attendance VALUES (807, '2017-02-05', '2017-02-06', 'present', '', 73, '2017-02-06 06:42:49.449761+00');
INSERT INTO attendance_attendance VALUES (808, '2017-02-05', '2017-02-06', 'present', '', 77, '2017-02-06 06:42:49.450678+00');
INSERT INTO attendance_attendance VALUES (809, '2017-02-05', '2017-02-06', 'present', '', 79, '2017-02-06 06:42:49.451395+00');
INSERT INTO attendance_attendance VALUES (810, '2017-02-05', '2017-02-06', 'present', '', 81, '2017-02-06 06:42:49.452135+00');
INSERT INTO attendance_attendance VALUES (811, '2017-02-05', '2017-02-06', 'present', '', 84, '2017-02-06 06:42:49.454478+00');
INSERT INTO attendance_attendance VALUES (812, '2017-02-05', '2017-02-06', 'present', '', 90, '2017-02-06 06:42:49.455214+00');
INSERT INTO attendance_attendance VALUES (813, '2017-02-05', '2017-02-06', 'present', '', 92, '2017-02-06 06:42:49.455969+00');
INSERT INTO attendance_attendance VALUES (814, '2017-02-05', '2017-02-06', 'present', '', 95, '2017-02-06 06:42:49.456869+00');
INSERT INTO attendance_attendance VALUES (815, '2017-02-05', '2017-02-06', 'present', '', 96, '2017-02-06 06:42:49.457732+00');
INSERT INTO attendance_attendance VALUES (816, '2017-02-05', '2017-02-06', 'present', '', 97, '2017-02-06 06:42:49.45845+00');
INSERT INTO attendance_attendance VALUES (817, '2017-02-05', '2017-02-06', 'present', '', 98, '2017-02-06 06:42:49.459166+00');
INSERT INTO attendance_attendance VALUES (818, '2017-02-05', '2017-02-06', 'present', '', 99, '2017-02-06 06:42:49.459907+00');
INSERT INTO attendance_attendance VALUES (819, '2017-02-05', '2017-02-06', 'present', '', 101, '2017-02-06 06:42:49.460645+00');
INSERT INTO attendance_attendance VALUES (820, '2017-02-05', '2017-02-06', 'present', '', 102, '2017-02-06 06:42:49.461959+00');
INSERT INTO attendance_attendance VALUES (821, '2017-02-05', '2017-02-06', 'absent', '', 106, '2017-02-06 06:42:49.463296+00');
INSERT INTO attendance_attendance VALUES (822, '2017-02-05', '2017-02-06', 'absent', '', 178, '2017-02-06 06:42:49.465379+00');
INSERT INTO attendance_attendance VALUES (823, '2017-02-05', '2017-02-06', 'present', '', 184, '2017-02-06 06:42:49.466125+00');
INSERT INTO attendance_attendance VALUES (824, '2017-02-05', '2017-02-06', 'present', '', 230, '2017-02-06 06:42:49.467239+00');
INSERT INTO attendance_attendance VALUES (825, '2017-02-05', '2017-02-06', 'absent', '', 231, '2017-02-06 06:42:49.468011+00');
INSERT INTO attendance_attendance VALUES (826, '2017-02-05', '2017-02-06', 'present', '', 249, '2017-02-06 06:42:49.468728+00');
INSERT INTO attendance_attendance VALUES (827, '2017-02-05', '2017-02-06', 'absent', '', 264, '2017-02-06 06:42:49.469446+00');
INSERT INTO attendance_attendance VALUES (828, '2017-02-05', '2017-02-06', 'present', '', 312, '2017-02-06 06:42:49.470162+00');
INSERT INTO attendance_attendance VALUES (829, '2017-02-05', '2017-02-06', 'present', '', 40, '2017-02-06 06:42:49.606881+00');
INSERT INTO attendance_attendance VALUES (830, '2017-02-05', '2017-02-06', 'absent', '', 41, '2017-02-06 06:42:49.60794+00');
INSERT INTO attendance_attendance VALUES (831, '2017-02-05', '2017-02-06', 'present', '', 47, '2017-02-06 06:42:49.608805+00');
INSERT INTO attendance_attendance VALUES (832, '2017-02-05', '2017-02-06', 'absent', '', 50, '2017-02-06 06:42:49.609567+00');
INSERT INTO attendance_attendance VALUES (833, '2017-02-05', '2017-02-06', 'present', '', 52, '2017-02-06 06:42:49.610349+00');
INSERT INTO attendance_attendance VALUES (834, '2017-02-05', '2017-02-06', 'present', '', 53, '2017-02-06 06:42:49.611101+00');
INSERT INTO attendance_attendance VALUES (835, '2017-02-05', '2017-02-06', 'absent', '', 54, '2017-02-06 06:42:49.611854+00');
INSERT INTO attendance_attendance VALUES (836, '2017-02-05', '2017-02-06', 'present', '', 55, '2017-02-06 06:42:49.613972+00');
INSERT INTO attendance_attendance VALUES (837, '2017-02-05', '2017-02-06', 'present', '', 56, '2017-02-06 06:42:49.615046+00');
INSERT INTO attendance_attendance VALUES (838, '2017-02-05', '2017-02-06', 'present', '', 58, '2017-02-06 06:42:49.615827+00');
INSERT INTO attendance_attendance VALUES (839, '2017-02-05', '2017-02-06', 'present', '', 59, '2017-02-06 06:42:49.616553+00');
INSERT INTO attendance_attendance VALUES (840, '2017-02-05', '2017-02-06', 'present', '', 60, '2017-02-06 06:42:49.617309+00');
INSERT INTO attendance_attendance VALUES (841, '2017-02-05', '2017-02-06', 'present', '', 61, '2017-02-06 06:42:49.618104+00');
INSERT INTO attendance_attendance VALUES (842, '2017-02-05', '2017-02-06', 'present', '', 62, '2017-02-06 06:42:49.618831+00');
INSERT INTO attendance_attendance VALUES (843, '2017-02-05', '2017-02-06', 'present', '', 63, '2017-02-06 06:42:49.619555+00');
INSERT INTO attendance_attendance VALUES (844, '2017-02-05', '2017-02-06', 'present', '', 65, '2017-02-06 06:42:49.620284+00');
INSERT INTO attendance_attendance VALUES (845, '2017-02-05', '2017-02-06', 'present', '', 69, '2017-02-06 06:42:49.621369+00');
INSERT INTO attendance_attendance VALUES (846, '2017-02-05', '2017-02-06', 'present', '', 70, '2017-02-06 06:42:49.622185+00');
INSERT INTO attendance_attendance VALUES (847, '2017-02-05', '2017-02-06', 'present', '', 71, '2017-02-06 06:42:49.624038+00');
INSERT INTO attendance_attendance VALUES (848, '2017-02-05', '2017-02-06', 'absent', '', 72, '2017-02-06 06:42:49.625019+00');
INSERT INTO attendance_attendance VALUES (849, '2017-02-05', '2017-02-06', 'absent', '', 80, '2017-02-06 06:42:49.62582+00');
INSERT INTO attendance_attendance VALUES (850, '2017-02-05', '2017-02-06', 'present', '', 37, '2017-02-06 06:42:49.716557+00');
INSERT INTO attendance_attendance VALUES (851, '2017-02-05', '2017-02-06', 'present', '', 38, '2017-02-06 06:42:49.717765+00');
INSERT INTO attendance_attendance VALUES (852, '2017-02-05', '2017-02-06', 'present', '', 39, '2017-02-06 06:42:49.71874+00');
INSERT INTO attendance_attendance VALUES (853, '2017-02-05', '2017-02-06', 'present', '', 42, '2017-02-06 06:42:49.719569+00');
INSERT INTO attendance_attendance VALUES (854, '2017-02-05', '2017-02-06', 'present', '', 43, '2017-02-06 06:42:49.720398+00');
INSERT INTO attendance_attendance VALUES (855, '2017-02-05', '2017-02-06', 'present', '', 44, '2017-02-06 06:42:49.721208+00');
INSERT INTO attendance_attendance VALUES (856, '2017-02-05', '2017-02-06', 'present', '', 45, '2017-02-06 06:42:49.722154+00');
INSERT INTO attendance_attendance VALUES (857, '2017-02-05', '2017-02-06', 'present', '', 46, '2017-02-06 06:42:49.724945+00');
INSERT INTO attendance_attendance VALUES (858, '2017-02-05', '2017-02-06', 'present', '', 48, '2017-02-06 06:42:49.725694+00');
INSERT INTO attendance_attendance VALUES (859, '2017-02-05', '2017-02-06', 'present', '', 49, '2017-02-06 06:42:49.726566+00');
INSERT INTO attendance_attendance VALUES (860, '2017-02-05', '2017-02-06', 'absent', '', 67, '2017-02-06 06:42:49.727561+00');
INSERT INTO attendance_attendance VALUES (439, '2017-02-06', '2017-02-05', 'present', '', 160, '2017-02-05 21:41:14.02781+00');
INSERT INTO attendance_attendance VALUES (440, '2017-02-06', '2017-02-05', 'present', '', 167, '2017-02-05 21:41:14.029631+00');
INSERT INTO attendance_attendance VALUES (441, '2017-02-06', '2017-02-05', 'present', '', 169, '2017-02-05 21:41:14.030782+00');
INSERT INTO attendance_attendance VALUES (442, '2017-02-06', '2017-02-05', 'present', '', 170, '2017-02-05 21:41:14.031883+00');
INSERT INTO attendance_attendance VALUES (443, '2017-02-06', '2017-02-05', 'present', '', 180, '2017-02-05 21:41:14.035041+00');
INSERT INTO attendance_attendance VALUES (444, '2017-02-06', '2017-02-05', 'present', '', 181, '2017-02-05 21:41:14.036138+00');
INSERT INTO attendance_attendance VALUES (445, '2017-02-06', '2017-02-05', 'present', '', 187, '2017-02-05 21:41:14.037206+00');
INSERT INTO attendance_attendance VALUES (446, '2017-02-06', '2017-02-05', 'present', '', 193, '2017-02-05 21:41:14.038464+00');
INSERT INTO attendance_attendance VALUES (447, '2017-02-06', '2017-02-05', 'present', '', 194, '2017-02-05 21:41:14.039596+00');
INSERT INTO attendance_attendance VALUES (448, '2017-02-06', '2017-02-05', 'absent', '', 203, '2017-02-05 21:41:14.04068+00');
INSERT INTO attendance_attendance VALUES (449, '2017-02-06', '2017-02-05', 'present', '', 212, '2017-02-05 21:41:14.04177+00');
INSERT INTO attendance_attendance VALUES (450, '2017-02-06', '2017-02-05', 'absent', '', 215, '2017-02-05 21:41:14.045686+00');
INSERT INTO attendance_attendance VALUES (451, '2017-02-06', '2017-02-05', 'present', '', 217, '2017-02-05 21:41:14.046812+00');
INSERT INTO attendance_attendance VALUES (452, '2017-02-06', '2017-02-05', 'present', '', 218, '2017-02-05 21:41:14.047922+00');
INSERT INTO attendance_attendance VALUES (453, '2017-02-06', '2017-02-05', 'present', '', 237, '2017-02-05 21:41:14.048997+00');
INSERT INTO attendance_attendance VALUES (454, '2017-02-06', '2017-02-05', 'absent', '', 238, '2017-02-05 21:41:14.050059+00');
INSERT INTO attendance_attendance VALUES (455, '2017-02-06', '2017-02-05', 'absent', '', 239, '2017-02-05 21:41:14.051167+00');
INSERT INTO attendance_attendance VALUES (456, '2017-02-06', '2017-02-05', 'absent', '', 240, '2017-02-05 21:41:14.052253+00');
INSERT INTO attendance_attendance VALUES (457, '2017-02-06', '2017-02-05', 'present', '', 242, '2017-02-05 21:41:14.055806+00');
INSERT INTO attendance_attendance VALUES (458, '2017-02-06', '2017-02-05', 'present', '', 243, '2017-02-05 21:41:14.056914+00');
INSERT INTO attendance_attendance VALUES (459, '2017-02-06', '2017-02-05', 'present', '', 253, '2017-02-05 21:41:14.05799+00');
INSERT INTO attendance_attendance VALUES (460, '2017-02-06', '2017-02-05', 'present', '', 259, '2017-02-05 21:41:14.059073+00');
INSERT INTO attendance_attendance VALUES (461, '2017-02-06', '2017-02-05', 'absent', '', 260, '2017-02-05 21:41:14.060203+00');
INSERT INTO attendance_attendance VALUES (462, '2017-02-06', '2017-02-05', 'absent', '', 261, '2017-02-05 21:41:14.061298+00');
INSERT INTO attendance_attendance VALUES (463, '2017-02-06', '2017-02-05', 'present', '', 268, '2017-02-05 21:41:14.064764+00');
INSERT INTO attendance_attendance VALUES (464, '2017-02-06', '2017-02-05', 'absent', '', 273, '2017-02-05 21:41:14.065899+00');
INSERT INTO attendance_attendance VALUES (465, '2017-02-06', '2017-02-05', 'present', '', 274, '2017-02-05 21:41:14.066997+00');
INSERT INTO attendance_attendance VALUES (466, '2017-02-06', '2017-02-05', 'present', '', 275, '2017-02-05 21:41:14.068101+00');
INSERT INTO attendance_attendance VALUES (467, '2017-02-06', '2017-02-05', 'present', '', 283, '2017-02-05 21:41:14.069363+00');
INSERT INTO attendance_attendance VALUES (468, '2017-02-06', '2017-02-05', 'present', '', 287, '2017-02-05 21:41:14.070516+00');
INSERT INTO attendance_attendance VALUES (469, '2017-02-06', '2017-02-05', 'absent', '', 288, '2017-02-05 21:41:14.071587+00');
INSERT INTO attendance_attendance VALUES (470, '2017-02-06', '2017-02-05', 'present', '', 289, '2017-02-05 21:41:14.074909+00');
INSERT INTO attendance_attendance VALUES (471, '2017-02-06', '2017-02-05', 'present', '', 302, '2017-02-05 21:41:14.076025+00');
INSERT INTO attendance_attendance VALUES (472, '2017-02-06', '2017-02-05', 'present', '', 306, '2017-02-05 21:41:14.077278+00');
INSERT INTO attendance_attendance VALUES (473, '2017-02-06', '2017-02-05', 'present', '', 307, '2017-02-05 21:41:14.078414+00');
INSERT INTO attendance_attendance VALUES (474, '2017-02-06', '2017-02-05', 'present', '', 309, '2017-02-05 21:41:14.079543+00');
INSERT INTO attendance_attendance VALUES (475, '2017-02-06', '2017-02-05', 'present', '', 314, '2017-02-05 21:41:14.080607+00');
INSERT INTO attendance_attendance VALUES (476, '2017-02-06', '2017-02-05', 'present', '', 88, '2017-02-05 21:41:14.364984+00');
INSERT INTO attendance_attendance VALUES (477, '2017-02-06', '2017-02-05', 'present', '', 111, '2017-02-05 21:41:14.366326+00');
INSERT INTO attendance_attendance VALUES (478, '2017-02-06', '2017-02-05', 'present', '', 124, '2017-02-05 21:41:14.367481+00');
INSERT INTO attendance_attendance VALUES (479, '2017-02-06', '2017-02-05', 'present', '', 125, '2017-02-05 21:41:14.368601+00');
INSERT INTO attendance_attendance VALUES (480, '2017-02-06', '2017-02-05', 'present', '', 129, '2017-02-05 21:41:14.36977+00');
INSERT INTO attendance_attendance VALUES (481, '2017-02-06', '2017-02-05', 'present', '', 134, '2017-02-05 21:41:14.370865+00');
INSERT INTO attendance_attendance VALUES (482, '2017-02-06', '2017-02-05', 'present', '', 135, '2017-02-05 21:41:14.372228+00');
INSERT INTO attendance_attendance VALUES (483, '2017-02-06', '2017-02-05', 'present', '', 136, '2017-02-05 21:41:14.374216+00');
INSERT INTO attendance_attendance VALUES (484, '2017-02-06', '2017-02-05', 'present', '', 139, '2017-02-05 21:41:14.37529+00');
INSERT INTO attendance_attendance VALUES (485, '2017-02-06', '2017-02-05', 'present', '', 140, '2017-02-05 21:41:14.376372+00');
INSERT INTO attendance_attendance VALUES (486, '2017-02-06', '2017-02-05', 'present', '', 143, '2017-02-05 21:41:14.377456+00');
INSERT INTO attendance_attendance VALUES (487, '2017-02-06', '2017-02-05', 'present', '', 146, '2017-02-05 21:41:14.378537+00');
INSERT INTO attendance_attendance VALUES (488, '2017-02-06', '2017-02-05', 'present', '', 147, '2017-02-05 21:41:14.379657+00');
INSERT INTO attendance_attendance VALUES (489, '2017-02-06', '2017-02-05', 'present', '', 148, '2017-02-05 21:41:14.380878+00');
INSERT INTO attendance_attendance VALUES (490, '2017-02-06', '2017-02-05', 'present', '', 168, '2017-02-05 21:41:14.381926+00');
INSERT INTO attendance_attendance VALUES (491, '2017-02-06', '2017-02-05', 'absent', '', 171, '2017-02-05 21:41:14.384609+00');
INSERT INTO attendance_attendance VALUES (492, '2017-02-06', '2017-02-05', 'present', '', 172, '2017-02-05 21:41:14.385661+00');
INSERT INTO attendance_attendance VALUES (493, '2017-02-06', '2017-02-05', 'present', '', 183, '2017-02-05 21:41:14.386798+00');
INSERT INTO attendance_attendance VALUES (494, '2017-02-06', '2017-02-05', 'absent', '', 190, '2017-02-05 21:41:14.387879+00');
INSERT INTO attendance_attendance VALUES (495, '2017-02-06', '2017-02-05', 'absent', '', 191, '2017-02-05 21:41:14.388973+00');
INSERT INTO attendance_attendance VALUES (496, '2017-02-06', '2017-02-05', 'present', '', 196, '2017-02-05 21:41:14.390022+00');
INSERT INTO attendance_attendance VALUES (497, '2017-02-06', '2017-02-05', 'present', '', 206, '2017-02-05 21:41:14.391131+00');
INSERT INTO attendance_attendance VALUES (498, '2017-02-06', '2017-02-05', 'absent', '', 207, '2017-02-05 21:41:14.392235+00');
INSERT INTO attendance_attendance VALUES (499, '2017-02-06', '2017-02-05', 'present', '', 213, '2017-02-05 21:41:14.394515+00');
INSERT INTO attendance_attendance VALUES (500, '2017-02-06', '2017-02-05', 'present', '', 224, '2017-02-05 21:41:14.395579+00');
INSERT INTO attendance_attendance VALUES (501, '2017-02-06', '2017-02-05', 'present', '', 235, '2017-02-05 21:41:14.396646+00');
INSERT INTO attendance_attendance VALUES (502, '2017-02-06', '2017-02-05', 'present', '', 250, '2017-02-05 21:41:14.397889+00');
INSERT INTO attendance_attendance VALUES (503, '2017-02-06', '2017-02-05', 'present', '', 254, '2017-02-05 21:41:14.399337+00');
INSERT INTO attendance_attendance VALUES (504, '2017-02-06', '2017-02-05', 'present', '', 255, '2017-02-05 21:41:14.400733+00');
INSERT INTO attendance_attendance VALUES (505, '2017-02-06', '2017-02-05', 'present', '', 267, '2017-02-05 21:41:14.402029+00');
INSERT INTO attendance_attendance VALUES (506, '2017-02-06', '2017-02-05', 'present', '', 327, '2017-02-05 21:41:14.404417+00');
INSERT INTO attendance_attendance VALUES (507, '2017-02-06', '2017-02-05', 'present', '', 51, '2017-02-05 21:41:14.606607+00');
INSERT INTO attendance_attendance VALUES (508, '2017-02-06', '2017-02-05', 'present', '', 57, '2017-02-05 21:41:14.608395+00');
INSERT INTO attendance_attendance VALUES (509, '2017-02-06', '2017-02-05', 'present', '', 68, '2017-02-05 21:41:14.609551+00');
INSERT INTO attendance_attendance VALUES (510, '2017-02-06', '2017-02-05', 'present', '', 73, '2017-02-05 21:41:14.610656+00');
INSERT INTO attendance_attendance VALUES (511, '2017-02-06', '2017-02-05', 'present', '', 77, '2017-02-05 21:41:14.611862+00');
INSERT INTO attendance_attendance VALUES (512, '2017-02-06', '2017-02-05', 'present', '', 79, '2017-02-05 21:41:14.613762+00');
INSERT INTO attendance_attendance VALUES (513, '2017-02-06', '2017-02-05', 'present', '', 81, '2017-02-05 21:41:14.614935+00');
INSERT INTO attendance_attendance VALUES (514, '2017-02-06', '2017-02-05', 'present', '', 84, '2017-02-05 21:41:14.616214+00');
INSERT INTO attendance_attendance VALUES (515, '2017-02-06', '2017-02-05', 'absent', '', 90, '2017-02-05 21:41:14.617586+00');
INSERT INTO attendance_attendance VALUES (516, '2017-02-06', '2017-02-05', 'present', '', 92, '2017-02-05 21:41:14.619056+00');
INSERT INTO attendance_attendance VALUES (517, '2017-02-06', '2017-02-05', 'absent', '', 95, '2017-02-05 21:41:14.620355+00');
INSERT INTO attendance_attendance VALUES (518, '2017-02-06', '2017-02-05', 'present', '', 96, '2017-02-05 21:41:14.621469+00');
INSERT INTO attendance_attendance VALUES (519, '2017-02-06', '2017-02-05', 'present', '', 97, '2017-02-05 21:41:14.623289+00');
INSERT INTO attendance_attendance VALUES (520, '2017-02-06', '2017-02-05', 'absent', '', 98, '2017-02-05 21:41:14.625211+00');
INSERT INTO attendance_attendance VALUES (521, '2017-02-06', '2017-02-05', 'present', '', 99, '2017-02-05 21:41:14.626307+00');
INSERT INTO attendance_attendance VALUES (522, '2017-02-06', '2017-02-05', 'present', '', 101, '2017-02-05 21:41:14.627647+00');
INSERT INTO attendance_attendance VALUES (523, '2017-02-06', '2017-02-05', 'present', '', 102, '2017-02-05 21:41:14.628771+00');
INSERT INTO attendance_attendance VALUES (524, '2017-02-06', '2017-02-05', 'present', '', 106, '2017-02-05 21:41:14.629931+00');
INSERT INTO attendance_attendance VALUES (525, '2017-02-06', '2017-02-05', 'present', '', 178, '2017-02-05 21:41:14.631057+00');
INSERT INTO attendance_attendance VALUES (526, '2017-02-06', '2017-02-05', 'present', '', 184, '2017-02-05 21:41:14.632188+00');
INSERT INTO attendance_attendance VALUES (527, '2017-02-06', '2017-02-05', 'absent', '', 230, '2017-02-05 21:41:14.634499+00');
INSERT INTO attendance_attendance VALUES (528, '2017-02-06', '2017-02-05', 'present', '', 231, '2017-02-05 21:41:14.635871+00');
INSERT INTO attendance_attendance VALUES (529, '2017-02-06', '2017-02-05', 'present', '', 249, '2017-02-05 21:41:14.637188+00');
INSERT INTO attendance_attendance VALUES (530, '2017-02-06', '2017-02-05', 'present', '', 264, '2017-02-05 21:41:14.638472+00');
INSERT INTO attendance_attendance VALUES (531, '2017-02-06', '2017-02-05', 'present', '', 312, '2017-02-05 21:41:14.640134+00');
INSERT INTO attendance_attendance VALUES (532, '2017-02-06', '2017-02-05', 'present', '', 40, '2017-02-05 21:41:14.94155+00');
INSERT INTO attendance_attendance VALUES (533, '2017-02-06', '2017-02-05', 'present', '', 41, '2017-02-05 21:41:14.945558+00');
INSERT INTO attendance_attendance VALUES (534, '2017-02-06', '2017-02-05', 'present', '', 47, '2017-02-05 21:41:14.947153+00');
INSERT INTO attendance_attendance VALUES (535, '2017-02-06', '2017-02-05', 'present', '', 50, '2017-02-05 21:41:14.94915+00');
INSERT INTO attendance_attendance VALUES (536, '2017-02-06', '2017-02-05', 'absent', '', 52, '2017-02-05 21:41:14.951242+00');
INSERT INTO attendance_attendance VALUES (537, '2017-02-06', '2017-02-05', 'present', '', 53, '2017-02-05 21:41:14.95556+00');
INSERT INTO attendance_attendance VALUES (538, '2017-02-06', '2017-02-05', 'absent', '', 54, '2017-02-05 21:41:14.95706+00');
INSERT INTO attendance_attendance VALUES (539, '2017-02-06', '2017-02-05', 'present', '', 55, '2017-02-05 21:41:14.958903+00');
INSERT INTO attendance_attendance VALUES (540, '2017-02-06', '2017-02-05', 'absent', '', 56, '2017-02-05 21:41:14.960386+00');
INSERT INTO attendance_attendance VALUES (541, '2017-02-06', '2017-02-05', 'present', '', 58, '2017-02-05 21:41:14.961526+00');
INSERT INTO attendance_attendance VALUES (542, '2017-02-06', '2017-02-05', 'absent', '', 59, '2017-02-05 21:41:14.965472+00');
INSERT INTO attendance_attendance VALUES (543, '2017-02-06', '2017-02-05', 'present', '', 60, '2017-02-05 21:41:14.96681+00');
INSERT INTO attendance_attendance VALUES (544, '2017-02-06', '2017-02-05', 'absent', '', 61, '2017-02-05 21:41:14.968426+00');
INSERT INTO attendance_attendance VALUES (545, '2017-02-06', '2017-02-05', 'present', '', 62, '2017-02-05 21:41:14.969896+00');
INSERT INTO attendance_attendance VALUES (546, '2017-02-06', '2017-02-05', 'absent', '', 63, '2017-02-05 21:41:14.97109+00');
INSERT INTO attendance_attendance VALUES (547, '2017-02-06', '2017-02-05', 'present', '', 65, '2017-02-05 21:41:14.972274+00');
INSERT INTO attendance_attendance VALUES (548, '2017-02-06', '2017-02-05', 'absent', '', 69, '2017-02-05 21:41:14.976065+00');
INSERT INTO attendance_attendance VALUES (549, '2017-02-06', '2017-02-05', 'present', '', 70, '2017-02-05 21:41:14.977696+00');
INSERT INTO attendance_attendance VALUES (550, '2017-02-06', '2017-02-05', 'absent', '', 71, '2017-02-05 21:41:14.979058+00');
INSERT INTO attendance_attendance VALUES (551, '2017-02-06', '2017-02-05', 'present', '', 72, '2017-02-05 21:41:14.98041+00');
INSERT INTO attendance_attendance VALUES (552, '2017-02-06', '2017-02-05', 'absent', '', 80, '2017-02-05 21:41:14.981584+00');
INSERT INTO attendance_attendance VALUES (553, '2017-02-06', '2017-02-05', 'present', '', 37, '2017-02-05 21:41:15.1312+00');
INSERT INTO attendance_attendance VALUES (554, '2017-02-06', '2017-02-05', 'absent', '', 38, '2017-02-05 21:41:15.134656+00');
INSERT INTO attendance_attendance VALUES (555, '2017-02-06', '2017-02-05', 'present', '', 39, '2017-02-05 21:41:15.13619+00');
INSERT INTO attendance_attendance VALUES (556, '2017-02-06', '2017-02-05', 'present', '', 42, '2017-02-05 21:41:15.137543+00');
INSERT INTO attendance_attendance VALUES (557, '2017-02-06', '2017-02-05', 'absent', '', 43, '2017-02-05 21:41:15.138741+00');
INSERT INTO attendance_attendance VALUES (558, '2017-02-06', '2017-02-05', 'present', '', 44, '2017-02-05 21:41:15.139928+00');
INSERT INTO attendance_attendance VALUES (559, '2017-02-06', '2017-02-05', 'absent', '', 45, '2017-02-05 21:41:15.14111+00');
INSERT INTO attendance_attendance VALUES (560, '2017-02-06', '2017-02-05', 'present', '', 46, '2017-02-05 21:41:15.142307+00');
INSERT INTO attendance_attendance VALUES (561, '2017-02-06', '2017-02-05', 'present', '', 48, '2017-02-05 21:41:15.145158+00');
INSERT INTO attendance_attendance VALUES (562, '2017-02-06', '2017-02-05', 'present', '', 49, '2017-02-05 21:41:15.14666+00');
INSERT INTO attendance_attendance VALUES (563, '2017-02-06', '2017-02-05', 'present', '', 67, '2017-02-05 21:41:15.148001+00');
INSERT INTO attendance_attendance VALUES (564, '2017-02-06', '2017-02-05', 'present', '', 173, '2017-02-05 21:41:15.149188+00');
INSERT INTO attendance_attendance VALUES (565, '2017-02-06', '2017-02-05', 'present', '', 155, '2017-02-05 21:51:19.16678+00');
INSERT INTO attendance_attendance VALUES (566, '2017-02-06', '2017-02-05', 'present', '', 159, '2017-02-05 21:51:19.168842+00');
INSERT INTO attendance_attendance VALUES (567, '2017-02-06', '2017-02-05', 'present', '', 161, '2017-02-05 21:51:19.169726+00');
INSERT INTO attendance_attendance VALUES (568, '2017-02-06', '2017-02-05', 'present', '', 179, '2017-02-05 21:51:19.170942+00');
INSERT INTO attendance_attendance VALUES (569, '2017-02-06', '2017-02-05', 'present', '', 197, '2017-02-05 21:51:19.171787+00');
INSERT INTO attendance_attendance VALUES (570, '2017-02-06', '2017-02-05', 'present', '', 200, '2017-02-05 21:51:19.174204+00');
INSERT INTO attendance_attendance VALUES (571, '2017-02-06', '2017-02-05', 'present', '', 201, '2017-02-05 21:51:19.175156+00');
INSERT INTO attendance_attendance VALUES (572, '2017-02-06', '2017-02-05', 'present', '', 208, '2017-02-05 21:51:19.175882+00');
INSERT INTO attendance_attendance VALUES (573, '2017-02-06', '2017-02-05', 'present', '', 209, '2017-02-05 21:51:19.176587+00');
INSERT INTO attendance_attendance VALUES (574, '2017-02-06', '2017-02-05', 'present', '', 210, '2017-02-05 21:51:19.177344+00');
INSERT INTO attendance_attendance VALUES (575, '2017-02-06', '2017-02-05', 'absent', '', 211, '2017-02-05 21:51:19.178076+00');
INSERT INTO attendance_attendance VALUES (576, '2017-02-06', '2017-02-05', 'present', '', 219, '2017-02-05 21:51:19.178786+00');
INSERT INTO attendance_attendance VALUES (577, '2017-02-06', '2017-02-05', 'present', '', 229, '2017-02-05 21:51:19.179573+00');
INSERT INTO attendance_attendance VALUES (578, '2017-02-06', '2017-02-05', 'present', '', 232, '2017-02-05 21:51:19.180339+00');
INSERT INTO attendance_attendance VALUES (579, '2017-02-06', '2017-02-05', 'present', '', 233, '2017-02-05 21:51:19.181108+00');
INSERT INTO attendance_attendance VALUES (580, '2017-02-06', '2017-02-05', 'present', '', 234, '2017-02-05 21:51:19.181831+00');
INSERT INTO attendance_attendance VALUES (581, '2017-02-06', '2017-02-05', 'present', '', 241, '2017-02-05 21:51:19.18355+00');
INSERT INTO attendance_attendance VALUES (582, '2017-02-06', '2017-02-05', 'present', '', 244, '2017-02-05 21:51:19.18429+00');
INSERT INTO attendance_attendance VALUES (583, '2017-02-06', '2017-02-05', 'present', '', 245, '2017-02-05 21:51:19.185063+00');
INSERT INTO attendance_attendance VALUES (584, '2017-02-06', '2017-02-05', 'absent', '', 247, '2017-02-05 21:51:19.185957+00');
INSERT INTO attendance_attendance VALUES (585, '2017-02-06', '2017-02-05', 'present', '', 248, '2017-02-05 21:51:19.186831+00');
INSERT INTO attendance_attendance VALUES (586, '2017-02-06', '2017-02-05', 'absent', '', 251, '2017-02-05 21:51:19.18774+00');
INSERT INTO attendance_attendance VALUES (587, '2017-02-06', '2017-02-05', 'absent', '', 252, '2017-02-05 21:51:19.188507+00');
INSERT INTO attendance_attendance VALUES (588, '2017-02-06', '2017-02-05', 'absent', '', 256, '2017-02-05 21:51:19.189309+00');
INSERT INTO attendance_attendance VALUES (589, '2017-02-06', '2017-02-05', 'absent', '', 257, '2017-02-05 21:51:19.190105+00');
INSERT INTO attendance_attendance VALUES (590, '2017-02-06', '2017-02-05', 'absent', '', 265, '2017-02-05 21:51:19.191213+00');
INSERT INTO attendance_attendance VALUES (591, '2017-02-06', '2017-02-05', 'absent', '', 269, '2017-02-05 21:51:19.192171+00');
INSERT INTO attendance_attendance VALUES (592, '2017-02-06', '2017-02-05', 'absent', '', 270, '2017-02-05 21:51:19.194921+00');
INSERT INTO attendance_attendance VALUES (593, '2017-02-06', '2017-02-05', 'absent', '', 272, '2017-02-05 21:51:19.195683+00');
INSERT INTO attendance_attendance VALUES (594, '2017-02-06', '2017-02-05', 'absent', '', 276, '2017-02-05 21:51:19.196414+00');
INSERT INTO attendance_attendance VALUES (595, '2017-02-06', '2017-02-05', 'absent', '', 277, '2017-02-05 21:51:19.197498+00');
INSERT INTO attendance_attendance VALUES (596, '2017-02-06', '2017-02-05', 'absent', '', 278, '2017-02-05 21:51:19.198244+00');
INSERT INTO attendance_attendance VALUES (597, '2017-02-06', '2017-02-05', 'absent', '', 279, '2017-02-05 21:51:19.199313+00');
INSERT INTO attendance_attendance VALUES (598, '2017-02-06', '2017-02-05', 'absent', '', 280, '2017-02-05 21:51:19.200211+00');
INSERT INTO attendance_attendance VALUES (599, '2017-02-06', '2017-02-05', 'absent', '', 284, '2017-02-05 21:51:19.20101+00');
INSERT INTO attendance_attendance VALUES (600, '2017-02-06', '2017-02-05', 'absent', '', 286, '2017-02-05 21:51:19.201757+00');
INSERT INTO attendance_attendance VALUES (601, '2017-02-06', '2017-02-05', 'absent', '', 290, '2017-02-05 21:51:19.204211+00');
INSERT INTO attendance_attendance VALUES (602, '2017-02-06', '2017-02-05', 'absent', '', 291, '2017-02-05 21:51:19.204983+00');
INSERT INTO attendance_attendance VALUES (603, '2017-02-06', '2017-02-05', 'absent', '', 292, '2017-02-05 21:51:19.205949+00');
INSERT INTO attendance_attendance VALUES (604, '2017-02-06', '2017-02-05', 'absent', '', 293, '2017-02-05 21:51:19.206914+00');
INSERT INTO attendance_attendance VALUES (605, '2017-02-06', '2017-02-05', 'absent', '', 294, '2017-02-05 21:51:19.208096+00');
INSERT INTO attendance_attendance VALUES (606, '2017-02-06', '2017-02-05', 'absent', '', 295, '2017-02-05 21:51:19.209114+00');
INSERT INTO attendance_attendance VALUES (607, '2017-02-06', '2017-02-05', 'absent', '', 296, '2017-02-05 21:51:19.209984+00');
INSERT INTO attendance_attendance VALUES (608, '2017-02-06', '2017-02-05', 'absent', '', 298, '2017-02-05 21:51:19.211028+00');
INSERT INTO attendance_attendance VALUES (609, '2017-02-06', '2017-02-05', 'absent', '', 299, '2017-02-05 21:51:19.211892+00');
INSERT INTO attendance_attendance VALUES (610, '2017-02-06', '2017-02-05', 'absent', '', 304, '2017-02-05 21:51:19.214032+00');
INSERT INTO attendance_attendance VALUES (611, '2017-02-06', '2017-02-05', 'absent', '', 305, '2017-02-05 21:51:19.214954+00');
INSERT INTO attendance_attendance VALUES (612, '2017-02-06', '2017-02-05', 'absent', '', 308, '2017-02-05 21:51:19.216097+00');
INSERT INTO attendance_attendance VALUES (613, '2017-02-06', '2017-02-05', 'absent', '', 310, '2017-02-05 21:51:19.21728+00');
INSERT INTO attendance_attendance VALUES (614, '2017-02-06', '2017-02-05', 'absent', '', 311, '2017-02-05 21:51:19.21823+00');
INSERT INTO attendance_attendance VALUES (615, '2017-02-06', '2017-02-05', 'absent', '', 316, '2017-02-05 21:51:19.219166+00');
INSERT INTO attendance_attendance VALUES (616, '2017-02-06', '2017-02-05', 'absent', '', 317, '2017-02-05 21:51:19.220228+00');
INSERT INTO attendance_attendance VALUES (617, '2017-02-06', '2017-02-05', 'absent', '', 318, '2017-02-05 21:51:19.22117+00');
INSERT INTO attendance_attendance VALUES (618, '2017-02-06', '2017-02-05', 'absent', '', 319, '2017-02-05 21:51:19.22203+00');
INSERT INTO attendance_attendance VALUES (619, '2017-02-06', '2017-02-05', 'absent', '', 320, '2017-02-05 21:51:19.224207+00');
INSERT INTO attendance_attendance VALUES (620, '2017-02-06', '2017-02-05', 'absent', '', 321, '2017-02-05 21:51:19.225144+00');
INSERT INTO attendance_attendance VALUES (621, '2017-02-06', '2017-02-05', 'absent', '', 322, '2017-02-05 21:51:19.226075+00');
INSERT INTO attendance_attendance VALUES (622, '2017-02-06', '2017-02-05', 'absent', '', 323, '2017-02-05 21:51:19.227006+00');
INSERT INTO attendance_attendance VALUES (623, '2017-02-06', '2017-02-05', 'absent', '', 324, '2017-02-05 21:51:19.22772+00');
INSERT INTO attendance_attendance VALUES (624, '2017-02-06', '2017-02-05', 'absent', '', 325, '2017-02-05 21:51:19.228484+00');
INSERT INTO attendance_attendance VALUES (625, '2017-02-06', '2017-02-05', 'absent', '', 326, '2017-02-05 21:51:19.229186+00');
INSERT INTO attendance_attendance VALUES (626, '2017-02-06', '2017-02-05', 'absent', '', 328, '2017-02-05 21:51:19.230246+00');
INSERT INTO attendance_attendance VALUES (627, '2017-02-06', '2017-02-05', 'absent', '', 329, '2017-02-05 21:51:19.231262+00');
INSERT INTO attendance_attendance VALUES (628, '2017-02-06', '2017-02-05', 'absent', '', 330, '2017-02-05 21:51:19.232269+00');
INSERT INTO attendance_attendance VALUES (629, '2017-02-06', '2017-02-05', 'absent', '', 331, '2017-02-05 21:51:19.235022+00');
INSERT INTO attendance_attendance VALUES (630, '2017-02-06', '2017-02-05', 'absent', '', 332, '2017-02-05 21:51:19.236034+00');
INSERT INTO attendance_attendance VALUES (631, '2017-02-06', '2017-02-05', 'absent', '', 333, '2017-02-05 21:51:19.236869+00');
INSERT INTO attendance_attendance VALUES (632, '2017-02-06', '2017-02-05', 'absent', '', 123, '2017-02-05 21:51:19.420348+00');
INSERT INTO attendance_attendance VALUES (633, '2017-02-06', '2017-02-05', 'absent', '', 142, '2017-02-05 21:51:19.421531+00');
INSERT INTO attendance_attendance VALUES (634, '2017-02-06', '2017-02-05', 'absent', '', 151, '2017-02-05 21:51:19.423532+00');
INSERT INTO attendance_attendance VALUES (635, '2017-02-06', '2017-02-05', 'absent', '', 152, '2017-02-05 21:51:19.424541+00');
INSERT INTO attendance_attendance VALUES (636, '2017-02-06', '2017-02-05', 'absent', '', 153, '2017-02-05 21:51:19.425404+00');
INSERT INTO attendance_attendance VALUES (637, '2017-02-06', '2017-02-05', 'absent', '', 154, '2017-02-05 21:51:19.426245+00');
INSERT INTO attendance_attendance VALUES (638, '2017-02-06', '2017-02-05', 'absent', '', 157, '2017-02-05 21:51:19.427327+00');
INSERT INTO attendance_attendance VALUES (639, '2017-02-06', '2017-02-05', 'absent', '', 162, '2017-02-05 21:51:19.428072+00');
INSERT INTO attendance_attendance VALUES (640, '2017-02-06', '2017-02-05', 'absent', '', 163, '2017-02-05 21:51:19.429006+00');
INSERT INTO attendance_attendance VALUES (641, '2017-02-06', '2017-02-05', 'absent', '', 176, '2017-02-05 21:51:19.429722+00');
INSERT INTO attendance_attendance VALUES (642, '2017-02-06', '2017-02-05', 'absent', '', 202, '2017-02-05 21:51:19.43062+00');
INSERT INTO attendance_attendance VALUES (643, '2017-02-06', '2017-02-05', 'absent', '', 214, '2017-02-05 21:51:19.431403+00');
INSERT INTO attendance_attendance VALUES (644, '2017-02-06', '2017-02-05', 'present', '', 216, '2017-02-05 21:51:19.432156+00');
INSERT INTO attendance_attendance VALUES (645, '2017-02-06', '2017-02-05', 'present', '', 220, '2017-02-05 21:51:19.433802+00');
INSERT INTO attendance_attendance VALUES (646, '2017-02-06', '2017-02-05', 'present', '', 222, '2017-02-05 21:51:19.434532+00');
INSERT INTO attendance_attendance VALUES (647, '2017-02-06', '2017-02-05', 'absent', '', 223, '2017-02-05 21:51:19.435259+00');
INSERT INTO attendance_attendance VALUES (648, '2017-02-06', '2017-02-05', 'present', '', 226, '2017-02-05 21:51:19.43616+00');
INSERT INTO attendance_attendance VALUES (649, '2017-02-06', '2017-02-05', 'present', '', 228, '2017-02-05 21:51:19.437212+00');
INSERT INTO attendance_attendance VALUES (650, '2017-02-06', '2017-02-05', 'present', '', 236, '2017-02-05 21:51:19.438137+00');
INSERT INTO attendance_attendance VALUES (651, '2017-02-06', '2017-02-05', 'present', '', 258, '2017-02-05 21:51:19.439038+00');
INSERT INTO attendance_attendance VALUES (652, '2017-02-06', '2017-02-05', 'present', '', 262, '2017-02-05 21:51:19.43977+00');
INSERT INTO attendance_attendance VALUES (653, '2017-02-06', '2017-02-05', 'present', '', 263, '2017-02-05 21:51:19.440485+00');
INSERT INTO attendance_attendance VALUES (654, '2017-02-06', '2017-02-05', 'present', '', 266, '2017-02-05 21:51:19.441237+00');
INSERT INTO attendance_attendance VALUES (655, '2017-02-06', '2017-02-05', 'absent', '', 281, '2017-02-05 21:51:19.441981+00');
INSERT INTO attendance_attendance VALUES (656, '2017-02-06', '2017-02-05', 'absent', '', 297, '2017-02-05 21:51:19.443605+00');
INSERT INTO attendance_attendance VALUES (657, '2017-02-06', '2017-02-05', 'present', '', 301, '2017-02-05 21:51:19.444699+00');
INSERT INTO attendance_attendance VALUES (658, '2017-02-06', '2017-02-05', 'absent', '', 313, '2017-02-05 21:51:19.44546+00');
INSERT INTO attendance_attendance VALUES (659, '2017-02-06', '2017-02-05', 'present', '', 315, '2017-02-05 21:51:19.446221+00');
INSERT INTO attendance_attendance VALUES (660, '2017-02-06', '2017-02-05', 'present', '', 110, '2017-02-05 21:51:19.556737+00');
INSERT INTO attendance_attendance VALUES (661, '2017-02-06', '2017-02-05', 'absent', '', 113, '2017-02-05 21:51:19.557696+00');
INSERT INTO attendance_attendance VALUES (662, '2017-02-06', '2017-02-05', 'present', '', 115, '2017-02-05 21:51:19.558433+00');
INSERT INTO attendance_attendance VALUES (663, '2017-02-06', '2017-02-05', 'present', '', 128, '2017-02-05 21:51:19.559163+00');
INSERT INTO attendance_attendance VALUES (664, '2017-02-06', '2017-02-05', 'present', '', 141, '2017-02-05 21:51:19.559963+00');
INSERT INTO attendance_attendance VALUES (665, '2017-02-06', '2017-02-05', 'present', '', 144, '2017-02-05 21:51:19.560693+00');
INSERT INTO attendance_attendance VALUES (666, '2017-02-06', '2017-02-05', 'present', '', 149, '2017-02-05 21:51:19.561517+00');
INSERT INTO attendance_attendance VALUES (667, '2017-02-06', '2017-02-05', 'present', '', 150, '2017-02-05 21:51:19.562261+00');
INSERT INTO attendance_attendance VALUES (668, '2017-02-06', '2017-02-05', 'present', '', 156, '2017-02-05 21:51:19.564882+00');
INSERT INTO attendance_attendance VALUES (669, '2017-02-06', '2017-02-05', 'absent', '', 158, '2017-02-05 21:51:19.565748+00');
INSERT INTO attendance_attendance VALUES (670, '2017-02-06', '2017-02-05', 'absent', '', 188, '2017-02-05 21:51:19.566509+00');
INSERT INTO attendance_attendance VALUES (671, '2017-02-06', '2017-02-05', 'present', '', 192, '2017-02-05 21:51:19.567257+00');
INSERT INTO attendance_attendance VALUES (672, '2017-02-06', '2017-02-05', 'present', '', 199, '2017-02-05 21:51:19.567986+00');
INSERT INTO attendance_attendance VALUES (673, '2017-02-06', '2017-02-05', 'present', '', 205, '2017-02-05 21:51:19.568705+00');
INSERT INTO attendance_attendance VALUES (674, '2017-02-06', '2017-02-05', 'present', '', 246, '2017-02-05 21:51:19.569409+00');
INSERT INTO attendance_attendance VALUES (675, '2017-02-06', '2017-02-05', 'present', '', 282, '2017-02-05 21:51:19.570122+00');
INSERT INTO attendance_attendance VALUES (676, '2017-02-06', '2017-02-05', 'present', '', 285, '2017-02-05 21:51:19.570831+00');
INSERT INTO attendance_attendance VALUES (677, '2017-02-06', '2017-02-05', 'present', '', 64, '2017-02-05 21:51:19.743722+00');
INSERT INTO attendance_attendance VALUES (678, '2017-02-06', '2017-02-05', 'present', '', 66, '2017-02-05 21:51:19.744902+00');
INSERT INTO attendance_attendance VALUES (679, '2017-02-06', '2017-02-05', 'present', '', 76, '2017-02-05 21:51:19.745842+00');
INSERT INTO attendance_attendance VALUES (680, '2017-02-06', '2017-02-05', 'present', '', 87, '2017-02-05 21:51:19.74657+00');
INSERT INTO attendance_attendance VALUES (681, '2017-02-06', '2017-02-05', 'present', '', 89, '2017-02-05 21:51:19.747424+00');
INSERT INTO attendance_attendance VALUES (682, '2017-02-06', '2017-02-05', 'present', '', 100, '2017-02-05 21:51:19.748179+00');
INSERT INTO attendance_attendance VALUES (683, '2017-02-06', '2017-02-05', 'present', '', 108, '2017-02-05 21:51:19.749113+00');
INSERT INTO attendance_attendance VALUES (684, '2017-02-06', '2017-02-05', 'present', '', 114, '2017-02-05 21:51:19.749882+00');
INSERT INTO attendance_attendance VALUES (685, '2017-02-06', '2017-02-05', 'present', '', 116, '2017-02-05 21:51:19.750768+00');
INSERT INTO attendance_attendance VALUES (686, '2017-02-06', '2017-02-05', 'present', '', 117, '2017-02-05 21:51:19.751724+00');
INSERT INTO attendance_attendance VALUES (687, '2017-02-06', '2017-02-05', 'present', '', 118, '2017-02-05 21:51:19.75329+00');
INSERT INTO attendance_attendance VALUES (688, '2017-02-06', '2017-02-05', 'present', '', 119, '2017-02-05 21:51:19.754573+00');
INSERT INTO attendance_attendance VALUES (689, '2017-02-06', '2017-02-05', 'present', '', 120, '2017-02-05 21:51:19.755327+00');
INSERT INTO attendance_attendance VALUES (690, '2017-02-06', '2017-02-05', 'present', '', 121, '2017-02-05 21:51:19.756037+00');
INSERT INTO attendance_attendance VALUES (691, '2017-02-06', '2017-02-05', 'present', '', 130, '2017-02-05 21:51:19.75694+00');
INSERT INTO attendance_attendance VALUES (692, '2017-02-06', '2017-02-05', 'present', '', 138, '2017-02-05 21:51:19.757677+00');
INSERT INTO attendance_attendance VALUES (693, '2017-02-06', '2017-02-05', 'present', '', 145, '2017-02-05 21:51:19.758743+00');
INSERT INTO attendance_attendance VALUES (694, '2017-02-06', '2017-02-05', 'present', '', 165, '2017-02-05 21:51:19.759561+00');
INSERT INTO attendance_attendance VALUES (695, '2017-02-06', '2017-02-05', 'present', '', 185, '2017-02-05 21:51:19.760398+00');
INSERT INTO attendance_attendance VALUES (696, '2017-02-06', '2017-02-05', 'present', '', 189, '2017-02-05 21:51:19.761171+00');
INSERT INTO attendance_attendance VALUES (697, '2017-02-06', '2017-02-05', 'present', '', 204, '2017-02-05 21:51:19.761979+00');
INSERT INTO attendance_attendance VALUES (698, '2017-02-06', '2017-02-05', 'present', '', 221, '2017-02-05 21:51:19.763669+00');
INSERT INTO attendance_attendance VALUES (699, '2017-02-06', '2017-02-05', 'present', '', 225, '2017-02-05 21:51:19.764434+00');
INSERT INTO attendance_attendance VALUES (700, '2017-02-06', '2017-02-05', 'present', '', 271, '2017-02-05 21:51:19.765193+00');
INSERT INTO attendance_attendance VALUES (701, '2017-02-06', '2017-02-05', 'absent', '', 300, '2017-02-05 21:51:19.765952+00');
INSERT INTO attendance_attendance VALUES (702, '2017-02-06', '2017-02-05', 'present', '', 74, '2017-02-05 21:51:19.983588+00');
INSERT INTO attendance_attendance VALUES (703, '2017-02-06', '2017-02-05', 'present', '', 75, '2017-02-05 21:51:19.98476+00');
INSERT INTO attendance_attendance VALUES (704, '2017-02-06', '2017-02-05', 'present', '', 78, '2017-02-05 21:51:19.9859+00');
INSERT INTO attendance_attendance VALUES (705, '2017-02-06', '2017-02-05', 'present', '', 82, '2017-02-05 21:51:19.98676+00');
INSERT INTO attendance_attendance VALUES (706, '2017-02-06', '2017-02-05', 'present', '', 83, '2017-02-05 21:51:19.987478+00');
INSERT INTO attendance_attendance VALUES (707, '2017-02-06', '2017-02-05', 'present', '', 85, '2017-02-05 21:51:19.988213+00');
INSERT INTO attendance_attendance VALUES (708, '2017-02-06', '2017-02-05', 'present', '', 86, '2017-02-05 21:51:19.989195+00');
INSERT INTO attendance_attendance VALUES (709, '2017-02-06', '2017-02-05', 'present', '', 91, '2017-02-05 21:51:19.990093+00');
INSERT INTO attendance_attendance VALUES (710, '2017-02-06', '2017-02-05', 'present', '', 93, '2017-02-05 21:51:19.990886+00');
INSERT INTO attendance_attendance VALUES (711, '2017-02-06', '2017-02-05', 'present', '', 94, '2017-02-05 21:51:19.991756+00');
INSERT INTO attendance_attendance VALUES (712, '2017-02-06', '2017-02-05', 'present', '', 103, '2017-02-05 21:51:19.993113+00');
INSERT INTO attendance_attendance VALUES (713, '2017-02-06', '2017-02-05', 'present', '', 104, '2017-02-05 21:51:19.994022+00');
INSERT INTO attendance_attendance VALUES (714, '2017-02-06', '2017-02-05', 'present', '', 105, '2017-02-05 21:51:19.994842+00');
INSERT INTO attendance_attendance VALUES (715, '2017-02-06', '2017-02-05', 'present', '', 107, '2017-02-05 21:51:19.995596+00');
INSERT INTO attendance_attendance VALUES (716, '2017-02-06', '2017-02-05', 'present', '', 109, '2017-02-05 21:51:19.996385+00');
INSERT INTO attendance_attendance VALUES (717, '2017-02-06', '2017-02-05', 'present', '', 112, '2017-02-05 21:51:19.997117+00');
INSERT INTO attendance_attendance VALUES (718, '2017-02-06', '2017-02-05', 'present', '', 122, '2017-02-05 21:51:19.997883+00');
INSERT INTO attendance_attendance VALUES (719, '2017-02-06', '2017-02-05', 'present', '', 126, '2017-02-05 21:51:19.998749+00');
INSERT INTO attendance_attendance VALUES (720, '2017-02-06', '2017-02-05', 'present', '', 127, '2017-02-05 21:51:19.9995+00');
INSERT INTO attendance_attendance VALUES (721, '2017-02-06', '2017-02-05', 'present', '', 131, '2017-02-05 21:51:20.000259+00');
INSERT INTO attendance_attendance VALUES (722, '2017-02-06', '2017-02-05', 'present', '', 132, '2017-02-05 21:51:20.0011+00');
INSERT INTO attendance_attendance VALUES (723, '2017-02-06', '2017-02-05', 'present', '', 133, '2017-02-05 21:51:20.001852+00');
INSERT INTO attendance_attendance VALUES (724, '2017-02-06', '2017-02-05', 'present', '', 137, '2017-02-05 21:51:20.004286+00');
INSERT INTO attendance_attendance VALUES (725, '2017-02-06', '2017-02-05', 'present', '', 164, '2017-02-05 21:51:20.005281+00');
INSERT INTO attendance_attendance VALUES (726, '2017-02-06', '2017-02-05', 'present', '', 166, '2017-02-05 21:51:20.006034+00');
INSERT INTO attendance_attendance VALUES (727, '2017-02-06', '2017-02-05', 'present', '', 174, '2017-02-05 21:51:20.006805+00');
INSERT INTO attendance_attendance VALUES (728, '2017-02-06', '2017-02-05', 'present', '', 175, '2017-02-05 21:51:20.007682+00');
INSERT INTO attendance_attendance VALUES (729, '2017-02-06', '2017-02-05', 'present', '', 177, '2017-02-05 21:51:20.008438+00');
INSERT INTO attendance_attendance VALUES (730, '2017-02-06', '2017-02-05', 'present', '', 182, '2017-02-05 21:51:20.009165+00');
INSERT INTO attendance_attendance VALUES (731, '2017-02-06', '2017-02-05', 'present', '', 186, '2017-02-05 21:51:20.010006+00');
INSERT INTO attendance_attendance VALUES (732, '2017-02-06', '2017-02-05', 'present', '', 195, '2017-02-05 21:51:20.010769+00');
INSERT INTO attendance_attendance VALUES (733, '2017-02-06', '2017-02-05', 'present', '', 198, '2017-02-05 21:51:20.011543+00');
INSERT INTO attendance_attendance VALUES (734, '2017-02-06', '2017-02-05', 'present', '', 227, '2017-02-05 21:51:20.012248+00');
INSERT INTO attendance_attendance VALUES (735, '2017-02-06', '2017-02-05', 'present', '', 303, '2017-02-05 21:51:20.014597+00');
INSERT INTO attendance_attendance VALUES (861, '2017-02-05', '2017-02-06', 'absent', '', 173, '2017-02-06 06:42:49.728306+00');
INSERT INTO attendance_attendance VALUES (862, '2017-02-10', '2017-02-09', 'present', '', 155, '2017-02-09 22:22:45.602203+00');
INSERT INTO attendance_attendance VALUES (863, '2017-02-10', '2017-02-09', 'present', '', 159, '2017-02-09 22:22:45.607462+00');
INSERT INTO attendance_attendance VALUES (864, '2017-02-10', '2017-02-09', 'present', '', 161, '2017-02-09 22:22:45.608374+00');
INSERT INTO attendance_attendance VALUES (865, '2017-02-10', '2017-02-09', 'present', '', 179, '2017-02-09 22:22:45.609251+00');
INSERT INTO attendance_attendance VALUES (866, '2017-02-10', '2017-02-09', 'present', '', 197, '2017-02-09 22:22:45.610143+00');
INSERT INTO attendance_attendance VALUES (867, '2017-02-10', '2017-02-09', 'present', '', 200, '2017-02-09 22:22:45.611065+00');
INSERT INTO attendance_attendance VALUES (868, '2017-02-10', '2017-02-09', 'present', '', 201, '2017-02-09 22:22:45.611957+00');
INSERT INTO attendance_attendance VALUES (869, '2017-02-10', '2017-02-09', 'absent', '', 208, '2017-02-09 22:22:45.615226+00');
INSERT INTO attendance_attendance VALUES (870, '2017-02-10', '2017-02-09', 'present', '', 209, '2017-02-09 22:22:45.616215+00');
INSERT INTO attendance_attendance VALUES (871, '2017-02-10', '2017-02-09', 'absent', '', 210, '2017-02-09 22:22:45.617019+00');
INSERT INTO attendance_attendance VALUES (872, '2017-02-10', '2017-02-09', 'present', '', 211, '2017-02-09 22:22:45.617989+00');
INSERT INTO attendance_attendance VALUES (873, '2017-02-10', '2017-02-09', 'absent', '', 219, '2017-02-09 22:22:45.618794+00');
INSERT INTO attendance_attendance VALUES (874, '2017-02-10', '2017-02-09', 'present', '', 229, '2017-02-09 22:22:45.619569+00');
INSERT INTO attendance_attendance VALUES (875, '2017-02-10', '2017-02-09', 'present', '', 232, '2017-02-09 22:22:45.620402+00');
INSERT INTO attendance_attendance VALUES (876, '2017-02-10', '2017-02-09', 'present', '', 233, '2017-02-09 22:22:45.621181+00');
INSERT INTO attendance_attendance VALUES (877, '2017-02-10', '2017-02-09', 'present', '', 234, '2017-02-09 22:22:45.621991+00');
INSERT INTO attendance_attendance VALUES (878, '2017-02-10', '2017-02-09', 'absent', '', 241, '2017-02-09 22:22:45.624094+00');
INSERT INTO attendance_attendance VALUES (879, '2017-02-10', '2017-02-09', 'present', '', 244, '2017-02-09 22:22:45.625074+00');
INSERT INTO attendance_attendance VALUES (880, '2017-02-10', '2017-02-09', 'present', '', 245, '2017-02-09 22:22:45.626082+00');
INSERT INTO attendance_attendance VALUES (881, '2017-02-10', '2017-02-09', 'present', '', 247, '2017-02-09 22:22:45.627038+00');
INSERT INTO attendance_attendance VALUES (882, '2017-02-10', '2017-02-09', 'present', '', 248, '2017-02-09 22:22:45.627836+00');
INSERT INTO attendance_attendance VALUES (883, '2017-02-10', '2017-02-09', 'absent', '', 251, '2017-02-09 22:22:45.62861+00');
INSERT INTO attendance_attendance VALUES (884, '2017-02-10', '2017-02-09', 'present', '', 252, '2017-02-09 22:22:45.629399+00');
INSERT INTO attendance_attendance VALUES (885, '2017-02-10', '2017-02-09', 'absent', '', 256, '2017-02-09 22:22:45.630175+00');
INSERT INTO attendance_attendance VALUES (886, '2017-02-10', '2017-02-09', 'present', '', 257, '2017-02-09 22:22:45.630949+00');
INSERT INTO attendance_attendance VALUES (887, '2017-02-10', '2017-02-09', 'present', '', 265, '2017-02-09 22:22:45.631721+00');
INSERT INTO attendance_attendance VALUES (888, '2017-02-10', '2017-02-09', 'absent', '', 269, '2017-02-09 22:22:45.634384+00');
INSERT INTO attendance_attendance VALUES (889, '2017-02-10', '2017-02-09', 'present', '', 270, '2017-02-09 22:22:45.635402+00');
INSERT INTO attendance_attendance VALUES (890, '2017-02-10', '2017-02-09', 'absent', '', 272, '2017-02-09 22:22:45.636383+00');
INSERT INTO attendance_attendance VALUES (891, '2017-02-10', '2017-02-09', 'present', '', 276, '2017-02-09 22:22:45.637484+00');
INSERT INTO attendance_attendance VALUES (892, '2017-02-10', '2017-02-09', 'absent', '', 277, '2017-02-09 22:22:45.638524+00');
INSERT INTO attendance_attendance VALUES (893, '2017-02-10', '2017-02-09', 'present', '', 278, '2017-02-09 22:22:45.639565+00');
INSERT INTO attendance_attendance VALUES (894, '2017-02-10', '2017-02-09', 'absent', '', 279, '2017-02-09 22:22:45.640575+00');
INSERT INTO attendance_attendance VALUES (895, '2017-02-10', '2017-02-09', 'present', '', 280, '2017-02-09 22:22:45.641974+00');
INSERT INTO attendance_attendance VALUES (896, '2017-02-10', '2017-02-09', 'absent', '', 284, '2017-02-09 22:22:45.64428+00');
INSERT INTO attendance_attendance VALUES (897, '2017-02-10', '2017-02-09', 'present', '', 286, '2017-02-09 22:22:45.645422+00');
INSERT INTO attendance_attendance VALUES (898, '2017-02-10', '2017-02-09', 'absent', '', 290, '2017-02-09 22:22:45.646425+00');
INSERT INTO attendance_attendance VALUES (899, '2017-02-10', '2017-02-09', 'present', '', 291, '2017-02-09 22:22:45.647572+00');
INSERT INTO attendance_attendance VALUES (900, '2017-02-10', '2017-02-09', 'present', '', 292, '2017-02-09 22:22:45.648685+00');
INSERT INTO attendance_attendance VALUES (901, '2017-02-10', '2017-02-09', 'absent', '', 293, '2017-02-09 22:22:45.649806+00');
INSERT INTO attendance_attendance VALUES (902, '2017-02-10', '2017-02-09', 'present', '', 294, '2017-02-09 22:22:45.650871+00');
INSERT INTO attendance_attendance VALUES (903, '2017-02-10', '2017-02-09', 'present', '', 295, '2017-02-09 22:22:45.65198+00');
INSERT INTO attendance_attendance VALUES (904, '2017-02-10', '2017-02-09', 'present', '', 296, '2017-02-09 22:22:45.654854+00');
INSERT INTO attendance_attendance VALUES (905, '2017-02-10', '2017-02-09', 'present', '', 298, '2017-02-09 22:22:45.657099+00');
INSERT INTO attendance_attendance VALUES (906, '2017-02-10', '2017-02-09', 'present', '', 299, '2017-02-09 22:22:45.658484+00');
INSERT INTO attendance_attendance VALUES (907, '2017-02-10', '2017-02-09', 'absent', '', 304, '2017-02-09 22:22:45.659675+00');
INSERT INTO attendance_attendance VALUES (908, '2017-02-10', '2017-02-09', 'absent', '', 305, '2017-02-09 22:22:45.66077+00');
INSERT INTO attendance_attendance VALUES (909, '2017-02-10', '2017-02-09', 'absent', '', 308, '2017-02-09 22:22:45.662009+00');
INSERT INTO attendance_attendance VALUES (910, '2017-02-10', '2017-02-09', 'present', '', 310, '2017-02-09 22:22:45.664724+00');
INSERT INTO attendance_attendance VALUES (911, '2017-02-10', '2017-02-09', 'absent', '', 311, '2017-02-09 22:22:45.665757+00');
INSERT INTO attendance_attendance VALUES (912, '2017-02-10', '2017-02-09', 'present', '', 316, '2017-02-09 22:22:45.6669+00');
INSERT INTO attendance_attendance VALUES (913, '2017-02-10', '2017-02-09', 'absent', '', 317, '2017-02-09 22:22:45.667952+00');
INSERT INTO attendance_attendance VALUES (914, '2017-02-10', '2017-02-09', 'absent', '', 318, '2017-02-09 22:22:45.670144+00');
INSERT INTO attendance_attendance VALUES (915, '2017-02-10', '2017-02-09', 'absent', '', 319, '2017-02-09 22:22:45.671184+00');
INSERT INTO attendance_attendance VALUES (916, '2017-02-10', '2017-02-09', 'present', '', 320, '2017-02-09 22:22:45.672268+00');
INSERT INTO attendance_attendance VALUES (917, '2017-02-10', '2017-02-09', 'present', '', 321, '2017-02-09 22:22:45.674835+00');
INSERT INTO attendance_attendance VALUES (918, '2017-02-10', '2017-02-09', 'absent', '', 322, '2017-02-09 22:22:45.675887+00');
INSERT INTO attendance_attendance VALUES (919, '2017-02-10', '2017-02-09', 'present', '', 323, '2017-02-09 22:22:45.677072+00');
INSERT INTO attendance_attendance VALUES (920, '2017-02-10', '2017-02-09', 'absent', '', 324, '2017-02-09 22:22:45.678169+00');
INSERT INTO attendance_attendance VALUES (921, '2017-02-10', '2017-02-09', 'present', '', 325, '2017-02-09 22:22:45.679512+00');
INSERT INTO attendance_attendance VALUES (922, '2017-02-10', '2017-02-09', 'absent', '', 326, '2017-02-09 22:22:45.6806+00');
INSERT INTO attendance_attendance VALUES (923, '2017-02-10', '2017-02-09', 'present', '', 328, '2017-02-09 22:22:45.681662+00');
INSERT INTO attendance_attendance VALUES (924, '2017-02-10', '2017-02-09', 'present', '', 329, '2017-02-09 22:22:45.684998+00');
INSERT INTO attendance_attendance VALUES (925, '2017-02-10', '2017-02-09', 'present', '', 330, '2017-02-09 22:22:45.686944+00');
INSERT INTO attendance_attendance VALUES (926, '2017-02-10', '2017-02-09', 'present', '', 331, '2017-02-09 22:22:45.688643+00');
INSERT INTO attendance_attendance VALUES (927, '2017-02-10', '2017-02-09', 'present', '', 332, '2017-02-09 22:22:45.689725+00');
INSERT INTO attendance_attendance VALUES (928, '2017-02-10', '2017-02-09', 'present', '', 333, '2017-02-09 22:22:45.690775+00');
INSERT INTO attendance_attendance VALUES (929, '2017-02-10', '2017-02-09', 'present', '', 123, '2017-02-09 22:22:45.909509+00');
INSERT INTO attendance_attendance VALUES (930, '2017-02-10', '2017-02-09', 'present', '', 142, '2017-02-09 22:22:45.910857+00');
INSERT INTO attendance_attendance VALUES (931, '2017-02-10', '2017-02-09', 'present', '', 151, '2017-02-09 22:22:45.911948+00');
INSERT INTO attendance_attendance VALUES (932, '2017-02-10', '2017-02-09', 'present', '', 152, '2017-02-09 22:22:45.914292+00');
INSERT INTO attendance_attendance VALUES (933, '2017-02-10', '2017-02-09', 'absent', '', 153, '2017-02-09 22:22:45.915238+00');
INSERT INTO attendance_attendance VALUES (934, '2017-02-10', '2017-02-09', 'present', '', 154, '2017-02-09 22:22:45.916132+00');
INSERT INTO attendance_attendance VALUES (935, '2017-02-10', '2017-02-09', 'absent', '', 157, '2017-02-09 22:22:45.917213+00');
INSERT INTO attendance_attendance VALUES (936, '2017-02-10', '2017-02-09', 'present', '', 162, '2017-02-09 22:22:45.918276+00');
INSERT INTO attendance_attendance VALUES (937, '2017-02-10', '2017-02-09', 'absent', '', 163, '2017-02-09 22:22:45.91935+00');
INSERT INTO attendance_attendance VALUES (938, '2017-02-10', '2017-02-09', 'present', '', 176, '2017-02-09 22:22:45.92074+00');
INSERT INTO attendance_attendance VALUES (939, '2017-02-10', '2017-02-09', 'absent', '', 202, '2017-02-09 22:22:45.922057+00');
INSERT INTO attendance_attendance VALUES (940, '2017-02-10', '2017-02-09', 'present', '', 214, '2017-02-09 22:22:45.925138+00');
INSERT INTO attendance_attendance VALUES (941, '2017-02-10', '2017-02-09', 'absent', '', 216, '2017-02-09 22:22:45.926336+00');
INSERT INTO attendance_attendance VALUES (942, '2017-02-10', '2017-02-09', 'present', '', 220, '2017-02-09 22:22:45.927529+00');
INSERT INTO attendance_attendance VALUES (943, '2017-02-10', '2017-02-09', 'absent', '', 222, '2017-02-09 22:22:45.928544+00');
INSERT INTO attendance_attendance VALUES (944, '2017-02-10', '2017-02-09', 'present', '', 223, '2017-02-09 22:22:45.929506+00');
INSERT INTO attendance_attendance VALUES (945, '2017-02-10', '2017-02-09', 'absent', '', 226, '2017-02-09 22:22:45.930556+00');
INSERT INTO attendance_attendance VALUES (946, '2017-02-10', '2017-02-09', 'present', '', 228, '2017-02-09 22:22:45.931605+00');
INSERT INTO attendance_attendance VALUES (947, '2017-02-10', '2017-02-09', 'absent', '', 236, '2017-02-09 22:22:45.934749+00');
INSERT INTO attendance_attendance VALUES (948, '2017-02-10', '2017-02-09', 'present', '', 258, '2017-02-09 22:22:45.935829+00');
INSERT INTO attendance_attendance VALUES (949, '2017-02-10', '2017-02-09', 'absent', '', 262, '2017-02-09 22:22:45.937193+00');
INSERT INTO attendance_attendance VALUES (950, '2017-02-10', '2017-02-09', 'present', '', 263, '2017-02-09 22:22:45.938214+00');
INSERT INTO attendance_attendance VALUES (951, '2017-02-10', '2017-02-09', 'absent', '', 266, '2017-02-09 22:22:45.939258+00');
INSERT INTO attendance_attendance VALUES (952, '2017-02-10', '2017-02-09', 'present', '', 281, '2017-02-09 22:22:45.940333+00');
INSERT INTO attendance_attendance VALUES (953, '2017-02-10', '2017-02-09', 'present', '', 297, '2017-02-09 22:22:45.941364+00');
INSERT INTO attendance_attendance VALUES (954, '2017-02-10', '2017-02-09', 'present', '', 301, '2017-02-09 22:22:45.944111+00');
INSERT INTO attendance_attendance VALUES (955, '2017-02-10', '2017-02-09', 'absent', '', 313, '2017-02-09 22:22:45.945471+00');
INSERT INTO attendance_attendance VALUES (956, '2017-02-10', '2017-02-09', 'present', '', 315, '2017-02-09 22:22:45.946531+00');
INSERT INTO attendance_attendance VALUES (957, '2017-02-10', '2017-02-09', 'present', '', 110, '2017-02-09 22:22:46.066367+00');
INSERT INTO attendance_attendance VALUES (958, '2017-02-10', '2017-02-09', 'present', '', 113, '2017-02-09 22:22:46.067382+00');
INSERT INTO attendance_attendance VALUES (959, '2017-02-10', '2017-02-09', 'present', '', 115, '2017-02-09 22:22:46.068231+00');
INSERT INTO attendance_attendance VALUES (960, '2017-02-10', '2017-02-09', 'present', '', 128, '2017-02-09 22:22:46.069061+00');
INSERT INTO attendance_attendance VALUES (961, '2017-02-10', '2017-02-09', 'absent', '', 141, '2017-02-09 22:22:46.06999+00');
INSERT INTO attendance_attendance VALUES (962, '2017-02-10', '2017-02-09', 'present', '', 144, '2017-02-09 22:22:46.070779+00');
INSERT INTO attendance_attendance VALUES (963, '2017-02-10', '2017-02-09', 'present', '', 149, '2017-02-09 22:22:46.071585+00');
INSERT INTO attendance_attendance VALUES (964, '2017-02-10', '2017-02-09', 'present', '', 150, '2017-02-09 22:22:46.073417+00');
INSERT INTO attendance_attendance VALUES (965, '2017-02-10', '2017-02-09', 'present', '', 156, '2017-02-09 22:22:46.07422+00');
INSERT INTO attendance_attendance VALUES (966, '2017-02-10', '2017-02-09', 'present', '', 158, '2017-02-09 22:22:46.075189+00');
INSERT INTO attendance_attendance VALUES (967, '2017-02-10', '2017-02-09', 'present', '', 188, '2017-02-09 22:22:46.075963+00');
INSERT INTO attendance_attendance VALUES (968, '2017-02-10', '2017-02-09', 'present', '', 192, '2017-02-09 22:22:46.077073+00');
INSERT INTO attendance_attendance VALUES (969, '2017-02-10', '2017-02-09', 'present', '', 199, '2017-02-09 22:22:46.078066+00');
INSERT INTO attendance_attendance VALUES (970, '2017-02-10', '2017-02-09', 'present', '', 205, '2017-02-09 22:22:46.078874+00');
INSERT INTO attendance_attendance VALUES (971, '2017-02-10', '2017-02-09', 'present', '', 246, '2017-02-09 22:22:46.079658+00');
INSERT INTO attendance_attendance VALUES (972, '2017-02-10', '2017-02-09', 'present', '', 282, '2017-02-09 22:22:46.080445+00');
INSERT INTO attendance_attendance VALUES (973, '2017-02-10', '2017-02-09', 'absent', '', 285, '2017-02-09 22:22:46.08121+00');
INSERT INTO attendance_attendance VALUES (974, '2017-02-10', '2017-02-09', 'present', '', 64, '2017-02-09 22:22:46.228312+00');
INSERT INTO attendance_attendance VALUES (975, '2017-02-10', '2017-02-09', 'present', '', 66, '2017-02-09 22:22:46.229387+00');
INSERT INTO attendance_attendance VALUES (976, '2017-02-10', '2017-02-09', 'present', '', 76, '2017-02-09 22:22:46.230283+00');
INSERT INTO attendance_attendance VALUES (977, '2017-02-10', '2017-02-09', 'present', '', 87, '2017-02-09 22:22:46.23116+00');
INSERT INTO attendance_attendance VALUES (978, '2017-02-10', '2017-02-09', 'present', '', 89, '2017-02-09 22:22:46.232248+00');
INSERT INTO attendance_attendance VALUES (979, '2017-02-10', '2017-02-09', 'present', '', 100, '2017-02-09 22:22:46.234261+00');
INSERT INTO attendance_attendance VALUES (980, '2017-02-10', '2017-02-09', 'present', '', 108, '2017-02-09 22:22:46.235135+00');
INSERT INTO attendance_attendance VALUES (981, '2017-02-10', '2017-02-09', 'present', '', 114, '2017-02-09 22:22:46.235963+00');
INSERT INTO attendance_attendance VALUES (982, '2017-02-10', '2017-02-09', 'present', '', 116, '2017-02-09 22:22:46.236898+00');
INSERT INTO attendance_attendance VALUES (983, '2017-02-10', '2017-02-09', 'present', '', 117, '2017-02-09 22:22:46.237883+00');
INSERT INTO attendance_attendance VALUES (984, '2017-02-10', '2017-02-09', 'present', '', 118, '2017-02-09 22:22:46.238891+00');
INSERT INTO attendance_attendance VALUES (985, '2017-02-10', '2017-02-09', 'present', '', 119, '2017-02-09 22:22:46.240803+00');
INSERT INTO attendance_attendance VALUES (986, '2017-02-10', '2017-02-09', 'present', '', 120, '2017-02-09 22:22:46.242044+00');
INSERT INTO attendance_attendance VALUES (987, '2017-02-10', '2017-02-09', 'present', '', 121, '2017-02-09 22:22:46.244433+00');
INSERT INTO attendance_attendance VALUES (988, '2017-02-10', '2017-02-09', 'present', '', 130, '2017-02-09 22:22:46.245242+00');
INSERT INTO attendance_attendance VALUES (989, '2017-02-10', '2017-02-09', 'present', '', 138, '2017-02-09 22:22:46.246065+00');
INSERT INTO attendance_attendance VALUES (990, '2017-02-10', '2017-02-09', 'present', '', 145, '2017-02-09 22:22:46.246939+00');
INSERT INTO attendance_attendance VALUES (991, '2017-02-10', '2017-02-09', 'present', '', 165, '2017-02-09 22:22:46.247798+00');
INSERT INTO attendance_attendance VALUES (992, '2017-02-10', '2017-02-09', 'present', '', 185, '2017-02-09 22:22:46.248803+00');
INSERT INTO attendance_attendance VALUES (993, '2017-02-10', '2017-02-09', 'present', '', 189, '2017-02-09 22:22:46.249632+00');
INSERT INTO attendance_attendance VALUES (994, '2017-02-10', '2017-02-09', 'present', '', 204, '2017-02-09 22:22:46.250475+00');
INSERT INTO attendance_attendance VALUES (995, '2017-02-10', '2017-02-09', 'absent', '', 221, '2017-02-09 22:22:46.251293+00');
INSERT INTO attendance_attendance VALUES (996, '2017-02-10', '2017-02-09', 'present', '', 225, '2017-02-09 22:22:46.252085+00');
INSERT INTO attendance_attendance VALUES (997, '2017-02-10', '2017-02-09', 'absent', '', 271, '2017-02-09 22:22:46.254042+00');
INSERT INTO attendance_attendance VALUES (998, '2017-02-10', '2017-02-09', 'present', '', 300, '2017-02-09 22:22:46.255165+00');
INSERT INTO attendance_attendance VALUES (999, '2017-02-10', '2017-02-09', 'present', '', 74, '2017-02-09 22:22:46.458274+00');
INSERT INTO attendance_attendance VALUES (1000, '2017-02-10', '2017-02-09', 'present', '', 75, '2017-02-09 22:22:46.459263+00');
INSERT INTO attendance_attendance VALUES (1001, '2017-02-10', '2017-02-09', 'present', '', 78, '2017-02-09 22:22:46.460099+00');
INSERT INTO attendance_attendance VALUES (1002, '2017-02-10', '2017-02-09', 'present', '', 82, '2017-02-09 22:22:46.461206+00');
INSERT INTO attendance_attendance VALUES (1003, '2017-02-10', '2017-02-09', 'present', '', 83, '2017-02-09 22:22:46.462058+00');
INSERT INTO attendance_attendance VALUES (1004, '2017-02-10', '2017-02-09', 'present', '', 85, '2017-02-09 22:22:46.464005+00');
INSERT INTO attendance_attendance VALUES (1005, '2017-02-10', '2017-02-09', 'present', '', 86, '2017-02-09 22:22:46.465192+00');
INSERT INTO attendance_attendance VALUES (1006, '2017-02-10', '2017-02-09', 'absent', '', 91, '2017-02-09 22:22:46.466251+00');
INSERT INTO attendance_attendance VALUES (1007, '2017-02-10', '2017-02-09', 'present', '', 93, '2017-02-09 22:22:46.467096+00');
INSERT INTO attendance_attendance VALUES (1008, '2017-02-10', '2017-02-09', 'absent', '', 94, '2017-02-09 22:22:46.467867+00');
INSERT INTO attendance_attendance VALUES (1009, '2017-02-10', '2017-02-09', 'present', '', 103, '2017-02-09 22:22:46.468643+00');
INSERT INTO attendance_attendance VALUES (1010, '2017-02-10', '2017-02-09', 'present', '', 104, '2017-02-09 22:22:46.469438+00');
INSERT INTO attendance_attendance VALUES (1011, '2017-02-10', '2017-02-09', 'present', '', 105, '2017-02-09 22:22:46.47028+00');
INSERT INTO attendance_attendance VALUES (1012, '2017-02-10', '2017-02-09', 'present', '', 107, '2017-02-09 22:22:46.471113+00');
INSERT INTO attendance_attendance VALUES (1013, '2017-02-10', '2017-02-09', 'present', '', 109, '2017-02-09 22:22:46.471966+00');
INSERT INTO attendance_attendance VALUES (1014, '2017-02-10', '2017-02-09', 'present', '', 112, '2017-02-09 22:22:46.473944+00');
INSERT INTO attendance_attendance VALUES (1015, '2017-02-10', '2017-02-09', 'absent', '', 122, '2017-02-09 22:22:46.474917+00');
INSERT INTO attendance_attendance VALUES (1016, '2017-02-10', '2017-02-09', 'present', '', 126, '2017-02-09 22:22:46.47592+00');
INSERT INTO attendance_attendance VALUES (1017, '2017-02-10', '2017-02-09', 'absent', '', 127, '2017-02-09 22:22:46.476918+00');
INSERT INTO attendance_attendance VALUES (1018, '2017-02-10', '2017-02-09', 'absent', '', 131, '2017-02-09 22:22:46.477723+00');
INSERT INTO attendance_attendance VALUES (1019, '2017-02-10', '2017-02-09', 'present', '', 132, '2017-02-09 22:22:46.478595+00');
INSERT INTO attendance_attendance VALUES (1020, '2017-02-10', '2017-02-09', 'absent', '', 133, '2017-02-09 22:22:46.479466+00');
INSERT INTO attendance_attendance VALUES (1021, '2017-02-10', '2017-02-09', 'present', '', 137, '2017-02-09 22:22:46.4803+00');
INSERT INTO attendance_attendance VALUES (1022, '2017-02-10', '2017-02-09', 'present', '', 164, '2017-02-09 22:22:46.481171+00');
INSERT INTO attendance_attendance VALUES (1023, '2017-02-10', '2017-02-09', 'present', '', 166, '2017-02-09 22:22:46.482078+00');
INSERT INTO attendance_attendance VALUES (1024, '2017-02-10', '2017-02-09', 'present', '', 174, '2017-02-09 22:22:46.484102+00');
INSERT INTO attendance_attendance VALUES (1025, '2017-02-10', '2017-02-09', 'present', '', 175, '2017-02-09 22:22:46.485099+00');
INSERT INTO attendance_attendance VALUES (1026, '2017-02-10', '2017-02-09', 'present', '', 177, '2017-02-09 22:22:46.485911+00');
INSERT INTO attendance_attendance VALUES (1027, '2017-02-10', '2017-02-09', 'present', '', 182, '2017-02-09 22:22:46.486747+00');
INSERT INTO attendance_attendance VALUES (1028, '2017-02-10', '2017-02-09', 'present', '', 186, '2017-02-09 22:22:46.488418+00');
INSERT INTO attendance_attendance VALUES (1029, '2017-02-10', '2017-02-09', 'present', '', 195, '2017-02-09 22:22:46.489219+00');
INSERT INTO attendance_attendance VALUES (1030, '2017-02-10', '2017-02-09', 'present', '', 198, '2017-02-09 22:22:46.489988+00');
INSERT INTO attendance_attendance VALUES (1031, '2017-02-10', '2017-02-09', 'present', '', 227, '2017-02-09 22:22:46.490766+00');
INSERT INTO attendance_attendance VALUES (1032, '2017-02-10', '2017-02-09', 'absent', '', 303, '2017-02-09 22:22:46.491626+00');
INSERT INTO attendance_attendance VALUES (1039, '2017-02-10', '2017-02-11', 'present', '', 23, '2017-02-11 20:52:14.91738+00');
INSERT INTO attendance_attendance VALUES (1040, '2017-02-10', '2017-02-11', 'present', '', 24, '2017-02-11 20:52:14.918764+00');
INSERT INTO attendance_attendance VALUES (1041, '2017-02-10', '2017-02-11', 'present', '', 25, '2017-02-11 20:52:14.919881+00');
INSERT INTO attendance_attendance VALUES (1042, '2017-02-10', '2017-02-11', 'present', '', 30, '2017-02-11 20:52:14.921595+00');
INSERT INTO attendance_attendance VALUES (1043, '2017-02-10', '2017-02-11', 'present', '', 26, '2017-02-11 20:52:14.93937+00');
INSERT INTO attendance_attendance VALUES (1044, '2017-02-10', '2017-02-11', 'present', '', 27, '2017-02-11 20:52:14.940413+00');
INSERT INTO attendance_attendance VALUES (1033, '2017-02-11', '2017-02-11', 'present', '', 23, '2017-02-11 21:03:39.590414+00');
INSERT INTO attendance_attendance VALUES (1034, '2017-02-11', '2017-02-11', 'present', '', 24, '2017-02-11 21:03:39.591779+00');
INSERT INTO attendance_attendance VALUES (1035, '2017-02-11', '2017-02-11', 'present', '', 25, '2017-02-11 21:03:39.593715+00');
INSERT INTO attendance_attendance VALUES (1036, '2017-02-11', '2017-02-11', 'present', '', 30, '2017-02-11 21:03:39.594925+00');
INSERT INTO attendance_attendance VALUES (1037, '2017-02-11', '2017-02-11', 'present', '', 26, '2017-02-11 21:03:39.634497+00');
INSERT INTO attendance_attendance VALUES (1038, '2017-02-11', '2017-02-11', 'present', '', 27, '2017-02-11 21:03:39.635929+00');
INSERT INTO attendance_attendance VALUES (1051, '2017-02-08', '2017-02-11', 'absent', '', 23, '2017-02-12 02:40:39.098066+00');
INSERT INTO attendance_attendance VALUES (1052, '2017-02-08', '2017-02-11', 'absent', '', 24, '2017-02-12 02:40:39.099861+00');
INSERT INTO attendance_attendance VALUES (1053, '2017-02-08', '2017-02-11', 'absent', '', 25, '2017-02-12 02:40:39.100964+00');
INSERT INTO attendance_attendance VALUES (1054, '2017-02-08', '2017-02-11', 'absent', '', 30, '2017-02-12 02:40:39.101959+00');
INSERT INTO attendance_attendance VALUES (1055, '2017-02-08', '2017-02-11', 'absent', '', 26, '2017-02-12 02:40:39.120736+00');
INSERT INTO attendance_attendance VALUES (1056, '2017-02-08', '2017-02-11', 'absent', '', 27, '2017-02-12 02:40:39.122178+00');
INSERT INTO attendance_attendance VALUES (1057, '2017-02-08', '2017-02-11', 'absent', '', 160, '2017-02-12 03:03:15.860215+00');
INSERT INTO attendance_attendance VALUES (1058, '2017-02-08', '2017-02-11', 'absent', '', 167, '2017-02-12 03:03:15.861973+00');
INSERT INTO attendance_attendance VALUES (1059, '2017-02-08', '2017-02-11', 'absent', '', 169, '2017-02-12 03:03:15.86474+00');
INSERT INTO attendance_attendance VALUES (1060, '2017-02-08', '2017-02-11', 'absent', '', 170, '2017-02-12 03:03:15.865736+00');
INSERT INTO attendance_attendance VALUES (1061, '2017-02-08', '2017-02-11', 'absent', '', 180, '2017-02-12 03:03:15.866649+00');
INSERT INTO attendance_attendance VALUES (1062, '2017-02-08', '2017-02-11', 'absent', '', 181, '2017-02-12 03:03:15.86775+00');
INSERT INTO attendance_attendance VALUES (1063, '2017-02-08', '2017-02-11', 'absent', '', 187, '2017-02-12 03:03:15.868665+00');
INSERT INTO attendance_attendance VALUES (1064, '2017-02-08', '2017-02-11', 'absent', '', 193, '2017-02-12 03:03:15.86983+00');
INSERT INTO attendance_attendance VALUES (1065, '2017-02-08', '2017-02-11', 'absent', '', 194, '2017-02-12 03:03:15.870766+00');
INSERT INTO attendance_attendance VALUES (1066, '2017-02-08', '2017-02-11', 'absent', '', 203, '2017-02-12 03:03:15.871645+00');
INSERT INTO attendance_attendance VALUES (1067, '2017-02-08', '2017-02-11', 'absent', '', 212, '2017-02-12 03:03:15.874549+00');
INSERT INTO attendance_attendance VALUES (1068, '2017-02-08', '2017-02-11', 'absent', '', 215, '2017-02-12 03:03:15.875706+00');
INSERT INTO attendance_attendance VALUES (1069, '2017-02-08', '2017-02-11', 'absent', '', 217, '2017-02-12 03:03:15.876904+00');
INSERT INTO attendance_attendance VALUES (1070, '2017-02-08', '2017-02-11', 'absent', '', 218, '2017-02-12 03:03:15.877806+00');
INSERT INTO attendance_attendance VALUES (1071, '2017-02-08', '2017-02-11', 'absent', '', 237, '2017-02-12 03:03:15.87871+00');
INSERT INTO attendance_attendance VALUES (1072, '2017-02-08', '2017-02-11', 'absent', '', 238, '2017-02-12 03:03:15.879608+00');
INSERT INTO attendance_attendance VALUES (1073, '2017-02-08', '2017-02-11', 'absent', '', 239, '2017-02-12 03:03:15.880425+00');
INSERT INTO attendance_attendance VALUES (1074, '2017-02-08', '2017-02-11', 'absent', '', 240, '2017-02-12 03:03:15.88126+00');
INSERT INTO attendance_attendance VALUES (1075, '2017-02-08', '2017-02-11', 'absent', '', 242, '2017-02-12 03:03:15.882062+00');
INSERT INTO attendance_attendance VALUES (1076, '2017-02-08', '2017-02-11', 'absent', '', 243, '2017-02-12 03:03:15.885369+00');
INSERT INTO attendance_attendance VALUES (1077, '2017-02-08', '2017-02-11', 'absent', '', 253, '2017-02-12 03:03:15.886199+00');
INSERT INTO attendance_attendance VALUES (1078, '2017-02-08', '2017-02-11', 'absent', '', 259, '2017-02-12 03:03:15.887032+00');
INSERT INTO attendance_attendance VALUES (1079, '2017-02-08', '2017-02-11', 'absent', '', 260, '2017-02-12 03:03:15.887916+00');
INSERT INTO attendance_attendance VALUES (1080, '2017-02-08', '2017-02-11', 'absent', '', 261, '2017-02-12 03:03:15.888744+00');
INSERT INTO attendance_attendance VALUES (1081, '2017-02-08', '2017-02-11', 'absent', '', 268, '2017-02-12 03:03:15.889518+00');
INSERT INTO attendance_attendance VALUES (1082, '2017-02-08', '2017-02-11', 'absent', '', 273, '2017-02-12 03:03:15.89034+00');
INSERT INTO attendance_attendance VALUES (1083, '2017-02-08', '2017-02-11', 'absent', '', 274, '2017-02-12 03:03:15.89113+00');
INSERT INTO attendance_attendance VALUES (1084, '2017-02-08', '2017-02-11', 'absent', '', 275, '2017-02-12 03:03:15.891922+00');
INSERT INTO attendance_attendance VALUES (1085, '2017-02-08', '2017-02-11', 'absent', '', 283, '2017-02-12 03:03:15.894773+00');
INSERT INTO attendance_attendance VALUES (1086, '2017-02-08', '2017-02-11', 'absent', '', 287, '2017-02-12 03:03:15.895609+00');
INSERT INTO attendance_attendance VALUES (1087, '2017-02-08', '2017-02-11', 'absent', '', 288, '2017-02-12 03:03:15.896509+00');
INSERT INTO attendance_attendance VALUES (1088, '2017-02-08', '2017-02-11', 'absent', '', 289, '2017-02-12 03:03:15.897341+00');
INSERT INTO attendance_attendance VALUES (1089, '2017-02-08', '2017-02-11', 'absent', '', 302, '2017-02-12 03:03:15.898152+00');
INSERT INTO attendance_attendance VALUES (1090, '2017-02-08', '2017-02-11', 'absent', '', 306, '2017-02-12 03:03:15.899234+00');
INSERT INTO attendance_attendance VALUES (1091, '2017-02-08', '2017-02-11', 'absent', '', 309, '2017-02-12 03:03:15.900027+00');
INSERT INTO attendance_attendance VALUES (1092, '2017-02-08', '2017-02-11', 'absent', '', 314, '2017-02-12 03:03:15.900871+00');
INSERT INTO attendance_attendance VALUES (1093, '2017-02-08', '2017-02-11', 'absent', '', 307, '2017-02-12 03:03:15.901637+00');
INSERT INTO attendance_attendance VALUES (1094, '2017-02-08', '2017-02-11', 'present', '', 88, '2017-02-12 03:03:16.169143+00');
INSERT INTO attendance_attendance VALUES (1095, '2017-02-08', '2017-02-11', 'present', '', 111, '2017-02-12 03:03:16.170689+00');
INSERT INTO attendance_attendance VALUES (1096, '2017-02-08', '2017-02-11', 'present', '', 124, '2017-02-12 03:03:16.171599+00');
INSERT INTO attendance_attendance VALUES (1097, '2017-02-08', '2017-02-11', 'present', '', 125, '2017-02-12 03:03:16.17668+00');
INSERT INTO attendance_attendance VALUES (1098, '2017-02-08', '2017-02-11', 'present', '', 129, '2017-02-12 03:03:16.177544+00');
INSERT INTO attendance_attendance VALUES (1099, '2017-02-08', '2017-02-11', 'present', '', 134, '2017-02-12 03:03:16.178368+00');
INSERT INTO attendance_attendance VALUES (1100, '2017-02-08', '2017-02-11', 'absent', '', 135, '2017-02-12 03:03:16.179179+00');
INSERT INTO attendance_attendance VALUES (1101, '2017-02-08', '2017-02-11', 'absent', '', 136, '2017-02-12 03:03:16.179955+00');
INSERT INTO attendance_attendance VALUES (1102, '2017-02-08', '2017-02-11', 'absent', '', 139, '2017-02-12 03:03:16.180695+00');
INSERT INTO attendance_attendance VALUES (1103, '2017-02-08', '2017-02-11', 'absent', '', 140, '2017-02-12 03:03:16.181471+00');
INSERT INTO attendance_attendance VALUES (1104, '2017-02-08', '2017-02-11', 'absent', '', 143, '2017-02-12 03:03:16.182217+00');
INSERT INTO attendance_attendance VALUES (1045, '2017-02-09', '2017-02-11', 'present', '', 23, '2017-02-13 01:09:24.486947+00');
INSERT INTO attendance_attendance VALUES (1046, '2017-02-09', '2017-02-11', 'present', 'Late by 15 min', 24, '2017-02-13 01:09:24.488498+00');
INSERT INTO attendance_attendance VALUES (1047, '2017-02-09', '2017-02-11', 'present', '', 25, '2017-02-13 01:09:24.489667+00');
INSERT INTO attendance_attendance VALUES (1048, '2017-02-09', '2017-02-11', 'present', '', 30, '2017-02-13 01:09:24.490803+00');
INSERT INTO attendance_attendance VALUES (1049, '2017-02-09', '2017-02-11', 'present', '', 26, '2017-02-13 01:09:24.592185+00');
INSERT INTO attendance_attendance VALUES (1050, '2017-02-09', '2017-02-11', 'present', '', 27, '2017-02-13 01:09:24.594208+00');
INSERT INTO attendance_attendance VALUES (1105, '2017-02-08', '2017-02-11', 'absent', '', 146, '2017-02-12 03:03:16.187281+00');
INSERT INTO attendance_attendance VALUES (1106, '2017-02-08', '2017-02-11', 'absent', '', 147, '2017-02-12 03:03:16.1882+00');
INSERT INTO attendance_attendance VALUES (1107, '2017-02-08', '2017-02-11', 'absent', '', 148, '2017-02-12 03:03:16.189012+00');
INSERT INTO attendance_attendance VALUES (1108, '2017-02-08', '2017-02-11', 'absent', '', 168, '2017-02-12 03:03:16.190015+00');
INSERT INTO attendance_attendance VALUES (1109, '2017-02-08', '2017-02-11', 'absent', '', 171, '2017-02-12 03:03:16.190825+00');
INSERT INTO attendance_attendance VALUES (1110, '2017-02-08', '2017-02-11', 'absent', '', 172, '2017-02-12 03:03:16.191582+00');
INSERT INTO attendance_attendance VALUES (1111, '2017-02-08', '2017-02-11', 'absent', '', 183, '2017-02-12 03:03:16.194626+00');
INSERT INTO attendance_attendance VALUES (1112, '2017-02-08', '2017-02-11', 'absent', '', 190, '2017-02-12 03:03:16.196598+00');
INSERT INTO attendance_attendance VALUES (1113, '2017-02-08', '2017-02-11', 'absent', '', 191, '2017-02-12 03:03:16.197652+00');
INSERT INTO attendance_attendance VALUES (1114, '2017-02-08', '2017-02-11', 'absent', '', 196, '2017-02-12 03:03:16.19848+00');
INSERT INTO attendance_attendance VALUES (1115, '2017-02-08', '2017-02-11', 'absent', '', 206, '2017-02-12 03:03:16.199387+00');
INSERT INTO attendance_attendance VALUES (1116, '2017-02-08', '2017-02-11', 'absent', '', 207, '2017-02-12 03:03:16.2006+00');
INSERT INTO attendance_attendance VALUES (1117, '2017-02-08', '2017-02-11', 'absent', '', 213, '2017-02-12 03:03:16.201407+00');
INSERT INTO attendance_attendance VALUES (1118, '2017-02-08', '2017-02-11', 'absent', '', 224, '2017-02-12 03:03:16.202217+00');
INSERT INTO attendance_attendance VALUES (1119, '2017-02-08', '2017-02-11', 'absent', '', 235, '2017-02-12 03:03:16.206281+00');
INSERT INTO attendance_attendance VALUES (1120, '2017-02-08', '2017-02-11', 'absent', '', 250, '2017-02-12 03:03:16.207251+00');
INSERT INTO attendance_attendance VALUES (1121, '2017-02-08', '2017-02-11', 'absent', '', 254, '2017-02-12 03:03:16.208506+00');
INSERT INTO attendance_attendance VALUES (1122, '2017-02-08', '2017-02-11', 'absent', '', 255, '2017-02-12 03:03:16.209471+00');
INSERT INTO attendance_attendance VALUES (1123, '2017-02-08', '2017-02-11', 'absent', '', 267, '2017-02-12 03:03:16.210368+00');
INSERT INTO attendance_attendance VALUES (1124, '2017-02-08', '2017-02-11', 'absent', '', 327, '2017-02-12 03:03:16.211261+00');
INSERT INTO attendance_attendance VALUES (1125, '2017-02-08', '2017-02-11', 'absent', '', 51, '2017-02-12 03:03:16.404997+00');
INSERT INTO attendance_attendance VALUES (1126, '2017-02-08', '2017-02-11', 'absent', '', 57, '2017-02-12 03:03:16.406178+00');
INSERT INTO attendance_attendance VALUES (1127, '2017-02-08', '2017-02-11', 'absent', '', 68, '2017-02-12 03:03:16.406972+00');
INSERT INTO attendance_attendance VALUES (1128, '2017-02-08', '2017-02-11', 'absent', '', 73, '2017-02-12 03:03:16.407764+00');
INSERT INTO attendance_attendance VALUES (1129, '2017-02-08', '2017-02-11', 'absent', '', 77, '2017-02-12 03:03:16.408546+00');
INSERT INTO attendance_attendance VALUES (1130, '2017-02-08', '2017-02-11', 'absent', '', 79, '2017-02-12 03:03:16.40937+00');
INSERT INTO attendance_attendance VALUES (1131, '2017-02-08', '2017-02-11', 'absent', '', 81, '2017-02-12 03:03:16.410185+00');
INSERT INTO attendance_attendance VALUES (1132, '2017-02-08', '2017-02-11', 'absent', '', 84, '2017-02-12 03:03:16.411025+00');
INSERT INTO attendance_attendance VALUES (1133, '2017-02-08', '2017-02-11', 'absent', '', 90, '2017-02-12 03:03:16.41183+00');
INSERT INTO attendance_attendance VALUES (1134, '2017-02-08', '2017-02-11', 'absent', '', 92, '2017-02-12 03:03:16.413036+00');
INSERT INTO attendance_attendance VALUES (1135, '2017-02-08', '2017-02-11', 'absent', '', 95, '2017-02-12 03:03:16.414011+00');
INSERT INTO attendance_attendance VALUES (1136, '2017-02-08', '2017-02-11', 'absent', '', 96, '2017-02-12 03:03:16.41498+00');
INSERT INTO attendance_attendance VALUES (1137, '2017-02-08', '2017-02-11', 'absent', '', 97, '2017-02-12 03:03:16.415939+00');
INSERT INTO attendance_attendance VALUES (1138, '2017-02-08', '2017-02-11', 'absent', '', 98, '2017-02-12 03:03:16.416922+00');
INSERT INTO attendance_attendance VALUES (1139, '2017-02-08', '2017-02-11', 'absent', '', 99, '2017-02-12 03:03:16.417708+00');
INSERT INTO attendance_attendance VALUES (1140, '2017-02-08', '2017-02-11', 'absent', '', 101, '2017-02-12 03:03:16.418495+00');
INSERT INTO attendance_attendance VALUES (1141, '2017-02-08', '2017-02-11', 'absent', '', 102, '2017-02-12 03:03:16.419546+00');
INSERT INTO attendance_attendance VALUES (1142, '2017-02-08', '2017-02-11', 'absent', '', 106, '2017-02-12 03:03:16.420532+00');
INSERT INTO attendance_attendance VALUES (1143, '2017-02-08', '2017-02-11', 'absent', '', 178, '2017-02-12 03:03:16.421381+00');
INSERT INTO attendance_attendance VALUES (1144, '2017-02-08', '2017-02-11', 'absent', '', 184, '2017-02-12 03:03:16.422204+00');
INSERT INTO attendance_attendance VALUES (1145, '2017-02-08', '2017-02-11', 'absent', '', 230, '2017-02-12 03:03:16.423676+00');
INSERT INTO attendance_attendance VALUES (1146, '2017-02-08', '2017-02-11', 'absent', '', 231, '2017-02-12 03:03:16.424682+00');
INSERT INTO attendance_attendance VALUES (1147, '2017-02-08', '2017-02-11', 'absent', '', 249, '2017-02-12 03:03:16.4255+00');
INSERT INTO attendance_attendance VALUES (1148, '2017-02-08', '2017-02-11', 'absent', '', 264, '2017-02-12 03:03:16.426308+00');
INSERT INTO attendance_attendance VALUES (1149, '2017-02-08', '2017-02-11', 'absent', '', 312, '2017-02-12 03:03:16.427116+00');
INSERT INTO attendance_attendance VALUES (1150, '2017-02-08', '2017-02-11', 'absent', '', 40, '2017-02-12 03:03:16.547425+00');
INSERT INTO attendance_attendance VALUES (1151, '2017-02-08', '2017-02-11', 'absent', '', 41, '2017-02-12 03:03:16.548631+00');
INSERT INTO attendance_attendance VALUES (1152, '2017-02-08', '2017-02-11', 'absent', '', 47, '2017-02-12 03:03:16.549686+00');
INSERT INTO attendance_attendance VALUES (1153, '2017-02-08', '2017-02-11', 'absent', '', 50, '2017-02-12 03:03:16.550565+00');
INSERT INTO attendance_attendance VALUES (1154, '2017-02-08', '2017-02-11', 'absent', '', 52, '2017-02-12 03:03:16.551591+00');
INSERT INTO attendance_attendance VALUES (1155, '2017-02-08', '2017-02-11', 'absent', '', 53, '2017-02-12 03:03:16.553335+00');
INSERT INTO attendance_attendance VALUES (1156, '2017-02-08', '2017-02-11', 'absent', '', 54, '2017-02-12 03:03:16.55417+00');
INSERT INTO attendance_attendance VALUES (1157, '2017-02-08', '2017-02-11', 'absent', '', 55, '2017-02-12 03:03:16.554999+00');
INSERT INTO attendance_attendance VALUES (1158, '2017-02-08', '2017-02-11', 'absent', '', 56, '2017-02-12 03:03:16.555942+00');
INSERT INTO attendance_attendance VALUES (1159, '2017-02-08', '2017-02-11', 'absent', '', 58, '2017-02-12 03:03:16.556787+00');
INSERT INTO attendance_attendance VALUES (1160, '2017-02-08', '2017-02-11', 'absent', '', 59, '2017-02-12 03:03:16.557592+00');
INSERT INTO attendance_attendance VALUES (1161, '2017-02-08', '2017-02-11', 'absent', '', 60, '2017-02-12 03:03:16.558701+00');
INSERT INTO attendance_attendance VALUES (1162, '2017-02-08', '2017-02-11', 'absent', '', 61, '2017-02-12 03:03:16.55948+00');
INSERT INTO attendance_attendance VALUES (1163, '2017-02-08', '2017-02-11', 'absent', '', 62, '2017-02-12 03:03:16.560304+00');
INSERT INTO attendance_attendance VALUES (1164, '2017-02-08', '2017-02-11', 'absent', '', 63, '2017-02-12 03:03:16.561109+00');
INSERT INTO attendance_attendance VALUES (1165, '2017-02-08', '2017-02-11', 'absent', '', 65, '2017-02-12 03:03:16.562082+00');
INSERT INTO attendance_attendance VALUES (1166, '2017-02-08', '2017-02-11', 'absent', '', 69, '2017-02-12 03:03:16.564046+00');
INSERT INTO attendance_attendance VALUES (1167, '2017-02-08', '2017-02-11', 'absent', '', 70, '2017-02-12 03:03:16.565051+00');
INSERT INTO attendance_attendance VALUES (1168, '2017-02-08', '2017-02-11', 'absent', '', 71, '2017-02-12 03:03:16.565871+00');
INSERT INTO attendance_attendance VALUES (1169, '2017-02-08', '2017-02-11', 'absent', '', 72, '2017-02-12 03:03:16.566793+00');
INSERT INTO attendance_attendance VALUES (1170, '2017-02-08', '2017-02-11', 'absent', '', 80, '2017-02-12 03:03:16.567762+00');
INSERT INTO attendance_attendance VALUES (1171, '2017-02-08', '2017-02-11', 'present', '', 37, '2017-02-12 03:03:16.649447+00');
INSERT INTO attendance_attendance VALUES (1172, '2017-02-08', '2017-02-11', 'present', '', 38, '2017-02-12 03:03:16.650463+00');
INSERT INTO attendance_attendance VALUES (1173, '2017-02-08', '2017-02-11', 'present', '', 39, '2017-02-12 03:03:16.651271+00');
INSERT INTO attendance_attendance VALUES (1174, '2017-02-08', '2017-02-11', 'present', '', 42, '2017-02-12 03:03:16.652074+00');
INSERT INTO attendance_attendance VALUES (1175, '2017-02-08', '2017-02-11', 'present', '', 43, '2017-02-12 03:03:16.654523+00');
INSERT INTO attendance_attendance VALUES (1176, '2017-02-08', '2017-02-11', 'present', '', 44, '2017-02-12 03:03:16.655331+00');
INSERT INTO attendance_attendance VALUES (1177, '2017-02-08', '2017-02-11', 'present', '', 45, '2017-02-12 03:03:16.656145+00');
INSERT INTO attendance_attendance VALUES (1178, '2017-02-08', '2017-02-11', 'present', '', 46, '2017-02-12 03:03:16.656946+00');
INSERT INTO attendance_attendance VALUES (1179, '2017-02-08', '2017-02-11', 'present', '', 48, '2017-02-12 03:03:16.657873+00');
INSERT INTO attendance_attendance VALUES (1180, '2017-02-08', '2017-02-11', 'present', '', 49, '2017-02-12 03:03:16.658655+00');
INSERT INTO attendance_attendance VALUES (1181, '2017-02-08', '2017-02-11', 'present', '', 67, '2017-02-12 03:03:16.65943+00');
INSERT INTO attendance_attendance VALUES (1182, '2017-02-08', '2017-02-11', 'present', '', 173, '2017-02-12 03:03:16.660241+00');
INSERT INTO attendance_attendance VALUES (1184, '2017-02-12', '2017-02-12', 'present', '', 159, '2017-02-12 22:01:17.87667+00');
INSERT INTO attendance_attendance VALUES (1185, '2017-02-12', '2017-02-12', 'absent', '', 161, '2017-02-12 22:01:17.877959+00');
INSERT INTO attendance_attendance VALUES (1186, '2017-02-12', '2017-02-12', 'present', '', 179, '2017-02-12 22:01:17.87925+00');
INSERT INTO attendance_attendance VALUES (1188, '2017-02-12', '2017-02-12', 'present', '', 200, '2017-02-12 22:01:17.881435+00');
INSERT INTO attendance_attendance VALUES (1189, '2017-02-12', '2017-02-12', 'absent', '', 201, '2017-02-12 22:01:17.883254+00');
INSERT INTO attendance_attendance VALUES (1190, '2017-02-12', '2017-02-12', 'present', '', 208, '2017-02-12 22:01:17.884774+00');
INSERT INTO attendance_attendance VALUES (1191, '2017-02-12', '2017-02-12', 'present', '', 209, '2017-02-12 22:01:17.886089+00');
INSERT INTO attendance_attendance VALUES (1192, '2017-02-12', '2017-02-12', 'absent', '', 210, '2017-02-12 22:01:17.887193+00');
INSERT INTO attendance_attendance VALUES (1193, '2017-02-12', '2017-02-12', 'present', '', 211, '2017-02-12 22:01:17.88837+00');
INSERT INTO attendance_attendance VALUES (1195, '2017-02-12', '2017-02-12', 'absent', '', 229, '2017-02-12 22:01:17.890689+00');
INSERT INTO attendance_attendance VALUES (1196, '2017-02-12', '2017-02-12', 'present', '', 232, '2017-02-12 22:01:17.891972+00');
INSERT INTO attendance_attendance VALUES (1197, '2017-02-12', '2017-02-12', 'absent', '', 233, '2017-02-12 22:01:17.893945+00');
INSERT INTO attendance_attendance VALUES (1198, '2017-02-12', '2017-02-12', 'present', '', 234, '2017-02-12 22:01:17.895002+00');
INSERT INTO attendance_attendance VALUES (1199, '2017-02-12', '2017-02-12', 'absent', '', 241, '2017-02-12 22:01:17.89629+00');
INSERT INTO attendance_attendance VALUES (1200, '2017-02-12', '2017-02-12', 'present', '', 244, '2017-02-12 22:01:17.897765+00');
INSERT INTO attendance_attendance VALUES (1201, '2017-02-12', '2017-02-12', 'present', '', 245, '2017-02-12 22:01:17.898929+00');
INSERT INTO attendance_attendance VALUES (1203, '2017-02-12', '2017-02-12', 'present', '', 248, '2017-02-12 22:01:17.901179+00');
INSERT INTO attendance_attendance VALUES (1204, '2017-02-12', '2017-02-12', 'absent', '', 251, '2017-02-12 22:01:17.90227+00');
INSERT INTO attendance_attendance VALUES (1205, '2017-02-12', '2017-02-12', 'present', '', 252, '2017-02-12 22:01:17.904242+00');
INSERT INTO attendance_attendance VALUES (1206, '2017-02-12', '2017-02-12', 'present', '', 256, '2017-02-12 22:01:17.905277+00');
INSERT INTO attendance_attendance VALUES (1207, '2017-02-12', '2017-02-12', 'absent', '', 257, '2017-02-12 22:01:17.906315+00');
INSERT INTO attendance_attendance VALUES (1208, '2017-02-12', '2017-02-12', 'present', '', 265, '2017-02-12 22:01:17.907759+00');
INSERT INTO attendance_attendance VALUES (1210, '2017-02-12', '2017-02-12', 'present', '', 270, '2017-02-12 22:01:17.90991+00');
INSERT INTO attendance_attendance VALUES (1211, '2017-02-12', '2017-02-12', 'present', '', 272, '2017-02-12 22:01:17.910976+00');
INSERT INTO attendance_attendance VALUES (1212, '2017-02-12', '2017-02-12', 'present', '', 276, '2017-02-12 22:01:17.912044+00');
INSERT INTO attendance_attendance VALUES (1213, '2017-02-12', '2017-02-12', 'absent', '', 277, '2017-02-12 22:01:17.914218+00');
INSERT INTO attendance_attendance VALUES (1214, '2017-02-12', '2017-02-12', 'present', '', 278, '2017-02-12 22:01:17.915317+00');
INSERT INTO attendance_attendance VALUES (1215, '2017-02-12', '2017-02-12', 'absent', '', 279, '2017-02-12 22:01:17.916614+00');
INSERT INTO attendance_attendance VALUES (1217, '2017-02-12', '2017-02-12', 'present', '', 284, '2017-02-12 22:01:17.919238+00');
INSERT INTO attendance_attendance VALUES (1218, '2017-02-12', '2017-02-12', 'absent', '', 286, '2017-02-12 22:01:17.921427+00');
INSERT INTO attendance_attendance VALUES (1219, '2017-02-12', '2017-02-12', 'present', '', 290, '2017-02-12 22:01:17.925517+00');
INSERT INTO attendance_attendance VALUES (1220, '2017-02-12', '2017-02-12', 'present', '', 291, '2017-02-12 22:01:17.926771+00');
INSERT INTO attendance_attendance VALUES (1221, '2017-02-12', '2017-02-12', 'absent', '', 292, '2017-02-12 22:01:17.92819+00');
INSERT INTO attendance_attendance VALUES (1222, '2017-02-12', '2017-02-12', 'present', '', 293, '2017-02-12 22:01:17.929404+00');
INSERT INTO attendance_attendance VALUES (1224, '2017-02-12', '2017-02-12', 'present', '', 295, '2017-02-12 22:01:17.931826+00');
INSERT INTO attendance_attendance VALUES (1225, '2017-02-12', '2017-02-12', 'present', '', 296, '2017-02-12 22:01:17.93514+00');
INSERT INTO attendance_attendance VALUES (1226, '2017-02-12', '2017-02-12', 'absent', '', 298, '2017-02-12 22:01:17.936333+00');
INSERT INTO attendance_attendance VALUES (1227, '2017-02-12', '2017-02-12', 'present', '', 299, '2017-02-12 22:01:17.937645+00');
INSERT INTO attendance_attendance VALUES (1228, '2017-02-12', '2017-02-12', 'present', '', 304, '2017-02-12 22:01:17.938778+00');
INSERT INTO attendance_attendance VALUES (1230, '2017-02-12', '2017-02-12', 'absent', '', 308, '2017-02-12 22:01:17.941109+00');
INSERT INTO attendance_attendance VALUES (1231, '2017-02-12', '2017-02-12', 'absent', '', 310, '2017-02-12 22:01:17.942252+00');
INSERT INTO attendance_attendance VALUES (1232, '2017-02-12', '2017-02-12', 'present', '', 311, '2017-02-12 22:01:17.945289+00');
INSERT INTO attendance_attendance VALUES (1233, '2017-02-12', '2017-02-12', 'present', '', 316, '2017-02-12 22:01:17.946481+00');
INSERT INTO attendance_attendance VALUES (1234, '2017-02-12', '2017-02-12', 'present', '', 317, '2017-02-12 22:01:17.947625+00');
INSERT INTO attendance_attendance VALUES (1235, '2017-02-12', '2017-02-12', 'present', '', 318, '2017-02-12 22:01:17.948777+00');
INSERT INTO attendance_attendance VALUES (1237, '2017-02-12', '2017-02-12', 'present', '', 320, '2017-02-12 22:01:17.951053+00');
INSERT INTO attendance_attendance VALUES (1238, '2017-02-12', '2017-02-12', 'absent', '', 321, '2017-02-12 22:01:17.952164+00');
INSERT INTO attendance_attendance VALUES (1183, '2017-02-12', '2017-02-12', 'present', '', 155, '2017-02-12 22:01:17.874528+00');
INSERT INTO attendance_attendance VALUES (1187, '2017-02-12', '2017-02-12', 'present', '', 197, '2017-02-12 22:01:17.880347+00');
INSERT INTO attendance_attendance VALUES (1194, '2017-02-12', '2017-02-12', 'present', '', 219, '2017-02-12 22:01:17.889516+00');
INSERT INTO attendance_attendance VALUES (1202, '2017-02-12', '2017-02-12', 'absent', '', 247, '2017-02-12 22:01:17.900048+00');
INSERT INTO attendance_attendance VALUES (1209, '2017-02-12', '2017-02-12', 'present', '', 269, '2017-02-12 22:01:17.908828+00');
INSERT INTO attendance_attendance VALUES (1216, '2017-02-12', '2017-02-12', 'present', '', 280, '2017-02-12 22:01:17.917735+00');
INSERT INTO attendance_attendance VALUES (1223, '2017-02-12', '2017-02-12', 'absent', '', 294, '2017-02-12 22:01:17.930623+00');
INSERT INTO attendance_attendance VALUES (1229, '2017-02-12', '2017-02-12', 'present', '', 305, '2017-02-12 22:01:17.939921+00');
INSERT INTO attendance_attendance VALUES (1236, '2017-02-12', '2017-02-12', 'present', '', 319, '2017-02-12 22:01:17.949883+00');
INSERT INTO attendance_attendance VALUES (1239, '2017-02-12', '2017-02-12', 'absent', '', 322, '2017-02-12 22:01:17.955307+00');
INSERT INTO attendance_attendance VALUES (1240, '2017-02-12', '2017-02-12', 'present', '', 323, '2017-02-12 22:01:17.956638+00');
INSERT INTO attendance_attendance VALUES (1241, '2017-02-12', '2017-02-12', 'absent', '', 324, '2017-02-12 22:01:17.957962+00');
INSERT INTO attendance_attendance VALUES (1242, '2017-02-12', '2017-02-12', 'present', '', 325, '2017-02-12 22:01:17.959212+00');
INSERT INTO attendance_attendance VALUES (1243, '2017-02-12', '2017-02-12', 'absent', '', 326, '2017-02-12 22:01:17.960429+00');
INSERT INTO attendance_attendance VALUES (1244, '2017-02-12', '2017-02-12', 'present', '', 328, '2017-02-12 22:01:17.961745+00');
INSERT INTO attendance_attendance VALUES (1245, '2017-02-12', '2017-02-12', 'absent', '', 329, '2017-02-12 22:01:17.96451+00');
INSERT INTO attendance_attendance VALUES (1246, '2017-02-12', '2017-02-12', 'present', '', 330, '2017-02-12 22:01:17.96558+00');
INSERT INTO attendance_attendance VALUES (1247, '2017-02-12', '2017-02-12', 'present', '', 331, '2017-02-12 22:01:17.966778+00');
INSERT INTO attendance_attendance VALUES (1248, '2017-02-12', '2017-02-12', 'absent', '', 332, '2017-02-12 22:01:17.968069+00');
INSERT INTO attendance_attendance VALUES (1249, '2017-02-12', '2017-02-12', 'absent', '', 333, '2017-02-12 22:01:17.969315+00');
INSERT INTO attendance_attendance VALUES (1250, '2017-02-12', '2017-02-12', 'absent', '', 123, '2017-02-12 22:01:18.22953+00');
INSERT INTO attendance_attendance VALUES (1251, '2017-02-12', '2017-02-12', 'present', '', 142, '2017-02-12 22:01:18.230977+00');
INSERT INTO attendance_attendance VALUES (1252, '2017-02-12', '2017-02-12', 'absent', '', 151, '2017-02-12 22:01:18.232093+00');
INSERT INTO attendance_attendance VALUES (1253, '2017-02-12', '2017-02-12', 'present', '', 152, '2017-02-12 22:01:18.234684+00');
INSERT INTO attendance_attendance VALUES (1254, '2017-02-12', '2017-02-12', 'present', '', 153, '2017-02-12 22:01:18.235951+00');
INSERT INTO attendance_attendance VALUES (1255, '2017-02-12', '2017-02-12', 'absent', '', 154, '2017-02-12 22:01:18.237052+00');
INSERT INTO attendance_attendance VALUES (1256, '2017-02-12', '2017-02-12', 'absent', '', 157, '2017-02-12 22:01:18.238111+00');
INSERT INTO attendance_attendance VALUES (1257, '2017-02-12', '2017-02-12', 'present', '', 162, '2017-02-12 22:01:18.239433+00');
INSERT INTO attendance_attendance VALUES (1258, '2017-02-12', '2017-02-12', 'absent', '', 163, '2017-02-12 22:01:18.24056+00');
INSERT INTO attendance_attendance VALUES (1259, '2017-02-12', '2017-02-12', 'present', '', 176, '2017-02-12 22:01:18.241614+00');
INSERT INTO attendance_attendance VALUES (1260, '2017-02-12', '2017-02-12', 'absent', '', 202, '2017-02-12 22:01:18.243601+00');
INSERT INTO attendance_attendance VALUES (1261, '2017-02-12', '2017-02-12', 'present', '', 214, '2017-02-12 22:01:18.244717+00');
INSERT INTO attendance_attendance VALUES (1262, '2017-02-12', '2017-02-12', 'absent', '', 216, '2017-02-12 22:01:18.245976+00');
INSERT INTO attendance_attendance VALUES (1263, '2017-02-12', '2017-02-12', 'present', '', 220, '2017-02-12 22:01:18.247127+00');
INSERT INTO attendance_attendance VALUES (1264, '2017-02-12', '2017-02-12', 'present', '', 222, '2017-02-12 22:01:18.24825+00');
INSERT INTO attendance_attendance VALUES (1265, '2017-02-12', '2017-02-12', 'present', '', 223, '2017-02-12 22:01:18.249846+00');
INSERT INTO attendance_attendance VALUES (1266, '2017-02-12', '2017-02-12', 'present', '', 226, '2017-02-12 22:01:18.250935+00');
INSERT INTO attendance_attendance VALUES (1267, '2017-02-12', '2017-02-12', 'present', '', 228, '2017-02-12 22:01:18.252098+00');
INSERT INTO attendance_attendance VALUES (1268, '2017-02-12', '2017-02-12', 'absent', '', 236, '2017-02-12 22:01:18.255093+00');
INSERT INTO attendance_attendance VALUES (1269, '2017-02-12', '2017-02-12', 'present', '', 258, '2017-02-12 22:01:18.256205+00');
INSERT INTO attendance_attendance VALUES (1270, '2017-02-12', '2017-02-12', 'present', '', 262, '2017-02-12 22:01:18.257314+00');
INSERT INTO attendance_attendance VALUES (1271, '2017-02-12', '2017-02-12', 'absent', '', 263, '2017-02-12 22:01:18.258718+00');
INSERT INTO attendance_attendance VALUES (1272, '2017-02-12', '2017-02-12', 'present', '', 266, '2017-02-12 22:01:18.259819+00');
INSERT INTO attendance_attendance VALUES (1273, '2017-02-12', '2017-02-12', 'present', '', 281, '2017-02-12 22:01:18.260913+00');
INSERT INTO attendance_attendance VALUES (1274, '2017-02-12', '2017-02-12', 'absent', '', 297, '2017-02-12 22:01:18.262186+00');
INSERT INTO attendance_attendance VALUES (1275, '2017-02-12', '2017-02-12', 'present', '', 301, '2017-02-12 22:01:18.264219+00');
INSERT INTO attendance_attendance VALUES (1276, '2017-02-12', '2017-02-12', 'present', '', 313, '2017-02-12 22:01:18.265944+00');
INSERT INTO attendance_attendance VALUES (1277, '2017-02-12', '2017-02-12', 'absent', '', 315, '2017-02-12 22:01:18.267361+00');
INSERT INTO attendance_attendance VALUES (1278, '2017-02-12', '2017-02-12', 'present', '', 110, '2017-02-12 22:01:18.41949+00');
INSERT INTO attendance_attendance VALUES (1279, '2017-02-12', '2017-02-12', 'absent', '', 113, '2017-02-12 22:01:18.420789+00');
INSERT INTO attendance_attendance VALUES (1280, '2017-02-12', '2017-02-12', 'absent', '', 115, '2017-02-12 22:01:18.42193+00');
INSERT INTO attendance_attendance VALUES (1281, '2017-02-12', '2017-02-12', 'present', '', 128, '2017-02-12 22:01:18.424031+00');
INSERT INTO attendance_attendance VALUES (1282, '2017-02-12', '2017-02-12', 'absent', '', 141, '2017-02-12 22:01:18.425129+00');
INSERT INTO attendance_attendance VALUES (1283, '2017-02-12', '2017-02-12', 'absent', '', 144, '2017-02-12 22:01:18.426207+00');
INSERT INTO attendance_attendance VALUES (1285, '2017-02-12', '2017-02-12', 'absent', '', 150, '2017-02-12 22:01:18.429031+00');
INSERT INTO attendance_attendance VALUES (1286, '2017-02-12', '2017-02-12', 'absent', '', 156, '2017-02-12 22:01:18.430175+00');
INSERT INTO attendance_attendance VALUES (1287, '2017-02-12', '2017-02-12', 'present', '', 158, '2017-02-12 22:01:18.431253+00');
INSERT INTO attendance_attendance VALUES (1288, '2017-02-12', '2017-02-12', 'absent', '', 188, '2017-02-12 22:01:18.433261+00');
INSERT INTO attendance_attendance VALUES (1289, '2017-02-12', '2017-02-12', 'absent', '', 192, '2017-02-12 22:01:18.434378+00');
INSERT INTO attendance_attendance VALUES (1290, '2017-02-12', '2017-02-12', 'present', '', 199, '2017-02-12 22:01:18.435624+00');
INSERT INTO attendance_attendance VALUES (1291, '2017-02-12', '2017-02-12', 'absent', '', 205, '2017-02-12 22:01:18.436891+00');
INSERT INTO attendance_attendance VALUES (1292, '2017-02-12', '2017-02-12', 'present', '', 246, '2017-02-12 22:01:18.437973+00');
INSERT INTO attendance_attendance VALUES (1293, '2017-02-12', '2017-02-12', 'absent', '', 282, '2017-02-12 22:01:18.439248+00');
INSERT INTO attendance_attendance VALUES (1294, '2017-02-12', '2017-02-12', 'absent', '', 285, '2017-02-12 22:01:18.440354+00');
INSERT INTO attendance_attendance VALUES (1296, '2017-02-12', '2017-02-12', 'absent', 'Leave', 66, '2017-02-12 22:01:18.631685+00');
INSERT INTO attendance_attendance VALUES (1297, '2017-02-12', '2017-02-12', 'present', '', 76, '2017-02-12 22:01:18.633597+00');
INSERT INTO attendance_attendance VALUES (1298, '2017-02-12', '2017-02-12', 'present', '', 87, '2017-02-12 22:01:18.634707+00');
INSERT INTO attendance_attendance VALUES (1299, '2017-02-12', '2017-02-12', 'present', '', 89, '2017-02-12 22:01:18.63606+00');
INSERT INTO attendance_attendance VALUES (1300, '2017-02-12', '2017-02-12', 'absent', 'Sick', 100, '2017-02-12 22:01:18.637358+00');
INSERT INTO attendance_attendance VALUES (1301, '2017-02-12', '2017-02-12', 'absent', 'Family visiting village', 108, '2017-02-12 22:01:18.638461+00');
INSERT INTO attendance_attendance VALUES (1302, '2017-02-12', '2017-02-12', 'present', '', 114, '2017-02-12 22:01:18.639572+00');
INSERT INTO attendance_attendance VALUES (1303, '2017-02-12', '2017-02-12', 'present', '', 116, '2017-02-12 22:01:18.640657+00');
INSERT INTO attendance_attendance VALUES (1304, '2017-02-12', '2017-02-12', 'present', '', 117, '2017-02-12 22:01:18.641616+00');
INSERT INTO attendance_attendance VALUES (1305, '2017-02-12', '2017-02-12', 'present', '', 118, '2017-02-12 22:01:18.643053+00');
INSERT INTO attendance_attendance VALUES (1306, '2017-02-12', '2017-02-12', 'absent', '', 119, '2017-02-12 22:01:18.644447+00');
INSERT INTO attendance_attendance VALUES (1307, '2017-02-12', '2017-02-12', 'present', '', 120, '2017-02-12 22:01:18.645467+00');
INSERT INTO attendance_attendance VALUES (1308, '2017-02-12', '2017-02-12', 'present', '', 121, '2017-02-12 22:01:18.646441+00');
INSERT INTO attendance_attendance VALUES (1309, '2017-02-12', '2017-02-12', 'absent', '', 130, '2017-02-12 22:01:18.647406+00');
INSERT INTO attendance_attendance VALUES (1311, '2017-02-12', '2017-02-12', 'absent', '', 145, '2017-02-12 22:01:18.649818+00');
INSERT INTO attendance_attendance VALUES (1312, '2017-02-12', '2017-02-12', 'present', '', 165, '2017-02-12 22:01:18.651153+00');
INSERT INTO attendance_attendance VALUES (1313, '2017-02-12', '2017-02-12', 'present', '', 185, '2017-02-12 22:01:18.65327+00');
INSERT INTO attendance_attendance VALUES (1314, '2017-02-12', '2017-02-12', 'present', '', 189, '2017-02-12 22:01:18.65456+00');
INSERT INTO attendance_attendance VALUES (1315, '2017-02-12', '2017-02-12', 'present', '', 204, '2017-02-12 22:01:18.655832+00');
INSERT INTO attendance_attendance VALUES (1316, '2017-02-12', '2017-02-12', 'present', '', 221, '2017-02-12 22:01:18.657368+00');
INSERT INTO attendance_attendance VALUES (1317, '2017-02-12', '2017-02-12', 'present', '', 225, '2017-02-12 22:01:18.658841+00');
INSERT INTO attendance_attendance VALUES (1318, '2017-02-12', '2017-02-12', 'absent', '', 271, '2017-02-12 22:01:18.660065+00');
INSERT INTO attendance_attendance VALUES (1319, '2017-02-12', '2017-02-12', 'absent', '', 300, '2017-02-12 22:01:18.661482+00');
INSERT INTO attendance_attendance VALUES (1320, '2017-02-12', '2017-02-12', 'absent', '', 74, '2017-02-12 22:01:18.932066+00');
INSERT INTO attendance_attendance VALUES (1321, '2017-02-12', '2017-02-12', 'present', '', 75, '2017-02-12 22:01:18.935108+00');
INSERT INTO attendance_attendance VALUES (1322, '2017-02-12', '2017-02-12', 'absent', '', 78, '2017-02-12 22:01:18.936209+00');
INSERT INTO attendance_attendance VALUES (1323, '2017-02-12', '2017-02-12', 'present', '', 82, '2017-02-12 22:01:18.937334+00');
INSERT INTO attendance_attendance VALUES (1325, '2017-02-12', '2017-02-12', 'present', '', 85, '2017-02-12 22:01:18.939869+00');
INSERT INTO attendance_attendance VALUES (1326, '2017-02-12', '2017-02-12', 'present', '', 86, '2017-02-12 22:01:18.940925+00');
INSERT INTO attendance_attendance VALUES (1327, '2017-02-12', '2017-02-12', 'absent', '', 91, '2017-02-12 22:01:18.942174+00');
INSERT INTO attendance_attendance VALUES (1328, '2017-02-12', '2017-02-12', 'present', '', 93, '2017-02-12 22:01:18.944469+00');
INSERT INTO attendance_attendance VALUES (1329, '2017-02-12', '2017-02-12', 'absent', '', 94, '2017-02-12 22:01:18.945589+00');
INSERT INTO attendance_attendance VALUES (1330, '2017-02-12', '2017-02-12', 'present', '', 103, '2017-02-12 22:01:18.946812+00');
INSERT INTO attendance_attendance VALUES (1331, '2017-02-12', '2017-02-12', 'absent', '', 104, '2017-02-12 22:01:18.948107+00');
INSERT INTO attendance_attendance VALUES (1333, '2017-02-12', '2017-02-12', 'present', '', 107, '2017-02-12 22:01:18.950614+00');
INSERT INTO attendance_attendance VALUES (1334, '2017-02-12', '2017-02-12', 'present', '', 109, '2017-02-12 22:01:18.951759+00');
INSERT INTO attendance_attendance VALUES (1335, '2017-02-12', '2017-02-12', 'absent', '', 112, '2017-02-12 22:01:18.953977+00');
INSERT INTO attendance_attendance VALUES (1336, '2017-02-12', '2017-02-12', 'present', '', 122, '2017-02-12 22:01:18.955128+00');
INSERT INTO attendance_attendance VALUES (1337, '2017-02-12', '2017-02-12', 'present', '', 126, '2017-02-12 22:01:18.9567+00');
INSERT INTO attendance_attendance VALUES (1339, '2017-02-12', '2017-02-12', 'absent', '', 131, '2017-02-12 22:01:18.959117+00');
INSERT INTO attendance_attendance VALUES (1340, '2017-02-12', '2017-02-12', 'present', '', 132, '2017-02-12 22:01:18.960298+00');
INSERT INTO attendance_attendance VALUES (1341, '2017-02-12', '2017-02-12', 'present', '', 133, '2017-02-12 22:01:18.9615+00');
INSERT INTO attendance_attendance VALUES (1342, '2017-02-12', '2017-02-12', 'present', '', 137, '2017-02-12 22:01:18.963652+00');
INSERT INTO attendance_attendance VALUES (1343, '2017-02-12', '2017-02-12', 'present', '', 164, '2017-02-12 22:01:18.964813+00');
INSERT INTO attendance_attendance VALUES (1344, '2017-02-12', '2017-02-12', 'absent', '', 166, '2017-02-12 22:01:18.966667+00');
INSERT INTO attendance_attendance VALUES (1346, '2017-02-12', '2017-02-12', 'present', '', 175, '2017-02-12 22:01:18.968923+00');
INSERT INTO attendance_attendance VALUES (1347, '2017-02-12', '2017-02-12', 'present', '', 177, '2017-02-12 22:01:18.970046+00');
INSERT INTO attendance_attendance VALUES (1348, '2017-02-12', '2017-02-12', 'absent', '', 182, '2017-02-12 22:01:18.971178+00');
INSERT INTO attendance_attendance VALUES (1349, '2017-02-12', '2017-02-12', 'present', '', 186, '2017-02-12 22:01:18.972304+00');
INSERT INTO attendance_attendance VALUES (1350, '2017-02-12', '2017-02-12', 'absent', '', 195, '2017-02-12 22:01:18.974345+00');
INSERT INTO attendance_attendance VALUES (1351, '2017-02-12', '2017-02-12', 'present', '', 198, '2017-02-12 22:01:18.975637+00');
INSERT INTO attendance_attendance VALUES (1352, '2017-02-12', '2017-02-12', 'absent', '', 227, '2017-02-12 22:01:18.976905+00');
INSERT INTO attendance_attendance VALUES (1354, '2017-02-12', '2017-02-12', 'absent', '', 335, '2017-02-12 22:01:18.979209+00');
INSERT INTO attendance_attendance VALUES (1284, '2017-02-12', '2017-02-12', 'present', '', 149, '2017-02-12 22:01:18.427836+00');
INSERT INTO attendance_attendance VALUES (1295, '2017-02-12', '2017-02-12', 'present', '', 64, '2017-02-12 22:01:18.630262+00');
INSERT INTO attendance_attendance VALUES (1310, '2017-02-12', '2017-02-12', 'present', '', 138, '2017-02-12 22:01:18.64838+00');
INSERT INTO attendance_attendance VALUES (1324, '2017-02-12', '2017-02-12', 'present', '', 83, '2017-02-12 22:01:18.938763+00');
INSERT INTO attendance_attendance VALUES (1332, '2017-02-12', '2017-02-12', 'present', '', 105, '2017-02-12 22:01:18.949234+00');
INSERT INTO attendance_attendance VALUES (1338, '2017-02-12', '2017-02-12', 'present', '', 127, '2017-02-12 22:01:18.957793+00');
INSERT INTO attendance_attendance VALUES (1345, '2017-02-12', '2017-02-12', 'present', '', 174, '2017-02-12 22:01:18.967769+00');
INSERT INTO attendance_attendance VALUES (1353, '2017-02-12', '2017-02-12', 'present', '', 303, '2017-02-12 22:01:18.978028+00');
INSERT INTO attendance_attendance VALUES (1356, '2017-02-11', '2017-02-12', 'absent', '', 159, '2017-02-13 01:06:25.805701+00');
INSERT INTO attendance_attendance VALUES (1357, '2017-02-11', '2017-02-12', 'absent', '', 161, '2017-02-13 01:06:25.807303+00');
INSERT INTO attendance_attendance VALUES (1358, '2017-02-11', '2017-02-12', 'absent', '', 179, '2017-02-13 01:06:25.808847+00');
INSERT INTO attendance_attendance VALUES (1359, '2017-02-11', '2017-02-12', 'absent', '', 197, '2017-02-13 01:06:25.810279+00');
INSERT INTO attendance_attendance VALUES (1360, '2017-02-11', '2017-02-12', 'absent', '', 200, '2017-02-13 01:06:25.811763+00');
INSERT INTO attendance_attendance VALUES (1361, '2017-02-11', '2017-02-12', 'absent', '', 201, '2017-02-13 01:06:25.81394+00');
INSERT INTO attendance_attendance VALUES (1363, '2017-02-11', '2017-02-12', 'absent', '', 209, '2017-02-13 01:06:25.817249+00');
INSERT INTO attendance_attendance VALUES (1364, '2017-02-11', '2017-02-12', 'absent', '', 210, '2017-02-13 01:06:25.818666+00');
INSERT INTO attendance_attendance VALUES (1365, '2017-02-11', '2017-02-12', 'absent', '', 211, '2017-02-13 01:06:25.819863+00');
INSERT INTO attendance_attendance VALUES (1366, '2017-02-11', '2017-02-12', 'absent', '', 219, '2017-02-13 01:06:25.821356+00');
INSERT INTO attendance_attendance VALUES (1367, '2017-02-11', '2017-02-12', 'absent', '', 229, '2017-02-13 01:06:25.823679+00');
INSERT INTO attendance_attendance VALUES (1368, '2017-02-11', '2017-02-12', 'absent', '', 232, '2017-02-13 01:06:25.825561+00');
INSERT INTO attendance_attendance VALUES (1369, '2017-02-11', '2017-02-12', 'absent', '', 233, '2017-02-13 01:06:25.826646+00');
INSERT INTO attendance_attendance VALUES (1370, '2017-02-11', '2017-02-12', 'absent', '', 234, '2017-02-13 01:06:25.828648+00');
INSERT INTO attendance_attendance VALUES (1371, '2017-02-11', '2017-02-12', 'absent', '', 241, '2017-02-13 01:06:25.830326+00');
INSERT INTO attendance_attendance VALUES (1372, '2017-02-11', '2017-02-12', 'absent', '', 244, '2017-02-13 01:06:25.831878+00');
INSERT INTO attendance_attendance VALUES (1373, '2017-02-11', '2017-02-12', 'absent', '', 245, '2017-02-13 01:06:25.834346+00');
INSERT INTO attendance_attendance VALUES (1374, '2017-02-11', '2017-02-12', 'absent', '', 247, '2017-02-13 01:06:25.836031+00');
INSERT INTO attendance_attendance VALUES (1375, '2017-02-11', '2017-02-12', 'absent', '', 248, '2017-02-13 01:06:25.837826+00');
INSERT INTO attendance_attendance VALUES (1376, '2017-02-11', '2017-02-12', 'absent', '', 251, '2017-02-13 01:06:25.839579+00');
INSERT INTO attendance_attendance VALUES (1378, '2017-02-11', '2017-02-12', 'absent', '', 256, '2017-02-13 01:06:25.843542+00');
INSERT INTO attendance_attendance VALUES (1379, '2017-02-11', '2017-02-12', 'absent', '', 257, '2017-02-13 01:06:25.845173+00');
INSERT INTO attendance_attendance VALUES (1380, '2017-02-11', '2017-02-12', 'absent', '', 265, '2017-02-13 01:06:25.847146+00');
INSERT INTO attendance_attendance VALUES (1381, '2017-02-11', '2017-02-12', 'absent', '', 269, '2017-02-13 01:06:25.848827+00');
INSERT INTO attendance_attendance VALUES (1382, '2017-02-11', '2017-02-12', 'absent', '', 270, '2017-02-13 01:06:25.849913+00');
INSERT INTO attendance_attendance VALUES (1383, '2017-02-11', '2017-02-12', 'absent', '', 272, '2017-02-13 01:06:25.850934+00');
INSERT INTO attendance_attendance VALUES (1384, '2017-02-11', '2017-02-12', 'absent', '', 276, '2017-02-13 01:06:25.851955+00');
INSERT INTO attendance_attendance VALUES (1385, '2017-02-11', '2017-02-12', 'absent', '', 277, '2017-02-13 01:06:25.854052+00');
INSERT INTO attendance_attendance VALUES (1386, '2017-02-11', '2017-02-12', 'absent', '', 278, '2017-02-13 01:06:25.85543+00');
INSERT INTO attendance_attendance VALUES (1387, '2017-02-11', '2017-02-12', 'absent', '', 279, '2017-02-13 01:06:25.856516+00');
INSERT INTO attendance_attendance VALUES (1388, '2017-02-11', '2017-02-12', 'absent', '', 280, '2017-02-13 01:06:25.857753+00');
INSERT INTO attendance_attendance VALUES (1389, '2017-02-11', '2017-02-12', 'absent', '', 284, '2017-02-13 01:06:25.858851+00');
INSERT INTO attendance_attendance VALUES (1390, '2017-02-11', '2017-02-12', 'absent', '', 286, '2017-02-13 01:06:25.859899+00');
INSERT INTO attendance_attendance VALUES (1391, '2017-02-11', '2017-02-12', 'absent', '', 290, '2017-02-13 01:06:25.860904+00');
INSERT INTO attendance_attendance VALUES (1393, '2017-02-11', '2017-02-12', 'absent', '', 292, '2017-02-13 01:06:25.864219+00');
INSERT INTO attendance_attendance VALUES (1394, '2017-02-11', '2017-02-12', 'absent', '', 293, '2017-02-13 01:06:25.865341+00');
INSERT INTO attendance_attendance VALUES (1395, '2017-02-11', '2017-02-12', 'absent', '', 294, '2017-02-13 01:06:25.866581+00');
INSERT INTO attendance_attendance VALUES (1396, '2017-02-11', '2017-02-12', 'absent', '', 295, '2017-02-13 01:06:25.86767+00');
INSERT INTO attendance_attendance VALUES (1397, '2017-02-11', '2017-02-12', 'absent', '', 296, '2017-02-13 01:06:25.868705+00');
INSERT INTO attendance_attendance VALUES (1398, '2017-02-11', '2017-02-12', 'absent', '', 298, '2017-02-13 01:06:25.869744+00');
INSERT INTO attendance_attendance VALUES (1399, '2017-02-11', '2017-02-12', 'absent', '', 299, '2017-02-13 01:06:25.870822+00');
INSERT INTO attendance_attendance VALUES (1400, '2017-02-11', '2017-02-12', 'absent', '', 304, '2017-02-13 01:06:25.871866+00');
INSERT INTO attendance_attendance VALUES (1401, '2017-02-11', '2017-02-12', 'absent', '', 305, '2017-02-13 01:06:25.873549+00');
INSERT INTO attendance_attendance VALUES (1402, '2017-02-11', '2017-02-12', 'absent', '', 308, '2017-02-13 01:06:25.87461+00');
INSERT INTO attendance_attendance VALUES (1403, '2017-02-11', '2017-02-12', 'absent', '', 310, '2017-02-13 01:06:25.875657+00');
INSERT INTO attendance_attendance VALUES (1404, '2017-02-11', '2017-02-12', 'absent', '', 311, '2017-02-13 01:06:25.876928+00');
INSERT INTO attendance_attendance VALUES (1405, '2017-02-11', '2017-02-12', 'absent', '', 316, '2017-02-13 01:06:25.87817+00');
INSERT INTO attendance_attendance VALUES (1406, '2017-02-11', '2017-02-12', 'absent', '', 317, '2017-02-13 01:06:25.879231+00');
INSERT INTO attendance_attendance VALUES (1408, '2017-02-11', '2017-02-12', 'absent', '', 319, '2017-02-13 01:06:25.88154+00');
INSERT INTO attendance_attendance VALUES (1409, '2017-02-11', '2017-02-12', 'absent', '', 320, '2017-02-13 01:06:25.882914+00');
INSERT INTO attendance_attendance VALUES (1410, '2017-02-11', '2017-02-12', 'absent', '', 321, '2017-02-13 01:06:25.884065+00');
INSERT INTO attendance_attendance VALUES (1411, '2017-02-11', '2017-02-12', 'absent', '', 322, '2017-02-13 01:06:25.885787+00');
INSERT INTO attendance_attendance VALUES (1412, '2017-02-11', '2017-02-12', 'absent', '', 323, '2017-02-13 01:06:25.886847+00');
INSERT INTO attendance_attendance VALUES (1413, '2017-02-11', '2017-02-12', 'absent', '', 324, '2017-02-13 01:06:25.887917+00');
INSERT INTO attendance_attendance VALUES (1414, '2017-02-11', '2017-02-12', 'absent', '', 325, '2017-02-13 01:06:25.889193+00');
INSERT INTO attendance_attendance VALUES (1415, '2017-02-11', '2017-02-12', 'absent', '', 326, '2017-02-13 01:06:25.890392+00');
INSERT INTO attendance_attendance VALUES (1416, '2017-02-11', '2017-02-12', 'absent', '', 328, '2017-02-13 01:06:25.891466+00');
INSERT INTO attendance_attendance VALUES (1417, '2017-02-11', '2017-02-12', 'absent', '', 329, '2017-02-13 01:06:25.893859+00');
INSERT INTO attendance_attendance VALUES (1418, '2017-02-11', '2017-02-12', 'absent', '', 330, '2017-02-13 01:06:25.895402+00');
INSERT INTO attendance_attendance VALUES (1419, '2017-02-11', '2017-02-12', 'absent', '', 331, '2017-02-13 01:06:25.896513+00');
INSERT INTO attendance_attendance VALUES (1420, '2017-02-11', '2017-02-12', 'absent', '', 332, '2017-02-13 01:06:25.897584+00');
INSERT INTO attendance_attendance VALUES (1421, '2017-02-11', '2017-02-12', 'absent', '', 333, '2017-02-13 01:06:25.898848+00');
INSERT INTO attendance_attendance VALUES (1423, '2017-02-11', '2017-02-12', 'absent', '', 142, '2017-02-13 01:06:26.16578+00');
INSERT INTO attendance_attendance VALUES (1424, '2017-02-11', '2017-02-12', 'absent', '', 151, '2017-02-13 01:06:26.166896+00');
INSERT INTO attendance_attendance VALUES (1425, '2017-02-11', '2017-02-12', 'absent', '', 152, '2017-02-13 01:06:26.167969+00');
INSERT INTO attendance_attendance VALUES (1426, '2017-02-11', '2017-02-12', 'absent', '', 153, '2017-02-13 01:06:26.169238+00');
INSERT INTO attendance_attendance VALUES (1427, '2017-02-11', '2017-02-12', 'absent', '', 154, '2017-02-13 01:06:26.17033+00');
INSERT INTO attendance_attendance VALUES (1428, '2017-02-11', '2017-02-12', 'absent', '', 157, '2017-02-13 01:06:26.171501+00');
INSERT INTO attendance_attendance VALUES (1429, '2017-02-11', '2017-02-12', 'absent', '', 162, '2017-02-13 01:06:26.176407+00');
INSERT INTO attendance_attendance VALUES (1430, '2017-02-11', '2017-02-12', 'absent', '', 163, '2017-02-13 01:06:26.177834+00');
INSERT INTO attendance_attendance VALUES (1431, '2017-02-11', '2017-02-12', 'absent', '', 176, '2017-02-13 01:06:26.179095+00');
INSERT INTO attendance_attendance VALUES (1432, '2017-02-11', '2017-02-12', 'absent', '', 202, '2017-02-13 01:06:26.180158+00');
INSERT INTO attendance_attendance VALUES (1433, '2017-02-11', '2017-02-12', 'absent', '', 214, '2017-02-13 01:06:26.181217+00');
INSERT INTO attendance_attendance VALUES (1434, '2017-02-11', '2017-02-12', 'absent', '', 216, '2017-02-13 01:06:26.182307+00');
INSERT INTO attendance_attendance VALUES (1435, '2017-02-11', '2017-02-12', 'absent', '', 220, '2017-02-13 01:06:26.18709+00');
INSERT INTO attendance_attendance VALUES (1436, '2017-02-11', '2017-02-12', 'absent', '', 222, '2017-02-13 01:06:26.188154+00');
INSERT INTO attendance_attendance VALUES (1438, '2017-02-11', '2017-02-12', 'absent', '', 226, '2017-02-13 01:06:26.190311+00');
INSERT INTO attendance_attendance VALUES (1439, '2017-02-11', '2017-02-12', 'absent', '', 228, '2017-02-13 01:06:26.19155+00');
INSERT INTO attendance_attendance VALUES (1440, '2017-02-11', '2017-02-12', 'absent', '', 236, '2017-02-13 01:06:26.195628+00');
INSERT INTO attendance_attendance VALUES (1441, '2017-02-11', '2017-02-12', 'absent', '', 258, '2017-02-13 01:06:26.197112+00');
INSERT INTO attendance_attendance VALUES (1442, '2017-02-11', '2017-02-12', 'absent', '', 262, '2017-02-13 01:06:26.19825+00');
INSERT INTO attendance_attendance VALUES (1443, '2017-02-11', '2017-02-12', 'absent', '', 263, '2017-02-13 01:06:26.199324+00');
INSERT INTO attendance_attendance VALUES (1444, '2017-02-11', '2017-02-12', 'absent', '', 266, '2017-02-13 01:06:26.200472+00');
INSERT INTO attendance_attendance VALUES (1445, '2017-02-11', '2017-02-12', 'absent', '', 281, '2017-02-13 01:06:26.201595+00');
INSERT INTO attendance_attendance VALUES (1446, '2017-02-11', '2017-02-12', 'absent', '', 297, '2017-02-13 01:06:26.205176+00');
INSERT INTO attendance_attendance VALUES (1447, '2017-02-11', '2017-02-12', 'absent', '', 301, '2017-02-13 01:06:26.206592+00');
INSERT INTO attendance_attendance VALUES (1448, '2017-02-11', '2017-02-12', 'absent', '', 313, '2017-02-13 01:06:26.207682+00');
INSERT INTO attendance_attendance VALUES (1449, '2017-02-11', '2017-02-12', 'absent', '', 315, '2017-02-13 01:06:26.208787+00');
INSERT INTO attendance_attendance VALUES (1450, '2017-02-11', '2017-02-12', 'absent', '', 110, '2017-02-13 01:06:26.390975+00');
INSERT INTO attendance_attendance VALUES (1451, '2017-02-11', '2017-02-12', 'absent', '', 113, '2017-02-13 01:06:26.394884+00');
INSERT INTO attendance_attendance VALUES (1453, '2017-02-11', '2017-02-12', 'absent', '', 128, '2017-02-13 01:06:26.397661+00');
INSERT INTO attendance_attendance VALUES (1454, '2017-02-11', '2017-02-12', 'absent', '', 141, '2017-02-13 01:06:26.39904+00');
INSERT INTO attendance_attendance VALUES (1455, '2017-02-11', '2017-02-12', 'absent', '', 144, '2017-02-13 01:06:26.40017+00');
INSERT INTO attendance_attendance VALUES (1456, '2017-02-11', '2017-02-12', 'absent', '', 149, '2017-02-13 01:06:26.401395+00');
INSERT INTO attendance_attendance VALUES (1457, '2017-02-11', '2017-02-12', 'absent', '', 150, '2017-02-13 01:06:26.40491+00');
INSERT INTO attendance_attendance VALUES (1458, '2017-02-11', '2017-02-12', 'absent', '', 156, '2017-02-13 01:06:26.406035+00');
INSERT INTO attendance_attendance VALUES (1459, '2017-02-11', '2017-02-12', 'absent', '', 158, '2017-02-13 01:06:26.407119+00');
INSERT INTO attendance_attendance VALUES (1460, '2017-02-11', '2017-02-12', 'absent', '', 188, '2017-02-13 01:06:26.408187+00');
INSERT INTO attendance_attendance VALUES (1461, '2017-02-11', '2017-02-12', 'absent', '', 192, '2017-02-13 01:06:26.409261+00');
INSERT INTO attendance_attendance VALUES (1462, '2017-02-11', '2017-02-12', 'absent', '', 199, '2017-02-13 01:06:26.410365+00');
INSERT INTO attendance_attendance VALUES (1463, '2017-02-11', '2017-02-12', 'absent', '', 205, '2017-02-13 01:06:26.411457+00');
INSERT INTO attendance_attendance VALUES (1464, '2017-02-11', '2017-02-12', 'absent', '', 246, '2017-02-13 01:06:26.414826+00');
INSERT INTO attendance_attendance VALUES (1465, '2017-02-11', '2017-02-12', 'absent', '', 282, '2017-02-13 01:06:26.415932+00');
INSERT INTO attendance_attendance VALUES (1466, '2017-02-11', '2017-02-12', 'absent', '', 285, '2017-02-13 01:06:26.417005+00');
INSERT INTO attendance_attendance VALUES (1468, '2017-02-11', '2017-02-12', 'present', '', 66, '2017-02-13 01:06:26.68747+00');
INSERT INTO attendance_attendance VALUES (1469, '2017-02-11', '2017-02-12', 'absent', '', 76, '2017-02-13 01:06:26.688873+00');
INSERT INTO attendance_attendance VALUES (1470, '2017-02-11', '2017-02-12', 'absent', '', 87, '2017-02-13 01:06:26.690163+00');
INSERT INTO attendance_attendance VALUES (1471, '2017-02-11', '2017-02-12', 'present', '', 89, '2017-02-13 01:06:26.691418+00');
INSERT INTO attendance_attendance VALUES (1472, '2017-02-11', '2017-02-12', 'present', '', 100, '2017-02-13 01:06:26.694915+00');
INSERT INTO attendance_attendance VALUES (1473, '2017-02-11', '2017-02-12', 'absent', '', 108, '2017-02-13 01:06:26.696195+00');
INSERT INTO attendance_attendance VALUES (1474, '2017-02-11', '2017-02-12', 'present', '', 114, '2017-02-13 01:06:26.697407+00');
INSERT INTO attendance_attendance VALUES (1475, '2017-02-11', '2017-02-12', 'absent', '', 116, '2017-02-13 01:06:26.698827+00');
INSERT INTO attendance_attendance VALUES (1476, '2017-02-11', '2017-02-12', 'absent', '', 117, '2017-02-13 01:06:26.699993+00');
INSERT INTO attendance_attendance VALUES (1477, '2017-02-11', '2017-02-12', 'absent', '', 118, '2017-02-13 01:06:26.701105+00');
INSERT INTO attendance_attendance VALUES (1478, '2017-02-11', '2017-02-12', 'present', '', 119, '2017-02-13 01:06:26.702208+00');
INSERT INTO attendance_attendance VALUES (1479, '2017-02-11', '2017-02-12', 'absent', '', 120, '2017-02-13 01:06:26.705088+00');
INSERT INTO attendance_attendance VALUES (1480, '2017-02-11', '2017-02-12', 'absent', '', 121, '2017-02-13 01:06:26.706333+00');
INSERT INTO attendance_attendance VALUES (1355, '2017-02-11', '2017-02-12', 'absent', '', 155, '2017-02-13 01:06:25.802177+00');
INSERT INTO attendance_attendance VALUES (1362, '2017-02-11', '2017-02-12', 'absent', '', 208, '2017-02-13 01:06:25.815695+00');
INSERT INTO attendance_attendance VALUES (1377, '2017-02-11', '2017-02-12', 'absent', '', 252, '2017-02-13 01:06:25.841058+00');
INSERT INTO attendance_attendance VALUES (1392, '2017-02-11', '2017-02-12', 'absent', '', 291, '2017-02-13 01:06:25.862098+00');
INSERT INTO attendance_attendance VALUES (1407, '2017-02-11', '2017-02-12', 'absent', '', 318, '2017-02-13 01:06:25.880465+00');
INSERT INTO attendance_attendance VALUES (1422, '2017-02-11', '2017-02-12', 'absent', '', 123, '2017-02-13 01:06:26.161148+00');
INSERT INTO attendance_attendance VALUES (1437, '2017-02-11', '2017-02-12', 'absent', '', 223, '2017-02-13 01:06:26.189219+00');
INSERT INTO attendance_attendance VALUES (1452, '2017-02-11', '2017-02-12', 'absent', '', 115, '2017-02-13 01:06:26.396359+00');
INSERT INTO attendance_attendance VALUES (1467, '2017-02-11', '2017-02-12', 'present', '', 64, '2017-02-13 01:06:26.685502+00');
INSERT INTO attendance_attendance VALUES (1481, '2017-02-11', '2017-02-12', 'absent', '', 130, '2017-02-13 01:06:26.707469+00');
INSERT INTO attendance_attendance VALUES (1482, '2017-02-11', '2017-02-12', 'absent', '', 138, '2017-02-13 01:06:26.708562+00');
INSERT INTO attendance_attendance VALUES (1483, '2017-02-11', '2017-02-12', 'absent', '', 145, '2017-02-13 01:06:26.709629+00');
INSERT INTO attendance_attendance VALUES (1484, '2017-02-11', '2017-02-12', 'absent', '', 165, '2017-02-13 01:06:26.710731+00');
INSERT INTO attendance_attendance VALUES (1485, '2017-02-11', '2017-02-12', 'absent', '', 185, '2017-02-13 01:06:26.711781+00');
INSERT INTO attendance_attendance VALUES (1486, '2017-02-11', '2017-02-12', 'absent', '', 189, '2017-02-13 01:06:26.715222+00');
INSERT INTO attendance_attendance VALUES (1487, '2017-02-11', '2017-02-12', 'absent', '', 204, '2017-02-13 01:06:26.716316+00');
INSERT INTO attendance_attendance VALUES (1488, '2017-02-11', '2017-02-12', 'absent', '', 221, '2017-02-13 01:06:26.717396+00');
INSERT INTO attendance_attendance VALUES (1489, '2017-02-11', '2017-02-12', 'absent', '', 225, '2017-02-13 01:06:26.718466+00');
INSERT INTO attendance_attendance VALUES (1490, '2017-02-11', '2017-02-12', 'absent', '', 271, '2017-02-13 01:06:26.71971+00');
INSERT INTO attendance_attendance VALUES (1491, '2017-02-11', '2017-02-12', 'absent', '', 300, '2017-02-13 01:06:26.720793+00');
INSERT INTO attendance_attendance VALUES (1492, '2017-02-11', '2017-02-12', 'absent', '', 74, '2017-02-13 01:06:27.082297+00');
INSERT INTO attendance_attendance VALUES (1493, '2017-02-11', '2017-02-12', 'absent', '', 75, '2017-02-13 01:06:27.085242+00');
INSERT INTO attendance_attendance VALUES (1494, '2017-02-11', '2017-02-12', 'absent', '', 78, '2017-02-13 01:06:27.08633+00');
INSERT INTO attendance_attendance VALUES (1495, '2017-02-11', '2017-02-12', 'absent', '', 82, '2017-02-13 01:06:27.087392+00');
INSERT INTO attendance_attendance VALUES (1496, '2017-02-11', '2017-02-12', 'absent', '', 83, '2017-02-13 01:06:27.088454+00');
INSERT INTO attendance_attendance VALUES (1497, '2017-02-11', '2017-02-12', 'absent', '', 85, '2017-02-13 01:06:27.0895+00');
INSERT INTO attendance_attendance VALUES (1498, '2017-02-11', '2017-02-12', 'absent', '', 86, '2017-02-13 01:06:27.090548+00');
INSERT INTO attendance_attendance VALUES (1499, '2017-02-11', '2017-02-12', 'absent', '', 91, '2017-02-13 01:06:27.091576+00');
INSERT INTO attendance_attendance VALUES (1500, '2017-02-11', '2017-02-12', 'absent', '', 93, '2017-02-13 01:06:27.092896+00');
INSERT INTO attendance_attendance VALUES (1501, '2017-02-11', '2017-02-12', 'absent', '', 94, '2017-02-13 01:06:27.094125+00');
INSERT INTO attendance_attendance VALUES (1502, '2017-02-11', '2017-02-12', 'absent', '', 103, '2017-02-13 01:06:27.095417+00');
INSERT INTO attendance_attendance VALUES (1503, '2017-02-11', '2017-02-12', 'absent', '', 104, '2017-02-13 01:06:27.096666+00');
INSERT INTO attendance_attendance VALUES (1504, '2017-02-11', '2017-02-12', 'absent', '', 105, '2017-02-13 01:06:27.097797+00');
INSERT INTO attendance_attendance VALUES (1505, '2017-02-11', '2017-02-12', 'absent', '', 107, '2017-02-13 01:06:27.0992+00');
INSERT INTO attendance_attendance VALUES (1506, '2017-02-11', '2017-02-12', 'absent', '', 109, '2017-02-13 01:06:27.100295+00');
INSERT INTO attendance_attendance VALUES (1507, '2017-02-11', '2017-02-12', 'absent', '', 112, '2017-02-13 01:06:27.10154+00');
INSERT INTO attendance_attendance VALUES (1508, '2017-02-11', '2017-02-12', 'absent', '', 122, '2017-02-13 01:06:27.103027+00');
INSERT INTO attendance_attendance VALUES (1509, '2017-02-11', '2017-02-12', 'absent', '', 126, '2017-02-13 01:06:27.104275+00');
INSERT INTO attendance_attendance VALUES (1510, '2017-02-11', '2017-02-12', 'absent', '', 127, '2017-02-13 01:06:27.105397+00');
INSERT INTO attendance_attendance VALUES (1511, '2017-02-11', '2017-02-12', 'absent', '', 131, '2017-02-13 01:06:27.106514+00');
INSERT INTO attendance_attendance VALUES (1512, '2017-02-11', '2017-02-12', 'absent', '', 132, '2017-02-13 01:06:27.107559+00');
INSERT INTO attendance_attendance VALUES (1513, '2017-02-11', '2017-02-12', 'absent', '', 133, '2017-02-13 01:06:27.108562+00');
INSERT INTO attendance_attendance VALUES (1514, '2017-02-11', '2017-02-12', 'absent', '', 137, '2017-02-13 01:06:27.109597+00');
INSERT INTO attendance_attendance VALUES (1515, '2017-02-11', '2017-02-12', 'absent', '', 164, '2017-02-13 01:06:27.11065+00');
INSERT INTO attendance_attendance VALUES (1516, '2017-02-11', '2017-02-12', 'absent', '', 166, '2017-02-13 01:06:27.1117+00');
INSERT INTO attendance_attendance VALUES (1517, '2017-02-11', '2017-02-12', 'absent', '', 174, '2017-02-13 01:06:27.113089+00');
INSERT INTO attendance_attendance VALUES (1518, '2017-02-11', '2017-02-12', 'absent', '', 175, '2017-02-13 01:06:27.114384+00');
INSERT INTO attendance_attendance VALUES (1519, '2017-02-11', '2017-02-12', 'absent', '', 177, '2017-02-13 01:06:27.115431+00');
INSERT INTO attendance_attendance VALUES (1520, '2017-02-11', '2017-02-12', 'absent', '', 182, '2017-02-13 01:06:27.116799+00');
INSERT INTO attendance_attendance VALUES (1521, '2017-02-11', '2017-02-12', 'absent', '', 186, '2017-02-13 01:06:27.117865+00');
INSERT INTO attendance_attendance VALUES (1522, '2017-02-11', '2017-02-12', 'absent', '', 195, '2017-02-13 01:06:27.119085+00');
INSERT INTO attendance_attendance VALUES (1523, '2017-02-11', '2017-02-12', 'absent', '', 198, '2017-02-13 01:06:27.120143+00');
INSERT INTO attendance_attendance VALUES (1524, '2017-02-11', '2017-02-12', 'absent', '', 227, '2017-02-13 01:06:27.121226+00');
INSERT INTO attendance_attendance VALUES (1525, '2017-02-11', '2017-02-12', 'absent', '', 303, '2017-02-13 01:06:27.123378+00');
INSERT INTO attendance_attendance VALUES (1526, '2017-02-11', '2017-02-12', 'absent', '', 335, '2017-02-13 01:06:27.124675+00');
INSERT INTO attendance_attendance VALUES (1527, '2017-02-12', '2017-02-12', 'present', '', 23, '2017-02-13 01:06:41.970545+00');
INSERT INTO attendance_attendance VALUES (1528, '2017-02-12', '2017-02-12', 'present', '', 24, '2017-02-13 01:06:41.972315+00');
INSERT INTO attendance_attendance VALUES (1529, '2017-02-12', '2017-02-12', 'absent', '', 25, '2017-02-13 01:06:41.974378+00');
INSERT INTO attendance_attendance VALUES (1530, '2017-02-12', '2017-02-12', 'absent', '', 30, '2017-02-13 01:06:41.975213+00');
INSERT INTO attendance_attendance VALUES (1531, '2017-02-12', '2017-02-12', 'absent', '', 26, '2017-02-13 01:06:41.994295+00');
INSERT INTO attendance_attendance VALUES (1532, '2017-02-12', '2017-02-12', 'absent', '', 27, '2017-02-13 01:06:41.995199+00');
INSERT INTO attendance_attendance VALUES (1533, '2017-02-25', '2017-02-25', 'absent', '', 3, '2017-02-25 14:54:56.116823+00');
INSERT INTO attendance_attendance VALUES (1534, '2017-02-25', '2017-02-25', 'absent', '', 4, '2017-02-25 14:54:56.119864+00');
INSERT INTO attendance_attendance VALUES (1535, '2017-02-25', '2017-02-25', 'absent', '', 5, '2017-02-25 14:54:56.150658+00');
INSERT INTO attendance_attendance VALUES (1536, '2017-02-25', '2017-02-25', 'absent', '', 6, '2017-02-25 14:54:56.151787+00');
INSERT INTO attendance_attendance VALUES (1537, '2017-02-25', '2017-02-25', 'absent', '', 7, '2017-02-25 14:54:56.153866+00');
INSERT INTO attendance_attendance VALUES (1538, '2017-02-25', '2017-02-25', 'absent', '', 31, '2017-02-25 14:54:56.154979+00');


--
-- Name: attendance_attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('attendance_attendance_id_seq', 1538, true);


--
-- Data for Name: attendance_attendancecalendar; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO attendance_attendancecalendar VALUES (2, '2017-02-01', 24, NULL, 1);
INSERT INTO attendance_attendancecalendar VALUES (3, '2017-03-01', 26, NULL, 1);
INSERT INTO attendance_attendancecalendar VALUES (4, '2017-01-01', 18, NULL, 2);
INSERT INTO attendance_attendancecalendar VALUES (5, '2017-02-01', 22, NULL, 2);
INSERT INTO attendance_attendancecalendar VALUES (6, '2017-01-01', 17, NULL, 3);
INSERT INTO attendance_attendancecalendar VALUES (7, '2017-01-01', 19, NULL, 4);
INSERT INTO attendance_attendancecalendar VALUES (8, '2017-02-01', 27, NULL, 4);
INSERT INTO attendance_attendancecalendar VALUES (9, '2016-12-01', 12, NULL, 1);
INSERT INTO attendance_attendancecalendar VALUES (1, '2017-01-01', 23, NULL, 1);
INSERT INTO attendance_attendancecalendar VALUES (12, '2017-04-03', 25, NULL, 2);
INSERT INTO attendance_attendancecalendar VALUES (10, '2017-04-01', 25, NULL, 1);
INSERT INTO attendance_attendancecalendar VALUES (13, '2017-02-01', 20, NULL, 5);
INSERT INTO attendance_attendancecalendar VALUES (14, '2017-01-01', 20, NULL, 5);
INSERT INTO attendance_attendancecalendar VALUES (15, '2017-03-01', 22, NULL, 5);
INSERT INTO attendance_attendancecalendar VALUES (16, '2017-05-01', 26, NULL, 2);
INSERT INTO attendance_attendancecalendar VALUES (11, '2017-03-01', 19, NULL, 2);
INSERT INTO attendance_attendancecalendar VALUES (17, '2017-06-01', 23, NULL, 2);
INSERT INTO attendance_attendancecalendar VALUES (18, '2017-02-01', 23, NULL, 7);
INSERT INTO attendance_attendancecalendar VALUES (19, '2017-04-01', 22, NULL, 7);


--
-- Name: attendance_attendancecalendar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('attendance_attendancecalendar_id_seq', 19, true);


--
-- Data for Name: attendance_nonscheduledholidays; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO attendance_nonscheduledholidays VALUES (1, '2017-01-18', 'some reason - donno', 1);
INSERT INTO attendance_nonscheduledholidays VALUES (2, '2017-01-16', 'it was raining really hard. had to cancel evening session', 1);
INSERT INTO attendance_nonscheduledholidays VALUES (3, '2016-12-16', 'strike schools were shut', 1);
INSERT INTO attendance_nonscheduledholidays VALUES (4, '2016-10-05', 'election day', 1);
INSERT INTO attendance_nonscheduledholidays VALUES (5, '2017-01-20', 'just cuz', 2);
INSERT INTO attendance_nonscheduledholidays VALUES (6, '2016-11-26', 'principal sick', 2);
INSERT INTO attendance_nonscheduledholidays VALUES (7, '2016-09-12', 'hartaal', 2);
INSERT INTO attendance_nonscheduledholidays VALUES (8, '2016-11-24', 'school PTA', 3);
INSERT INTO attendance_nonscheduledholidays VALUES (9, '2017-01-02', 'holiday for school', 4);
INSERT INTO attendance_nonscheduledholidays VALUES (10, '2016-12-23', 'some unexpected reason', 4);
INSERT INTO attendance_nonscheduledholidays VALUES (11, '2017-01-23', 'hartaal', 2);
INSERT INTO attendance_nonscheduledholidays VALUES (12, '2017-01-22', 'extreme rain', 1);
INSERT INTO attendance_nonscheduledholidays VALUES (13, '2017-02-01', 'hartaal', 5);
INSERT INTO attendance_nonscheduledholidays VALUES (19, '2017-02-15', 'Rain day', 2);
INSERT INTO attendance_nonscheduledholidays VALUES (20, '2017-02-12', 'Hartal', 7);
INSERT INTO attendance_nonscheduledholidays VALUES (21, '2016-05-12', 'test', 1);


--
-- Name: attendance_nonscheduledholidays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('attendance_nonscheduledholidays_id_seq', 21, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--



--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--



--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO auth_permission VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO auth_permission VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO auth_permission VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO auth_permission VALUES (7, 'Can add user', 3, 'add_user');
INSERT INTO auth_permission VALUES (8, 'Can change user', 3, 'change_user');
INSERT INTO auth_permission VALUES (9, 'Can delete user', 3, 'delete_user');
INSERT INTO auth_permission VALUES (10, 'Can add group', 4, 'add_group');
INSERT INTO auth_permission VALUES (11, 'Can change group', 4, 'change_group');
INSERT INTO auth_permission VALUES (12, 'Can delete group', 4, 'delete_group');
INSERT INTO auth_permission VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO auth_permission VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO auth_permission VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO auth_permission VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO auth_permission VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO auth_permission VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO auth_permission VALUES (19, 'Can add school', 7, 'add_school');
INSERT INTO auth_permission VALUES (20, 'Can change school', 7, 'change_school');
INSERT INTO auth_permission VALUES (21, 'Can delete school', 7, 'delete_school');
INSERT INTO auth_permission VALUES (22, 'Can add class', 8, 'add_class');
INSERT INTO auth_permission VALUES (23, 'Can change class', 8, 'change_class');
INSERT INTO auth_permission VALUES (24, 'Can delete class', 8, 'delete_class');
INSERT INTO auth_permission VALUES (25, 'Can add teacher', 9, 'add_teacher');
INSERT INTO auth_permission VALUES (26, 'Can change teacher', 9, 'change_teacher');
INSERT INTO auth_permission VALUES (27, 'Can delete teacher', 9, 'delete_teacher');
INSERT INTO auth_permission VALUES (28, 'Can add student', 10, 'add_student');
INSERT INTO auth_permission VALUES (29, 'Can change student', 10, 'change_student');
INSERT INTO auth_permission VALUES (30, 'Can delete student', 10, 'delete_student');
INSERT INTO auth_permission VALUES (31, 'Can add attendance calendar', 11, 'add_attendancecalendar');
INSERT INTO auth_permission VALUES (32, 'Can change attendance calendar', 11, 'change_attendancecalendar');
INSERT INTO auth_permission VALUES (33, 'Can delete attendance calendar', 11, 'delete_attendancecalendar');
INSERT INTO auth_permission VALUES (34, 'Can add non scheduled holidays', 12, 'add_nonscheduledholidays');
INSERT INTO auth_permission VALUES (35, 'Can change non scheduled holidays', 12, 'change_nonscheduledholidays');
INSERT INTO auth_permission VALUES (36, 'Can delete non scheduled holidays', 12, 'delete_nonscheduledholidays');
INSERT INTO auth_permission VALUES (37, 'Can add attendance', 13, 'add_attendance');
INSERT INTO auth_permission VALUES (38, 'Can change attendance', 13, 'change_attendance');
INSERT INTO auth_permission VALUES (39, 'Can delete attendance', 13, 'delete_attendance');
INSERT INTO auth_permission VALUES (40, 'Can add donor_log', 14, 'add_donor_log');
INSERT INTO auth_permission VALUES (41, 'Can change donor_log', 14, 'change_donor_log');
INSERT INTO auth_permission VALUES (42, 'Can delete donor_log', 14, 'delete_donor_log');
INSERT INTO auth_permission VALUES (43, 'Can add donor', 15, 'add_donor');
INSERT INTO auth_permission VALUES (44, 'Can change donor', 15, 'change_donor');
INSERT INTO auth_permission VALUES (45, 'Can delete donor', 15, 'delete_donor');
INSERT INTO auth_permission VALUES (46, 'Can add user access', 16, 'add_useraccess');
INSERT INTO auth_permission VALUES (47, 'Can change user access', 16, 'change_useraccess');
INSERT INTO auth_permission VALUES (48, 'Can delete user access', 16, 'delete_useraccess');
INSERT INTO auth_permission VALUES (49, 'Can add student history', 17, 'add_studenthistory');
INSERT INTO auth_permission VALUES (50, 'Can change student history', 17, 'change_studenthistory');
INSERT INTO auth_permission VALUES (51, 'Can delete student history', 17, 'delete_studenthistory');
INSERT INTO auth_permission VALUES (52, 'Can add teacher attendance', 18, 'add_teacherattendance');
INSERT INTO auth_permission VALUES (53, 'Can change teacher attendance', 18, 'change_teacherattendance');
INSERT INTO auth_permission VALUES (54, 'Can delete teacher attendance', 18, 'delete_teacherattendance');


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('auth_permission_id_seq', 54, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO auth_user VALUES (1, 'pbkdf2_sha256$30000$zeSdSjFfvIc8$yqMdjGqOYSvgHTU5Wvx5vLy3ppt40NfqbY2xu3HAVak=', '2017-02-25 14:54:18.277135+00', true, 'admin', '', '', 'junaidq1@gmail.com', true, true, '2017-01-15 22:36:52.431687+00');
INSERT INTO auth_user VALUES (4, 'pbkdf2_sha256$30000$ZpvbmqeeRrhc$n7CcokSsmM37dpseZU4bLPg+HarUsR4bGvOWwQ2XTzY=', NULL, false, 'teach2', '', '', '', false, true, '2017-01-21 22:15:50.103184+00');
INSERT INTO auth_user VALUES (5, 'pbkdf2_sha256$30000$txlruYp5EHKf$qJAdG0uFTcYVhZXfu4sQJuKMgAZ2ltazcsy7uCG5TEQ=', NULL, false, 'teach3', '', '', '', false, true, '2017-01-21 22:15:58.845739+00');
INSERT INTO auth_user VALUES (3, 'pbkdf2_sha256$30000$pQwRGRLRE7S4$0s62hYfc6rwzds7y3HLEXrNZRAqgIxe4hZrgRrdCA/w=', '2017-02-10 00:07:46.446912+00', false, 'teach1', '', '', '', false, true, '2017-01-21 22:15:30+00');
INSERT INTO auth_user VALUES (2, 'pbkdf2_sha256$30000$z16v441aj3mF$Y5q1dcceaiKQwh50JINoUTKVoCgMEz0VjMY9pPL/H0I=', '2017-02-10 00:09:22.989952+00', false, 'thebomb', '', '', '', false, true, '2017-01-16 22:19:17.363976+00');


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--



--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('auth_user_id_seq', 5, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--



--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: classes_class; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO classes_class VALUES (20, 'Play Group', 'A', 'PK5_Play Group_A_morning', 1, 5, 'morning');
INSERT INTO classes_class VALUES (21, 'Nursery', 'A', 'PK5_Nursery_A_morning', 1, 5, 'morning');
INSERT INTO classes_class VALUES (22, 'Nursery', 'B', 'PK5_Nursery_B_evening', 1, 5, 'evening');
INSERT INTO classes_class VALUES (23, 'M1', 'A', 'PK5_M1_A_morning', 1, 5, 'morning');
INSERT INTO classes_class VALUES (24, 'M1', 'B', 'PK5_M1_B_evening', 1, 5, 'evening');
INSERT INTO classes_class VALUES (25, 'M2', 'A', 'PK5_M2_A_morning', 1, 5, 'morning');
INSERT INTO classes_class VALUES (26, 'M2', 'B', 'PK5_M2_B_morning', 1, 5, 'morning');
INSERT INTO classes_class VALUES (27, 'Class 3', 'A', 'PK5_Class 3_A_evening', 1, 5, 'evening');
INSERT INTO classes_class VALUES (28, 'Class 4', 'A', 'PK5_Class 4_A_evening', 1, 5, 'evening');
INSERT INTO classes_class VALUES (29, 'Class 5', 'A', 'PK5_Class 5_A_evening', 1, 5, 'evening');
INSERT INTO classes_class VALUES (1, 'M1', 'A', 'PK1_M1_A_evening', 1, 1, 'evening');
INSERT INTO classes_class VALUES (2, 'M2', 'A', 'PK1_M2_A_morning', 1, 1, 'morning');
INSERT INTO classes_class VALUES (3, 'Class 3', 'A', 'PK1_Class 3_A_morning', 1, 1, 'morning');
INSERT INTO classes_class VALUES (4, 'M1', 'A', 'PK2_M1_A_morning', 1, 2, 'morning');
INSERT INTO classes_class VALUES (5, 'M2', 'A', 'PK2_M2_A_evening', 1, 2, 'evening');
INSERT INTO classes_class VALUES (6, 'Class 3', 'A', 'PK3_Class 3_A_evening', 1, 3, 'evening');
INSERT INTO classes_class VALUES (7, 'Class 4', 'A', 'PK3_Class 4_A_evening', 1, 3, 'evening');
INSERT INTO classes_class VALUES (8, 'Class 5', 'A', 'PK3_Class 5_A_morning', 1, 3, 'morning');
INSERT INTO classes_class VALUES (9, 'Play Group', 'A', 'PK4_Play Group_A_morning', 1, 4, 'morning');
INSERT INTO classes_class VALUES (10, 'Nursery', 'A', 'PK4_Nursery_A_morning', 1, 4, 'morning');
INSERT INTO classes_class VALUES (12, 'Play Group', 'A', 'PK3_Play Group_A_evening', 4, 3, 'evening');
INSERT INTO classes_class VALUES (11, 'M1', 'A', 'PK4_M1_A_evening', 1, 4, 'evening');


--
-- Name: classes_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('classes_class_id_seq', 29, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO django_admin_log VALUES (1, '2017-01-15 22:40:04.752373+00', '1', 'admin_admin', 1, '[{"added": {}}]', 9, 1);
INSERT INTO django_admin_log VALUES (2, '2017-01-15 22:41:04.750791+00', '1', 'PK1 - morning', 1, '[{"added": {}}]', 7, 1);
INSERT INTO django_admin_log VALUES (3, '2017-01-15 22:41:40.622754+00', '1', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (4, '2017-01-15 22:41:53.847566+00', '2', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (5, '2017-01-15 22:42:10.024964+00', '3', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (6, '2017-01-15 22:42:49.572747+00', '1', 'john_snow', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (7, '2017-01-15 22:43:16.3546+00', '2', 'hillary_clinton', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (8, '2017-01-15 22:43:42.120387+00', '3', 'super_man', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (9, '2017-01-15 22:44:25.063144+00', '4', 'barack_obama', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (10, '2017-01-15 22:44:51.816177+00', '5', 'cat_woman', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (11, '2017-01-15 22:45:17.697024+00', '6', 'bat_man', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (12, '2017-01-15 22:45:43.181778+00', '7', 'spider_man', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (13, '2017-01-15 22:46:25.077257+00', '1', 'admin_admin', 2, '[]', 9, 1);
INSERT INTO django_admin_log VALUES (14, '2017-01-16 21:40:33.37035+00', '2', 'PK2 - morning', 1, '[{"added": {}}]', 7, 1);
INSERT INTO django_admin_log VALUES (15, '2017-01-16 21:43:54.604545+00', '4', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (16, '2017-01-16 21:44:56.214307+00', '5', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (17, '2017-01-16 21:54:37.122341+00', '1', 'admin_admin', 2, '[]', 9, 1);
INSERT INTO django_admin_log VALUES (18, '2017-01-16 22:19:17.801698+00', '2', 'thebomb', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log VALUES (19, '2017-01-17 22:26:21.079892+00', '3', 'PK3 - morning', 1, '[{"added": {}}]', 7, 1);
INSERT INTO django_admin_log VALUES (20, '2017-01-17 22:26:55.845659+00', '4', 'PK4 - evening', 1, '[{"added": {}}]', 7, 1);
INSERT INTO django_admin_log VALUES (21, '2017-01-17 22:27:58.505391+00', '6', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (22, '2017-01-17 22:28:08.880963+00', '7', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (23, '2017-01-17 22:28:22.479021+00', '8', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (24, '2017-01-17 22:28:45.791951+00', '9', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (25, '2017-01-17 22:28:56.415706+00', '10', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (26, '2017-01-17 22:29:07.82185+00', '11', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (27, '2017-01-17 22:31:53.408741+00', '1', 'PK1 - morning', 1, '[{"added": {}}]', 11, 1);
INSERT INTO django_admin_log VALUES (28, '2017-01-17 22:32:09.038035+00', '2', 'PK1 - morning', 1, '[{"added": {}}]', 11, 1);
INSERT INTO django_admin_log VALUES (29, '2017-01-17 22:32:22.998075+00', '3', 'PK1 - morning', 1, '[{"added": {}}]', 11, 1);
INSERT INTO django_admin_log VALUES (30, '2017-01-17 22:32:34.839107+00', '4', 'PK2 - morning', 1, '[{"added": {}}]', 11, 1);
INSERT INTO django_admin_log VALUES (31, '2017-01-17 22:32:47.65182+00', '5', 'PK2 - morning', 1, '[{"added": {}}]', 11, 1);
INSERT INTO django_admin_log VALUES (32, '2017-01-17 22:32:58.65214+00', '6', 'PK3 - morning', 1, '[{"added": {}}]', 11, 1);
INSERT INTO django_admin_log VALUES (33, '2017-01-17 22:33:19.850422+00', '7', 'PK4 - evening', 1, '[{"added": {}}]', 11, 1);
INSERT INTO django_admin_log VALUES (34, '2017-01-17 22:33:45.832576+00', '8', 'PK4 - evening', 1, '[{"added": {}}]', 11, 1);
INSERT INTO django_admin_log VALUES (35, '2017-01-17 22:38:52.417369+00', '1', 'admin_admin', 2, '[]', 9, 1);
INSERT INTO django_admin_log VALUES (36, '2017-01-17 23:44:42.061183+00', '15', 'jerry_springer', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (37, '2017-01-17 23:45:33.965243+00', '16', 'shahid_afridi', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (38, '2017-01-17 23:46:32.744274+00', '17', 'goldi_locks', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (39, '2017-01-17 23:47:12.229799+00', '18', 'staci_kole', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (40, '2017-01-17 23:47:47.331856+00', '19', 'dave_spade', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (41, '2017-01-17 23:48:25.651588+00', '20', 'shakira_shakira', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (42, '2017-01-17 23:49:00.534657+00', '21', 'aunt_jemima', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (43, '2017-01-17 23:50:48.332535+00', '22', 'debbie_snow', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (44, '2017-01-17 23:51:31.758991+00', '23', 'snoop_dog', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (45, '2017-01-17 23:52:24.306696+00', '24', 'john_bonjovi', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (46, '2017-01-17 23:53:26.377518+00', '25', 'katie_perry', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (47, '2017-01-17 23:54:02.167162+00', '26', 'cercei_lannister', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (48, '2017-01-17 23:54:38.996223+00', '27', 'arya_stark', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (49, '2017-01-17 23:55:39.64426+00', '28', 'raegar_targaryen', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (50, '2017-01-17 23:56:21.742603+00', '29', 'danerys_targaryen', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (51, '2017-01-17 23:57:22.212306+00', '30', 'jamie_lannister', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (52, '2017-01-18 03:30:41.30475+00', '31', 'master_yoda', 1, '[{"added": {}}]', 10, 1);
INSERT INTO django_admin_log VALUES (53, '2017-01-18 03:35:52.001244+00', '91', 'super_man_absent', 3, '', 13, 1);
INSERT INTO django_admin_log VALUES (54, '2017-01-18 03:39:28.878983+00', '9', 'PK1 - morning', 1, '[{"added": {}}]', 11, 1);
INSERT INTO django_admin_log VALUES (55, '2017-01-19 04:53:31.584953+00', '1', 'junaid_qureshi', 1, '[{"added": {}}]', 15, 1);
INSERT INTO django_admin_log VALUES (56, '2017-01-19 04:53:56.475951+00', '2', 'navaid_qureshi', 1, '[{"added": {}}]', 15, 1);
INSERT INTO django_admin_log VALUES (57, '2017-01-19 04:54:57.032973+00', '2', 'navaid_qureshi', 3, '', 15, 1);
INSERT INTO django_admin_log VALUES (58, '2017-01-19 04:54:57.040266+00', '1', 'junaid_qureshi', 3, '', 15, 1);
INSERT INTO django_admin_log VALUES (59, '2017-01-19 05:03:14.808889+00', '3', 'junaid_qureshi', 1, '[{"added": {}}]', 15, 1);
INSERT INTO django_admin_log VALUES (60, '2017-01-19 05:03:33.902709+00', '4', 'navaid_qureshi', 1, '[{"added": {}}]', 15, 1);
INSERT INTO django_admin_log VALUES (61, '2017-01-19 05:04:18.854575+00', '5', 'mohammad_bilal', 1, '[{"added": {}}]', 15, 1);
INSERT INTO django_admin_log VALUES (62, '2017-01-19 05:04:38.185698+00', '6', 'john_doe', 1, '[{"added": {}}]', 15, 1);
INSERT INTO django_admin_log VALUES (63, '2017-01-19 05:06:04.263829+00', '1', 'Donor_log object', 1, '[{"added": {}}]', 14, 1);
INSERT INTO django_admin_log VALUES (64, '2017-01-19 05:06:24.0705+00', '2', 'Donor_log object', 1, '[{"added": {}}]', 14, 1);
INSERT INTO django_admin_log VALUES (65, '2017-01-19 05:06:37.089709+00', '3', 'Donor_log object', 1, '[{"added": {}}]', 14, 1);
INSERT INTO django_admin_log VALUES (66, '2017-01-19 05:06:54.08095+00', '4', 'Donor_log object', 1, '[{"added": {}}]', 14, 1);
INSERT INTO django_admin_log VALUES (67, '2017-01-19 05:07:16.438524+00', '5', 'Donor_log object', 1, '[{"added": {}}]', 14, 1);
INSERT INTO django_admin_log VALUES (68, '2017-01-21 22:15:30.719363+00', '3', 'teach1', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log VALUES (69, '2017-01-21 22:15:38.920966+00', '3', 'teach1', 2, '[]', 3, 1);
INSERT INTO django_admin_log VALUES (70, '2017-01-21 22:15:50.158567+00', '4', 'teach2', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log VALUES (71, '2017-01-21 22:15:58.902905+00', '5', 'teach3', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django_admin_log VALUES (72, '2017-01-21 22:17:31.12653+00', '2', 'the_principal', 1, '[{"added": {}}]', 9, 1);
INSERT INTO django_admin_log VALUES (73, '2017-01-21 22:18:26.803438+00', '3', 'katy_perry', 1, '[{"added": {}}]', 9, 1);
INSERT INTO django_admin_log VALUES (74, '2017-01-21 22:19:12.94425+00', '4', 'irfan_khan', 1, '[{"added": {}}]', 9, 1);
INSERT INTO django_admin_log VALUES (75, '2017-01-21 22:20:09.289223+00', '4', 'irfan_khan', 2, '[{"changed": {"fields": ["date_joined"]}}]', 9, 1);
INSERT INTO django_admin_log VALUES (76, '2017-01-22 07:31:54.515149+00', '12', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (77, '2017-01-22 19:01:57.237171+00', '5', 'Donor_log object', 2, '[{"changed": {"fields": ["amount_pkr"]}}]', 14, 1);
INSERT INTO django_admin_log VALUES (78, '2017-01-22 19:02:08.770248+00', '4', 'Donor_log object', 2, '[{"changed": {"fields": ["amount_pkr"]}}]', 14, 1);
INSERT INTO django_admin_log VALUES (79, '2017-01-22 19:02:19.096751+00', '3', 'Donor_log object', 2, '[{"changed": {"fields": ["amount_pkr"]}}]', 14, 1);
INSERT INTO django_admin_log VALUES (80, '2017-01-22 19:02:27.041575+00', '2', 'Donor_log object', 2, '[{"changed": {"fields": ["amount_pkr"]}}]', 14, 1);
INSERT INTO django_admin_log VALUES (81, '2017-01-22 19:02:47.721969+00', '1', 'Donor_log object', 2, '[{"changed": {"fields": ["amount_pkr"]}}]', 14, 1);
INSERT INTO django_admin_log VALUES (82, '2017-01-22 19:03:00.408313+00', '6', 'Donor_log object', 1, '[{"added": {}}]', 14, 1);
INSERT INTO django_admin_log VALUES (83, '2017-01-22 19:03:32.675136+00', '6', 'Donor_log object', 2, '[{"changed": {"fields": ["donation_date", "fiscal_year"]}}]', 14, 1);
INSERT INTO django_admin_log VALUES (84, '2017-01-22 19:05:45.764862+00', '6', 'Donor_log object', 2, '[]', 14, 1);
INSERT INTO django_admin_log VALUES (85, '2017-01-22 20:18:23.981681+00', '9', 'Haleemah_Qureshi', 3, '', 15, 1);
INSERT INTO django_admin_log VALUES (86, '2017-01-28 16:51:06.8502+00', '1', 'PK1', 2, '[{"changed": {"fields": ["school_name"]}}]', 7, 1);
INSERT INTO django_admin_log VALUES (87, '2017-01-28 16:51:16.134594+00', '2', 'PK2', 2, '[{"changed": {"fields": ["school_name"]}}]', 7, 1);
INSERT INTO django_admin_log VALUES (88, '2017-01-28 16:51:20.990528+00', '3', 'PK3', 2, '[{"changed": {"fields": ["school_name"]}}]', 7, 1);
INSERT INTO django_admin_log VALUES (89, '2017-01-28 16:51:27.665682+00', '4', 'PK4', 2, '[{"changed": {"fields": ["school_name"]}}]', 7, 1);
INSERT INTO django_admin_log VALUES (90, '2017-01-28 17:00:28.481337+00', '1', 'PK1_M1_A', 2, '[{"changed": {"fields": ["school_class_section"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (91, '2017-01-28 17:00:36.167804+00', '2', 'PK1_M2_A', 2, '[{"changed": {"fields": ["school_class_section"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (92, '2017-01-28 17:00:45.568286+00', '3', 'PK1_Class 3_A', 2, '[{"changed": {"fields": ["school_class_section"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (93, '2017-01-28 17:00:53.836946+00', '4', 'PK2_M1_A', 2, '[{"changed": {"fields": ["school_class_section"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (94, '2017-01-28 17:01:01.667175+00', '5', 'PK2_M2_A', 2, '[{"changed": {"fields": ["school_class_section"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (95, '2017-01-28 17:01:10.750287+00', '6', 'PK3_Class 3_A', 2, '[{"changed": {"fields": ["school_class_section"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (96, '2017-01-28 17:01:18.645134+00', '7', 'PK3_Class 4_A', 2, '[{"changed": {"fields": ["school_class_section"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (97, '2017-01-28 17:01:39.569147+00', '8', 'PK3_Class 5_A', 2, '[{"changed": {"fields": ["school_class_section"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (98, '2017-01-28 17:01:46.846439+00', '9', 'PK4_Play Group_A', 2, '[{"changed": {"fields": ["school_class_section"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (99, '2017-01-28 17:01:52.483834+00', '10', 'PK4_Nursery_A', 2, '[{"changed": {"fields": ["school_class_section"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (100, '2017-01-28 17:01:59.009878+00', '11', 'PK4_M1_A', 2, '[{"changed": {"fields": ["school_class_section"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (101, '2017-01-28 17:02:06.260508+00', '12', 'PK3_Play Group_A', 2, '[{"changed": {"fields": ["school_class_section"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (102, '2017-01-28 17:04:35.234152+00', '1', 'PK1_M1_A', 2, '[{"changed": {"fields": ["shift"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (103, '2017-01-28 17:06:37.413504+00', '1', 'PK1_M1_A', 2, '[]', 8, 1);
INSERT INTO django_admin_log VALUES (104, '2017-01-28 17:06:43.254758+00', '2', 'PK1_M2_A', 2, '[]', 8, 1);
INSERT INTO django_admin_log VALUES (105, '2017-01-28 17:06:49.227163+00', '3', 'PK1_Class 3_A', 2, '[]', 8, 1);
INSERT INTO django_admin_log VALUES (106, '2017-01-28 17:07:04.087303+00', '4', 'PK2_M1_A', 2, '[]', 8, 1);
INSERT INTO django_admin_log VALUES (107, '2017-01-28 17:07:21.907677+00', '5', 'PK2_M2_A', 2, '[{"changed": {"fields": ["shift"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (108, '2017-01-28 17:07:32.319388+00', '6', 'PK3_Class 3_A', 2, '[{"changed": {"fields": ["shift"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (109, '2017-01-28 17:07:39.71765+00', '7', 'PK3_Class 4_A', 2, '[{"changed": {"fields": ["shift"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (110, '2017-01-28 17:07:44.730091+00', '8', 'PK3_Class 5_A', 2, '[]', 8, 1);
INSERT INTO django_admin_log VALUES (111, '2017-01-28 17:07:50.5+00', '9', 'PK4_Play Group_A', 2, '[]', 8, 1);
INSERT INTO django_admin_log VALUES (112, '2017-01-28 17:07:54.35688+00', '10', 'PK4_Nursery_A', 2, '[]', 8, 1);
INSERT INTO django_admin_log VALUES (113, '2017-01-28 17:07:57.436254+00', '11', 'PK4_M1_A', 2, '[]', 8, 1);
INSERT INTO django_admin_log VALUES (114, '2017-01-28 17:08:03.663264+00', '12', 'PK3_Play Group_A', 2, '[{"changed": {"fields": ["shift"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (115, '2017-01-28 17:08:16.609089+00', '11', 'PK4_M1_A_morning', 2, '[{"changed": {"fields": ["shift"]}}]', 8, 1);
INSERT INTO django_admin_log VALUES (116, '2017-01-30 01:45:01.034308+00', '5', 'PK5', 1, '[{"added": {}}]', 7, 1);
INSERT INTO django_admin_log VALUES (117, '2017-01-30 01:45:03.889489+00', '6', 'PK5', 1, '[{"added": {}}]', 7, 1);
INSERT INTO django_admin_log VALUES (118, '2017-01-30 01:45:18.499169+00', '6', 'PK5', 3, '', 7, 1);
INSERT INTO django_admin_log VALUES (119, '2017-01-30 01:57:57.375785+00', '13', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (120, '2017-01-30 01:58:39.318975+00', '14', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (121, '2017-01-30 01:59:02.180352+00', '15', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (122, '2017-01-30 01:59:17.081943+00', '16', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (123, '2017-01-30 01:59:39.268678+00', '17', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (124, '2017-01-30 01:59:52.316409+00', '18', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (125, '2017-01-30 02:00:34.895646+00', '19', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (126, '2017-02-04 21:23:43.705611+00', '36', 'power_ranger', 2, '[{"changed": {"fields": ["updated_last_by"]}}]', 10, 1);
INSERT INTO django_admin_log VALUES (127, '2017-02-04 21:37:43.979521+00', '36', 'power_ranger', 2, '[{"changed": {"fields": ["updated_last_by"]}}]', 10, 1);
INSERT INTO django_admin_log VALUES (128, '2017-02-04 21:43:46.699445+00', '36', 'power_ranger', 2, '[{"changed": {"fields": ["updated_last_by"]}}]', 10, 1);
INSERT INTO django_admin_log VALUES (129, '2017-02-04 21:43:56.823039+00', '36', 'power_ranger', 2, '[]', 10, 1);
INSERT INTO django_admin_log VALUES (130, '2017-02-04 21:50:13.786818+00', '36', 'power_ranger', 2, '[{"changed": {"fields": ["updated_last_by"]}}]', 10, 1);
INSERT INTO django_admin_log VALUES (131, '2017-02-04 21:51:25.036228+00', '35', 'sabira_qureshi2', 2, '[{"changed": {"fields": ["updated_last_by"]}}]', 10, 1);
INSERT INTO django_admin_log VALUES (132, '2017-02-04 21:53:22.750335+00', '35', 'sabira_qureshi2', 2, '[{"changed": {"fields": ["updated_last_by"]}}]', 10, 1);
INSERT INTO django_admin_log VALUES (133, '2017-02-05 03:34:53.052146+00', '10', 'allie_mcbeal', 2, '[{"changed": {"fields": ["currently_enrolled", "date_left"]}}]', 10, 1);
INSERT INTO django_admin_log VALUES (134, '2017-02-05 21:25:10.727093+00', '19', 'PK5_Class 5_A_morning', 3, '', 8, 1);
INSERT INTO django_admin_log VALUES (135, '2017-02-05 21:26:28.974781+00', '18', 'PK5_Class 4_A_morning', 3, '', 8, 1);
INSERT INTO django_admin_log VALUES (136, '2017-02-05 21:26:28.97723+00', '17', 'PK5_Class 3_A_morning', 3, '', 8, 1);
INSERT INTO django_admin_log VALUES (137, '2017-02-05 21:26:28.978502+00', '16', 'PK5_M2_A_morning', 3, '', 8, 1);
INSERT INTO django_admin_log VALUES (138, '2017-02-05 21:26:28.979657+00', '15', 'PK5_M1_A_morning', 3, '', 8, 1);
INSERT INTO django_admin_log VALUES (139, '2017-02-05 21:26:28.980659+00', '14', 'PK5_Nursery_A_morning', 3, '', 8, 1);
INSERT INTO django_admin_log VALUES (140, '2017-02-05 21:26:28.98166+00', '13', 'PK5_Play Group_A_morning', 3, '', 8, 1);
INSERT INTO django_admin_log VALUES (141, '2017-02-05 21:26:43.38012+00', '20', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (142, '2017-02-05 21:27:06.584082+00', '21', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (143, '2017-02-05 21:27:17.717784+00', '22', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (144, '2017-02-05 21:27:34.294485+00', '23', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (145, '2017-02-05 21:27:51.016458+00', '24', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (146, '2017-02-05 21:28:07.49517+00', '25', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (147, '2017-02-05 21:28:20.465936+00', '26', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (148, '2017-02-05 21:28:39.018283+00', '27', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (149, '2017-02-05 21:28:51.88658+00', '28', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (150, '2017-02-05 21:29:01.279643+00', '29', '', 1, '[{"added": {}}]', 8, 1);
INSERT INTO django_admin_log VALUES (151, '2017-02-05 21:31:47.553862+00', '1', 'admin_admin', 2, '[]', 9, 1);
INSERT INTO django_admin_log VALUES (152, '2017-02-06 04:47:07.145224+00', '9', 'Donor_log object', 1, '[{"added": {}}]', 14, 1);
INSERT INTO django_admin_log VALUES (153, '2017-02-06 04:47:19.139709+00', '9', 'Donor_log object', 2, '[]', 14, 1);
INSERT INTO django_admin_log VALUES (154, '2017-02-06 04:47:39.562031+00', '10', 'Donor_log object', 1, '[{"added": {}}]', 14, 1);
INSERT INTO django_admin_log VALUES (155, '2017-02-06 06:14:02.925187+00', '8', 'Sabira_Qureshi', 3, '', 15, 1);
INSERT INTO django_admin_log VALUES (156, '2017-02-06 06:14:02.927659+00', '7', 'donald_duck', 3, '', 15, 1);
INSERT INTO django_admin_log VALUES (157, '2017-02-06 06:14:02.928805+00', '6', 'john_doe', 3, '', 15, 1);
INSERT INTO django_admin_log VALUES (158, '2017-02-06 06:14:02.930188+00', '5', 'mohammad_bilal', 3, '', 15, 1);
INSERT INTO django_admin_log VALUES (159, '2017-02-06 06:14:02.931268+00', '4', 'Navaid_Qureshi', 3, '', 15, 1);
INSERT INTO django_admin_log VALUES (160, '2017-02-06 06:14:02.933104+00', '3', 'Junaid_Qureshi', 3, '', 15, 1);
INSERT INTO django_admin_log VALUES (161, '2017-02-07 06:17:57.725096+00', '1108', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (162, '2017-02-07 06:17:57.728547+00', '1107', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (163, '2017-02-07 06:17:57.729644+00', '1106', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (164, '2017-02-07 06:17:57.730804+00', '1105', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (165, '2017-02-07 06:17:57.731814+00', '1104', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (166, '2017-02-07 06:17:57.733988+00', '1103', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (167, '2017-02-07 06:17:57.73536+00', '1102', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (168, '2017-02-07 06:17:57.736333+00', '1101', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (169, '2017-02-07 06:17:57.737503+00', '1100', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (170, '2017-02-07 06:17:57.738452+00', '1099', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (171, '2017-02-07 06:17:57.739374+00', '1098', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (172, '2017-02-07 06:17:57.740394+00', '1097', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (173, '2017-02-07 06:17:57.741379+00', '1096', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (174, '2017-02-07 06:17:57.742891+00', '1095', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (175, '2017-02-07 06:17:57.744579+00', '1094', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (176, '2017-02-07 06:17:57.745801+00', '1093', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (177, '2017-02-07 06:17:57.746847+00', '1092', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (178, '2017-02-07 06:17:57.748215+00', '1091', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (179, '2017-02-07 06:17:57.749299+00', '1090', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (180, '2017-02-07 06:17:57.750317+00', '1089', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (181, '2017-02-07 06:17:57.751511+00', '1088', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (182, '2017-02-07 06:17:57.753174+00', '1087', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (183, '2017-02-07 06:17:57.754114+00', '1086', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (184, '2017-02-07 06:17:57.755079+00', '1085', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (185, '2017-02-07 06:17:57.75617+00', '1084', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (186, '2017-02-07 06:17:57.757246+00', '1083', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (187, '2017-02-07 06:17:57.758576+00', '1082', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (188, '2017-02-07 06:17:57.760081+00', '1081', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (189, '2017-02-07 06:17:57.761455+00', '1080', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (190, '2017-02-07 06:17:57.763715+00', '1079', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (191, '2017-02-07 06:17:57.764685+00', '1078', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (192, '2017-02-07 06:17:57.765888+00', '1077', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (193, '2017-02-07 06:17:57.766844+00', '1076', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (194, '2017-02-07 06:17:57.76779+00', '1075', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (195, '2017-02-07 06:17:57.768702+00', '1074', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (196, '2017-02-07 06:17:57.769636+00', '1073', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (197, '2017-02-07 06:17:57.770529+00', '1072', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (198, '2017-02-07 06:17:57.771444+00', '1071', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (199, '2017-02-07 06:17:57.77323+00', '1070', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (200, '2017-02-07 06:17:57.774275+00', '1069', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (201, '2017-02-07 06:17:57.775239+00', '1068', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (202, '2017-02-07 06:17:57.776604+00', '1067', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (203, '2017-02-07 06:17:57.777518+00', '1066', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (204, '2017-02-07 06:17:57.778662+00', '1065', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (205, '2017-02-07 06:17:57.779575+00', '1064', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (206, '2017-02-07 06:17:57.780494+00', '1063', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (207, '2017-02-07 06:17:57.781419+00', '1062', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (208, '2017-02-07 06:17:57.782917+00', '1061', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (209, '2017-02-07 06:17:57.78459+00', '1060', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (210, '2017-02-07 06:17:57.785587+00', '1059', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (211, '2017-02-07 06:17:57.786655+00', '1058', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (212, '2017-02-07 06:17:57.787683+00', '1057', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (213, '2017-02-07 06:17:57.788615+00', '1056', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (214, '2017-02-07 06:17:57.789521+00', '1055', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (215, '2017-02-07 06:17:57.790461+00', '1054', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (216, '2017-02-07 06:17:57.791402+00', '1053', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (217, '2017-02-07 06:17:57.79279+00', '1052', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (218, '2017-02-07 06:17:57.794869+00', '1051', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (219, '2017-02-07 06:17:57.795778+00', '1050', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (220, '2017-02-07 06:17:57.796701+00', '1049', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (221, '2017-02-07 06:17:57.79763+00', '1048', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (222, '2017-02-07 06:17:57.798677+00', '1047', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (223, '2017-02-07 06:17:57.799826+00', '1046', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (224, '2017-02-07 06:17:57.801011+00', '1045', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (225, '2017-02-07 06:17:57.802159+00', '1044', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (226, '2017-02-07 06:17:57.805166+00', '1043', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (227, '2017-02-07 06:17:57.806125+00', '1042', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (228, '2017-02-07 06:17:57.80705+00', '1041', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (229, '2017-02-07 06:17:57.807961+00', '1040', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (230, '2017-02-07 06:17:57.808892+00', '1039', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (231, '2017-02-07 06:17:57.809845+00', '1038', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (232, '2017-02-07 06:17:57.810802+00', '1037', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (233, '2017-02-07 06:17:57.811706+00', '1036', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (234, '2017-02-07 06:17:57.814557+00', '1035', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (235, '2017-02-07 06:17:57.815506+00', '1034', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (236, '2017-02-07 06:17:57.816629+00', '1033', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (237, '2017-02-07 06:17:57.817531+00', '1032', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (238, '2017-02-07 06:17:57.818465+00', '1031', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (239, '2017-02-07 06:17:57.819377+00', '1030', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (240, '2017-02-07 06:17:57.820303+00', '1029', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (241, '2017-02-07 06:17:57.821238+00', '1028', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (242, '2017-02-07 06:17:57.822177+00', '1027', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (243, '2017-02-07 06:17:57.824878+00', '1026', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (244, '2017-02-07 06:17:57.825793+00', '1025', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (245, '2017-02-07 06:17:57.826704+00', '1024', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (246, '2017-02-07 06:17:57.82764+00', '1023', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (247, '2017-02-07 06:17:57.828531+00', '1022', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (248, '2017-02-07 06:17:57.829496+00', '1021', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (249, '2017-02-07 06:17:57.830591+00', '1020', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (250, '2017-02-07 06:17:57.831514+00', '1019', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (251, '2017-02-07 06:17:57.834154+00', '1018', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (252, '2017-02-07 06:17:57.835261+00', '1017', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (253, '2017-02-07 06:17:57.836224+00', '1016', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (254, '2017-02-07 06:17:57.837217+00', '1015', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (255, '2017-02-07 06:17:57.838334+00', '1014', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (256, '2017-02-07 06:17:57.839524+00', '1013', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (257, '2017-02-07 06:17:57.840612+00', '1012', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (258, '2017-02-07 06:17:57.84167+00', '1011', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (259, '2017-02-07 06:17:57.844751+00', '1010', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (260, '2017-02-07 06:17:57.845899+00', '1009', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (261, '2017-02-07 06:18:05.843557+00', '1008', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (262, '2017-02-07 06:18:05.846309+00', '1007', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (263, '2017-02-07 06:18:05.847349+00', '1006', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (264, '2017-02-07 06:18:05.848356+00', '1005', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (265, '2017-02-07 06:18:05.849355+00', '1004', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (266, '2017-02-07 06:18:05.850299+00', '1003', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (267, '2017-02-07 06:18:05.851291+00', '1002', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (268, '2017-02-07 06:18:05.852213+00', '1001', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (269, '2017-02-07 06:18:05.854092+00', '1000', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (270, '2017-02-07 06:18:05.854989+00', '999', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (271, '2017-02-07 06:18:05.855881+00', '998', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (272, '2017-02-07 06:18:05.85681+00', '997', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (273, '2017-02-07 06:18:05.857666+00', '996', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (274, '2017-02-07 06:18:05.858525+00', '995', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (275, '2017-02-07 06:18:05.859384+00', '994', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (276, '2017-02-07 06:18:05.860269+00', '993', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (277, '2017-02-07 06:18:05.861196+00', '992', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (278, '2017-02-07 06:18:05.862835+00', '991', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (279, '2017-02-07 06:18:05.863982+00', '990', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (280, '2017-02-07 06:18:05.864921+00', '989', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (281, '2017-02-07 06:18:05.865986+00', '988', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (282, '2017-02-07 06:18:05.867037+00', '987', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (283, '2017-02-07 06:18:05.867897+00', '986', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (284, '2017-02-07 06:18:05.868751+00', '985', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (285, '2017-02-07 06:18:05.869609+00', '984', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (286, '2017-02-07 06:18:05.870477+00', '983', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (287, '2017-02-07 06:18:05.871344+00', '982', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (288, '2017-02-07 06:18:05.872227+00', '981', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (289, '2017-02-07 06:18:05.873427+00', '980', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (290, '2017-02-07 06:18:05.874335+00', '979', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (291, '2017-02-07 06:18:05.875222+00', '978', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (292, '2017-02-07 06:18:05.876255+00', '977', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (293, '2017-02-07 06:18:05.877313+00', '976', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (294, '2017-02-07 06:18:05.87868+00', '975', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (295, '2017-02-07 06:18:05.879758+00', '974', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (296, '2017-02-07 06:18:05.88063+00', '973', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (297, '2017-02-07 06:18:05.881637+00', '972', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (298, '2017-02-07 06:18:05.883019+00', '971', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (299, '2017-02-07 06:18:05.884519+00', '970', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (300, '2017-02-07 06:18:05.885408+00', '969', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (301, '2017-02-07 06:18:05.886296+00', '968', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (302, '2017-02-07 06:18:05.887193+00', '967', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (303, '2017-02-07 06:18:05.888324+00', '966', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (304, '2017-02-07 06:18:05.889298+00', '965', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (305, '2017-02-07 06:18:05.890181+00', '964', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (306, '2017-02-07 06:18:05.891064+00', '963', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (307, '2017-02-07 06:18:05.892107+00', '962', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (308, '2017-02-07 06:18:05.894134+00', '961', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (309, '2017-02-07 06:18:05.895236+00', '960', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (310, '2017-02-07 06:18:05.896132+00', '959', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (311, '2017-02-07 06:18:05.897217+00', '958', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (312, '2017-02-07 06:18:05.898119+00', '957', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (313, '2017-02-07 06:18:05.898991+00', '956', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (314, '2017-02-07 06:18:05.900108+00', '955', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (315, '2017-02-07 06:18:05.901203+00', '954', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (316, '2017-02-07 06:18:05.902146+00', '953', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (317, '2017-02-07 06:18:05.904362+00', '952', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (318, '2017-02-07 06:18:05.905511+00', '951', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (319, '2017-02-07 06:18:05.906526+00', '950', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (320, '2017-02-07 06:18:05.907544+00', '949', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (321, '2017-02-07 06:18:05.908514+00', '948', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (322, '2017-02-07 06:18:05.909498+00', '947', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (323, '2017-02-07 06:18:05.910493+00', '946', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (324, '2017-02-07 06:18:05.911425+00', '945', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (325, '2017-02-07 06:18:05.912295+00', '944', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (326, '2017-02-07 06:18:05.913996+00', '943', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (327, '2017-02-07 06:18:05.915001+00', '942', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (328, '2017-02-07 06:18:05.916114+00', '941', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (329, '2017-02-07 06:18:05.917235+00', '940', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (330, '2017-02-07 06:18:05.918203+00', '939', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (331, '2017-02-07 06:18:05.919082+00', '938', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (332, '2017-02-07 06:18:05.920998+00', '937', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (333, '2017-02-07 06:18:05.922289+00', '936', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (334, '2017-02-07 06:18:05.925124+00', '935', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (335, '2017-02-07 06:18:05.926115+00', '934', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (336, '2017-02-07 06:18:05.927313+00', '933', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (337, '2017-02-07 06:18:05.928693+00', '932', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (338, '2017-02-07 06:18:05.929832+00', '931', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (339, '2017-02-07 06:18:05.93107+00', '930', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (340, '2017-02-07 06:18:05.932046+00', '929', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (341, '2017-02-07 06:18:05.935614+00', '928', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (342, '2017-02-07 06:18:05.93659+00', '927', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (343, '2017-02-07 06:18:05.937548+00', '926', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (344, '2017-02-07 06:18:05.938686+00', '925', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (345, '2017-02-07 06:18:05.939668+00', '924', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (346, '2017-02-07 06:18:05.940654+00', '923', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (347, '2017-02-07 06:18:05.941848+00', '922', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (348, '2017-02-07 06:18:05.944324+00', '921', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (349, '2017-02-07 06:18:05.945632+00', '920', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (350, '2017-02-07 06:18:05.946605+00', '919', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (351, '2017-02-07 06:18:05.94769+00', '918', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (352, '2017-02-07 06:18:05.948696+00', '917', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (353, '2017-02-07 06:18:05.949677+00', '916', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (354, '2017-02-07 06:18:05.950824+00', '915', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (355, '2017-02-07 06:18:05.951926+00', '914', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (356, '2017-02-07 06:18:05.953802+00', '913', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (357, '2017-02-07 06:18:05.955059+00', '912', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (358, '2017-02-07 06:18:05.956287+00', '911', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (359, '2017-02-07 06:18:05.957712+00', '910', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (360, '2017-02-07 06:18:05.961184+00', '909', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (361, '2017-02-07 06:18:12.989006+00', '908', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (362, '2017-02-07 06:18:12.991906+00', '907', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (363, '2017-02-07 06:18:12.993765+00', '906', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (364, '2017-02-07 06:18:12.995125+00', '905', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (365, '2017-02-07 06:18:12.99614+00', '904', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (366, '2017-02-07 06:18:12.997173+00', '903', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (367, '2017-02-07 06:18:12.998159+00', '902', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (368, '2017-02-07 06:18:12.999193+00', '901', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (369, '2017-02-07 06:18:13.001168+00', '900', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (370, '2017-02-07 06:18:13.006835+00', '899', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (371, '2017-02-07 06:18:13.008112+00', '898', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (372, '2017-02-07 06:18:13.009421+00', '897', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (373, '2017-02-07 06:18:13.010969+00', '896', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (374, '2017-02-07 06:18:13.012124+00', '895', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (375, '2017-02-07 06:18:13.016085+00', '894', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (376, '2017-02-07 06:18:13.01739+00', '893', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (377, '2017-02-07 06:18:13.01868+00', '892', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (378, '2017-02-07 06:18:13.01998+00', '891', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (379, '2017-02-07 06:18:13.021243+00', '890', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (380, '2017-02-07 06:18:13.022313+00', '889', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (381, '2017-02-07 06:18:13.024563+00', '888', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (382, '2017-02-07 06:18:13.025596+00', '887', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (383, '2017-02-07 06:18:13.029344+00', '886', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (384, '2017-02-07 06:18:13.030751+00', '885', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (385, '2017-02-07 06:18:13.040273+00', '884', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (386, '2017-02-07 06:18:13.041608+00', '883', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (387, '2017-02-07 06:18:13.043525+00', '882', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (388, '2017-02-07 06:18:13.044675+00', '881', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (389, '2017-02-07 06:18:13.045828+00', '880', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (390, '2017-02-07 06:18:13.046819+00', '879', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (391, '2017-02-07 06:18:13.047914+00', '878', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (392, '2017-02-07 06:18:13.048917+00', '877', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (393, '2017-02-07 06:18:13.049887+00', '876', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (394, '2017-02-07 06:18:13.051079+00', '875', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (395, '2017-02-07 06:18:13.052068+00', '874', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (396, '2017-02-07 06:18:13.053974+00', '873', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (397, '2017-02-07 06:18:13.05619+00', '872', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (398, '2017-02-07 06:18:13.057547+00', '871', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (399, '2017-02-07 06:18:13.058808+00', '870', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (400, '2017-02-07 06:18:13.060077+00', '869', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (401, '2017-02-07 06:18:13.061443+00', '868', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (402, '2017-02-07 06:18:13.067687+00', '867', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (403, '2017-02-07 06:18:13.069049+00', '866', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (404, '2017-02-07 06:18:13.070053+00', '865', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (405, '2017-02-07 06:18:13.070985+00', '864', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (406, '2017-02-07 06:18:13.071941+00', '863', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (407, '2017-02-07 06:18:13.074518+00', '862', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (408, '2017-02-07 06:18:13.075638+00', '861', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (409, '2017-02-07 06:18:13.076925+00', '860', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (410, '2017-02-07 06:18:13.077871+00', '859', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (411, '2017-02-07 06:18:13.080123+00', '858', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (412, '2017-02-07 06:18:13.081235+00', '857', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (413, '2017-02-07 06:18:13.082803+00', '856', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (414, '2017-02-07 06:18:13.084858+00', '855', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (415, '2017-02-07 06:18:13.085864+00', '854', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (416, '2017-02-07 06:18:13.086779+00', '853', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (417, '2017-02-07 06:18:13.087921+00', '852', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (418, '2017-02-07 06:18:13.088918+00', '851', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (419, '2017-02-07 06:18:13.089864+00', '850', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (420, '2017-02-07 06:18:13.090936+00', '849', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (421, '2017-02-07 06:18:13.09185+00', '848', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (422, '2017-02-07 06:18:13.094164+00', '847', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (423, '2017-02-07 06:18:13.09527+00', '846', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (424, '2017-02-07 06:18:13.096204+00', '845', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (425, '2017-02-07 06:18:13.097295+00', '844', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (426, '2017-02-07 06:18:13.098222+00', '843', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (427, '2017-02-07 06:18:13.099132+00', '842', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (428, '2017-02-07 06:18:13.100042+00', '841', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (429, '2017-02-07 06:18:13.100962+00', '840', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (430, '2017-02-07 06:18:13.101875+00', '839', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (431, '2017-02-07 06:18:13.103581+00', '838', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (432, '2017-02-07 06:18:13.104561+00', '837', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (433, '2017-02-07 06:18:13.105502+00', '836', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (434, '2017-02-07 06:18:13.106729+00', '835', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (435, '2017-02-07 06:18:13.107705+00', '834', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (436, '2017-02-07 06:18:13.108644+00', '833', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (437, '2017-02-07 06:18:13.109538+00', '832', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (438, '2017-02-07 06:18:13.110473+00', '831', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (439, '2017-02-07 06:18:13.111535+00', '830', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (440, '2017-02-07 06:18:13.113113+00', '829', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (441, '2017-02-07 06:18:13.114307+00', '828', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (442, '2017-02-07 06:18:13.115453+00', '827', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (443, '2017-02-07 06:18:13.116356+00', '826', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (444, '2017-02-07 06:18:13.117283+00', '825', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (445, '2017-02-07 06:18:13.118542+00', '824', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (446, '2017-02-07 06:18:13.119485+00', '823', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (447, '2017-02-07 06:18:13.120658+00', '822', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (448, '2017-02-07 06:18:13.121745+00', '821', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (449, '2017-02-07 06:18:13.123654+00', '820', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (450, '2017-02-07 06:18:13.124612+00', '819', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (451, '2017-02-07 06:18:13.125536+00', '818', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (452, '2017-02-07 06:18:13.12671+00', '817', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (453, '2017-02-07 06:18:13.127675+00', '816', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (454, '2017-02-07 06:18:13.128595+00', '815', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (455, '2017-02-07 06:18:13.129532+00', '814', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (456, '2017-02-07 06:18:13.130487+00', '813', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (457, '2017-02-07 06:18:13.131584+00', '812', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (458, '2017-02-07 06:18:13.133547+00', '811', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (459, '2017-02-07 06:18:13.134542+00', '810', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (460, '2017-02-07 06:18:13.135659+00', '809', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (461, '2017-02-07 06:18:24.670641+00', '808', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (462, '2017-02-07 06:18:24.674693+00', '807', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (463, '2017-02-07 06:18:24.676714+00', '806', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (464, '2017-02-07 06:18:24.677904+00', '805', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (465, '2017-02-07 06:18:24.679077+00', '804', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (466, '2017-02-07 06:18:24.680271+00', '803', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (467, '2017-02-07 06:18:24.681302+00', '802', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (468, '2017-02-07 06:18:24.682283+00', '801', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (469, '2017-02-07 06:18:24.685037+00', '800', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (470, '2017-02-07 06:18:24.686004+00', '799', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (471, '2017-02-07 06:18:24.688005+00', '798', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (472, '2017-02-07 06:18:24.689275+00', '797', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (473, '2017-02-07 06:18:24.690343+00', '796', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (474, '2017-02-07 06:18:24.691459+00', '795', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (475, '2017-02-07 06:18:24.694233+00', '794', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (476, '2017-02-07 06:18:24.695359+00', '793', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (477, '2017-02-07 06:18:24.696594+00', '792', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (478, '2017-02-07 06:18:24.697683+00', '791', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (479, '2017-02-07 06:18:24.699034+00', '790', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (480, '2017-02-07 06:18:24.700082+00', '789', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (481, '2017-02-07 06:18:24.701141+00', '788', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (482, '2017-02-07 06:18:24.703656+00', '787', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (483, '2017-02-07 06:18:24.704848+00', '786', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (484, '2017-02-07 06:18:24.706216+00', '785', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (485, '2017-02-07 06:18:24.70729+00', '784', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (486, '2017-02-07 06:18:24.708389+00', '783', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (487, '2017-02-07 06:18:24.70942+00', '782', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (488, '2017-02-07 06:18:24.71045+00', '781', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (489, '2017-02-07 06:18:24.711474+00', '780', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (490, '2017-02-07 06:18:24.713679+00', '779', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (491, '2017-02-07 06:18:24.71489+00', '778', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (492, '2017-02-07 06:18:24.716116+00', '777', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (493, '2017-02-07 06:18:24.717533+00', '776', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (494, '2017-02-07 06:18:24.71862+00', '775', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (495, '2017-02-07 06:18:24.719646+00', '774', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (496, '2017-02-07 06:18:24.720693+00', '773', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (497, '2017-02-07 06:18:24.721699+00', '772', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (498, '2017-02-07 06:18:24.723197+00', '771', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (499, '2017-02-07 06:18:24.724533+00', '770', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (500, '2017-02-07 06:18:24.725562+00', '769', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (501, '2017-02-07 06:18:24.726715+00', '768', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (502, '2017-02-07 06:18:24.727729+00', '767', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (503, '2017-02-07 06:18:24.728747+00', '766', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (504, '2017-02-07 06:18:24.729938+00', '765', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (505, '2017-02-07 06:18:24.731128+00', '764', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (506, '2017-02-07 06:18:24.732135+00', '763', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (507, '2017-02-07 06:18:24.733497+00', '762', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (508, '2017-02-07 06:18:24.734654+00', '761', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (509, '2017-02-07 06:18:24.735856+00', '760', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (510, '2017-02-07 06:18:24.736927+00', '759', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (511, '2017-02-07 06:18:24.738145+00', '758', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (512, '2017-02-07 06:18:24.739399+00', '757', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (513, '2017-02-07 06:18:24.7404+00', '756', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (514, '2017-02-07 06:18:24.741618+00', '755', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (515, '2017-02-07 06:18:24.743574+00', '754', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (516, '2017-02-07 06:18:24.744598+00', '753', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (517, '2017-02-07 06:18:24.745678+00', '752', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (518, '2017-02-07 06:18:24.746708+00', '751', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (519, '2017-02-07 06:18:24.747898+00', '750', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (520, '2017-02-07 06:18:24.74909+00', '749', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (521, '2017-02-07 06:18:24.750284+00', '748', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (522, '2017-02-07 06:18:24.75131+00', '747', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (523, '2017-02-07 06:18:24.753639+00', '746', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (524, '2017-02-07 06:18:24.755993+00', '745', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (525, '2017-02-07 06:18:24.757017+00', '744', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (526, '2017-02-07 06:18:24.758844+00', '743', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (527, '2017-02-07 06:18:24.759904+00', '742', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (528, '2017-02-07 06:18:24.760952+00', '741', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (529, '2017-02-07 06:18:24.762003+00', '740', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (530, '2017-02-07 06:18:24.765637+00', '739', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (531, '2017-02-07 06:18:24.767104+00', '738', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (532, '2017-02-07 06:18:24.7683+00', '737', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (533, '2017-02-07 06:18:24.769345+00', '736', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (534, '2017-02-07 06:18:24.770396+00', '735', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (535, '2017-02-07 06:18:24.771433+00', '734', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (536, '2017-02-07 06:18:24.775042+00', '733', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (537, '2017-02-07 06:18:24.776067+00', '732', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (538, '2017-02-07 06:18:24.777103+00', '731', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (539, '2017-02-07 06:18:24.778126+00', '730', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (540, '2017-02-07 06:18:24.779145+00', '729', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (541, '2017-02-07 06:18:24.78033+00', '728', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (542, '2017-02-07 06:18:24.781387+00', '727', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (543, '2017-02-07 06:18:24.784346+00', '726', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (544, '2017-02-07 06:18:24.785373+00', '725', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (545, '2017-02-07 06:18:24.786653+00', '724', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (546, '2017-02-07 06:18:24.787675+00', '723', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (547, '2017-02-07 06:18:24.788843+00', '722', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (548, '2017-02-07 06:18:24.789882+00', '721', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (549, '2017-02-07 06:18:24.791239+00', '720', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (550, '2017-02-07 06:18:24.792281+00', '719', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (551, '2017-02-07 06:18:24.795352+00', '718', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (552, '2017-02-07 06:18:24.796539+00', '717', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (553, '2017-02-07 06:18:24.797556+00', '716', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (554, '2017-02-07 06:18:24.798578+00', '715', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (555, '2017-02-07 06:18:24.799596+00', '714', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (556, '2017-02-07 06:18:24.800808+00', '713', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (557, '2017-02-07 06:18:24.801977+00', '712', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (558, '2017-02-07 06:18:24.805185+00', '711', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (559, '2017-02-07 06:18:24.806213+00', '710', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (560, '2017-02-07 06:18:24.807396+00', '709', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (561, '2017-02-07 06:18:24.808563+00', '708', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (562, '2017-02-07 06:18:24.809584+00', '707', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (563, '2017-02-07 06:18:24.810664+00', '706', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (564, '2017-02-07 06:18:24.811685+00', '705', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (565, '2017-02-07 06:18:24.814008+00', '704', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (566, '2017-02-07 06:18:24.815331+00', '703', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (567, '2017-02-07 06:18:24.816452+00', '702', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (568, '2017-02-07 06:18:24.81747+00', '701', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (569, '2017-02-07 06:18:24.818524+00', '700', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (570, '2017-02-07 06:18:24.819854+00', '699', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (571, '2017-02-07 06:18:24.821026+00', '698', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (572, '2017-02-07 06:18:24.822041+00', '697', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (573, '2017-02-07 06:18:24.824511+00', '696', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (574, '2017-02-07 06:18:24.825694+00', '695', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (575, '2017-02-07 06:18:24.826868+00', '694', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (576, '2017-02-07 06:18:24.828064+00', '693', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (577, '2017-02-07 06:18:24.829086+00', '692', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (578, '2017-02-07 06:18:24.830111+00', '691', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (579, '2017-02-07 06:18:24.831148+00', '690', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (580, '2017-02-07 06:18:24.832202+00', '689', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (581, '2017-02-07 06:18:24.835413+00', '688', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (582, '2017-02-07 06:18:24.836456+00', '687', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (583, '2017-02-07 06:18:24.837802+00', '686', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (584, '2017-02-07 06:18:24.838829+00', '685', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (585, '2017-02-07 06:18:24.83985+00', '684', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (586, '2017-02-07 06:18:24.841031+00', '683', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (587, '2017-02-07 06:18:24.84206+00', '682', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (588, '2017-02-07 06:18:24.844976+00', '681', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (589, '2017-02-07 06:18:24.846182+00', '680', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (590, '2017-02-07 06:18:24.847563+00', '679', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (591, '2017-02-07 06:18:24.848588+00', '678', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (592, '2017-02-07 06:18:24.849601+00', '677', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (593, '2017-02-07 06:18:24.850608+00', '676', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (594, '2017-02-07 06:18:24.851644+00', '675', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (595, '2017-02-07 06:18:24.854242+00', '674', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (596, '2017-02-07 06:18:24.855673+00', '673', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (597, '2017-02-07 06:18:24.856704+00', '672', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (598, '2017-02-07 06:18:24.857737+00', '671', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (599, '2017-02-07 06:18:24.858761+00', '670', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (600, '2017-02-07 06:18:24.859781+00', '669', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (601, '2017-02-07 06:18:24.860805+00', '668', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (602, '2017-02-07 06:18:24.861834+00', '667', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (603, '2017-02-07 06:18:24.864603+00', '666', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (604, '2017-02-07 06:18:24.865676+00', '665', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (605, '2017-02-07 06:18:24.866853+00', '664', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (606, '2017-02-07 06:18:24.867931+00', '663', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (607, '2017-02-07 06:18:24.86896+00', '662', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (608, '2017-02-07 06:18:24.870171+00', '661', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (609, '2017-02-07 06:18:24.871218+00', '660', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (610, '2017-02-07 06:18:24.872245+00', '659', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (611, '2017-02-07 06:18:24.874305+00', '658', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (612, '2017-02-07 06:18:24.875508+00', '657', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (613, '2017-02-07 06:18:24.876526+00', '656', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (614, '2017-02-07 06:18:24.877544+00', '655', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (615, '2017-02-07 06:18:24.878569+00', '654', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (616, '2017-02-07 06:18:24.879585+00', '653', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (617, '2017-02-07 06:18:24.881077+00', '652', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (618, '2017-02-07 06:18:24.882098+00', '651', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (619, '2017-02-07 06:18:24.884443+00', '650', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (620, '2017-02-07 06:18:24.885461+00', '649', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (621, '2017-02-07 06:18:24.886797+00', '648', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (622, '2017-02-07 06:18:24.887872+00', '647', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (623, '2017-02-07 06:18:24.888907+00', '646', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (624, '2017-02-07 06:18:24.889944+00', '645', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (625, '2017-02-07 06:18:24.89114+00', '644', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (626, '2017-02-07 06:18:24.892164+00', '643', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (627, '2017-02-07 06:18:24.894803+00', '642', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (628, '2017-02-07 06:18:24.895981+00', '641', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (629, '2017-02-07 06:18:24.897173+00', '640', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (630, '2017-02-07 06:18:24.898505+00', '639', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (631, '2017-02-07 06:18:24.899525+00', '638', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (632, '2017-02-07 06:18:24.900606+00', '637', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (633, '2017-02-07 06:18:24.90177+00', '636', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (634, '2017-02-07 06:18:24.905188+00', '635', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (635, '2017-02-07 06:18:24.906325+00', '634', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (636, '2017-02-07 06:18:24.907289+00', '633', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (637, '2017-02-07 06:18:24.908556+00', '632', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (638, '2017-02-07 06:18:24.909796+00', '631', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (639, '2017-02-07 06:18:24.911107+00', '630', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (640, '2017-02-07 06:18:24.912042+00', '629', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (641, '2017-02-07 06:18:24.916153+00', '628', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (642, '2017-02-07 06:18:24.917197+00', '627', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (643, '2017-02-07 06:18:24.918547+00', '626', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (644, '2017-02-07 06:18:24.919564+00', '625', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (645, '2017-02-07 06:18:24.920664+00', '624', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (646, '2017-02-07 06:18:24.925588+00', '623', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (647, '2017-02-07 06:18:24.926566+00', '622', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (648, '2017-02-07 06:18:24.927642+00', '621', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (649, '2017-02-07 06:18:24.928648+00', '620', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (650, '2017-02-07 06:18:24.929881+00', '619', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (651, '2017-02-07 06:18:24.930846+00', '618', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (652, '2017-02-07 06:18:24.931939+00', '617', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (653, '2017-02-07 06:18:24.936182+00', '616', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (654, '2017-02-07 06:18:24.93729+00', '615', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (655, '2017-02-07 06:18:24.938475+00', '614', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (656, '2017-02-07 06:18:24.939514+00', '613', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (657, '2017-02-07 06:18:24.940491+00', '612', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (658, '2017-02-07 06:18:24.941637+00', '611', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (659, '2017-02-07 06:18:24.945501+00', '610', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (660, '2017-02-07 06:18:24.946651+00', '609', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (661, '2017-02-07 06:18:24.947576+00', '608', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (662, '2017-02-07 06:18:24.948658+00', '607', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (663, '2017-02-07 06:18:24.949597+00', '606', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (664, '2017-02-07 06:18:24.950529+00', '605', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (665, '2017-02-07 06:18:24.951638+00', '604', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (666, '2017-02-07 06:18:24.955265+00', '603', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (667, '2017-02-07 06:18:24.956268+00', '602', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (668, '2017-02-07 06:18:24.957226+00', '601', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (669, '2017-02-07 06:18:24.958285+00', '600', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (670, '2017-02-07 06:18:24.959669+00', '599', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (671, '2017-02-07 06:18:24.960863+00', '598', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (672, '2017-02-07 06:18:24.96206+00', '597', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (673, '2017-02-07 06:18:24.965228+00', '596', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (674, '2017-02-07 06:18:24.966284+00', '595', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (675, '2017-02-07 06:18:24.967794+00', '594', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (676, '2017-02-07 06:18:24.968821+00', '593', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (677, '2017-02-07 06:18:24.971178+00', '592', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (678, '2017-02-07 06:18:24.974414+00', '591', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (679, '2017-02-07 06:18:24.975625+00', '590', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (680, '2017-02-07 06:18:24.976823+00', '589', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (681, '2017-02-07 06:18:24.97785+00', '588', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (682, '2017-02-07 06:18:24.979186+00', '587', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (683, '2017-02-07 06:18:24.980545+00', '586', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (684, '2017-02-07 06:18:24.982076+00', '585', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (685, '2017-02-07 06:18:24.98585+00', '584', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (686, '2017-02-07 06:18:24.98689+00', '583', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (687, '2017-02-07 06:18:24.988218+00', '582', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (688, '2017-02-07 06:18:24.989419+00', '581', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (689, '2017-02-07 06:18:24.990448+00', '580', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (690, '2017-02-07 06:18:24.991484+00', '579', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (691, '2017-02-07 06:18:24.994865+00', '578', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (692, '2017-02-07 06:18:24.995908+00', '577', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (693, '2017-02-07 06:18:24.997429+00', '576', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (694, '2017-02-07 06:18:24.998474+00', '575', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (695, '2017-02-07 06:18:24.999666+00', '574', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (696, '2017-02-07 06:18:25.000867+00', '573', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (697, '2017-02-07 06:18:25.001904+00', '572', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (698, '2017-02-07 06:18:25.006277+00', '571', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (699, '2017-02-07 06:18:25.007929+00', '570', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (700, '2017-02-07 06:18:25.008965+00', '569', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (701, '2017-02-07 06:18:25.010146+00', '568', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (702, '2017-02-07 06:18:25.011236+00', '567', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (703, '2017-02-07 06:18:25.012295+00', '566', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (704, '2017-02-07 06:18:25.017097+00', '565', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (705, '2017-02-07 06:18:25.018129+00', '564', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (706, '2017-02-07 06:18:25.019345+00', '563', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (707, '2017-02-07 06:18:25.020381+00', '562', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (708, '2017-02-07 06:18:25.021433+00', '561', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (709, '2017-02-07 06:18:25.025223+00', '560', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (710, '2017-02-07 06:18:25.026394+00', '559', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (711, '2017-02-07 06:18:25.027336+00', '558', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (712, '2017-02-07 06:18:25.028256+00', '557', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (713, '2017-02-07 06:18:25.029639+00', '556', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (714, '2017-02-07 06:18:25.030649+00', '555', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (715, '2017-02-07 06:18:25.031576+00', '554', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (716, '2017-02-07 06:18:25.034929+00', '553', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (717, '2017-02-07 06:18:25.0359+00', '552', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (718, '2017-02-07 06:18:25.037059+00', '551', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (719, '2017-02-07 06:18:25.038027+00', '550', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (720, '2017-02-07 06:18:25.039104+00', '549', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (721, '2017-02-07 06:18:25.040496+00', '548', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (722, '2017-02-07 06:18:25.041455+00', '547', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (723, '2017-02-07 06:18:25.044256+00', '546', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (724, '2017-02-07 06:18:25.04521+00', '545', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (725, '2017-02-07 06:18:25.046473+00', '544', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (726, '2017-02-07 06:18:25.04758+00', '543', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (727, '2017-02-07 06:18:25.048551+00', '542', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (728, '2017-02-07 06:18:25.049657+00', '541', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (729, '2017-02-07 06:18:25.05067+00', '540', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (730, '2017-02-07 06:18:25.051622+00', '539', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (731, '2017-02-07 06:18:25.054348+00', '538', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (732, '2017-02-07 06:18:25.055279+00', '537', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (733, '2017-02-07 06:18:25.056435+00', '536', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (734, '2017-02-07 06:18:25.057456+00', '535', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (735, '2017-02-07 06:18:25.058585+00', '534', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (736, '2017-02-07 06:18:25.059554+00', '533', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (737, '2017-02-07 06:18:25.060492+00', '532', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (738, '2017-02-07 06:18:25.061457+00', '531', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (739, '2017-02-07 06:18:25.063415+00', '530', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (740, '2017-02-07 06:18:25.064393+00', '529', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (741, '2017-02-07 06:18:25.065305+00', '528', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (742, '2017-02-07 06:18:25.066575+00', '527', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (743, '2017-02-07 06:18:25.06753+00', '526', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (744, '2017-02-07 06:18:25.068644+00', '525', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (745, '2017-02-07 06:18:25.069788+00', '524', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (746, '2017-02-07 06:18:25.070856+00', '523', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (747, '2017-02-07 06:18:25.071781+00', '522', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (748, '2017-02-07 06:18:25.074159+00', '521', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (749, '2017-02-07 06:18:25.075254+00', '520', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (750, '2017-02-07 06:18:25.076349+00', '519', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (751, '2017-02-07 06:18:25.077874+00', '518', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (752, '2017-02-07 06:18:25.079507+00', '517', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (753, '2017-02-07 06:18:25.081043+00', '516', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (754, '2017-02-07 06:18:25.08217+00', '515', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (755, '2017-02-07 06:18:25.085866+00', '514', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (756, '2017-02-07 06:18:25.08682+00', '513', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (757, '2017-02-07 06:18:25.088423+00', '512', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (758, '2017-02-07 06:18:25.089459+00', '511', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (759, '2017-02-07 06:18:25.09055+00', '510', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (760, '2017-02-07 06:18:25.091498+00', '509', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (761, '2017-02-07 06:18:25.0939+00', '508', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (762, '2017-02-07 06:18:25.095165+00', '507', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (763, '2017-02-07 06:18:25.096453+00', '506', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (764, '2017-02-07 06:18:25.097654+00', '505', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (765, '2017-02-07 06:18:25.098621+00', '504', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (766, '2017-02-07 06:18:25.100011+00', '503', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (767, '2017-02-07 06:18:25.101252+00', '502', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (768, '2017-02-07 06:18:25.102273+00', '501', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (769, '2017-02-07 06:18:25.105172+00', '500', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (770, '2017-02-07 06:18:25.106189+00', '499', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (771, '2017-02-07 06:18:25.107161+00', '498', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (772, '2017-02-07 06:18:25.108222+00', '497', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (773, '2017-02-07 06:18:25.109169+00', '496', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (774, '2017-02-07 06:18:25.110142+00', '495', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (775, '2017-02-07 06:18:25.111144+00', '494', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (776, '2017-02-07 06:18:25.112106+00', '493', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (777, '2017-02-07 06:18:25.114844+00', '492', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (778, '2017-02-07 06:18:25.115793+00', '491', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (779, '2017-02-07 06:18:25.116783+00', '490', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (780, '2017-02-07 06:18:25.117728+00', '489', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (781, '2017-02-07 06:18:25.118671+00', '488', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (782, '2017-02-07 06:18:25.119833+00', '487', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (783, '2017-02-07 06:18:25.120854+00', '486', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (784, '2017-02-07 06:18:25.121814+00', '485', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (785, '2017-02-07 06:18:25.123689+00', '484', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (786, '2017-02-07 06:18:25.12466+00', '483', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (787, '2017-02-07 06:18:25.125821+00', '482', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (788, '2017-02-07 06:18:25.126799+00', '481', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (789, '2017-02-07 06:18:25.127727+00', '480', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (790, '2017-02-07 06:18:25.12867+00', '479', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (791, '2017-02-07 06:18:25.129656+00', '478', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (792, '2017-02-07 06:18:25.130568+00', '477', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (793, '2017-02-07 06:18:25.131523+00', '476', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (794, '2017-02-07 06:18:25.133484+00', '475', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (795, '2017-02-07 06:18:25.134492+00', '474', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (796, '2017-02-07 06:18:25.135442+00', '473', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (797, '2017-02-07 06:18:25.136581+00', '472', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (798, '2017-02-07 06:18:25.137561+00', '471', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (799, '2017-02-07 06:18:25.138695+00', '470', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (800, '2017-02-07 06:18:25.139632+00', '469', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (801, '2017-02-07 06:18:25.140617+00', '468', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (802, '2017-02-07 06:18:25.141624+00', '467', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (803, '2017-02-07 06:18:25.143831+00', '466', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (804, '2017-02-07 06:18:25.145165+00', '465', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (805, '2017-02-07 06:18:25.146489+00', '464', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (806, '2017-02-07 06:18:25.147411+00', '463', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (807, '2017-02-07 06:18:25.148331+00', '462', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (808, '2017-02-07 06:18:25.149257+00', '461', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (809, '2017-02-07 06:18:25.150521+00', '460', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (810, '2017-02-07 06:18:25.151498+00', '459', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (811, '2017-02-07 06:18:25.154029+00', '458', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (812, '2017-02-07 06:18:25.154975+00', '457', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (813, '2017-02-07 06:18:25.156237+00', '456', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (814, '2017-02-07 06:18:25.157186+00', '455', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (815, '2017-02-07 06:18:25.158634+00', '454', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (816, '2017-02-07 06:18:25.159634+00', '453', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (817, '2017-02-07 06:18:25.160582+00', '452', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (818, '2017-02-07 06:18:25.161558+00', '451', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (819, '2017-02-07 06:18:25.164361+00', '450', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (820, '2017-02-07 06:18:25.16538+00', '449', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (821, '2017-02-07 06:18:25.166715+00', '448', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (822, '2017-02-07 06:18:25.167779+00', '447', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (823, '2017-02-07 06:18:25.168875+00', '446', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (824, '2017-02-07 06:18:25.170005+00', '445', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (825, '2017-02-07 06:18:25.170933+00', '444', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (826, '2017-02-07 06:18:25.171849+00', '443', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (827, '2017-02-07 06:18:25.174626+00', '442', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (828, '2017-02-07 06:18:25.175653+00', '441', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (829, '2017-02-07 06:18:25.176579+00', '440', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (830, '2017-02-07 06:18:25.177592+00', '439', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (831, '2017-02-07 06:18:25.178559+00', '438', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (832, '2017-02-07 06:18:25.179489+00', '437', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (833, '2017-02-07 06:18:25.180599+00', '436', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (834, '2017-02-07 06:18:25.181526+00', '435', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (835, '2017-02-07 06:18:25.183234+00', '434', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (836, '2017-02-07 06:18:25.184378+00', '433', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (837, '2017-02-07 06:18:25.185534+00', '432', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (838, '2017-02-07 06:18:25.186486+00', '431', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (839, '2017-02-07 06:18:25.187617+00', '430', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (840, '2017-02-07 06:18:25.188686+00', '429', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (841, '2017-02-07 06:18:25.189665+00', '428', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (842, '2017-02-07 06:18:25.19058+00', '427', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (843, '2017-02-07 06:18:25.191722+00', '426', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (844, '2017-02-07 06:18:25.193243+00', '425', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (845, '2017-02-07 06:18:25.194543+00', '424', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (846, '2017-02-07 06:18:25.195483+00', '423', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (847, '2017-02-07 06:18:25.196496+00', '422', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (848, '2017-02-07 06:18:25.197465+00', '421', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (849, '2017-02-07 06:18:25.198388+00', '420', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (850, '2017-02-07 06:18:25.199316+00', '419', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (851, '2017-02-07 06:18:25.200248+00', '418', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (852, '2017-02-07 06:18:25.201163+00', '417', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (853, '2017-02-07 06:18:25.202088+00', '416', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (854, '2017-02-07 06:18:25.204624+00', '415', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (855, '2017-02-07 06:18:25.205545+00', '414', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (856, '2017-02-07 06:18:25.206498+00', '413', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (857, '2017-02-07 06:18:25.207684+00', '412', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (858, '2017-02-07 06:18:25.208659+00', '411', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (859, '2017-02-07 06:18:25.209596+00', '410', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (860, '2017-02-07 06:18:25.210631+00', '409', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (861, '2017-02-07 06:18:25.211584+00', '408', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (862, '2017-02-07 06:18:25.214553+00', '407', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (863, '2017-02-07 06:18:25.215867+00', '406', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (864, '2017-02-07 06:18:25.2168+00', '405', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (865, '2017-02-07 06:18:25.217717+00', '404', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (866, '2017-02-07 06:18:25.218645+00', '403', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (867, '2017-02-07 06:18:25.219579+00', '402', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (868, '2017-02-07 06:18:25.220498+00', '401', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (869, '2017-02-07 06:18:25.221427+00', '400', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (870, '2017-02-07 06:18:25.223226+00', '399', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (871, '2017-02-07 06:18:25.224943+00', '398', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (872, '2017-02-07 06:18:25.225891+00', '397', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (873, '2017-02-07 06:18:25.226971+00', '396', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (874, '2017-02-07 06:18:25.227898+00', '395', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (875, '2017-02-07 06:18:25.228827+00', '394', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (876, '2017-02-07 06:18:25.230063+00', '393', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (877, '2017-02-07 06:18:25.231185+00', '392', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (878, '2017-02-07 06:18:25.232111+00', '391', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (879, '2017-02-07 06:18:25.23386+00', '390', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (880, '2017-02-07 06:18:25.234953+00', '389', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (881, '2017-02-07 06:18:25.23605+00', '388', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (882, '2017-02-07 06:18:25.237551+00', '387', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (883, '2017-02-07 06:18:25.238524+00', '386', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (884, '2017-02-07 06:18:25.239521+00', '385', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (885, '2017-02-07 06:18:25.240504+00', '384', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (886, '2017-02-07 06:18:25.241497+00', '383', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (887, '2017-02-07 06:18:25.24379+00', '382', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (888, '2017-02-07 06:18:25.244883+00', '381', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (889, '2017-02-07 06:18:25.245986+00', '380', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (890, '2017-02-07 06:18:25.24708+00', '379', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (891, '2017-02-07 06:18:25.248002+00', '378', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (892, '2017-02-07 06:18:25.24892+00', '377', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (893, '2017-02-07 06:18:25.249849+00', '376', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (894, '2017-02-07 06:18:25.250754+00', '375', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (895, '2017-02-07 06:18:25.251684+00', '374', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (896, '2017-02-07 06:18:25.253664+00', '373', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (897, '2017-02-07 06:18:25.254937+00', '372', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (898, '2017-02-07 06:18:25.255885+00', '371', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (899, '2017-02-07 06:18:25.256958+00', '370', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (900, '2017-02-07 06:18:25.257871+00', '369', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (901, '2017-02-07 06:18:25.258822+00', '368', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (902, '2017-02-07 06:18:25.259912+00', '367', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (903, '2017-02-07 06:18:25.261184+00', '366', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (904, '2017-02-07 06:18:25.267307+00', '365', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (905, '2017-02-07 06:18:25.26871+00', '364', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (906, '2017-02-07 06:18:25.270405+00', '363', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (907, '2017-02-07 06:18:25.271764+00', '362', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (908, '2017-02-07 06:18:25.275178+00', '361', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (909, '2017-02-07 06:18:25.281923+00', '360', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (910, '2017-02-07 06:18:25.284189+00', '359', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (911, '2017-02-07 06:18:25.285762+00', '358', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (912, '2017-02-07 06:18:25.286884+00', '357', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (913, '2017-02-07 06:18:25.290556+00', '356', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (914, '2017-02-07 06:18:25.299283+00', '355', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (915, '2017-02-07 06:18:25.300373+00', '354', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (916, '2017-02-07 06:18:25.301335+00', '353', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (917, '2017-02-07 06:18:25.302263+00', '352', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (918, '2017-02-07 06:18:25.305345+00', '351', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (919, '2017-02-07 06:18:25.306602+00', '350', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (920, '2017-02-07 06:18:25.307586+00', '349', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (921, '2017-02-07 06:18:25.308516+00', '348', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (922, '2017-02-07 06:18:25.30965+00', '347', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (923, '2017-02-07 06:18:25.310845+00', '346', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (924, '2017-02-07 06:18:25.311863+00', '345', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (925, '2017-02-07 06:18:25.314614+00', '344', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (926, '2017-02-07 06:18:25.316849+00', '343', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (927, '2017-02-07 06:18:25.317869+00', '342', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (928, '2017-02-07 06:18:25.31886+00', '341', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (929, '2017-02-07 06:18:25.319797+00', '340', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (930, '2017-02-07 06:18:25.320746+00', '339', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (931, '2017-02-07 06:18:25.321669+00', '338', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (932, '2017-02-07 06:18:25.326163+00', '337', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (933, '2017-02-07 06:18:25.327352+00', '336', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (934, '2017-02-07 06:18:25.328342+00', '335', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (935, '2017-02-07 06:18:25.329286+00', '334', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (936, '2017-02-07 06:18:25.330213+00', '333', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (937, '2017-02-07 06:18:25.331158+00', '332', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (938, '2017-02-07 06:18:25.332251+00', '331', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (939, '2017-02-07 06:18:25.335049+00', '330', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (940, '2017-02-07 06:18:25.335981+00', '329', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (941, '2017-02-07 06:18:25.33707+00', '328', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (942, '2017-02-07 06:18:25.338142+00', '327', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (943, '2017-02-07 06:18:25.33925+00', '326', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (944, '2017-02-07 06:18:25.340176+00', '325', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (945, '2017-02-07 06:18:25.341101+00', '324', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (946, '2017-02-07 06:18:25.342176+00', '323', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (947, '2017-02-07 06:18:25.344269+00', '322', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (948, '2017-02-07 06:18:25.345196+00', '321', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (949, '2017-02-07 06:18:25.346149+00', '320', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (950, '2017-02-07 06:18:25.348528+00', '319', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (951, '2017-02-07 06:18:25.349774+00', '318', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (952, '2017-02-07 06:18:25.351112+00', '317', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (953, '2017-02-07 06:18:25.356467+00', '316', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (954, '2017-02-07 06:18:25.359743+00', '315', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (955, '2017-02-07 06:18:25.36106+00', '314', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (956, '2017-02-07 06:18:25.369296+00', '313', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (957, '2017-02-07 06:18:25.370506+00', '312', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (958, '2017-02-07 06:18:25.371464+00', '311', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (959, '2017-02-07 06:18:25.376254+00', '310', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (960, '2017-02-07 06:18:25.377501+00', '309', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (961, '2017-02-07 06:18:25.378767+00', '308', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (962, '2017-02-07 06:18:25.380021+00', '307', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (963, '2017-02-07 06:18:25.381184+00', '306', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (964, '2017-02-07 06:18:25.382292+00', '305', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (965, '2017-02-07 06:18:25.386922+00', '304', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (966, '2017-02-07 06:18:25.388216+00', '303', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (967, '2017-02-07 06:18:25.389397+00', '302', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (968, '2017-02-07 06:18:25.390564+00', '301', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (969, '2017-02-07 06:18:25.391717+00', '300', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (970, '2017-02-07 06:18:25.394031+00', '299', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (971, '2017-02-07 06:18:25.395523+00', '298', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (972, '2017-02-07 06:18:25.396886+00', '297', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (973, '2017-02-07 06:18:25.398045+00', '296', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (974, '2017-02-07 06:18:25.39944+00', '295', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (975, '2017-02-07 06:18:25.400671+00', '294', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (976, '2017-02-07 06:18:25.401939+00', '293', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (977, '2017-02-07 06:18:25.404695+00', '292', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (978, '2017-02-07 06:18:25.406304+00', '291', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (979, '2017-02-07 06:18:25.407581+00', '290', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (980, '2017-02-07 06:18:25.408984+00', '289', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (981, '2017-02-07 06:18:25.410011+00', '288', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (982, '2017-02-07 06:18:25.411054+00', '287', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (983, '2017-02-07 06:18:25.412124+00', '286', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (984, '2017-02-07 06:18:25.417513+00', '285', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (985, '2017-02-07 06:18:25.418743+00', '284', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (986, '2017-02-07 06:18:25.419704+00', '283', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (987, '2017-02-07 06:18:25.420653+00', '282', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (988, '2017-02-07 06:18:25.421568+00', '281', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (989, '2017-02-07 06:18:25.426464+00', '280', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (990, '2017-02-07 06:18:25.427565+00', '279', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (991, '2017-02-07 06:18:25.428721+00', '278', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (992, '2017-02-07 06:18:25.429776+00', '277', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (993, '2017-02-07 06:18:25.430844+00', '276', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (994, '2017-02-07 06:18:25.43192+00', '275', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (995, '2017-02-07 06:18:25.434603+00', '274', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (996, '2017-02-07 06:18:25.435669+00', '273', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (997, '2017-02-07 06:18:25.436888+00', '272', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (998, '2017-02-07 06:18:25.438014+00', '271', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (999, '2017-02-07 06:18:25.439145+00', '270', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1000, '2017-02-07 06:18:25.440248+00', '269', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1001, '2017-02-07 06:18:25.441453+00', '268', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1002, '2017-02-07 06:18:25.44312+00', '267', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1003, '2017-02-07 06:18:25.444059+00', '266', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1004, '2017-02-07 06:18:25.446061+00', '265', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1005, '2017-02-07 06:18:25.447329+00', '264', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1006, '2017-02-07 06:18:25.448565+00', '263', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1007, '2017-02-07 06:18:25.449824+00', '262', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1008, '2017-02-07 06:18:25.464647+00', '261', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1009, '2017-02-07 06:18:25.466006+00', '260', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1010, '2017-02-07 06:18:25.46706+00', '259', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1011, '2017-02-07 06:18:25.468123+00', '258', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1012, '2017-02-07 06:18:25.469294+00', '257', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1013, '2017-02-07 06:18:25.470554+00', '256', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1014, '2017-02-07 06:18:25.471824+00', '255', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1015, '2017-02-07 06:18:25.476399+00', '254', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1016, '2017-02-07 06:18:25.477729+00', '253', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1017, '2017-02-07 06:18:25.479944+00', '252', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1018, '2017-02-07 06:18:25.481188+00', '251', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1019, '2017-02-07 06:18:25.484212+00', '250', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1020, '2017-02-07 06:18:25.485732+00', '249', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1021, '2017-02-07 06:18:25.48728+00', '248', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1022, '2017-02-07 06:18:25.488611+00', '247', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1023, '2017-02-07 06:18:25.489824+00', '246', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1024, '2017-02-07 06:18:25.491017+00', '245', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1025, '2017-02-07 06:18:25.492085+00', '244', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1026, '2017-02-07 06:18:25.494608+00', '243', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1027, '2017-02-07 06:18:25.495651+00', '242', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1028, '2017-02-07 06:18:25.496904+00', '241', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1029, '2017-02-07 06:18:25.497949+00', '240', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1030, '2017-02-07 06:18:25.499165+00', '239', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1031, '2017-02-07 06:18:25.500311+00', '238', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1032, '2017-02-07 06:18:25.501543+00', '237', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1033, '2017-02-07 06:18:25.504878+00', '236', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1034, '2017-02-07 06:18:25.505947+00', '235', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1035, '2017-02-07 06:18:25.506988+00', '234', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1036, '2017-02-07 06:18:25.508022+00', '233', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1037, '2017-02-07 06:18:25.509111+00', '232', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1038, '2017-02-07 06:18:25.510469+00', '231', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1039, '2017-02-07 06:18:25.511854+00', '230', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1040, '2017-02-07 06:18:25.516831+00', '229', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1041, '2017-02-07 06:18:25.518557+00', '228', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1042, '2017-02-07 06:18:25.51976+00', '227', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1043, '2017-02-07 06:18:25.520788+00', '226', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1044, '2017-02-07 06:18:25.522004+00', '225', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1045, '2017-02-07 06:18:25.525146+00', '224', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1046, '2017-02-07 06:18:25.526382+00', '223', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1047, '2017-02-07 06:18:25.527737+00', '222', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1048, '2017-02-07 06:18:25.529056+00', '221', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1049, '2017-02-07 06:18:25.530583+00', '220', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1050, '2017-02-07 06:18:25.531638+00', '219', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1051, '2017-02-07 06:18:25.534572+00', '218', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1052, '2017-02-07 06:18:25.536+00', '217', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1053, '2017-02-07 06:18:25.537194+00', '216', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1054, '2017-02-07 06:18:25.538348+00', '215', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1055, '2017-02-07 06:18:25.539396+00', '214', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1056, '2017-02-07 06:18:25.540535+00', '213', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1057, '2017-02-07 06:18:25.545266+00', '212', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1058, '2017-02-07 06:18:25.546907+00', '211', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1059, '2017-02-07 06:18:25.548676+00', '210', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1060, '2017-02-07 06:18:25.550078+00', '209', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1061, '2017-02-07 06:18:25.551461+00', '208', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1062, '2017-02-07 06:18:25.557673+00', '207', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1063, '2017-02-07 06:18:25.559041+00', '206', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1064, '2017-02-07 06:18:25.560403+00', '205', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1065, '2017-02-07 06:18:25.561437+00', '204', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1066, '2017-02-07 06:18:25.569533+00', '203', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1067, '2017-02-07 06:18:25.571208+00', '202', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1068, '2017-02-07 06:18:25.574539+00', '201', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1069, '2017-02-07 06:18:25.575797+00', '200', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1070, '2017-02-07 06:18:25.576851+00', '199', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1071, '2017-02-07 06:18:25.582291+00', '198', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1072, '2017-02-07 06:18:25.589458+00', '197', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1073, '2017-02-07 06:18:25.590761+00', '196', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1074, '2017-02-07 06:18:25.591817+00', '195', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1075, '2017-02-07 06:18:25.59396+00', '194', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1076, '2017-02-07 06:18:25.595222+00', '193', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1077, '2017-02-07 06:18:25.597574+00', '192', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1078, '2017-02-07 06:18:25.59869+00', '191', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1079, '2017-02-07 06:18:25.59982+00', '190', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1080, '2017-02-07 06:18:25.600793+00', '189', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1081, '2017-02-07 06:18:25.601997+00', '188', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1082, '2017-02-07 06:18:25.603965+00', '187', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1083, '2017-02-07 06:18:25.605069+00', '186', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1084, '2017-02-07 06:18:25.605987+00', '185', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1085, '2017-02-07 06:18:25.607074+00', '184', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1086, '2017-02-07 06:18:25.608155+00', '183', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1087, '2017-02-07 06:18:25.609282+00', '182', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1088, '2017-02-07 06:18:25.61197+00', '181', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1089, '2017-02-07 06:18:25.617925+00', '180', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1090, '2017-02-07 06:18:25.619007+00', '179', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1091, '2017-02-07 06:18:25.620008+00', '178', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1092, '2017-02-07 06:18:25.620933+00', '177', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1093, '2017-02-07 06:18:25.621853+00', '176', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1094, '2017-02-07 06:18:25.626074+00', '175', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1095, '2017-02-07 06:18:25.627167+00', '174', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1096, '2017-02-07 06:18:25.628136+00', '173', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1097, '2017-02-07 06:18:25.629069+00', '172', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1098, '2017-02-07 06:18:25.629997+00', '171', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1099, '2017-02-07 06:18:25.630892+00', '170', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1100, '2017-02-07 06:18:25.631961+00', '169', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1101, '2017-02-07 06:18:25.634529+00', '168', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1102, '2017-02-07 06:18:25.635489+00', '167', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1103, '2017-02-07 06:18:25.636431+00', '166', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1104, '2017-02-07 06:18:25.637344+00', '165', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1105, '2017-02-07 06:18:25.638264+00', '164', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1106, '2017-02-07 06:18:25.639206+00', '163', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1107, '2017-02-07 06:18:25.640439+00', '162', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1108, '2017-02-07 06:18:25.641381+00', '161', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1109, '2017-02-07 06:18:25.643116+00', '160', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1110, '2017-02-07 06:18:25.64424+00', '159', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1111, '2017-02-07 06:18:25.645525+00', '158', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1112, '2017-02-07 06:18:25.646681+00', '157', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1113, '2017-02-07 06:18:25.648596+00', '156', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1114, '2017-02-07 06:18:25.649846+00', '155', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1115, '2017-02-07 06:18:25.651093+00', '154', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1116, '2017-02-07 06:18:25.653921+00', '153', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1117, '2017-02-07 06:18:25.658154+00', '152', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1118, '2017-02-07 06:18:25.659445+00', '151', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1119, '2017-02-07 06:18:25.66086+00', '150', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1120, '2017-02-07 06:18:25.664775+00', '149', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1121, '2017-02-07 06:18:25.666254+00', '148', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1122, '2017-02-07 06:18:25.667857+00', '147', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1123, '2017-02-07 06:18:25.669295+00', '146', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1124, '2017-02-07 06:18:25.670713+00', '145', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1125, '2017-02-07 06:18:25.672094+00', '144', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1126, '2017-02-07 06:18:25.676466+00', '143', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1127, '2017-02-07 06:18:25.677853+00', '142', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1128, '2017-02-07 06:18:25.679279+00', '141', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1129, '2017-02-07 06:18:25.680688+00', '140', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1130, '2017-02-07 06:18:25.682076+00', '139', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1131, '2017-02-07 06:18:25.687182+00', '138', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1132, '2017-02-07 06:18:25.688708+00', '137', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1133, '2017-02-07 06:18:25.690124+00', '136', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1134, '2017-02-07 06:18:25.691924+00', '135', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1135, '2017-02-07 06:18:25.694931+00', '134', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1136, '2017-02-07 06:18:25.696149+00', '133', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1137, '2017-02-07 06:18:25.697576+00', '132', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1138, '2017-02-07 06:18:25.698844+00', '131', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1139, '2017-02-07 06:18:25.700383+00', '130', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1140, '2017-02-07 06:18:25.701597+00', '129', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1141, '2017-02-07 06:18:25.704917+00', '128', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1142, '2017-02-07 06:18:25.706239+00', '127', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1143, '2017-02-07 06:18:25.707473+00', '126', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1144, '2017-02-07 06:18:25.70887+00', '125', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1145, '2017-02-07 06:18:25.710095+00', '124', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1146, '2017-02-07 06:18:25.711348+00', '123', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1147, '2017-02-07 06:18:25.716933+00', '122', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1148, '2017-02-07 06:18:25.717854+00', '121', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1149, '2017-02-07 06:18:25.718893+00', '120', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1150, '2017-02-07 06:18:25.719823+00', '119', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1151, '2017-02-07 06:18:25.720726+00', '118', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1152, '2017-02-07 06:18:25.721612+00', '117', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1153, '2017-02-07 06:18:25.724804+00', '116', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1154, '2017-02-07 06:18:25.725679+00', '115', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1155, '2017-02-07 06:18:25.726717+00', '114', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1156, '2017-02-07 06:18:25.727728+00', '113', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1157, '2017-02-07 06:18:25.728759+00', '112', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1158, '2017-02-07 06:18:25.729622+00', '111', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1159, '2017-02-07 06:18:25.730499+00', '110', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1160, '2017-02-07 06:18:25.731393+00', '109', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1161, '2017-02-07 06:18:25.733507+00', '108', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1162, '2017-02-07 06:18:25.735663+00', '107', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1163, '2017-02-07 06:18:25.736637+00', '106', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1164, '2017-02-07 06:18:25.737672+00', '105', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1165, '2017-02-07 06:18:25.738642+00', '104', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1166, '2017-02-07 06:18:25.740888+00', '103', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1167, '2017-02-07 06:18:25.742068+00', '102', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1168, '2017-02-07 06:18:25.748361+00', '101', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1169, '2017-02-07 06:18:25.750584+00', '100', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1170, '2017-02-07 06:18:25.751742+00', '99', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1171, '2017-02-07 06:18:25.756212+00', '98', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1172, '2017-02-07 06:18:25.757501+00', '97', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1173, '2017-02-07 06:18:25.758552+00', '96', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1174, '2017-02-07 06:18:25.759441+00', '95', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1175, '2017-02-07 06:18:25.76031+00', '94', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1176, '2017-02-07 06:18:25.761214+00', '93', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1177, '2017-02-07 06:18:25.76207+00', '92', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1178, '2017-02-07 06:18:25.765152+00', '91', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1179, '2017-02-07 06:18:25.766032+00', '90', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1180, '2017-02-07 06:18:25.767213+00', '89', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1181, '2017-02-07 06:18:25.768423+00', '88', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1182, '2017-02-07 06:18:25.769336+00', '87', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1183, '2017-02-07 06:18:25.770212+00', '86', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1184, '2017-02-07 06:18:25.771138+00', '85', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1185, '2017-02-07 06:18:25.772025+00', '84', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1186, '2017-02-07 06:18:25.774375+00', '83', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1187, '2017-02-07 06:18:25.775274+00', '82', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1188, '2017-02-07 06:18:25.776202+00', '81', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1189, '2017-02-07 06:18:25.777096+00', '80', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1190, '2017-02-07 06:18:25.778144+00', '79', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1191, '2017-02-07 06:18:25.779032+00', '78', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1192, '2017-02-07 06:18:25.779904+00', '77', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1193, '2017-02-07 06:18:25.780783+00', '76', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1194, '2017-02-07 06:18:25.781634+00', '75', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1195, '2017-02-07 06:18:25.784224+00', '74', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1196, '2017-02-07 06:18:25.78533+00', '73', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1197, '2017-02-07 06:18:25.786215+00', '72', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1198, '2017-02-07 06:18:25.787085+00', '71', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1199, '2017-02-07 06:18:25.78824+00', '70', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1200, '2017-02-07 06:18:25.789188+00', '69', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1201, '2017-02-07 06:18:25.790128+00', '68', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1202, '2017-02-07 06:18:25.790994+00', '67', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1203, '2017-02-07 06:18:25.791858+00', '66', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1204, '2017-02-07 06:18:25.793856+00', '65', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1205, '2017-02-07 06:18:25.794746+00', '64', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1206, '2017-02-07 06:18:25.795682+00', '63', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1207, '2017-02-07 06:18:25.796606+00', '62', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1208, '2017-02-07 06:18:25.797628+00', '61', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1209, '2017-02-07 06:18:25.798574+00', '60', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1210, '2017-02-07 06:18:25.79944+00', '59', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1211, '2017-02-07 06:18:25.800307+00', '58', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1212, '2017-02-07 06:18:25.80138+00', '57', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1213, '2017-02-07 06:18:25.802279+00', '56', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1214, '2017-02-07 06:18:25.804353+00', '55', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1215, '2017-02-07 06:18:25.805243+00', '54', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1216, '2017-02-07 06:18:25.806152+00', '53', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1217, '2017-02-07 06:18:25.807206+00', '52', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1218, '2017-02-07 06:18:25.808082+00', '51', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1219, '2017-02-07 06:18:25.809008+00', '50', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1220, '2017-02-07 06:18:25.810067+00', '49', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1221, '2017-02-07 06:18:25.810925+00', '48', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1222, '2017-02-07 06:18:25.81179+00', '47', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1223, '2017-02-07 06:18:25.817345+00', '46', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1224, '2017-02-07 06:18:25.820689+00', '45', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1225, '2017-02-07 06:18:25.821773+00', '44', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1226, '2017-02-07 06:18:25.824477+00', '43', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1227, '2017-02-07 06:18:25.825679+00', '42', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1228, '2017-02-07 06:18:25.826572+00', '41', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1229, '2017-02-07 06:18:25.827438+00', '40', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1230, '2017-02-07 06:18:25.828347+00', '39', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1231, '2017-02-07 06:18:25.829267+00', '38', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1232, '2017-02-07 06:18:25.830143+00', '37', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1233, '2017-02-07 06:18:25.831029+00', '36', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1234, '2017-02-07 06:18:25.831927+00', '35', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1235, '2017-02-07 06:18:25.833568+00', '34', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1236, '2017-02-07 06:18:25.834478+00', '33', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1237, '2017-02-07 06:18:25.837733+00', '32', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1238, '2017-02-07 06:18:25.839539+00', '31', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1239, '2017-02-07 06:18:25.840584+00', '30', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1240, '2017-02-07 06:18:25.841567+00', '29', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1241, '2017-02-07 06:18:25.846663+00', '28', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1242, '2017-02-07 06:18:25.847834+00', '27', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1243, '2017-02-07 06:18:25.848817+00', '26', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1244, '2017-02-07 06:18:25.849792+00', '25', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1245, '2017-02-07 06:18:25.850797+00', '24', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1246, '2017-02-07 06:18:25.851776+00', '23', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1247, '2017-02-07 06:18:25.855209+00', '22', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1248, '2017-02-07 06:18:25.856311+00', '21', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1249, '2017-02-07 06:18:25.857325+00', '20', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1250, '2017-02-07 06:18:25.858664+00', '19', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1251, '2017-02-07 06:18:25.859759+00', '18', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1252, '2017-02-07 06:18:25.860923+00', '17', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1253, '2017-02-07 06:18:25.86192+00', '16', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1254, '2017-02-07 06:18:25.864785+00', '15', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1255, '2017-02-07 06:18:25.865803+00', '14', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1256, '2017-02-07 06:18:25.866979+00', '13', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1257, '2017-02-07 06:18:25.867979+00', '12', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1258, '2017-02-07 06:18:25.869133+00', '11', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1259, '2017-02-10 00:06:39.804718+00', '1', 'super', 1, '[{"added": {}}]', 16, 1);
INSERT INTO django_admin_log VALUES (1260, '2017-02-10 00:06:50.399879+00', '2', 'staff', 1, '[{"added": {}}]', 16, 1);
INSERT INTO django_admin_log VALUES (1261, '2017-02-10 00:07:00.436739+00', '3', 'accountant', 1, '[{"added": {}}]', 16, 1);
INSERT INTO django_admin_log VALUES (1262, '2017-02-11 04:52:11.711008+00', '365', 'anushay_someoneikvsdjlfkjdslak', 1, '[{"added": {}}]', 15, 1);
INSERT INTO django_admin_log VALUES (1263, '2017-02-11 04:56:29.331646+00', '2209', 'Donor_log object', 3, '', 14, 1);
INSERT INTO django_admin_log VALUES (1264, '2017-02-11 05:00:50.66922+00', '366', 'anupanu_man', 3, '', 15, 1);
INSERT INTO django_admin_log VALUES (1265, '2017-02-12 02:42:45.309609+00', '18', 'NonScheduledHolidays object', 3, '', 12, 1);
INSERT INTO django_admin_log VALUES (1266, '2017-02-12 02:42:45.312058+00', '17', 'NonScheduledHolidays object', 3, '', 12, 1);
INSERT INTO django_admin_log VALUES (1267, '2017-02-12 02:42:45.315113+00', '16', 'NonScheduledHolidays object', 3, '', 12, 1);
INSERT INTO django_admin_log VALUES (1268, '2017-02-12 02:42:45.316144+00', '15', 'NonScheduledHolidays object', 3, '', 12, 1);
INSERT INTO django_admin_log VALUES (1269, '2017-02-12 02:42:45.317515+00', '14', 'NonScheduledHolidays object', 3, '', 12, 1);
INSERT INTO django_admin_log VALUES (1270, '2017-02-13 00:22:10.210769+00', '7', 'PK-6', 1, '[{"added": {}}]', 7, 1);
INSERT INTO django_admin_log VALUES (1271, '2017-02-13 00:27:03.867032+00', '1', 'admin_admin', 2, '[]', 9, 1);
INSERT INTO django_admin_log VALUES (1272, '2017-02-18 22:34:50.249572+00', '7', 'PK6', 2, '[{"changed": {"fields": ["school_name"]}}]', 7, 1);
INSERT INTO django_admin_log VALUES (1273, '2017-02-18 22:38:45.562096+00', '7', 'PK6', 2, '[{"changed": {"fields": ["school_notes"]}}]', 7, 1);
INSERT INTO django_admin_log VALUES (1274, '2017-02-19 03:28:00.345637+00', '335', 'goldi_locks', 2, '[]', 10, 1);
INSERT INTO django_admin_log VALUES (1275, '2017-02-19 04:27:51.766745+00', '336', 'Mickey_Mouse', 2, '[]', 10, 1);
INSERT INTO django_admin_log VALUES (1276, '2017-02-19 04:28:04.497083+00', '336', 'Mickey_Mouse', 2, '[]', 10, 1);
INSERT INTO django_admin_log VALUES (1277, '2017-02-19 04:28:28.015882+00', '336', 'Mickey_Mouse', 2, '[{"changed": {"fields": ["pkss_class"]}}]', 10, 1);
INSERT INTO django_admin_log VALUES (1278, '2017-02-19 04:29:13.8107+00', '334', 'kanye_west', 2, '[{"changed": {"fields": ["pkss_class_original"]}}]', 10, 1);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1278, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type VALUES (3, 'auth', 'user');
INSERT INTO django_content_type VALUES (4, 'auth', 'group');
INSERT INTO django_content_type VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO django_content_type VALUES (6, 'sessions', 'session');
INSERT INTO django_content_type VALUES (7, 'schools', 'school');
INSERT INTO django_content_type VALUES (8, 'classes', 'class');
INSERT INTO django_content_type VALUES (9, 'teachers', 'teacher');
INSERT INTO django_content_type VALUES (10, 'students', 'student');
INSERT INTO django_content_type VALUES (11, 'attendance', 'attendancecalendar');
INSERT INTO django_content_type VALUES (12, 'attendance', 'nonscheduledholidays');
INSERT INTO django_content_type VALUES (13, 'attendance', 'attendance');
INSERT INTO django_content_type VALUES (14, 'donors', 'donor_log');
INSERT INTO django_content_type VALUES (15, 'donors', 'donor');
INSERT INTO django_content_type VALUES (16, 'access', 'useraccess');
INSERT INTO django_content_type VALUES (17, 'students', 'studenthistory');
INSERT INTO django_content_type VALUES (18, 'tattendance', 'teacherattendance');


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('django_content_type_id_seq', 18, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO django_migrations VALUES (1, 'contenttypes', '0001_initial', '2017-01-15 22:35:23.859257+00');
INSERT INTO django_migrations VALUES (2, 'auth', '0001_initial', '2017-01-15 22:35:23.91276+00');
INSERT INTO django_migrations VALUES (3, 'admin', '0001_initial', '2017-01-15 22:35:23.941437+00');
INSERT INTO django_migrations VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2017-01-15 22:35:23.958888+00');
INSERT INTO django_migrations VALUES (5, 'schools', '0001_initial', '2017-01-15 22:35:23.967697+00');
INSERT INTO django_migrations VALUES (6, 'schools', '0002_school_shift', '2017-01-15 22:35:23.976572+00');
INSERT INTO django_migrations VALUES (7, 'teachers', '0001_initial', '2017-01-15 22:35:23.989553+00');
INSERT INTO django_migrations VALUES (8, 'classes', '0001_initial', '2017-01-15 22:35:23.997438+00');
INSERT INTO django_migrations VALUES (9, 'classes', '0002_class_teacher', '2017-01-15 22:35:24.006767+00');
INSERT INTO django_migrations VALUES (10, 'classes', '0003_class_school', '2017-01-15 22:35:24.024918+00');
INSERT INTO django_migrations VALUES (11, 'classes', '0004_auto_20161230_2143', '2017-01-15 22:35:24.04395+00');
INSERT INTO django_migrations VALUES (12, 'students', '0001_initial', '2017-01-15 22:35:24.065356+00');
INSERT INTO django_migrations VALUES (13, 'attendance', '0001_initial', '2017-01-15 22:35:24.112536+00');
INSERT INTO django_migrations VALUES (14, 'attendance', '0002_auto_20170102_1419', '2017-01-15 22:35:24.132139+00');
INSERT INTO django_migrations VALUES (15, 'attendance', '0003_auto_20170105_1949', '2017-01-15 22:35:24.151583+00');
INSERT INTO django_migrations VALUES (16, 'attendance', '0004_auto_20170105_2235', '2017-01-15 22:35:24.215105+00');
INSERT INTO django_migrations VALUES (17, 'attendance', '0005_attendancecalendar_nonscheduledholidays', '2017-01-15 22:35:24.292213+00');
INSERT INTO django_migrations VALUES (18, 'attendance', '0006_auto_20170105_2351', '2017-01-15 22:35:24.36352+00');
INSERT INTO django_migrations VALUES (19, 'contenttypes', '0002_remove_content_type_name', '2017-01-15 22:35:24.401131+00');
INSERT INTO django_migrations VALUES (20, 'auth', '0002_alter_permission_name_max_length', '2017-01-15 22:35:24.415529+00');
INSERT INTO django_migrations VALUES (21, 'auth', '0003_alter_user_email_max_length', '2017-01-15 22:35:24.427585+00');
INSERT INTO django_migrations VALUES (22, 'auth', '0004_alter_user_username_opts', '2017-01-15 22:35:24.438613+00');
INSERT INTO django_migrations VALUES (23, 'auth', '0005_alter_user_last_login_null', '2017-01-15 22:35:24.451063+00');
INSERT INTO django_migrations VALUES (24, 'auth', '0006_require_contenttypes_0002', '2017-01-15 22:35:24.452381+00');
INSERT INTO django_migrations VALUES (25, 'auth', '0007_alter_validators_add_error_messages', '2017-01-15 22:35:24.462746+00');
INSERT INTO django_migrations VALUES (26, 'auth', '0008_alter_user_username_max_length', '2017-01-15 22:35:24.477425+00');
INSERT INTO django_migrations VALUES (27, 'classes', '0005_auto_20161230_2226', '2017-01-15 22:35:24.509789+00');
INSERT INTO django_migrations VALUES (28, 'classes', '0006_auto_20170105_1949', '2017-01-15 22:35:24.521125+00');
INSERT INTO django_migrations VALUES (29, 'sessions', '0001_initial', '2017-01-15 22:35:24.529781+00');
INSERT INTO django_migrations VALUES (30, 'students', '0002_student_is_active', '2017-01-15 22:35:24.545268+00');
INSERT INTO django_migrations VALUES (31, 'students', '0003_auto_20170105_2303', '2017-01-15 22:35:24.593505+00');
INSERT INTO django_migrations VALUES (32, 'students', '0004_student_reason_left', '2017-01-15 22:35:24.611492+00');
INSERT INTO django_migrations VALUES (33, 'students', '0005_auto_20170105_2307', '2017-01-15 22:35:24.622935+00');
INSERT INTO django_migrations VALUES (34, 'students', '0006_auto_20170115_0231', '2017-01-15 22:35:24.634372+00');
INSERT INTO django_migrations VALUES (35, 'teachers', '0002_teacher_user', '2017-01-15 22:35:24.65604+00');
INSERT INTO django_migrations VALUES (36, 'teachers', '0003_auto_20170105_1949', '2017-01-15 22:35:24.774968+00');
INSERT INTO django_migrations VALUES (37, 'teachers', '0004_auto_20170105_2255', '2017-01-15 22:35:24.904516+00');
INSERT INTO django_migrations VALUES (38, 'attendance', '0007_auto_20170117_2338', '2017-01-18 04:38:11.623461+00');
INSERT INTO django_migrations VALUES (39, 'attendance', '0008_auto_20170117_2339', '2017-01-18 04:39:53.557554+00');
INSERT INTO django_migrations VALUES (40, 'donors', '0001_initial', '2017-01-19 04:52:28.683149+00');
INSERT INTO django_migrations VALUES (41, 'donors', '0002_auto_20170119_0000', '2017-01-19 05:00:13.098435+00');
INSERT INTO django_migrations VALUES (42, 'donors', '0003_auto_20170119_0002', '2017-01-19 05:02:42.828566+00');
INSERT INTO django_migrations VALUES (43, 'classes', '0007_class_shift', '2017-01-28 16:59:04.250885+00');
INSERT INTO django_migrations VALUES (44, 'classes', '0008_auto_20170128_1159', '2017-01-28 16:59:42.150743+00');
INSERT INTO django_migrations VALUES (45, 'students', '0007_auto_20170204_1610', '2017-02-04 21:10:47.806676+00');
INSERT INTO django_migrations VALUES (46, 'donors', '0004_auto_20170205_2345', '2017-02-06 04:45:55.43138+00');
INSERT INTO django_migrations VALUES (47, 'donors', '0005_auto_20170205_2346', '2017-02-06 04:46:22.207316+00');
INSERT INTO django_migrations VALUES (48, 'donors', '0006_auto_20170206_0109', '2017-02-06 06:09:11.578653+00');
INSERT INTO django_migrations VALUES (49, 'donors', '0007_auto_20170206_0109', '2017-02-06 06:09:37.191542+00');
INSERT INTO django_migrations VALUES (50, 'access', '0001_initial', '2017-02-10 00:05:29.989158+00');
INSERT INTO django_migrations VALUES (51, 'students', '0008_auto_20170212_2218', '2017-02-13 03:18:13.930005+00');
INSERT INTO django_migrations VALUES (52, 'schools', '0003_auto_20170218_1733', '2017-02-18 22:34:07.345417+00');
INSERT INTO django_migrations VALUES (53, 'students', '0009_auto_20170218_2147', '2017-02-19 02:48:04.941222+00');
INSERT INTO django_migrations VALUES (54, 'students', '0010_auto_20170218_2227', '2017-02-19 03:27:30.781265+00');
INSERT INTO django_migrations VALUES (55, 'students', '0011_auto_20170218_2326', '2017-02-19 04:26:56.246542+00');
INSERT INTO django_migrations VALUES (56, 'students', '0012_auto_20170219_0011', '2017-02-19 05:11:18.027547+00');
INSERT INTO django_migrations VALUES (57, 'tattendance', '0001_initial', '2017-02-19 21:56:22.175637+00');
INSERT INTO django_migrations VALUES (58, 'tattendance', '0002_auto_20170219_2006', '2017-02-20 01:06:42.902101+00');


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('django_migrations_id_seq', 58, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO django_session VALUES ('nkypnjy5qfackhfky6ungr1wcr9nzvh6', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-03-09 05:38:07.622136+00');
INSERT INTO django_session VALUES ('bmya5e6sp37cjcig06rhamwapsedbuz4', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-01-30 01:19:01.296838+00');
INSERT INTO django_session VALUES ('tav5roz68yr0xmcl31j6niww075e8znr', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-01-31 22:25:37.887552+00');
INSERT INTO django_session VALUES ('zcq9f7866ktq2krefhbuu130ovlwqz0s', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-03-11 08:42:58.707279+00');
INSERT INTO django_session VALUES ('a7xe2tf8s6aaqfvsr4byu3ojmo8e2dle', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-03-11 14:54:18.279842+00');
INSERT INTO django_session VALUES ('1dds7bdukzacmy6oilyxcorze7cy2fyf', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-03 18:40:17.17586+00');
INSERT INTO django_session VALUES ('8vh07k39h1czi5lgqyu4jl3d4faa5bab', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-05 22:18:27.007811+00');
INSERT INTO django_session VALUES ('kt4yc5926lct1stz0wghqtcpyaogjo5g', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-06 03:22:53.232679+00');
INSERT INTO django_session VALUES ('39iec10pwibyzb6iel6jve69ofc8mful', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-06 03:22:58.119254+00');
INSERT INTO django_session VALUES ('cvrjubn1w6n2ppoqcaf1h89et1gexz71', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-12 17:55:16.214196+00');
INSERT INTO django_session VALUES ('qmaadtq3ugqs7o1j9wjjnuqk5bqrnall', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-20 01:45:32.051119+00');
INSERT INTO django_session VALUES ('mml6uh9ek0ke42gf6m7419q2yek56k6f', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-20 06:27:46.679871+00');
INSERT INTO django_session VALUES ('kd0x7toyjjq1wfq97181sgxnypxd6dez', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-20 07:21:26.941325+00');
INSERT INTO django_session VALUES ('d837su785z782fd70e8y56rgs4w6w2g3', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-26 03:34:12.415807+00');
INSERT INTO django_session VALUES ('oca6bheftqm8t0wdkagcrt2hl3kiteag', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-26 08:38:20.398988+00');
INSERT INTO django_session VALUES ('6w7pm6wcx5uz9uyy4z5uo402h5rcbgki', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-26 13:17:32.130262+00');
INSERT INTO django_session VALUES ('my0hjtqnfokq8vppbkzamwod7svbwj3i', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-26 23:51:56.654613+00');
INSERT INTO django_session VALUES ('bb3rcey6umslrxdb0z31cyficf10j5u0', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-27 00:20:03.272241+00');
INSERT INTO django_session VALUES ('2531fx7y65i98f4zz5p3w1v5zm4crqik', 'Y2Q3ZjYxNmJjYWZjODcyMzc5NWMwZDdhNzAyNDI3MmEyM2JhNjZmYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwM2U3M2IwMzg1NDcwY2MwYjYyNWU4NGY2YzJkMWZlYzU4ZjYyNzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-03-07 04:31:24.851204+00');


--
-- Data for Name: donors_donor; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO donors_donor VALUES (10, 'Aalia', 'Mausuf', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.457672+00', NULL, NULL, NULL, false, 1);
INSERT INTO donors_donor VALUES (11, 'Abdul', 'Basit', 'Subhani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.46024+00', NULL, NULL, NULL, false, 2);
INSERT INTO donors_donor VALUES (12, 'Abdul', 'Qadir', 'Qayum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.461307+00', NULL, NULL, NULL, false, 3);
INSERT INTO donors_donor VALUES (13, 'Abdullah', '', 'Feroz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.462282+00', NULL, NULL, NULL, false, 4);
INSERT INTO donors_donor VALUES (14, 'Abid', '', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.464377+00', NULL, NULL, NULL, false, 5);
INSERT INTO donors_donor VALUES (15, 'Adnan', '', 'Syed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.465407+00', NULL, NULL, NULL, false, 6);
INSERT INTO donors_donor VALUES (16, 'ADP', '', 'Grant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.466744+00', NULL, NULL, NULL, false, 7);
INSERT INTO donors_donor VALUES (17, 'Aejaz', '', 'Basarai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.467726+00', NULL, NULL, NULL, false, 8);
INSERT INTO donors_donor VALUES (18, 'Afsar', '', 'Arslan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.468755+00', NULL, NULL, NULL, false, 9);
INSERT INTO donors_donor VALUES (19, 'Afsar', '', 'Aslam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.469932+00', NULL, NULL, NULL, false, 10);
INSERT INTO donors_donor VALUES (20, 'Afshan', '', 'Zaki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.470894+00', NULL, NULL, NULL, false, 11);
INSERT INTO donors_donor VALUES (21, 'Aftab', '', 'Zaki', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.471872+00', NULL, NULL, NULL, false, 12);
INSERT INTO donors_donor VALUES (22, 'Agha', '', 'Jawad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.474595+00', NULL, NULL, NULL, false, 13);
INSERT INTO donors_donor VALUES (23, 'Ahmad', '', 'na', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.475565+00', NULL, NULL, NULL, false, 14);
INSERT INTO donors_donor VALUES (24, 'Ahmed', '', 'Ali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.476542+00', NULL, NULL, NULL, false, 15);
INSERT INTO donors_donor VALUES (25, 'Ahmed', '', 'Zaheer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.47768+00', NULL, NULL, NULL, false, 16);
INSERT INTO donors_donor VALUES (26, 'Aisha', '', 'Iqbal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.478663+00', NULL, NULL, NULL, false, 17);
INSERT INTO donors_donor VALUES (27, 'Aizaz', '', 'Ali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.479657+00', NULL, NULL, NULL, false, 18);
INSERT INTO donors_donor VALUES (28, 'Aizaz', 'Moeen', 'Qureshi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.480615+00', NULL, NULL, NULL, false, 19);
INSERT INTO donors_donor VALUES (29, 'Akhtar', '', 'Hamid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.481585+00', NULL, NULL, NULL, false, 20);
INSERT INTO donors_donor VALUES (30, 'Akhter', '', 'Riazuddin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.484012+00', NULL, NULL, NULL, false, 21);
INSERT INTO donors_donor VALUES (31, 'Akhter', 'Riaz-ud-Din', 'Trust', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.485219+00', NULL, NULL, NULL, false, 22);
INSERT INTO donors_donor VALUES (32, 'Ali', '', 'Azfar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.486196+00', NULL, NULL, NULL, false, 23);
INSERT INTO donors_donor VALUES (33, 'Ali', 'Nawaz', 'Memon', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.487361+00', NULL, NULL, NULL, false, 24);
INSERT INTO donors_donor VALUES (34, 'Aliya', '', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.488476+00', NULL, NULL, NULL, false, 25);
INSERT INTO donors_donor VALUES (35, 'Ameena', '', 'Batool', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.489422+00', NULL, NULL, NULL, false, 26);
INSERT INTO donors_donor VALUES (36, 'Amin', '', 'Bilal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.490364+00', NULL, NULL, NULL, false, 27);
INSERT INTO donors_donor VALUES (37, 'Amina', '', 'Shah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.49129+00', NULL, NULL, NULL, false, 28);
INSERT INTO donors_donor VALUES (38, 'Aminah', '', 'Zaheer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.492227+00', NULL, NULL, NULL, false, 29);
INSERT INTO donors_donor VALUES (39, 'Amira', '', 'Sheikh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.494745+00', NULL, NULL, NULL, false, 30);
INSERT INTO donors_donor VALUES (40, 'Amjad', 'Ali', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.495744+00', NULL, NULL, NULL, false, 31);
INSERT INTO donors_donor VALUES (41, 'Ammara', '', 'Mahmood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.496711+00', NULL, NULL, NULL, false, 32);
INSERT INTO donors_donor VALUES (42, 'Anne', '', 'Saunders', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.497656+00', NULL, NULL, NULL, false, 33);
INSERT INTO donors_donor VALUES (43, 'Anne', '', 'Woodbridge', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.49859+00', NULL, NULL, NULL, false, 34);
INSERT INTO donors_donor VALUES (44, 'Anonymous', '', 'na', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.499628+00', NULL, NULL, NULL, false, 35);
INSERT INTO donors_donor VALUES (45, 'Anum', '', 'Husain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.500622+00', NULL, NULL, NULL, false, 36);
INSERT INTO donors_donor VALUES (46, 'Aqeela', 'khan', 'zada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.502033+00', NULL, NULL, NULL, false, 37);
INSERT INTO donors_donor VALUES (47, 'Arif', 'wasti', 'UK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.505563+00', NULL, NULL, NULL, false, 38);
INSERT INTO donors_donor VALUES (48, 'Arshad', '', 'Zaheer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.506546+00', NULL, NULL, NULL, false, 39);
INSERT INTO donors_donor VALUES (49, 'Arslan', '', 'Afzal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.507523+00', NULL, NULL, NULL, false, 40);
INSERT INTO donors_donor VALUES (50, 'Asad', 'Ali', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.508553+00', NULL, NULL, NULL, false, 41);
INSERT INTO donors_donor VALUES (51, 'Asad', '', 'sab', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.509561+00', NULL, NULL, NULL, false, 42);
INSERT INTO donors_donor VALUES (52, 'Asadali', '', 'Toor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.510533+00', NULL, NULL, NULL, false, 43);
INSERT INTO donors_donor VALUES (53, 'Ashish', '', 'Bhargava', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.511505+00', NULL, NULL, NULL, false, 44);
INSERT INTO donors_donor VALUES (54, 'Ashraf', '', '(Mr)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.513059+00', NULL, NULL, NULL, false, 45);
INSERT INTO donors_donor VALUES (55, 'Ashraf', '', '(Mrs)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.515184+00', NULL, NULL, NULL, false, 46);
INSERT INTO donors_donor VALUES (56, 'Asim', '', 'Chinoy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.516271+00', NULL, NULL, NULL, false, 47);
INSERT INTO donors_donor VALUES (57, 'Aslam', '', 'Hayat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.517232+00', NULL, NULL, NULL, false, 48);
INSERT INTO donors_donor VALUES (58, 'Athar', 'Imran', 'Nawaz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.51817+00', NULL, NULL, NULL, false, 49);
INSERT INTO donors_donor VALUES (59, 'Atif', '', 'Asghar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.519125+00', NULL, NULL, NULL, false, 50);
INSERT INTO donors_donor VALUES (60, 'Atif', '', 'Qazi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.520052+00', NULL, NULL, NULL, false, 51);
INSERT INTO donors_donor VALUES (61, 'Awab', '', 'Ali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.521041+00', NULL, NULL, NULL, false, 52);
INSERT INTO donors_donor VALUES (62, 'Ayesha', '', 'na', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.521985+00', NULL, NULL, NULL, false, 53);
INSERT INTO donors_donor VALUES (63, 'Ayesha', 'Saeed', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.524211+00', NULL, NULL, NULL, false, 54);
INSERT INTO donors_donor VALUES (64, 'Ayesha', '', 'Salaam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.525326+00', NULL, NULL, NULL, false, 55);
INSERT INTO donors_donor VALUES (65, 'Ayesha', '', 'Shamshad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.526254+00', NULL, NULL, NULL, false, 56);
INSERT INTO donors_donor VALUES (66, 'Ayesha', '', 'Zaheer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.527367+00', NULL, NULL, NULL, false, 57);
INSERT INTO donors_donor VALUES (67, 'Ayla', 'Changzeb', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.528317+00', NULL, NULL, NULL, false, 58);
INSERT INTO donors_donor VALUES (68, 'Azra', '', 'Arshad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.529429+00', NULL, NULL, NULL, false, 59);
INSERT INTO donors_donor VALUES (69, 'Bank', '', 'Profit', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.53038+00', NULL, NULL, NULL, false, 60);
INSERT INTO donors_donor VALUES (70, 'Barclays', '', 'Grant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.53131+00', NULL, NULL, NULL, false, 61);
INSERT INTO donors_donor VALUES (71, 'Basrani', '', 'na', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.532236+00', NULL, NULL, NULL, false, 62);
INSERT INTO donors_donor VALUES (72, 'Beverly', '', 'Yapp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.53427+00', NULL, NULL, NULL, false, 63);
INSERT INTO donors_donor VALUES (73, 'Brand', '', 'Pakistan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.53523+00', NULL, NULL, NULL, false, 64);
INSERT INTO donors_donor VALUES (74, 'BSV', 'Medical', 'Pvt Limited', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.536181+00', NULL, NULL, NULL, false, 65);
INSERT INTO donors_donor VALUES (75, 'Bushra', '', 'Jahfar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.537286+00', NULL, NULL, NULL, false, 66);
INSERT INTO donors_donor VALUES (76, 'Dania', '', 'Gharaibeh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.538214+00', NULL, NULL, NULL, false, 67);
INSERT INTO donors_donor VALUES (77, 'Danyal', '', 'Rehman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.53918+00', NULL, NULL, NULL, false, 68);
INSERT INTO donors_donor VALUES (78, 'Deutsche', '', 'Bank', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.540198+00', NULL, NULL, NULL, false, 69);
INSERT INTO donors_donor VALUES (79, 'Dil', '', 'waly', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.541347+00', NULL, NULL, NULL, false, 70);
INSERT INTO donors_donor VALUES (80, 'Donation', '', 'Box', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.542317+00', NULL, NULL, NULL, false, 71);
INSERT INTO donors_donor VALUES (81, 'Donation', 'recovrable', 'from wajahat sb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.544657+00', NULL, NULL, NULL, false, 72);
INSERT INTO donors_donor VALUES (82, 'Engro', '', 'Chemical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.545638+00', NULL, NULL, NULL, false, 73);
INSERT INTO donors_donor VALUES (83, 'Erum', '', 'Maqsood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.54663+00', NULL, NULL, NULL, false, 74);
INSERT INTO donors_donor VALUES (84, 'Espen', 'Brettas', 'Dahle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.547886+00', NULL, NULL, NULL, false, 75);
INSERT INTO donors_donor VALUES (85, 'Faisal', '', 'Amin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.548911+00', NULL, NULL, NULL, false, 76);
INSERT INTO donors_donor VALUES (86, 'Faisal', '', 'Chaudhry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.549935+00', NULL, NULL, NULL, false, 77);
INSERT INTO donors_donor VALUES (87, 'Faisal', '', 'Khalid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.551076+00', NULL, NULL, NULL, false, 78);
INSERT INTO donors_donor VALUES (88, 'Faiza', '', 'Zaheer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.552223+00', NULL, NULL, NULL, false, 79);
INSERT INTO donors_donor VALUES (89, 'Faizan', '', 'Syed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.554635+00', NULL, NULL, NULL, false, 80);
INSERT INTO donors_donor VALUES (90, 'Faraz', '', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.555638+00', NULL, NULL, NULL, false, 81);
INSERT INTO donors_donor VALUES (91, 'Faraz', '', 'Shahid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.556883+00', NULL, NULL, NULL, false, 82);
INSERT INTO donors_donor VALUES (92, 'Fareeda', 'Iqbal', 'Qureshi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.557907+00', NULL, NULL, NULL, false, 83);
INSERT INTO donors_donor VALUES (93, 'Farhat', 'Bajwa', 'Warraich', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.558933+00', NULL, NULL, NULL, false, 84);
INSERT INTO donors_donor VALUES (94, 'Farhat', '', 'Hussain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.559928+00', NULL, NULL, NULL, false, 85);
INSERT INTO donors_donor VALUES (95, 'Farhat', '', 'Rashid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.560913+00', NULL, NULL, NULL, false, 86);
INSERT INTO donors_donor VALUES (96, 'Farida', '', 'Dossani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.562093+00', NULL, NULL, NULL, false, 87);
INSERT INTO donors_donor VALUES (97, 'Farooq', '', 'Cheema', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.564743+00', NULL, NULL, NULL, false, 88);
INSERT INTO donors_donor VALUES (98, 'Farrukh', '', 'Iqbal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.565712+00', NULL, NULL, NULL, false, 89);
INSERT INTO donors_donor VALUES (99, 'Farukh', '', 'Hashmi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.566661+00', NULL, NULL, NULL, false, 90);
INSERT INTO donors_donor VALUES (100, 'Farzana', '', 'Hasan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.567754+00', NULL, NULL, NULL, false, 91);
INSERT INTO donors_donor VALUES (101, 'Farzana', '', 'Qazi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.568758+00', NULL, NULL, NULL, false, 92);
INSERT INTO donors_donor VALUES (102, 'Farzana', '', 'Shahid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.569767+00', NULL, NULL, NULL, false, 93);
INSERT INTO donors_donor VALUES (103, 'Fatima', '', 'Shah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.570868+00', NULL, NULL, NULL, false, 94);
INSERT INTO donors_donor VALUES (104, 'Fauzia', '', 'Rashid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.57183+00', NULL, NULL, NULL, false, 95);
INSERT INTO donors_donor VALUES (105, 'Fauzia', '', 'Zaheer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.574129+00', NULL, NULL, NULL, false, 96);
INSERT INTO donors_donor VALUES (106, 'Fozia', '', 'Owais', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.575112+00', NULL, NULL, NULL, false, 97);
INSERT INTO donors_donor VALUES (107, 'Ghazanfar', '', 'Mansoor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.576084+00', NULL, NULL, NULL, false, 98);
INSERT INTO donors_donor VALUES (108, 'Ghulam', 'Farooq', 'Rehmani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.57705+00', NULL, NULL, NULL, false, 99);
INSERT INTO donors_donor VALUES (109, 'Green', '', 'volunteers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.578001+00', NULL, NULL, NULL, false, 100);
INSERT INTO donors_donor VALUES (110, 'Hajira', '', 'Junaid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.579248+00', NULL, NULL, NULL, false, 101);
INSERT INTO donors_donor VALUES (111, 'Haleemah', '', 'Qureshi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.580195+00', NULL, NULL, NULL, false, 102);
INSERT INTO donors_donor VALUES (112, 'Hameeda', '', 'Mirza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.581132+00', NULL, NULL, NULL, false, 103);
INSERT INTO donors_donor VALUES (113, 'Hammad', '', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.582146+00', NULL, NULL, NULL, false, 104);
INSERT INTO donors_donor VALUES (114, 'Hasnain', '', 'Abubakr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.584595+00', NULL, NULL, NULL, false, 105);
INSERT INTO donors_donor VALUES (115, 'Hassan', '', 'Zaidi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.585708+00', NULL, NULL, NULL, false, 106);
INSERT INTO donors_donor VALUES (116, 'Hena', '', 'Tayyab', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.586695+00', NULL, NULL, NULL, false, 107);
INSERT INTO donors_donor VALUES (117, 'Hira', '', 'Masood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.587656+00', NULL, NULL, NULL, false, 108);
INSERT INTO donors_donor VALUES (118, 'Homayon', '', 'Sidiq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.588584+00', NULL, NULL, NULL, false, 109);
INSERT INTO donors_donor VALUES (119, 'Husain', 'Mehdi', 'Kazmi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.589782+00', NULL, NULL, NULL, false, 110);
INSERT INTO donors_donor VALUES (120, 'Iffi', 'Khalid', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.590753+00', NULL, NULL, NULL, false, 111);
INSERT INTO donors_donor VALUES (121, 'Iftekhar', 'Car', 'Installments', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.59188+00', NULL, NULL, NULL, false, 112);
INSERT INTO donors_donor VALUES (122, 'Ijaz', '', 'Basrahi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.5943+00', NULL, NULL, NULL, false, 113);
INSERT INTO donors_donor VALUES (123, 'Imran', '', 'Khalid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.595249+00', NULL, NULL, NULL, false, 114);
INSERT INTO donors_donor VALUES (124, 'Imran', '', 'Saeed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.596194+00', NULL, NULL, NULL, false, 115);
INSERT INTO donors_donor VALUES (125, 'Imtiaz', 'Hizkil', '& Naushina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.597123+00', NULL, NULL, NULL, false, 116);
INSERT INTO donors_donor VALUES (126, 'Insha', '', 'Zaheer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.598046+00', NULL, NULL, NULL, false, 117);
INSERT INTO donors_donor VALUES (127, 'Intermed', '', 'Onlus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.599015+00', NULL, NULL, NULL, false, 118);
INSERT INTO donors_donor VALUES (128, 'Invest', '', '2 Innovate', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.599954+00', NULL, NULL, NULL, false, 119);
INSERT INTO donors_donor VALUES (129, 'Irum', '', 'Bukhari', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.600896+00', NULL, NULL, NULL, false, 120);
INSERT INTO donors_donor VALUES (130, 'Izhar', '', 'Construction', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.601901+00', NULL, NULL, NULL, false, 121);
INSERT INTO donors_donor VALUES (131, 'Jameela', '', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.603789+00', NULL, NULL, NULL, false, 122);
INSERT INTO donors_donor VALUES (132, 'Janet', '', 'Lowenthal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.604742+00', NULL, NULL, NULL, false, 123);
INSERT INTO donors_donor VALUES (133, 'Javed', '', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.605738+00', NULL, NULL, NULL, false, 124);
INSERT INTO donors_donor VALUES (134, 'Javed', '', 'Mushtaq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.606733+00', NULL, NULL, NULL, false, 125);
INSERT INTO donors_donor VALUES (135, 'Jehan', '', 'Ara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.607706+00', NULL, NULL, NULL, false, 126);
INSERT INTO donors_donor VALUES (136, 'Jehangir', '', 'Shah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.608925+00', NULL, NULL, NULL, false, 127);
INSERT INTO donors_donor VALUES (137, 'Julianne', '', 'Huh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.609882+00', NULL, NULL, NULL, false, 128);
INSERT INTO donors_donor VALUES (139, 'Junaid', '', 'Khawaja', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.611805+00', NULL, NULL, NULL, false, 130);
INSERT INTO donors_donor VALUES (140, 'Junaid', '', 'Qazi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.613314+00', NULL, NULL, NULL, false, 131);
INSERT INTO donors_donor VALUES (141, 'K.M.', '', 'Ikramullah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.614347+00', NULL, NULL, NULL, false, 132);
INSERT INTO donors_donor VALUES (142, 'Kaghan', 'Memorial', 'Trust', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.61553+00', NULL, NULL, NULL, false, 133);
INSERT INTO donors_donor VALUES (143, 'Kaiser', '', 'Naseem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.616535+00', NULL, NULL, NULL, false, 134);
INSERT INTO donors_donor VALUES (144, 'Kamran', '', 'Liaqat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.617524+00', NULL, NULL, NULL, false, 135);
INSERT INTO donors_donor VALUES (145, 'Kanvas', '', 'Productions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.618532+00', NULL, NULL, NULL, false, 136);
INSERT INTO donors_donor VALUES (146, 'Kavita', '', 'na', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.619538+00', NULL, NULL, NULL, false, 137);
INSERT INTO donors_donor VALUES (147, 'Kazi', 'Zulkadar', 'Siddiqui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.620539+00', NULL, NULL, NULL, false, 138);
INSERT INTO donors_donor VALUES (148, 'Kehkeshan', '', 'Naseem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.621545+00', NULL, NULL, NULL, false, 139);
INSERT INTO donors_donor VALUES (149, 'Khadija', '', 'Siddiqui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.623117+00', NULL, NULL, NULL, false, 140);
INSERT INTO donors_donor VALUES (150, 'Khaldunia', 'high', 'school', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.624076+00', NULL, NULL, NULL, false, 141);
INSERT INTO donors_donor VALUES (151, 'Khalid', '', 'Aslam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.625379+00', NULL, NULL, NULL, false, 142);
INSERT INTO donors_donor VALUES (152, 'Khalida', '', 'Salimi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.62634+00', NULL, NULL, NULL, false, 143);
INSERT INTO donors_donor VALUES (153, 'Khalida', 'Samar', 'Mubarik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.627293+00', NULL, NULL, NULL, false, 144);
INSERT INTO donors_donor VALUES (154, 'Kiran', 'Omar', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.628291+00', NULL, NULL, NULL, false, 145);
INSERT INTO donors_donor VALUES (155, 'Kulsoon', '', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.629283+00', NULL, NULL, NULL, false, 146);
INSERT INTO donors_donor VALUES (156, 'Lahore', 'Grammer', 'School', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.630431+00', NULL, NULL, NULL, false, 147);
INSERT INTO donors_donor VALUES (157, 'Larry', '', 'Smucker', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.631368+00', NULL, NULL, NULL, false, 148);
INSERT INTO donors_donor VALUES (158, 'Leslie', '', 'na', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.632292+00', NULL, NULL, NULL, false, 149);
INSERT INTO donors_donor VALUES (159, 'Loan', 'Return', 'from Teacher', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.634158+00', NULL, NULL, NULL, false, 150);
INSERT INTO donors_donor VALUES (160, 'Lubna', '', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.635111+00', NULL, NULL, NULL, false, 151);
INSERT INTO donors_donor VALUES (161, 'M.', 'Abu', 'Bakr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.636034+00', NULL, NULL, NULL, false, 152);
INSERT INTO donors_donor VALUES (162, 'Madeeha', '', 'Hamid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.637138+00', NULL, NULL, NULL, false, 153);
INSERT INTO donors_donor VALUES (163, 'Madiha', '', 'Ansari', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.63822+00', NULL, NULL, NULL, false, 154);
INSERT INTO donors_donor VALUES (164, 'Madiha', '', 'Farhan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.639201+00', NULL, NULL, NULL, false, 155);
INSERT INTO donors_donor VALUES (165, 'Madiha', '', 'Fayyaz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.640537+00', NULL, NULL, NULL, false, 156);
INSERT INTO donors_donor VALUES (166, 'Madiha', '', 'Syed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.641515+00', NULL, NULL, NULL, false, 157);
INSERT INTO donors_donor VALUES (167, 'Maheen', '', 'na', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.643872+00', NULL, NULL, NULL, false, 158);
INSERT INTO donors_donor VALUES (168, 'Mahjabeen', '', 'Mirza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.644838+00', NULL, NULL, NULL, false, 159);
INSERT INTO donors_donor VALUES (169, 'Mahnaz', '', 'Ahmad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.645993+00', NULL, NULL, NULL, false, 160);
INSERT INTO donors_donor VALUES (170, 'Maira', 'Abbasi', 'Azmat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.647126+00', NULL, NULL, NULL, false, 161);
INSERT INTO donors_donor VALUES (171, 'Mairaj', '', 'Syed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.648072+00', NULL, NULL, NULL, false, 162);
INSERT INTO donors_donor VALUES (172, 'Majida', '', 'Rizvi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.64919+00', NULL, NULL, NULL, false, 163);
INSERT INTO donors_donor VALUES (173, 'Malaika', '', 'Burney', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.65014+00', NULL, NULL, NULL, false, 164);
INSERT INTO donors_donor VALUES (174, 'Mansoor', 'Ahmed', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.651104+00', NULL, NULL, NULL, false, 165);
INSERT INTO donors_donor VALUES (175, 'Mansoor', 'Habib', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.65205+00', NULL, NULL, NULL, false, 166);
INSERT INTO donors_donor VALUES (176, 'Mark', '', 'Stiles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.654725+00', NULL, NULL, NULL, false, 167);
INSERT INTO donors_donor VALUES (177, 'Masooma', 'Ejaz', 'Nabi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.655706+00', NULL, NULL, NULL, false, 168);
INSERT INTO donors_donor VALUES (178, 'Mehar', '', 'Patel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.656674+00', NULL, NULL, NULL, false, 169);
INSERT INTO donors_donor VALUES (179, 'Michael', 'Patrick', 'Foley', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.65762+00', NULL, NULL, NULL, false, 170);
INSERT INTO donors_donor VALUES (180, 'Minha', '', 'Kauser', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.658576+00', NULL, NULL, NULL, false, 171);
INSERT INTO donors_donor VALUES (181, 'Mobilink', '', 'na', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.65954+00', NULL, NULL, NULL, false, 172);
INSERT INTO donors_donor VALUES (182, 'Mohammad', 'Ali', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.660544+00', NULL, NULL, NULL, false, 173);
INSERT INTO donors_donor VALUES (183, 'Mohammad', '', 'Bilal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.661566+00', NULL, NULL, NULL, false, 174);
INSERT INTO donors_donor VALUES (184, 'Mohammad', '', 'Salman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.663877+00', NULL, NULL, NULL, false, 175);
INSERT INTO donors_donor VALUES (185, 'Moin', '', 'Karim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.664853+00', NULL, NULL, NULL, false, 176);
INSERT INTO donors_donor VALUES (186, 'Momina', 'Salim', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.665851+00', NULL, NULL, NULL, false, 177);
INSERT INTO donors_donor VALUES (187, 'Moonis', '', 'Bilal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.666829+00', NULL, NULL, NULL, false, 178);
INSERT INTO donors_donor VALUES (188, 'Mubarik', 'Ali', 'begum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.667776+00', NULL, NULL, NULL, false, 179);
INSERT INTO donors_donor VALUES (189, 'Muhammad', '', 'Sajjd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.668748+00', NULL, NULL, NULL, false, 180);
INSERT INTO donors_donor VALUES (190, 'Mumtaz', '', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.669724+00', NULL, NULL, NULL, false, 181);
INSERT INTO donors_donor VALUES (191, 'Muneera', '', 'Javed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.670668+00', NULL, NULL, NULL, false, 182);
INSERT INTO donors_donor VALUES (192, 'Munira', '', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.671623+00', NULL, NULL, NULL, false, 183);
INSERT INTO donors_donor VALUES (193, 'Murad', '', 'Jamil', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.673475+00', NULL, NULL, NULL, false, 184);
INSERT INTO donors_donor VALUES (194, 'Murtaza', '', 'Ali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.674644+00', NULL, NULL, NULL, false, 185);
INSERT INTO donors_donor VALUES (195, 'Musarat', '', 'Usmani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.675676+00', NULL, NULL, NULL, false, 186);
INSERT INTO donors_donor VALUES (196, 'Nabeela', '', 'Nazir', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.676643+00', NULL, NULL, NULL, false, 187);
INSERT INTO donors_donor VALUES (197, 'Nadia', '', 'Wajahat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.677917+00', NULL, NULL, NULL, false, 188);
INSERT INTO donors_donor VALUES (198, 'Naeem', '', 'Siddqui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.678934+00', NULL, NULL, NULL, false, 189);
INSERT INTO donors_donor VALUES (199, 'Naghmana', '', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.679884+00', NULL, NULL, NULL, false, 190);
INSERT INTO donors_donor VALUES (200, 'Naheed', '', 'Akhlaq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.680835+00', NULL, NULL, NULL, false, 191);
INSERT INTO donors_donor VALUES (201, 'Naheed', '', 'Aziz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.681818+00', NULL, NULL, NULL, false, 192);
INSERT INTO donors_donor VALUES (202, 'Najia', '', 'Hyder', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.683318+00', NULL, NULL, NULL, false, 193);
INSERT INTO donors_donor VALUES (203, 'Naseer', '', 'Rana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.684519+00', NULL, NULL, NULL, false, 194);
INSERT INTO donors_donor VALUES (204, 'Nasreen', '', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.685515+00', NULL, NULL, NULL, false, 195);
INSERT INTO donors_donor VALUES (205, 'Nauman', '', 'Khalid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.686469+00', NULL, NULL, NULL, false, 196);
INSERT INTO donors_donor VALUES (206, 'Nauman', '', 'Mahmood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.687423+00', NULL, NULL, NULL, false, 197);
INSERT INTO donors_donor VALUES (207, 'Naurina', '', 'na', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.688358+00', NULL, NULL, NULL, false, 198);
INSERT INTO donors_donor VALUES (208, 'Navaid', '', 'Qureshi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.689295+00', NULL, NULL, NULL, false, 199);
INSERT INTO donors_donor VALUES (209, 'Naveen', '', 'Haq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.69031+00', NULL, NULL, NULL, false, 200);
INSERT INTO donors_donor VALUES (210, 'Naveen', 'Iqtidar', 'Hussain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.691735+00', NULL, NULL, NULL, false, 201);
INSERT INTO donors_donor VALUES (211, 'Nawan', '', 'Butt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.692927+00', NULL, NULL, NULL, false, 202);
INSERT INTO donors_donor VALUES (212, 'Nayyar', '', 'Husain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.695218+00', NULL, NULL, NULL, false, 203);
INSERT INTO donors_donor VALUES (213, 'Nazli', '', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.696398+00', NULL, NULL, NULL, false, 204);
INSERT INTO donors_donor VALUES (214, 'Neelofar', '', 'Malik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.697424+00', NULL, NULL, NULL, false, 205);
INSERT INTO donors_donor VALUES (215, 'Nehdia', 'Sameen', 'Memorial Trust', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.698468+00', NULL, NULL, NULL, false, 206);
INSERT INTO donors_donor VALUES (216, 'Nida', '', 'Zohaib', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.699558+00', NULL, NULL, NULL, false, 207);
INSERT INTO donors_donor VALUES (217, 'Nigar', '', 'Hussain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.70053+00', NULL, NULL, NULL, false, 208);
INSERT INTO donors_donor VALUES (218, 'Nighat', '', 'Saeed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.701522+00', NULL, NULL, NULL, false, 209);
INSERT INTO donors_donor VALUES (219, 'Numan', '', 'Afridi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.703794+00', NULL, NULL, NULL, false, 210);
INSERT INTO donors_donor VALUES (220, 'Nusrat', '', 'Kitchlu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.704778+00', NULL, NULL, NULL, false, 211);
INSERT INTO donors_donor VALUES (221, 'Nusrat', '', 'Sufi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.705895+00', NULL, NULL, NULL, false, 212);
INSERT INTO donors_donor VALUES (222, 'Nuzhat', '', 'Sadiq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.706851+00', NULL, NULL, NULL, false, 213);
INSERT INTO donors_donor VALUES (223, 'Omer', '', 'Jamil', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.707995+00', NULL, NULL, NULL, false, 214);
INSERT INTO donors_donor VALUES (224, 'P.B.', '', 'Ajaib', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.708925+00', NULL, NULL, NULL, false, 215);
INSERT INTO donors_donor VALUES (225, 'Parveen', '', 'Haq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.709865+00', NULL, NULL, NULL, false, 216);
INSERT INTO donors_donor VALUES (226, 'Parveen', '', 'Hassan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.710829+00', NULL, NULL, NULL, false, 217);
INSERT INTO donors_donor VALUES (227, 'Parveen', '', 'Sadiq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.711758+00', NULL, NULL, NULL, false, 218);
INSERT INTO donors_donor VALUES (228, 'Patricia', '', 'Histed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.713853+00', NULL, NULL, NULL, false, 219);
INSERT INTO donors_donor VALUES (229, 'Project', '', 'Taleem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.71489+00', NULL, NULL, NULL, false, 220);
INSERT INTO donors_donor VALUES (230, 'Qasim', '', 'Mueen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.715851+00', NULL, NULL, NULL, false, 221);
INSERT INTO donors_donor VALUES (231, 'Qazi', 'Azmat', 'Isa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.716912+00', NULL, NULL, NULL, false, 222);
INSERT INTO donors_donor VALUES (232, 'Qazi', 'Zulfiqar', 'Siddiqui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.717895+00', NULL, NULL, NULL, false, 223);
INSERT INTO donors_donor VALUES (233, 'Qudsia', '', 'Najeeb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.718876+00', NULL, NULL, NULL, false, 224);
INSERT INTO donors_donor VALUES (234, 'Qudsia', 'Saeed', 'ullah Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.719828+00', NULL, NULL, NULL, false, 225);
INSERT INTO donors_donor VALUES (235, 'Quratulain', '', 'Rizwi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.720771+00', NULL, NULL, NULL, false, 226);
INSERT INTO donors_donor VALUES (236, 'Rabia', '', 'Pasha', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.721714+00', NULL, NULL, NULL, false, 227);
INSERT INTO donors_donor VALUES (237, 'Raffat', '', 'Zaheer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.723712+00', NULL, NULL, NULL, false, 228);
INSERT INTO donors_donor VALUES (238, 'Rahat', '', 'Qureshi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.724685+00', NULL, NULL, NULL, false, 229);
INSERT INTO donors_donor VALUES (239, 'Raheel', '', 'Raza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.725801+00', NULL, NULL, NULL, false, 230);
INSERT INTO donors_donor VALUES (240, 'Raja', 'Rehan', 'Arshad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.726867+00', NULL, NULL, NULL, false, 231);
INSERT INTO donors_donor VALUES (241, 'Raja', '', 'Zubair', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.727818+00', NULL, NULL, NULL, false, 232);
INSERT INTO donors_donor VALUES (242, 'Rani', '', 'Nasar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.728748+00', NULL, NULL, NULL, false, 233);
INSERT INTO donors_donor VALUES (243, 'Ratiba', '', 'Cerif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.729684+00', NULL, NULL, NULL, false, 234);
INSERT INTO donors_donor VALUES (244, 'Reema', '', 'Hussain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.730646+00', NULL, NULL, NULL, false, 235);
INSERT INTO donors_donor VALUES (245, 'Reza', 'Hyder', 'Bokhary', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.731601+00', NULL, NULL, NULL, false, 236);
INSERT INTO donors_donor VALUES (246, 'Rhonda', 'Gossen', 'Ehsani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.7337+00', NULL, NULL, NULL, false, 237);
INSERT INTO donors_donor VALUES (247, 'Rizwan', 'Irfan', 'Butt', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.734675+00', NULL, NULL, NULL, false, 238);
INSERT INTO donors_donor VALUES (248, 'Rizwan', '', 'Khalid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.735617+00', NULL, NULL, NULL, false, 239);
INSERT INTO donors_donor VALUES (249, 'Roohi', '', 'Abdullah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.736572+00', NULL, NULL, NULL, false, 240);
INSERT INTO donors_donor VALUES (250, 'Roohi', '', 'Husain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.737511+00', NULL, NULL, NULL, false, 241);
INSERT INTO donors_donor VALUES (251, 'Roohi', '', 'Kamal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.738486+00', NULL, NULL, NULL, false, 242);
INSERT INTO donors_donor VALUES (252, 'Roshan', '', 'Iqbal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.739434+00', NULL, NULL, NULL, false, 243);
INSERT INTO donors_donor VALUES (253, 'Rotary', '', 'Canada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.74038+00', NULL, NULL, NULL, false, 244);
INSERT INTO donors_donor VALUES (254, 'Rubina', '', 'Khilji', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.741327+00', NULL, NULL, NULL, false, 245);
INSERT INTO donors_donor VALUES (255, 'Rukhsana', '', 'Aziz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.742258+00', NULL, NULL, NULL, false, 246);
INSERT INTO donors_donor VALUES (256, 'S&P', '', 'Global', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.743669+00', NULL, NULL, NULL, false, 247);
INSERT INTO donors_donor VALUES (257, 'S.I.', '', 'Haque', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.744792+00', NULL, NULL, NULL, false, 248);
INSERT INTO donors_donor VALUES (258, 'S.M.', '', 'Anas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.745865+00', NULL, NULL, NULL, false, 249);
INSERT INTO donors_donor VALUES (259, 'Saad', '', 'Mamud', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.746903+00', NULL, NULL, NULL, false, 250);
INSERT INTO donors_donor VALUES (260, 'Saad', '', 'Shamsi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.747892+00', NULL, NULL, NULL, false, 251);
INSERT INTO donors_donor VALUES (261, 'Saba', '', 'Jamaluddin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.748902+00', NULL, NULL, NULL, false, 252);
INSERT INTO donors_donor VALUES (262, 'Sabaa', '', 'Zaheer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.749915+00', NULL, NULL, NULL, false, 253);
INSERT INTO donors_donor VALUES (263, 'Sabiha', '', 'Hasan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.750889+00', NULL, NULL, NULL, false, 254);
INSERT INTO donors_donor VALUES (264, 'Sabira', '', 'Qureshi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.75187+00', NULL, NULL, NULL, false, 255);
INSERT INTO donors_donor VALUES (265, 'Sadiq', '', 'Foundation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.753678+00', NULL, NULL, NULL, false, 256);
INSERT INTO donors_donor VALUES (266, 'Sadiqa', '', 'khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.754854+00', NULL, NULL, NULL, false, 257);
INSERT INTO donors_donor VALUES (267, 'Saeed', '', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.755818+00', NULL, NULL, NULL, false, 258);
INSERT INTO donors_donor VALUES (268, 'Saeed', '', 'Allahwala', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.756763+00', NULL, NULL, NULL, false, 259);
INSERT INTO donors_donor VALUES (269, 'Saeed', '', 'Rana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.757816+00', NULL, NULL, NULL, false, 260);
INSERT INTO donors_donor VALUES (270, 'Saeeda', 'Mahmud', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.758861+00', NULL, NULL, NULL, false, 261);
INSERT INTO donors_donor VALUES (271, 'Safia', '', 'Maqsood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.759819+00', NULL, NULL, NULL, false, 262);
INSERT INTO donors_donor VALUES (272, 'Saima', 'Junaid', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.760916+00', NULL, NULL, NULL, false, 263);
INSERT INTO donors_donor VALUES (273, 'Saira', 'R.', 'Saeed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.761902+00', NULL, NULL, NULL, false, 264);
INSERT INTO donors_donor VALUES (274, 'Sajida', '', 'Abbas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.763853+00', NULL, NULL, NULL, false, 265);
INSERT INTO donors_donor VALUES (275, 'Saleha', '', 'Bilal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.764992+00', NULL, NULL, NULL, false, 266);
INSERT INTO donors_donor VALUES (276, 'Salim', '', 'khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.766103+00', NULL, NULL, NULL, false, 267);
INSERT INTO donors_donor VALUES (277, 'Salma', '', 'Iqbal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.767045+00', NULL, NULL, NULL, false, 268);
INSERT INTO donors_donor VALUES (278, 'Salman', '', 'Burney', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.768006+00', NULL, NULL, NULL, false, 269);
INSERT INTO donors_donor VALUES (279, 'Salman', 'ul', 'haq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.769023+00', NULL, NULL, NULL, false, 270);
INSERT INTO donors_donor VALUES (280, 'Sameen', '', 'Sidique', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.76999+00', NULL, NULL, NULL, false, 271);
INSERT INTO donors_donor VALUES (281, 'Sameena', 'Mukhtar', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.770993+00', NULL, NULL, NULL, false, 272);
INSERT INTO donors_donor VALUES (282, 'Samia', '', 'Fikree', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.771941+00', NULL, NULL, NULL, false, 273);
INSERT INTO donors_donor VALUES (283, 'Samina', '', 'Yunus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.774165+00', NULL, NULL, NULL, false, 274);
INSERT INTO donors_donor VALUES (284, 'Sanaa', '', 'Tariq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.775114+00', NULL, NULL, NULL, false, 275);
INSERT INTO donors_donor VALUES (285, 'Sapphire', '', 'Textile', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.776068+00', NULL, NULL, NULL, false, 276);
INSERT INTO donors_donor VALUES (286, 'Sara', '', 'Haq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.777316+00', NULL, NULL, NULL, false, 277);
INSERT INTO donors_donor VALUES (287, 'Sara', '', 'Kazmi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.778302+00', NULL, NULL, NULL, false, 278);
INSERT INTO donors_donor VALUES (288, 'Sara', '', 'Siddiqui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.779272+00', NULL, NULL, NULL, false, 279);
INSERT INTO donors_donor VALUES (289, 'Sarah', '', 'Zaidi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.780227+00', NULL, NULL, NULL, false, 280);
INSERT INTO donors_donor VALUES (290, 'Sarfraz', '', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.781174+00', NULL, NULL, NULL, false, 281);
INSERT INTO donors_donor VALUES (291, 'Sarwat', '', '(Mrs)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.782294+00', NULL, NULL, NULL, false, 282);
INSERT INTO donors_donor VALUES (292, 'School', 'fee', 'collection', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.785057+00', NULL, NULL, NULL, false, 283);
INSERT INTO donors_donor VALUES (293, 'Seema', '', 'Shabab', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.786016+00', NULL, NULL, NULL, false, 284);
INSERT INTO donors_donor VALUES (294, 'Seeshan', '', 'Suhail', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.787081+00', NULL, NULL, NULL, false, 285);
INSERT INTO donors_donor VALUES (295, 'Shahana', '', 'Shah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.788031+00', NULL, NULL, NULL, false, 286);
INSERT INTO donors_donor VALUES (296, 'Shaheen', '', 'Ali', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.78898+00', NULL, NULL, NULL, false, 287);
INSERT INTO donors_donor VALUES (297, 'Shaheen', '', 'Hussain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.78994+00', NULL, NULL, NULL, false, 288);
INSERT INTO donors_donor VALUES (298, 'Shahid', '', 'Aslam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.790886+00', NULL, NULL, NULL, false, 289);
INSERT INTO donors_donor VALUES (299, 'Shahnaz', '', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.791857+00', NULL, NULL, NULL, false, 290);
INSERT INTO donors_donor VALUES (300, 'Shahnaz', '', 'Arshad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.794748+00', NULL, NULL, NULL, false, 291);
INSERT INTO donors_donor VALUES (301, 'Shahnaz', 'Kapadia', 'Rahat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.795764+00', NULL, NULL, NULL, false, 292);
INSERT INTO donors_donor VALUES (302, 'Shahwar', '', 'Raheem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.797148+00', NULL, NULL, NULL, false, 293);
INSERT INTO donors_donor VALUES (303, 'Shameela', '', 'Rizvi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.798273+00', NULL, NULL, NULL, false, 294);
INSERT INTO donors_donor VALUES (304, 'Shamsa', '', 'Riaz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.799401+00', NULL, NULL, NULL, false, 295);
INSERT INTO donors_donor VALUES (305, 'Shandana', '', 'Saifoor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.800361+00', NULL, NULL, NULL, false, 296);
INSERT INTO donors_donor VALUES (306, 'Shaukat', '', 'Farooq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.801293+00', NULL, NULL, NULL, false, 297);
INSERT INTO donors_donor VALUES (307, 'Shazia', '', 'Khalid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.802251+00', NULL, NULL, NULL, false, 298);
INSERT INTO donors_donor VALUES (308, 'Shazreh', '', 'Hussain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.805074+00', NULL, NULL, NULL, false, 299);
INSERT INTO donors_donor VALUES (309, 'Shehreyar', '', 'Omar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.806366+00', NULL, NULL, NULL, false, 300);
INSERT INTO donors_donor VALUES (310, 'Sheraz', '', 'Javed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.807459+00', NULL, NULL, NULL, false, 301);
INSERT INTO donors_donor VALUES (311, 'Shereen', '', 'Bajwa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.808455+00', NULL, NULL, NULL, false, 302);
INSERT INTO donors_donor VALUES (312, 'Shuja', '', 'Nawaz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.809613+00', NULL, NULL, NULL, false, 303);
INSERT INTO donors_donor VALUES (313, 'Sikandar', '', 'Rahman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.810633+00', NULL, NULL, NULL, false, 304);
INSERT INTO donors_donor VALUES (314, 'Sikandar', 'Raza', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.811809+00', NULL, NULL, NULL, false, 305);
INSERT INTO donors_donor VALUES (315, 'SM', '', 'Anas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.814821+00', NULL, NULL, NULL, false, 306);
INSERT INTO donors_donor VALUES (316, 'SNL', '', 'Employees', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.81592+00', NULL, NULL, NULL, false, 307);
INSERT INTO donors_donor VALUES (317, 'Sohaib', '', 'Sumera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.817104+00', NULL, NULL, NULL, false, 308);
INSERT INTO donors_donor VALUES (318, 'Staff', 'Salary', 'refund', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.818199+00', NULL, NULL, NULL, false, 309);
INSERT INTO donors_donor VALUES (319, 'Students', '', 'all', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.819257+00', NULL, NULL, NULL, false, 310);
INSERT INTO donors_donor VALUES (320, 'Subhani', '', 'Sab', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.82036+00', NULL, NULL, NULL, false, 311);
INSERT INTO donors_donor VALUES (321, 'Sughra', '', 'Sheikh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.821406+00', NULL, NULL, NULL, false, 312);
INSERT INTO donors_donor VALUES (322, 'Surraya', '', 'Khalid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.825593+00', NULL, NULL, NULL, false, 313);
INSERT INTO donors_donor VALUES (323, 'Syed', 'Ali', 'Rashidi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.826712+00', NULL, NULL, NULL, false, 314);
INSERT INTO donors_donor VALUES (324, 'Syed', 'Khalid', 'Reza', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.827968+00', NULL, NULL, NULL, false, 315);
INSERT INTO donors_donor VALUES (325, 'Syed', 'Sarwar', 'Abbas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.829033+00', NULL, NULL, NULL, false, 316);
INSERT INTO donors_donor VALUES (326, 'Tahira', '', 'Abdullah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.829986+00', NULL, NULL, NULL, false, 317);
INSERT INTO donors_donor VALUES (327, 'Tahira', '', 'Azizullah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.830925+00', NULL, NULL, NULL, false, 318);
INSERT INTO donors_donor VALUES (328, 'Tahira', '', 'Salim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.832023+00', NULL, NULL, NULL, false, 319);
INSERT INTO donors_donor VALUES (329, 'Tahira', '', 'Siddique', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.835831+00', NULL, NULL, NULL, false, 320);
INSERT INTO donors_donor VALUES (330, 'Tahire', '', 'Abdullah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.837345+00', NULL, NULL, NULL, false, 321);
INSERT INTO donors_donor VALUES (331, 'Tarim', '', 'Waseem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.838678+00', NULL, NULL, NULL, false, 322);
INSERT INTO donors_donor VALUES (332, 'Tasadduque', '', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.84+00', NULL, NULL, NULL, false, 323);
INSERT INTO donors_donor VALUES (333, 'Tasneem', '', 'Rais', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.841298+00', NULL, NULL, NULL, false, 324);
INSERT INTO donors_donor VALUES (334, 'Taufiq', '', 'Chinoy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.844511+00', NULL, NULL, NULL, false, 325);
INSERT INTO donors_donor VALUES (335, 'Tazeen', '', 'Sayed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.845887+00', NULL, NULL, NULL, false, 326);
INSERT INTO donors_donor VALUES (336, 'Tehreem', '', 'Zaman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.847474+00', NULL, NULL, NULL, false, 327);
INSERT INTO donors_donor VALUES (337, 'Telenor', '', 'Ltd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.848773+00', NULL, NULL, NULL, false, 328);
INSERT INTO donors_donor VALUES (338, 'Umar', '', 'Nadeem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.850307+00', NULL, NULL, NULL, false, 329);
INSERT INTO donors_donor VALUES (339, 'Umbar', '', 'Ansari', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.851747+00', NULL, NULL, NULL, false, 330);
INSERT INTO donors_donor VALUES (340, 'Uzma', '', 'Hasmi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.85439+00', NULL, NULL, NULL, false, 331);
INSERT INTO donors_donor VALUES (341, 'Vaqar', '', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.855898+00', NULL, NULL, NULL, false, 332);
INSERT INTO donors_donor VALUES (342, 'Wajid', '', 'Anwer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.857681+00', NULL, NULL, NULL, false, 333);
INSERT INTO donors_donor VALUES (343, 'Waqar', '', 'Haider', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.859089+00', NULL, NULL, NULL, false, 334);
INSERT INTO donors_donor VALUES (344, 'Windy', '', 'Zhu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.860743+00', NULL, NULL, NULL, false, 335);
INSERT INTO donors_donor VALUES (345, 'Yasmin', '', 'Imam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.862065+00', NULL, NULL, NULL, false, 336);
INSERT INTO donors_donor VALUES (346, 'Yasmin', '', 'Masood', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.865462+00', NULL, NULL, NULL, false, 337);
INSERT INTO donors_donor VALUES (347, 'Yuanda', 'Trading', 'Company', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.866742+00', NULL, NULL, NULL, false, 338);
INSERT INTO donors_donor VALUES (348, 'Zahid', 'Mukhtar', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.868179+00', NULL, NULL, NULL, false, 339);
INSERT INTO donors_donor VALUES (349, 'Zainab and Muhammad', 'and', 'Siddiqui', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.869673+00', NULL, NULL, NULL, false, 340);
INSERT INTO donors_donor VALUES (350, 'Zainab', '', 'Hafeez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.870904+00', NULL, NULL, NULL, false, 341);
INSERT INTO donors_donor VALUES (351, 'Zainab', '', 'Iqbal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.87202+00', NULL, NULL, NULL, false, 342);
INSERT INTO donors_donor VALUES (352, 'Zakir', '', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.875803+00', NULL, NULL, NULL, false, 343);
INSERT INTO donors_donor VALUES (353, 'Zarah', 'Khurshid', 'Khair', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.877435+00', NULL, NULL, NULL, false, 344);
INSERT INTO donors_donor VALUES (354, 'Zeeshan', '', 'Jamal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.878798+00', NULL, NULL, NULL, false, 345);
INSERT INTO donors_donor VALUES (355, 'Zehra', '', 'Aftab', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.880025+00', NULL, NULL, NULL, false, 346);
INSERT INTO donors_donor VALUES (356, 'Zia', '', 'Aljalaly', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.881183+00', NULL, NULL, NULL, false, 347);
INSERT INTO donors_donor VALUES (357, 'Zoaib', 'A', 'Khan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.882307+00', NULL, NULL, NULL, false, 348);
INSERT INTO donors_donor VALUES (358, 'Zoha', '', 'Warraich', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.885478+00', NULL, NULL, NULL, false, 349);
INSERT INTO donors_donor VALUES (359, 'Zohaib', '(Project', 'telecom)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.886858+00', NULL, NULL, NULL, false, 350);
INSERT INTO donors_donor VALUES (360, 'Zohaib', '', 'Yaseen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.887961+00', NULL, NULL, NULL, false, 351);
INSERT INTO donors_donor VALUES (361, 'Zuria', '', 'Batool', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2017-02-06 06:11:14.889128+00', NULL, NULL, NULL, false, 352);
INSERT INTO donors_donor VALUES (365, 'anushay', '', 'someoneikvsdjlfkjdslak', '', '', '', '', '', '', '', '', false, NULL, '2017-02-11 04:52:11.709126+00', NULL, NULL, NULL, false, 3243);
INSERT INTO donors_donor VALUES (138, 'Junaid and Anushay', '', 'Qureshi', '', '', '', '', '', '', '', '', false, NULL, '2017-02-13 00:04:42.328426+00', NULL, NULL, NULL, false, 129);
INSERT INTO donors_donor VALUES (367, 'transfer', NULL, 'amount', '', '', '', '', '', '', '', '', false, NULL, '2017-02-13 02:06:21.120093+00', NULL, NULL, NULL, false, 402390);


--
-- Name: donors_donor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('donors_donor_id_seq', 367, true);


--
-- Data for Name: donors_donor_log; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO donors_donor_log VALUES (2211, '2017-02-12', 'FY17', 'PKR', -150000, 1, -150000, '', 367);
INSERT INTO donors_donor_log VALUES (1109, '2007-06-01', 'FY07', 'PKR', 78570, 1, 78570, '', 292);
INSERT INTO donors_donor_log VALUES (1110, '2007-06-01', 'FY07', 'PKR', 50000, 1, 50000, '', 296);
INSERT INTO donors_donor_log VALUES (1111, '2006-07-01', 'FY07', 'PKR', 1000, 1, 1000, '', 238);
INSERT INTO donors_donor_log VALUES (1112, '2006-07-01', 'FY07', 'PKR', 1000, 1, 1000, '', 167);
INSERT INTO donors_donor_log VALUES (1113, '2006-07-01', 'FY07', 'PKR', 3000, 1, 3000, '', 21);
INSERT INTO donors_donor_log VALUES (1114, '2006-07-01', 'FY07', 'PKR', 5600, 1, 5600, '', 238);
INSERT INTO donors_donor_log VALUES (1115, '2006-07-01', 'FY07', 'PKR', 3000, 1, 3000, '', 21);
INSERT INTO donors_donor_log VALUES (1116, '2006-07-01', 'FY07', 'PKR', 3000, 1, 3000, '', 21);
INSERT INTO donors_donor_log VALUES (1117, '2006-07-01', 'FY07', 'PKR', 5000, 1, 5000, '', 238);
INSERT INTO donors_donor_log VALUES (1118, '2006-07-01', 'FY07', 'PKR', 5000, 1, 5000, '', 238);
INSERT INTO donors_donor_log VALUES (1119, '2006-07-01', 'FY07', 'PKR', 2500, 1, 2500, '', 28);
INSERT INTO donors_donor_log VALUES (1120, '2006-09-01', 'FY07', 'PKR', 5000, 1, 5000, '', 238);
INSERT INTO donors_donor_log VALUES (1121, '2006-08-01', 'FY07', 'PKR', 5000, 1, 5000, '', 263);
INSERT INTO donors_donor_log VALUES (1122, '2006-09-01', 'FY07', 'PKR', 12500, 1, 12500, '', 244);
INSERT INTO donors_donor_log VALUES (1123, '2006-09-01', 'FY07', 'PKR', 12500, 1, 12500, '', 209);
INSERT INTO donors_donor_log VALUES (1124, '2006-09-01', 'FY07', 'PKR', 200000, 1, 200000, '', 334);
INSERT INTO donors_donor_log VALUES (1125, '2006-09-01', 'FY07', 'PKR', 14400, 1, 14400, '', 151);
INSERT INTO donors_donor_log VALUES (1126, '2006-10-01', 'FY07', 'PKR', 5000, 1, 5000, '', 25);
INSERT INTO donors_donor_log VALUES (1127, '2006-10-01', 'FY07', 'PKR', 5000, 1, 5000, '', 28);
INSERT INTO donors_donor_log VALUES (1128, '2006-11-01', 'FY07', 'PKR', 4000, 1, 4000, '', 28);
INSERT INTO donors_donor_log VALUES (1129, '2006-11-01', 'FY07', 'PKR', 1000, 1, 1000, '', 238);
INSERT INTO donors_donor_log VALUES (1130, '2006-10-01', 'FY07', 'PKR', 50000, 1, 50000, '', 285);
INSERT INTO donors_donor_log VALUES (1131, '2006-10-01', 'FY07', 'PKR', 40000, 1, 40000, '', 237);
INSERT INTO donors_donor_log VALUES (1132, '2007-01-01', 'FY07', 'PKR', 4800, 1, 4800, '', 28);
INSERT INTO donors_donor_log VALUES (1133, '2007-01-01', 'FY07', 'PKR', 2000, 1, 2000, '', 21);
INSERT INTO donors_donor_log VALUES (1134, '2007-03-01', 'FY07', 'PKR', 2000, 1, 2000, '', 21);
INSERT INTO donors_donor_log VALUES (1135, '2007-02-01', 'FY07', 'PKR', 4800, 1, 4800, '', 28);
INSERT INTO donors_donor_log VALUES (1136, '2007-03-01', 'FY07', 'PKR', 4800, 1, 4800, '', 28);
INSERT INTO donors_donor_log VALUES (1137, '2007-03-01', 'FY07', 'PKR', 2000, 1, 2000, '', 38);
INSERT INTO donors_donor_log VALUES (1138, '2006-07-01', 'FY07', 'PKR', 180000, 1, 180000, '', 208);
INSERT INTO donors_donor_log VALUES (1139, '2006-09-01', 'FY07', 'PKR', 3500, 1, 3500, '', 159);
INSERT INTO donors_donor_log VALUES (1140, '2006-09-01', 'FY07', 'PKR', 2000, 1, 2000, '', 346);
INSERT INTO donors_donor_log VALUES (1141, '2006-09-01', 'FY07', 'PKR', 10000, 1, 10000, '', 346);
INSERT INTO donors_donor_log VALUES (1142, '2006-10-01', 'FY07', 'PKR', 2000, 1, 2000, '', 346);
INSERT INTO donors_donor_log VALUES (1143, '2006-11-01', 'FY07', 'PKR', 2000, 1, 2000, '', 346);
INSERT INTO donors_donor_log VALUES (1144, '2006-12-01', 'FY07', 'PKR', 2000, 1, 2000, '', 346);
INSERT INTO donors_donor_log VALUES (1145, '2007-01-01', 'FY07', 'PKR', 4000, 1, 4000, '', 346);
INSERT INTO donors_donor_log VALUES (1146, '2007-03-01', 'FY07', 'PKR', 2000, 1, 2000, '', 346);
INSERT INTO donors_donor_log VALUES (1147, '2007-04-01', 'FY07', 'PKR', 2000, 1, 2000, '', 346);
INSERT INTO donors_donor_log VALUES (1148, '2007-05-01', 'FY07', 'PKR', 13000, 1, 13000, '', 346);
INSERT INTO donors_donor_log VALUES (1149, '2007-06-01', 'FY07', 'PKR', 9000, 1, 9000, '', 346);
INSERT INTO donors_donor_log VALUES (1150, '2006-07-01', 'FY07', 'PKR', 11000, 1, 11000, '', 281);
INSERT INTO donors_donor_log VALUES (1151, '2006-07-01', 'FY07', 'PKR', 60300, 1, 60300, '', 133);
INSERT INTO donors_donor_log VALUES (1152, '2006-07-01', 'FY07', 'PKR', 125000, 1, 125000, '', 255);
INSERT INTO donors_donor_log VALUES (1153, '2006-10-01', 'FY07', 'PKR', 31000, 1, 31000, '', 281);
INSERT INTO donors_donor_log VALUES (1154, '2006-10-01', 'FY07', 'PKR', 2000, 1, 2000, '', 304);
INSERT INTO donors_donor_log VALUES (1155, '2006-10-01', 'FY07', 'PKR', 20000, 1, 20000, '', 39);
INSERT INTO donors_donor_log VALUES (1156, '2006-10-01', 'FY07', 'PKR', 50000, 1, 50000, '', 40);
INSERT INTO donors_donor_log VALUES (1157, '2006-10-01', 'FY07', 'PKR', 5000, 1, 5000, '', 172);
INSERT INTO donors_donor_log VALUES (1158, '2006-09-01', 'FY07', 'PKR', 110000, 1, 110000, '', 183);
INSERT INTO donors_donor_log VALUES (1159, '2006-11-01', 'FY07', 'PKR', 5000, 1, 5000, '', 201);
INSERT INTO donors_donor_log VALUES (1160, '2007-03-01', 'FY07', 'PKR', 100000, 1, 100000, '', 183);
INSERT INTO donors_donor_log VALUES (1161, '2007-01-01', 'FY07', 'PKR', 100000, 1, 100000, '', 296);
INSERT INTO donors_donor_log VALUES (1162, '2006-12-01', 'FY07', 'PKR', 4000, 1, 4000, '', 28);
INSERT INTO donors_donor_log VALUES (1163, '2006-10-01', 'FY07', 'PKR', 23000, 1, 23000, '', 82);
INSERT INTO donors_donor_log VALUES (1164, '2007-02-01', 'FY07', 'PKR', 25000, 1, 25000, '', 142);
INSERT INTO donors_donor_log VALUES (1165, '2007-05-01', 'FY07', 'PKR', 5000, 1, 5000, '', 201);
INSERT INTO donors_donor_log VALUES (1166, '2006-10-01', 'FY07', 'PKR', 100000, 1, 100000, '', 207);
INSERT INTO donors_donor_log VALUES (1167, '2007-03-01', 'FY07', 'PKR', 180000, 1, 180000, '', 208);
INSERT INTO donors_donor_log VALUES (1168, '2006-12-01', 'FY07', 'PKR', 1000, 1, 1000, '', 238);
INSERT INTO donors_donor_log VALUES (1169, '2006-09-01', 'FY07', 'PKR', 2500, 1, 2500, '', 257);
INSERT INTO donors_donor_log VALUES (1170, '2007-05-01', 'FY07', 'PKR', 100000, 1, 100000, '', 259);
INSERT INTO donors_donor_log VALUES (1171, '2006-10-01', 'FY07', 'PKR', 108800, 1, 108800, '', 259);
INSERT INTO donors_donor_log VALUES (1172, '2007-01-01', 'FY07', 'PKR', 10850, 1, 10850, '', 264);
INSERT INTO donors_donor_log VALUES (1173, '2007-05-01', 'FY07', 'PKR', 100000, 1, 100000, '', 281);
INSERT INTO donors_donor_log VALUES (1174, '2006-09-01', 'FY07', 'PKR', 15000, 1, 15000, '', 306);
INSERT INTO donors_donor_log VALUES (1175, '2007-02-01', 'FY07', 'PKR', 2000, 1, 2000, '', 346);
INSERT INTO donors_donor_log VALUES (1176, '2006-09-01', 'FY07', 'USD', 150, 59, 8850, '', 138);
INSERT INTO donors_donor_log VALUES (1177, '2006-09-01', 'FY07', 'USD', 250, 59, 14750, '', 261);
INSERT INTO donors_donor_log VALUES (1178, '2006-09-01', 'FY07', 'USD', 100, 59, 5900, '', 324);
INSERT INTO donors_donor_log VALUES (1179, '2006-09-01', 'FY07', 'USD', 200, 59, 11800, '', 176);
INSERT INTO donors_donor_log VALUES (1180, '2006-10-01', 'FY07', 'USD', 500, 59, 29500, '', 66);
INSERT INTO donors_donor_log VALUES (1181, '2006-10-01', 'FY07', 'USD', 200, 59, 11800, '', 289);
INSERT INTO donors_donor_log VALUES (1182, '2006-10-01', 'FY07', 'USD', 160, 59, 9440, '', 208);
INSERT INTO donors_donor_log VALUES (1183, '2006-10-01', 'FY07', 'USD', 100, 59, 5900, '', 333);
INSERT INTO donors_donor_log VALUES (1184, '2006-11-01', 'FY07', 'USD', 500, 59, 29500, '', 203);
INSERT INTO donors_donor_log VALUES (1185, '2006-11-01', 'FY07', 'USD', 500, 59, 29500, '', 119);
INSERT INTO donors_donor_log VALUES (1186, '2006-11-01', 'FY07', 'USD', 48, 59, 2832, '', 24);
INSERT INTO donors_donor_log VALUES (1187, '2007-01-01', 'FY07', 'UKP', 100, 116, 11600, '', 274);
INSERT INTO donors_donor_log VALUES (1188, '2007-01-01', 'FY07', 'UKP', 500, 116, 58000, '', 224);
INSERT INTO donors_donor_log VALUES (1189, '2007-01-01', 'FY07', 'UKP', 600, 116, 69600, '', 99);
INSERT INTO donors_donor_log VALUES (1190, '2007-05-01', 'FY08', 'PKR', 59700, 1, 59700, '', 292);
INSERT INTO donors_donor_log VALUES (1191, '2007-05-01', 'FY08', 'PKR', 41000, 1, 41000, '', 346);
INSERT INTO donors_donor_log VALUES (1192, '2007-05-01', 'FY08', 'PKR', 124810, 1, 124810, '', 153);
INSERT INTO donors_donor_log VALUES (1193, '2007-08-01', 'FY08', 'PKR', 4800, 1, 4800, '', 28);
INSERT INTO donors_donor_log VALUES (1194, '2007-08-01', 'FY08', 'PKR', 4800, 1, 4800, '', 28);
INSERT INTO donors_donor_log VALUES (1195, '2007-08-01', 'FY08', 'PKR', 2000, 1, 2000, '', 21);
INSERT INTO donors_donor_log VALUES (1196, '2007-08-01', 'FY08', 'PKR', 5000, 1, 5000, '', 28);
INSERT INTO donors_donor_log VALUES (1197, '2007-08-01', 'FY08', 'PKR', 4800, 1, 4800, '', 28);
INSERT INTO donors_donor_log VALUES (1198, '2007-08-01', 'FY08', 'PKR', 5000, 1, 5000, '', 28);
INSERT INTO donors_donor_log VALUES (1199, '2007-08-01', 'FY08', 'PKR', 5000, 1, 5000, '', 28);
INSERT INTO donors_donor_log VALUES (1200, '2007-08-01', 'FY08', 'PKR', 2000, 1, 2000, '', 21);
INSERT INTO donors_donor_log VALUES (1201, '2007-08-01', 'FY08', 'PKR', 10000, 1, 10000, '', 168);
INSERT INTO donors_donor_log VALUES (1202, '2007-09-01', 'FY08', 'PKR', 50000, 1, 50000, '', 300);
INSERT INTO donors_donor_log VALUES (1203, '2007-09-01', 'FY08', 'PKR', 10000, 1, 10000, '', 50);
INSERT INTO donors_donor_log VALUES (1204, '2007-09-01', 'FY08', 'PKR', 10000, 1, 10000, '', 62);
INSERT INTO donors_donor_log VALUES (1205, '2007-09-01', 'FY08', 'PKR', 1500, 1, 1500, '', 55);
INSERT INTO donors_donor_log VALUES (1206, '2007-09-01', 'FY08', 'PKR', 15137, 1, 15137, '', 131);
INSERT INTO donors_donor_log VALUES (1207, '2007-09-01', 'FY08', 'PKR', 30275, 1, 30275, '', 190);
INSERT INTO donors_donor_log VALUES (1208, '2007-09-01', 'FY08', 'PKR', 6055, 1, 6055, '', 133);
INSERT INTO donors_donor_log VALUES (1209, '2007-10-01', 'FY08', 'PKR', 50000, 1, 50000, '', 272);
INSERT INTO donors_donor_log VALUES (1210, '2007-10-01', 'FY08', 'PKR', 200000, 1, 200000, '', 208);
INSERT INTO donors_donor_log VALUES (1211, '2007-10-01', 'FY08', 'PKR', 850000, 1, 850000, '', 208);
INSERT INTO donors_donor_log VALUES (1212, '2007-10-01', 'FY08', 'PKR', 100000, 1, 100000, '', 259);
INSERT INTO donors_donor_log VALUES (1213, '2007-08-01', 'FY08', 'PKR', 5000, 1, 5000, '', 28);
INSERT INTO donors_donor_log VALUES (1214, '2007-09-01', 'FY08', 'PKR', 5000, 1, 5000, '', 28);
INSERT INTO donors_donor_log VALUES (1215, '2007-07-01', 'FY08', 'PKR', 2000, 1, 2000, '', 21);
INSERT INTO donors_donor_log VALUES (1216, '2007-08-01', 'FY08', 'PKR', 2000, 1, 2000, '', 21);
INSERT INTO donors_donor_log VALUES (1217, '2007-09-01', 'FY08', 'PKR', 10000, 1, 10000, '', 209);
INSERT INTO donors_donor_log VALUES (1218, '2007-09-01', 'FY08', 'PKR', 10000, 1, 10000, '', 244);
INSERT INTO donors_donor_log VALUES (1219, '2007-10-01', 'FY08', 'PKR', 5000, 1, 5000, '', 28);
INSERT INTO donors_donor_log VALUES (1220, '2007-09-01', 'FY08', 'PKR', 50000, 1, 50000, '', 237);
INSERT INTO donors_donor_log VALUES (1221, '2007-10-01', 'FY08', 'PKR', 200000, 1, 200000, '', 334);
INSERT INTO donors_donor_log VALUES (1222, '2007-10-01', 'FY08', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1223, '2007-10-01', 'FY08', 'PKR', 6000, 1, 6000, '', 201);
INSERT INTO donors_donor_log VALUES (1224, '2007-10-01', 'FY08', 'PKR', 8000, 1, 8000, '', 25);
INSERT INTO donors_donor_log VALUES (1225, '2007-11-01', 'FY08', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1226, '2007-11-01', 'FY08', 'PKR', 5000, 1, 5000, '', 28);
INSERT INTO donors_donor_log VALUES (1227, '2007-11-01', 'FY08', 'PKR', 50000, 1, 50000, '', 40);
INSERT INTO donors_donor_log VALUES (1228, '2007-12-01', 'FY08', 'PKR', 5000, 1, 5000, '', 28);
INSERT INTO donors_donor_log VALUES (1229, '2007-12-01', 'FY08', 'PKR', 20000, 1, 20000, '', 272);
INSERT INTO donors_donor_log VALUES (1230, '2007-12-01', 'FY08', 'PKR', 100000, 1, 100000, '', 183);
INSERT INTO donors_donor_log VALUES (1231, '2008-01-01', 'FY08', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1232, '2008-01-01', 'FY08', 'PKR', 5000, 1, 5000, '', 28);
INSERT INTO donors_donor_log VALUES (1233, '2008-02-01', 'FY08', 'PKR', 2000, 1, 2000, '', 353);
INSERT INTO donors_donor_log VALUES (1234, '2007-12-01', 'FY08', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1235, '2008-02-01', 'FY08', 'PKR', 5000, 1, 5000, '', 28);
INSERT INTO donors_donor_log VALUES (1236, '2008-03-01', 'FY08', 'PKR', 5000, 1, 5000, '', 28);
INSERT INTO donors_donor_log VALUES (1237, '2008-03-01', 'FY08', 'PKR', 3000, 1, 3000, '', 21);
INSERT INTO donors_donor_log VALUES (1238, '2008-04-01', 'FY08', 'PKR', 5000, 1, 5000, '', 28);
INSERT INTO donors_donor_log VALUES (1239, '2008-04-01', 'FY08', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1240, '2008-05-01', 'FY08', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1241, '2008-05-01', 'FY08', 'PKR', 5000, 1, 5000, '', 28);
INSERT INTO donors_donor_log VALUES (1242, '2008-05-01', 'FY08', 'PKR', 696, 1, 696, '', 318);
INSERT INTO donors_donor_log VALUES (1243, '2008-06-01', 'FY08', 'PKR', 9600, 1, 9600, '', 28);
INSERT INTO donors_donor_log VALUES (1244, '2008-06-01', 'FY08', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1245, '2008-06-01', 'FY08', 'PKR', 2000, 1, 2000, '', 174);
INSERT INTO donors_donor_log VALUES (1246, '2007-08-01', 'FY08', 'USD', 6000, 61, 366000, '', 348);
INSERT INTO donors_donor_log VALUES (1247, '2007-08-01', 'FY08', 'USD', 250, 61, 15250, '', 138);
INSERT INTO donors_donor_log VALUES (1248, '2007-08-01', 'FY08', 'USD', 1000, 61, 61000, '', 115);
INSERT INTO donors_donor_log VALUES (1249, '2007-08-01', 'FY08', 'USD', 210, 61, 12810, '', 208);
INSERT INTO donors_donor_log VALUES (1250, '2007-10-01', 'FY08', 'USD', 100, 61, 6100, '', 96);
INSERT INTO donors_donor_log VALUES (1251, '2007-10-01', 'FY08', 'USD', 200, 61, 12200, '', 61);
INSERT INTO donors_donor_log VALUES (1252, '2007-10-01', 'FY08', 'USD', 500, 61, 30500, '', 203);
INSERT INTO donors_donor_log VALUES (1253, '2007-10-01', 'FY08', 'USD', 500, 61, 30500, '', 119);
INSERT INTO donors_donor_log VALUES (1254, '2007-11-01', 'FY08', 'USD', 500, 61, 30500, '', 66);
INSERT INTO donors_donor_log VALUES (1255, '2007-11-01', 'FY08', 'USD', 134, 61, 8174, '', 289);
INSERT INTO donors_donor_log VALUES (1256, '2007-05-01', 'FY08', 'PKR', 67310, 1, 67310, '', 292);
INSERT INTO donors_donor_log VALUES (1257, '2007-05-01', 'FY09', 'PKR', 218700, 1, 218700, '', 153);
INSERT INTO donors_donor_log VALUES (1258, '2008-07-01', 'FY09', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1259, '2008-08-01', 'FY09', 'PKR', 9600, 1, 9600, '', 28);
INSERT INTO donors_donor_log VALUES (1260, '2008-08-01', 'FY09', 'PKR', 30275, 1, 30275, '', 190);
INSERT INTO donors_donor_log VALUES (1261, '2008-08-01', 'FY09', 'PKR', 1500, 1, 1500, '', 54);
INSERT INTO donors_donor_log VALUES (1262, '2008-08-01', 'FY09', 'PKR', 15137, 1, 15137, '', 131);
INSERT INTO donors_donor_log VALUES (1263, '2008-08-01', 'FY09', 'PKR', 6055, 1, 6055, '', 133);
INSERT INTO donors_donor_log VALUES (1264, '2008-09-01', 'FY09', 'PKR', 10000, 1, 10000, '', 349);
INSERT INTO donors_donor_log VALUES (1265, '2008-09-01', 'FY09', 'PKR', 25000, 1, 25000, '', 281);
INSERT INTO donors_donor_log VALUES (1266, '2008-09-01', 'FY09', 'PKR', 250000, 1, 250000, '', 40);
INSERT INTO donors_donor_log VALUES (1267, '2008-09-01', 'FY09', 'PKR', 100000, 1, 100000, '', 259);
INSERT INTO donors_donor_log VALUES (1268, '2008-09-01', 'FY09', 'PKR', 10000, 1, 10000, '', 209);
INSERT INTO donors_donor_log VALUES (1269, '2008-08-01', 'FY09', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1270, '2008-09-01', 'FY09', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1271, '2008-09-01', 'FY09', 'PKR', 14500, 1, 14500, '', 28);
INSERT INTO donors_donor_log VALUES (1272, '2008-09-01', 'FY09', 'PKR', 50000, 1, 50000, '', 237);
INSERT INTO donors_donor_log VALUES (1273, '2008-09-01', 'FY09', 'PKR', 3500, 1, 3500, '', 25);
INSERT INTO donors_donor_log VALUES (1274, '2008-09-01', 'FY09', 'PKR', 100000, 1, 100000, '', 334);
INSERT INTO donors_donor_log VALUES (1275, '2008-09-01', 'FY09', 'PKR', 7000, 1, 7000, '', 221);
INSERT INTO donors_donor_log VALUES (1276, '2008-11-01', 'FY09', 'PKR', 100000, 1, 100000, '', 183);
INSERT INTO donors_donor_log VALUES (1277, '2008-10-01', 'FY09', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1278, '2008-11-01', 'FY09', 'PKR', 14000, 1, 14000, '', 28);
INSERT INTO donors_donor_log VALUES (1279, '2008-11-01', 'FY09', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1280, '2008-12-01', 'FY09', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1281, '2008-12-01', 'FY09', 'PKR', 12400, 1, 12400, '', 28);
INSERT INTO donors_donor_log VALUES (1282, '2009-01-01', 'FY09', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1283, '2009-01-01', 'FY09', 'PKR', 12000, 1, 12000, '', 28);
INSERT INTO donors_donor_log VALUES (1284, '2009-02-01', 'FY09', 'PKR', 11500, 1, 11500, '', 28);
INSERT INTO donors_donor_log VALUES (1285, '2009-03-01', 'FY09', 'PKR', 300000, 1, 300000, '', 208);
INSERT INTO donors_donor_log VALUES (1286, '2009-03-01', 'FY09', 'PKR', 50000, 1, 50000, '', 300);
INSERT INTO donors_donor_log VALUES (1287, '2009-04-01', 'FY09', 'PKR', 12000, 1, 12000, '', 297);
INSERT INTO donors_donor_log VALUES (1288, '2009-04-01', 'FY09', 'PKR', 11500, 1, 11500, '', 28);
INSERT INTO donors_donor_log VALUES (1289, '2009-04-01', 'FY09', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1290, '2009-05-01', 'FY09', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1291, '2009-04-01', 'FY09', 'PKR', 20000, 1, 20000, '', 138);
INSERT INTO donors_donor_log VALUES (1292, '2009-06-01', 'FY09', 'PKR', 25000, 1, 25000, '', 119);
INSERT INTO donors_donor_log VALUES (1293, '2009-05-01', 'FY09', 'PKR', 12000, 1, 12000, '', 28);
INSERT INTO donors_donor_log VALUES (1294, '2009-06-01', 'FY09', 'PKR', 12000, 1, 12000, '', 28);
INSERT INTO donors_donor_log VALUES (1295, '2009-06-01', 'FY09', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1296, '2008-08-01', 'FY09', 'USD', 300, 76, 22800, '', 296);
INSERT INTO donors_donor_log VALUES (1297, '2008-09-01', 'FY09', 'USD', 3000, 76, 228000, '', 208);
INSERT INTO donors_donor_log VALUES (1298, '2008-09-01', 'FY09', 'USD', 100, 76, 7600, '', 43);
INSERT INTO donors_donor_log VALUES (1299, '2008-09-01', 'FY09', 'USD', 100, 76, 7600, '', 333);
INSERT INTO donors_donor_log VALUES (1300, '2008-09-01', 'FY09', 'USD', 250, 76, 19000, '', 176);
INSERT INTO donors_donor_log VALUES (1301, '2008-09-01', 'FY09', 'USD', 150, 76, 11400, '', 96);
INSERT INTO donors_donor_log VALUES (1302, '2008-09-01', 'FY09', 'USD', 50, 76, 3800, '', 286);
INSERT INTO donors_donor_log VALUES (1303, '2008-09-01', 'FY09', 'USD', 500, 76, 38000, '', 203);
INSERT INTO donors_donor_log VALUES (1304, '2008-09-01', 'FY09', 'USD', 100, 76, 7600, '', 202);
INSERT INTO donors_donor_log VALUES (1305, '2008-09-01', 'FY09', 'USD', 200, 76, 15200, '', 303);
INSERT INTO donors_donor_log VALUES (1306, '2008-09-01', 'FY09', 'USD', 115, 76, 8740, '', 102);
INSERT INTO donors_donor_log VALUES (1307, '2008-09-01', 'FY09', 'USD', 250, 76, 19000, '', 289);
INSERT INTO donors_donor_log VALUES (1308, '2008-10-01', 'FY09', 'USD', 500, 76, 38000, '', 119);
INSERT INTO donors_donor_log VALUES (1309, '2008-09-01', 'FY09', 'USD', 200, 76, 15200, '', 201);
INSERT INTO donors_donor_log VALUES (1310, '2008-10-01', 'FY09', 'USD', 100, 76, 7600, '', 33);
INSERT INTO donors_donor_log VALUES (1311, '2008-10-01', 'FY09', 'USD', 100, 76, 7600, '', 185);
INSERT INTO donors_donor_log VALUES (1312, '2008-10-01', 'FY09', 'USD', 100, 76, 7600, '', 108);
INSERT INTO donors_donor_log VALUES (1313, '2008-10-01', 'FY09', 'USD', 100, 76, 7600, '', 258);
INSERT INTO donors_donor_log VALUES (1314, '2008-11-01', 'FY09', 'USD', 200, 76, 15200, '', 264);
INSERT INTO donors_donor_log VALUES (1315, '2008-11-01', 'FY09', 'USD', 1000, 76, 76000, '', 212);
INSERT INTO donors_donor_log VALUES (1316, '2008-11-01', 'FY09', 'USD', 300, 76, 22800, '', 71);
INSERT INTO donors_donor_log VALUES (1317, '2008-11-01', 'FY09', 'USD', 300, 76, 22800, '', 141);
INSERT INTO donors_donor_log VALUES (1318, '2008-12-01', 'FY09', 'USD', 1000, 76, 76000, '', 115);
INSERT INTO donors_donor_log VALUES (1319, '2008-12-01', 'FY09', 'USD', 300, 76, 22800, '', 264);
INSERT INTO donors_donor_log VALUES (1320, '2008-12-01', 'FY09', 'USD', 3765, 76, 286140, '', 208);
INSERT INTO donors_donor_log VALUES (1321, '2009-04-01', 'FY09', 'USD', 50, 76, 3800, '', 228);
INSERT INTO donors_donor_log VALUES (1322, '2009-05-01', 'FY10', 'PKR', 74190, 1, 74190, '', 292);
INSERT INTO donors_donor_log VALUES (1323, '2009-05-01', 'FY10', 'PKR', 247960, 1, 247960, '', 153);
INSERT INTO donors_donor_log VALUES (1324, '2009-07-01', 'FY10', 'PKR', 1500, 1, 1500, '', 233);
INSERT INTO donors_donor_log VALUES (1325, '2009-07-01', 'FY10', 'PKR', 30000, 1, 30000, '', 23);
INSERT INTO donors_donor_log VALUES (1326, '2009-09-01', 'FY10', 'PKR', 1500, 1, 1500, '', 233);
INSERT INTO donors_donor_log VALUES (1327, '2009-07-01', 'FY10', 'PKR', 13500, 1, 13500, '', 28);
INSERT INTO donors_donor_log VALUES (1328, '2009-08-01', 'FY10', 'PKR', 14000, 1, 14000, '', 28);
INSERT INTO donors_donor_log VALUES (1329, '2009-08-01', 'FY10', 'PKR', 6000, 1, 6000, '', 265);
INSERT INTO donors_donor_log VALUES (1330, '2009-07-01', 'FY10', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1331, '2009-08-01', 'FY10', 'PKR', 1500, 1, 1500, '', 21);
INSERT INTO donors_donor_log VALUES (1332, '2009-08-01', 'FY10', 'PKR', 45000, 1, 45000, '', 237);
INSERT INTO donors_donor_log VALUES (1333, '2009-08-01', 'FY10', 'PKR', 100000, 1, 100000, '', 183);
INSERT INTO donors_donor_log VALUES (1334, '2009-08-01', 'FY10', 'PKR', 100000, 1, 100000, '', 322);
INSERT INTO donors_donor_log VALUES (1335, '2009-08-01', 'FY10', 'PKR', 250000, 1, 250000, '', 40);
INSERT INTO donors_donor_log VALUES (1336, '2009-08-01', 'FY10', 'PKR', 100000, 1, 100000, '', 248);
INSERT INTO donors_donor_log VALUES (1337, '2009-08-01', 'FY10', 'PKR', 20000, 1, 20000, '', 281);
INSERT INTO donors_donor_log VALUES (1338, '2009-09-01', 'FY10', 'PKR', 7000, 1, 7000, '', 242);
INSERT INTO donors_donor_log VALUES (1339, '2009-09-01', 'FY10', 'PKR', 10000, 1, 10000, '', 147);
INSERT INTO donors_donor_log VALUES (1340, '2009-09-01', 'FY10', 'PKR', 300000, 1, 300000, '', 208);
INSERT INTO donors_donor_log VALUES (1341, '2009-09-01', 'FY10', 'PKR', 8000, 1, 8000, '', 227);
INSERT INTO donors_donor_log VALUES (1342, '2009-09-01', 'FY10', 'PKR', 10000, 1, 10000, '', 88);
INSERT INTO donors_donor_log VALUES (1343, '2009-09-01', 'FY10', 'PKR', 3000, 1, 3000, '', 21);
INSERT INTO donors_donor_log VALUES (1344, '2009-09-01', 'FY10', 'PKR', 1500, 1, 1500, '', 233);
INSERT INTO donors_donor_log VALUES (1345, '2009-09-01', 'FY10', 'PKR', 50000, 1, 50000, '', 272);
INSERT INTO donors_donor_log VALUES (1346, '2009-09-01', 'FY10', 'PKR', 100000, 1, 100000, '', 259);
INSERT INTO donors_donor_log VALUES (1347, '2009-10-01', 'FY10', 'PKR', 1500, 1, 1500, '', 233);
INSERT INTO donors_donor_log VALUES (1348, '2009-10-01', 'FY10', 'PKR', 10000, 1, 10000, 'received thru Tahira. Najeeb to confirm', 288);
INSERT INTO donors_donor_log VALUES (1349, '2009-10-01', 'FY10', 'PKR', 7000, 1, 7000, 'received thru Tahira. Najeeb to confirm', 349);
INSERT INTO donors_donor_log VALUES (1350, '2009-11-01', 'FY10', 'PKR', 1500, 1, 1500, '', 233);
INSERT INTO donors_donor_log VALUES (1351, '2010-01-01', 'FY10', 'PKR', 400000, 1, 400000, '', 208);
INSERT INTO donors_donor_log VALUES (1352, '2010-01-01', 'FY10', 'PKR', 40000, 1, 40000, '', 208);
INSERT INTO donors_donor_log VALUES (1353, '2009-10-01', 'FY10', 'PKR', 13500, 1, 13500, 'cash handed to Najeeb by Nq - Feb 23', 28);
INSERT INTO donors_donor_log VALUES (1354, '2009-11-01', 'FY10', 'PKR', 13500, 1, 13500, 'cash handed to Najeeb by Nq - Feb 24', 28);
INSERT INTO donors_donor_log VALUES (1355, '2009-12-01', 'FY10', 'PKR', 14000, 1, 14000, 'cash handed to Najeeb by Nq - Feb 25', 28);
INSERT INTO donors_donor_log VALUES (1356, '2010-01-01', 'FY10', 'PKR', 14000, 1, 14000, 'cash handed to Najeeb by Nq - Feb 26', 28);
INSERT INTO donors_donor_log VALUES (1357, '2009-10-01', 'FY10', 'PKR', 1500, 1, 1500, 'cash handed to Najeeb by Nq - Feb 27', 21);
INSERT INTO donors_donor_log VALUES (1358, '2009-11-01', 'FY10', 'PKR', 1500, 1, 1500, 'cash handed to Najeeb by Nq - Feb 28', 21);
INSERT INTO donors_donor_log VALUES (1359, '2009-12-01', 'FY10', 'PKR', 1500, 1, 1500, 'cash handed to Najeeb by Nq - Feb 29', 21);
INSERT INTO donors_donor_log VALUES (1360, '2010-01-01', 'FY10', 'PKR', 1500, 1, 1500, 'cash handed to Najeeb by Nq - Feb 30', 21);
INSERT INTO donors_donor_log VALUES (1361, '2010-02-01', 'FY10', 'PKR', 14000, 1, 14000, 'cash handed to Najeeb by Nq - Feb 31', 28);
INSERT INTO donors_donor_log VALUES (1362, '2010-02-01', 'FY10', 'PKR', 35000, 1, 35000, 'cash handed to Najeeb by Nq - Feb 32', 296);
INSERT INTO donors_donor_log VALUES (1363, '2010-02-01', 'FY10', 'PKR', 50000, 1, 50000, 'cash to Najeeb thru Mansoor', 200);
INSERT INTO donors_donor_log VALUES (1364, '2010-03-01', 'FY10', 'PKR', 13000, 1, 13000, '', 28);
INSERT INTO donors_donor_log VALUES (1365, '2010-01-01', 'FY10', 'PKR', 1700, 1, 1700, '', 89);
INSERT INTO donors_donor_log VALUES (1366, '2010-02-01', 'FY10', 'PKR', 1700, 1, 1700, '', 89);
INSERT INTO donors_donor_log VALUES (1367, '2010-03-01', 'FY10', 'PKR', 1700, 1, 1700, '', 89);
INSERT INTO donors_donor_log VALUES (1368, '2010-03-01', 'FY10', 'PKR', 10000, 1, 10000, '', 171);
INSERT INTO donors_donor_log VALUES (1369, '2010-04-01', 'FY10', 'PKR', 1700, 1, 1700, '', 89);
INSERT INTO donors_donor_log VALUES (1370, '2010-04-01', 'FY10', 'PKR', 12500, 1, 12500, '', 28);
INSERT INTO donors_donor_log VALUES (1371, '2010-04-01', 'FY10', 'PKR', 4500, 1, 4500, '', 21);
INSERT INTO donors_donor_log VALUES (1372, '2009-09-01', 'FY10', 'PKR', 65000, 1, 65000, '', 281);
INSERT INTO donors_donor_log VALUES (1373, '2009-09-01', 'FY10', 'PKR', 85000, 1, 85000, '', 281);
INSERT INTO donors_donor_log VALUES (1374, '2010-05-01', 'FY10', 'PKR', 1700, 1, 1700, '', 89);
INSERT INTO donors_donor_log VALUES (1375, '2010-05-01', 'FY10', 'PKR', 1350, 1, 1350, '', 174);
INSERT INTO donors_donor_log VALUES (1376, '2010-05-01', 'FY10', 'PKR', 1350, 1, 1350, '', 174);
INSERT INTO donors_donor_log VALUES (1377, '2010-05-01', 'FY10', 'PKR', 100000, 1, 100000, '', 264);
INSERT INTO donors_donor_log VALUES (1378, '2010-05-01', 'FY10', 'PKR', 18000, 1, 18000, 'cheque given to Najeeb for deposit - confirm details', 10);
INSERT INTO donors_donor_log VALUES (1379, '2010-06-01', 'FY10', 'PKR', 200000, 1, 200000, '', 281);
INSERT INTO donors_donor_log VALUES (1380, '2010-06-01', 'FY10', 'PKR', 500000, 1, 500000, '', 268);
INSERT INTO donors_donor_log VALUES (1381, '2010-06-01', 'FY10', 'PKR', 25000, 1, 25000, '', 222);
INSERT INTO donors_donor_log VALUES (1382, '2010-06-01', 'FY10', 'PKR', 1700, 1, 1700, '', 89);
INSERT INTO donors_donor_log VALUES (1383, '2010-03-01', 'FY10', 'PKR', 10000, 1, 10000, 'TA - cash to Mairaj Sb for transport payment', 222);
INSERT INTO donors_donor_log VALUES (1384, '2009-10-01', 'FY10', 'PKR', 8000, 1, 8000, 'TA - cash', 100);
INSERT INTO donors_donor_log VALUES (1385, '2010-05-01', 'FY10', 'PKR', 5000, 1, 5000, 'TA - cash as original check misplaced', 201);
INSERT INTO donors_donor_log VALUES (1386, '2009-08-01', 'FY10', 'USD', 2500, 82, 205000, 'direct wire transfer to JAQ Trust Acct', 143);
INSERT INTO donors_donor_log VALUES (1387, '2009-09-01', 'FY10', 'USD', 250, 82, 20500, 'World Money Order recd by NQ will fwd to Najeeb', 176);
INSERT INTO donors_donor_log VALUES (1388, '2009-09-01', 'FY10', 'USD', 700, 82, 57400, 'Personal check to NQ. NQ will write equiv check to Najeeb', 119);
INSERT INTO donors_donor_log VALUES (1389, '2009-09-01', 'FY10', 'USD', 150, 82, 12300, '', 96);
INSERT INTO donors_donor_log VALUES (1390, '2009-09-01', 'FY10', 'USD', 100, 82, 8200, '', 132);
INSERT INTO donors_donor_log VALUES (1391, '2009-09-01', 'FY10', 'USD', 400, 82, 32800, '', 66);
INSERT INTO donors_donor_log VALUES (1392, '2009-09-01', 'FY10', 'USD', 100, 82, 8200, '', 202);
INSERT INTO donors_donor_log VALUES (1393, '2009-09-01', 'FY10', 'USD', 927, 82, 76014, '', 317);
INSERT INTO donors_donor_log VALUES (1394, '2009-09-01', 'FY10', 'USD', 1325, 82, 108650, '', 212);
INSERT INTO donors_donor_log VALUES (1395, '2009-09-01', 'FY10', 'USD', 48, 82, 3936, '', 296);
INSERT INTO donors_donor_log VALUES (1396, '2009-09-01', 'FY10', 'USD', 200, 82, 16400, '', 138);
INSERT INTO donors_donor_log VALUES (1397, '2009-09-01', 'FY10', 'USD', 1000, 82, 82000, '', 203);
INSERT INTO donors_donor_log VALUES (1398, '2009-09-01', 'FY10', 'USD', 200, 82, 16400, '', 289);
INSERT INTO donors_donor_log VALUES (1399, '2009-10-01', 'FY10', 'USD', 100, 82, 8200, '', 299);
INSERT INTO donors_donor_log VALUES (1400, '2009-10-01', 'FY10', 'USD', 1000, 82, 82000, '', 115);
INSERT INTO donors_donor_log VALUES (1401, '2009-11-01', 'FY10', 'USD', 100, 82, 8200, '', 290);
INSERT INTO donors_donor_log VALUES (1402, '2009-12-01', 'FY10', 'USD', 1000, 82, 82000, 'Personal check to SQ. Amt is part of USD 1600 Cash check given to Trust', 27);
INSERT INTO donors_donor_log VALUES (1403, '2009-12-01', 'FY10', 'USD', 400, 82, 32800, 'Personal check to SQ. Amt is part of USD 1600 Cash check given to Trust', 252);
INSERT INTO donors_donor_log VALUES (1404, '2009-12-01', 'FY10', 'USD', 120, 82, 9840, 'Personal check to SQ. Amt is part of USD 1600 Cash check given to Trust', 86);
INSERT INTO donors_donor_log VALUES (1405, '2009-12-01', 'FY10', 'USD', 80, 82, 6560, 'Personal check to SQ. Amt is part of USD 1600 Cash check given to Trust', 146);
INSERT INTO donors_donor_log VALUES (1406, '2010-03-01', 'FY10', 'USD', 500, 82, 41000, '', 138);
INSERT INTO donors_donor_log VALUES (1407, '2011-05-01', 'FY11', 'PKR', 88480, 1, 88480, '', 292);
INSERT INTO donors_donor_log VALUES (1408, '2011-05-01', 'FY11', 'PKR', 20400, 1, 20400, '', 292);
INSERT INTO donors_donor_log VALUES (1409, '2011-05-01', 'FY11', 'PKR', 295000, 1, 295000, '', 153);
INSERT INTO donors_donor_log VALUES (1410, '2010-07-01', 'FY11', 'PKR', 7000, 1, 7000, '', 299);
INSERT INTO donors_donor_log VALUES (1411, '2010-07-01', 'FY11', 'PKR', 50000, 1, 50000, '', 300);
INSERT INTO donors_donor_log VALUES (1412, '2010-07-01', 'FY11', 'PKR', 10800, 1, 10800, '', 278);
INSERT INTO donors_donor_log VALUES (1413, '2010-08-01', 'FY11', 'PKR', 45000, 1, 45000, '', 21);
INSERT INTO donors_donor_log VALUES (1414, '2010-08-01', 'FY11', 'PKR', 3000, 1, 3000, '', 174);
INSERT INTO donors_donor_log VALUES (1415, '2010-08-01', 'FY11', 'PKR', 2700, 1, 2700, '', 174);
INSERT INTO donors_donor_log VALUES (1416, '2010-08-01', 'FY11', 'PKR', 6060, 1, 6060, '', 292);
INSERT INTO donors_donor_log VALUES (1417, '2010-08-01', 'FY11', 'PKR', 250000, 1, 250000, '', 40);
INSERT INTO donors_donor_log VALUES (1418, '2010-09-01', 'FY11', 'PKR', 350000, 1, 350000, '', 208);
INSERT INTO donors_donor_log VALUES (1419, '2010-09-01', 'FY11', 'PKR', 40000, 1, 40000, '', 208);
INSERT INTO donors_donor_log VALUES (1420, '2010-09-01', 'FY11', 'PKR', 12500, 1, 12500, '', 28);
INSERT INTO donors_donor_log VALUES (1421, '2010-09-01', 'FY11', 'PKR', 100000, 1, 100000, '', 183);
INSERT INTO donors_donor_log VALUES (1422, '2010-09-01', 'FY11', 'PKR', 5000, 1, 5000, '', 352);
INSERT INTO donors_donor_log VALUES (1423, '2010-09-01', 'FY11', 'PKR', 100000, 1, 100000, '', 248);
INSERT INTO donors_donor_log VALUES (1424, '2010-09-01', 'FY11', 'PKR', 50000, 1, 50000, '', 166);
INSERT INTO donors_donor_log VALUES (1425, '2010-10-01', 'FY11', 'PKR', 100000, 1, 100000, '', 272);
INSERT INTO donors_donor_log VALUES (1426, '2010-11-01', 'FY11', 'PKR', 10000, 1, 10000, '', 297);
INSERT INTO donors_donor_log VALUES (1427, '2010-11-01', 'FY11', 'PKR', 3600, 1, 3600, '', 174);
INSERT INTO donors_donor_log VALUES (1428, '2010-12-01', 'FY11', 'PKR', 100000, 1, 100000, '', 259);
INSERT INTO donors_donor_log VALUES (1429, '2010-12-01', 'FY11', 'PKR', 3000, 1, 3000, '', 139);
INSERT INTO donors_donor_log VALUES (1430, '2010-12-01', 'FY11', 'PKR', 30000, 1, 30000, '', 237);
INSERT INTO donors_donor_log VALUES (1431, '2010-12-01', 'FY11', 'PKR', 15000, 1, 15000, '', 126);
INSERT INTO donors_donor_log VALUES (1432, '2010-12-01', 'FY11', 'PKR', 14000, 1, 14000, '', 28);
INSERT INTO donors_donor_log VALUES (1433, '2010-12-01', 'FY11', 'PKR', 10000, 1, 10000, '', 330);
INSERT INTO donors_donor_log VALUES (1434, '2011-01-01', 'FY11', 'PKR', 14000, 1, 14000, '', 28);
INSERT INTO donors_donor_log VALUES (1435, '2011-01-01', 'FY11', 'PKR', 13500, 1, 13500, '', 28);
INSERT INTO donors_donor_log VALUES (1436, '2011-01-01', 'FY11', 'PKR', 13500, 1, 13500, '', 28);
INSERT INTO donors_donor_log VALUES (1437, '2011-01-01', 'FY11', 'PKR', 5000, 1, 5000, '', 105);
INSERT INTO donors_donor_log VALUES (1438, '2011-02-01', 'FY11', 'PKR', 14000, 1, 14000, '', 28);
INSERT INTO donors_donor_log VALUES (1439, '2011-03-01', 'FY11', 'PKR', 100000, 1, 100000, '', 296);
INSERT INTO donors_donor_log VALUES (1440, '2011-03-01', 'FY11', 'PKR', 100000, 1, 100000, '', 301);
INSERT INTO donors_donor_log VALUES (1441, '2011-03-01', 'FY11', 'PKR', 8000, 1, 8000, '', 147);
INSERT INTO donors_donor_log VALUES (1442, '2011-03-01', 'FY11', 'PKR', 14000, 1, 14000, '', 28);
INSERT INTO donors_donor_log VALUES (1443, '2011-03-01', 'FY11', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1444, '2011-04-01', 'FY11', 'PKR', 2000, 1, 2000, '', 64);
INSERT INTO donors_donor_log VALUES (1445, '2011-04-01', 'FY11', 'PKR', 10000, 1, 10000, '', 254);
INSERT INTO donors_donor_log VALUES (1446, '2011-04-01', 'FY11', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1447, '2011-04-01', 'FY11', 'PKR', 7000, 1, 7000, '', 28);
INSERT INTO donors_donor_log VALUES (1448, '2011-04-01', 'FY11', 'PKR', 375000, 1, 375000, '', 208);
INSERT INTO donors_donor_log VALUES (1449, '2011-04-01', 'FY11', 'PKR', 10000, 1, 10000, '', 105);
INSERT INTO donors_donor_log VALUES (1450, '2011-04-01', 'FY11', 'PKR', 50000, 1, 50000, '', 203);
INSERT INTO donors_donor_log VALUES (1451, '2011-05-01', 'FY11', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1452, '2011-05-01', 'FY11', 'PKR', 7000, 1, 7000, '', 28);
INSERT INTO donors_donor_log VALUES (1453, '2011-06-01', 'FY11', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1454, '2011-06-01', 'FY11', 'PKR', 7000, 1, 7000, '', 28);
INSERT INTO donors_donor_log VALUES (1455, '2010-07-01', 'FY11', 'USD', 200, 86, 17200, '', 56);
INSERT INTO donors_donor_log VALUES (1456, '2010-07-01', 'FY11', 'USD', 50, 86, 4300, '', 14);
INSERT INTO donors_donor_log VALUES (1457, '2010-08-01', 'FY11', 'USD', 500, 86, 43000, '', 138);
INSERT INTO donors_donor_log VALUES (1458, '2010-09-01', 'FY11', 'USD', 100, 86, 8600, '', 261);
INSERT INTO donors_donor_log VALUES (1459, '2010-09-01', 'FY11', 'USD', 50, 86, 4300, '', 289);
INSERT INTO donors_donor_log VALUES (1460, '2010-11-01', 'FY11', 'USD', 200, 86, 17200, '', 138);
INSERT INTO donors_donor_log VALUES (1461, '2010-11-01', 'FY11', 'USD', 50, 86, 4300, '', 228);
INSERT INTO donors_donor_log VALUES (1462, '2010-11-01', 'FY11', 'USD', 250, 86, 21500, 'Actual deposit $238.90', 176);
INSERT INTO donors_donor_log VALUES (1463, '2010-11-01', 'FY11', 'USD', 1200, 86, 103200, '', 264);
INSERT INTO donors_donor_log VALUES (1464, '2010-11-01', 'FY11', 'USD', 1220, 86, 104920, '', 252);
INSERT INTO donors_donor_log VALUES (1465, '2010-11-01', 'FY11', 'USD', 50, 86, 4300, '', 239);
INSERT INTO donors_donor_log VALUES (1466, '2010-11-01', 'FY11', 'USD', 50, 86, 4300, '', 148);
INSERT INTO donors_donor_log VALUES (1467, '2010-11-01', 'FY11', 'USD', 300, 86, 25800, 'Actual deposit $6013', 138);
INSERT INTO donors_donor_log VALUES (1468, '2011-01-01', 'FY11', 'USD', 1000, 86, 86000, '', 115);
INSERT INTO donors_donor_log VALUES (1469, '2011-01-01', 'FY11', 'USD', 100, 86, 8600, '', 202);
INSERT INTO donors_donor_log VALUES (1470, '2011-01-01', 'FY11', 'USD', 1000, 86, 86000, '', 119);
INSERT INTO donors_donor_log VALUES (1471, '2011-03-01', 'FY11', 'USD', 100, 86, 8600, '', 333);
INSERT INTO donors_donor_log VALUES (1472, '2011-03-01', 'FY11', 'USD', 1000, 86, 86000, '', 138);
INSERT INTO donors_donor_log VALUES (1473, '2010-12-01', 'FY11', 'USD', 200, 86, 17200, '', 44);
INSERT INTO donors_donor_log VALUES (1474, '2011-03-01', 'FY11', 'USD', 1200, 86, 103200, '', 44);
INSERT INTO donors_donor_log VALUES (1475, '2011-03-01', 'FY11', 'USD', 320, 86, 27520, '', 44);
INSERT INTO donors_donor_log VALUES (1476, '2012-05-01', 'FY12', 'PKR', 107160, 1, 107160, '', 292);
INSERT INTO donors_donor_log VALUES (1477, '2012-05-01', 'FY12', 'PKR', 119545, 1, 119545, '', 292);
INSERT INTO donors_donor_log VALUES (1478, '2012-05-01', 'FY12', 'PKR', 13200, 1, 13200, '', 292);
INSERT INTO donors_donor_log VALUES (1479, '2012-05-01', 'FY12', 'PKR', 275000, 1, 275000, '', 153);
INSERT INTO donors_donor_log VALUES (1480, '2011-08-01', 'FY12', 'PKR', 100000, 1, 100000, '', 300);
INSERT INTO donors_donor_log VALUES (1481, '2011-08-01', 'FY12', 'PKR', 10650, 1, 10650, '', 47);
INSERT INTO donors_donor_log VALUES (1482, '2011-08-01', 'FY12', 'PKR', 200000, 1, 200000, '', 259);
INSERT INTO donors_donor_log VALUES (1483, '2011-08-01', 'FY12', 'PKR', 370000, 1, 370000, '', 208);
INSERT INTO donors_donor_log VALUES (1484, '2011-07-01', 'FY12', 'PKR', 7000, 1, 7000, '', 299);
INSERT INTO donors_donor_log VALUES (1485, '2011-08-01', 'FY12', 'PKR', 8600, 1, 8600, '', 270);
INSERT INTO donors_donor_log VALUES (1486, '2011-08-01', 'FY12', 'PKR', 100000, 1, 100000, '', 248);
INSERT INTO donors_donor_log VALUES (1487, '2011-08-01', 'FY12', 'PKR', 100000, 1, 100000, '', 183);
INSERT INTO donors_donor_log VALUES (1488, '2011-08-01', 'FY12', 'PKR', 15000, 1, 15000, '', 173);
INSERT INTO donors_donor_log VALUES (1489, '2011-08-01', 'FY12', 'PKR', 36000, 1, 36000, '', 278);
INSERT INTO donors_donor_log VALUES (1490, '2011-08-01', 'FY12', 'PKR', 250000, 1, 250000, '', 40);
INSERT INTO donors_donor_log VALUES (1491, '2011-08-01', 'FY12', 'PKR', 10000, 1, 10000, '', 147);
INSERT INTO donors_donor_log VALUES (1492, '2011-08-01', 'FY12', 'PKR', 10000, 1, 10000, '', 308);
INSERT INTO donors_donor_log VALUES (1493, '2011-08-01', 'FY12', 'PKR', 50000, 1, 50000, '', 281);
INSERT INTO donors_donor_log VALUES (1494, '2011-09-01', 'FY12', 'PKR', 129000, 1, 129000, '', 113);
INSERT INTO donors_donor_log VALUES (1495, '2011-09-01', 'FY12', 'PKR', 8600, 1, 8600, '', 184);
INSERT INTO donors_donor_log VALUES (1496, '2011-09-01', 'FY12', 'PKR', 12900, 1, 12900, '', 14);
INSERT INTO donors_donor_log VALUES (1497, '2011-09-01', 'FY12', 'PKR', 8600, 1, 8600, '', 206);
INSERT INTO donors_donor_log VALUES (1498, '2011-09-01', 'FY12', 'PKR', 8600, 1, 8600, '', 118);
INSERT INTO donors_donor_log VALUES (1499, '2011-09-01', 'FY12', 'PKR', 10000, 1, 10000, '', 213);
INSERT INTO donors_donor_log VALUES (1500, '2011-09-01', 'FY12', 'PKR', 20100, 1, 20100, '', 283);
INSERT INTO donors_donor_log VALUES (1501, '2011-07-01', 'FY12', 'PKR', 7000, 1, 7000, '', 28);
INSERT INTO donors_donor_log VALUES (1502, '2011-07-01', 'FY12', 'PKR', 7000, 1, 7000, '', 28);
INSERT INTO donors_donor_log VALUES (1503, '2011-07-01', 'FY12', 'PKR', 7000, 1, 7000, '', 28);
INSERT INTO donors_donor_log VALUES (1504, '2011-07-01', 'FY12', 'PKR', 7000, 1, 7000, '', 28);
INSERT INTO donors_donor_log VALUES (1505, '2011-08-01', 'FY12', 'PKR', 25000, 1, 25000, '', 38);
INSERT INTO donors_donor_log VALUES (1506, '2011-08-01', 'FY12', 'PKR', 45000, 1, 45000, '', 88);
INSERT INTO donors_donor_log VALUES (1507, '2011-08-01', 'FY12', 'PKR', 25000, 1, 25000, '', 126);
INSERT INTO donors_donor_log VALUES (1508, '2011-08-01', 'FY12', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1509, '2011-08-01', 'FY12', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1510, '2011-08-01', 'FY12', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1511, '2011-08-01', 'FY12', 'PKR', 40000, 1, 40000, '', 281);
INSERT INTO donors_donor_log VALUES (1512, '2011-09-01', 'FY12', 'PKR', 30000, 1, 30000, '', 122);
INSERT INTO donors_donor_log VALUES (1513, '2011-09-01', 'FY12', 'PKR', 30000, 1, 30000, '', 317);
INSERT INTO donors_donor_log VALUES (1514, '2011-09-01', 'FY12', 'PKR', 44000, 1, 44000, '', 32);
INSERT INTO donors_donor_log VALUES (1515, '2011-09-01', 'FY12', 'PKR', 50000, 1, 50000, '', 307);
INSERT INTO donors_donor_log VALUES (1516, '2011-09-01', 'FY12', 'PKR', 25000, 1, 25000, '', 123);
INSERT INTO donors_donor_log VALUES (1517, '2011-10-01', 'FY12', 'PKR', 5000, 1, 5000, '', 161);
INSERT INTO donors_donor_log VALUES (1518, '2011-10-01', 'FY12', 'PKR', 10000, 1, 10000, '', 114);
INSERT INTO donors_donor_log VALUES (1519, '2011-10-01', 'FY12', 'PKR', 5000, 1, 5000, '', 134);
INSERT INTO donors_donor_log VALUES (1520, '2011-10-01', 'FY12', 'PKR', 30000, 1, 30000, '', 152);
INSERT INTO donors_donor_log VALUES (1521, '2011-10-01', 'FY12', 'PKR', 25000, 1, 25000, '', 152);
INSERT INTO donors_donor_log VALUES (1522, '2011-11-01', 'FY12', 'PKR', 4300, 1, 4300, '', 174);
INSERT INTO donors_donor_log VALUES (1523, '2011-11-01', 'FY12', 'PKR', 31000, 1, 31000, '', 128);
INSERT INTO donors_donor_log VALUES (1524, '2011-10-01', 'FY12', 'PKR', 5000, 1, 5000, '', 101);
INSERT INTO donors_donor_log VALUES (1525, '2011-10-01', 'FY12', 'PKR', 31000, 1, 31000, '', 288);
INSERT INTO donors_donor_log VALUES (1526, '2011-11-01', 'FY12', 'PKR', 50000, 1, 50000, '', 298);
INSERT INTO donors_donor_log VALUES (1527, '2011-11-01', 'FY12', 'PKR', 5000, 1, 5000, '', 172);
INSERT INTO donors_donor_log VALUES (1528, '2011-12-01', 'FY12', 'PKR', 20000, 1, 20000, '', 63);
INSERT INTO donors_donor_log VALUES (1529, '2011-12-01', 'FY12', 'PKR', 16000, 1, 16000, '', 34);
INSERT INTO donors_donor_log VALUES (1530, '2012-02-01', 'FY12', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1531, '2012-02-01', 'FY12', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1532, '2012-02-01', 'FY12', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1533, '2012-02-01', 'FY12', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1534, '2012-02-01', 'FY12', 'PKR', 5000, 1, 5000, '', 105);
INSERT INTO donors_donor_log VALUES (1535, '2012-02-01', 'FY12', 'PKR', 117000, 1, 117000, '', 212);
INSERT INTO donors_donor_log VALUES (1536, '2012-01-01', 'FY12', 'PKR', 1372600, 1, 1372600, '', 70);
INSERT INTO donors_donor_log VALUES (1537, '2012-02-01', 'FY12', 'PKR', 5000, 1, 5000, '', 196);
INSERT INTO donors_donor_log VALUES (1538, '2012-02-01', 'FY12', 'PKR', 40000, 1, 40000, '', 276);
INSERT INTO donors_donor_log VALUES (1539, '2012-02-01', 'FY12', 'PKR', 10000, 1, 10000, '', 186);
INSERT INTO donors_donor_log VALUES (1540, '2012-02-01', 'FY12', 'PKR', 8000, 1, 8000, '', 291);
INSERT INTO donors_donor_log VALUES (1541, '2012-02-01', 'FY12', 'PKR', 10000, 1, 10000, '', 310);
INSERT INTO donors_donor_log VALUES (1542, '2012-02-01', 'FY12', 'PKR', 36700, 1, 36700, '', 229);
INSERT INTO donors_donor_log VALUES (1543, '2011-07-01', 'FY12', 'PKR', 27300, 1, 27300, '', 229);
INSERT INTO donors_donor_log VALUES (1544, '2011-09-01', 'FY12', 'PKR', 25600, 1, 25600, '', 229);
INSERT INTO donors_donor_log VALUES (1545, '2012-01-01', 'FY12', 'PKR', 9000, 1, 9000, '', 349);
INSERT INTO donors_donor_log VALUES (1546, '2012-02-01', 'FY12', 'PKR', 13500, 1, 13500, '', 341);
INSERT INTO donors_donor_log VALUES (1547, '2012-02-01', 'FY12', 'PKR', 4500, 1, 4500, '', 357);
INSERT INTO donors_donor_log VALUES (1548, '2012-02-01', 'FY12', 'PKR', 7000, 1, 7000, '', 271);
INSERT INTO donors_donor_log VALUES (1549, '2012-02-01', 'FY12', 'PKR', 3000, 1, 3000, '', 83);
INSERT INTO donors_donor_log VALUES (1550, '2012-02-01', 'FY12', 'PKR', 10000, 1, 10000, '', 44);
INSERT INTO donors_donor_log VALUES (1551, '2012-02-01', 'FY12', 'PKR', 3600, 1, 3600, '', 246);
INSERT INTO donors_donor_log VALUES (1552, '2012-02-01', 'FY12', 'PKR', 10000, 1, 10000, '', 308);
INSERT INTO donors_donor_log VALUES (1553, '2012-02-01', 'FY12', 'PKR', 4000, 1, 4000, '', 315);
INSERT INTO donors_donor_log VALUES (1554, '2012-03-01', 'FY12', 'PKR', 5000, 1, 5000, '', 52);
INSERT INTO donors_donor_log VALUES (1555, '2012-03-01', 'FY12', 'PKR', 1000, 1, 1000, '', 129);
INSERT INTO donors_donor_log VALUES (1556, '2012-03-01', 'FY12', 'PKR', 1000, 1, 1000, '', 75);
INSERT INTO donors_donor_log VALUES (1557, '2012-03-01', 'FY12', 'PKR', 2000, 1, 2000, '', 197);
INSERT INTO donors_donor_log VALUES (1558, '2012-04-01', 'FY12', 'PKR', 42500, 1, 42500, '', 76);
INSERT INTO donors_donor_log VALUES (1559, '2012-04-01', 'FY12', 'PKR', 127500, 1, 127500, '', 136);
INSERT INTO donors_donor_log VALUES (1560, '2012-04-01', 'FY12', 'PKR', 125000, 1, 125000, '', 300);
INSERT INTO donors_donor_log VALUES (1561, '2012-04-01', 'FY12', 'PKR', 3950, 1, 3950, '', 292);
INSERT INTO donors_donor_log VALUES (1562, '2012-04-01', 'FY12', 'PKR', 25000, 1, 25000, '', 360);
INSERT INTO donors_donor_log VALUES (1563, '2012-04-01', 'FY12', 'PKR', 50000, 1, 50000, '', 220);
INSERT INTO donors_donor_log VALUES (1564, '2012-04-01', 'FY12', 'PKR', 425000, 1, 425000, '', 208);
INSERT INTO donors_donor_log VALUES (1565, '2012-03-01', 'FY12', 'PKR', 14000, 1, 14000, '', 326);
INSERT INTO donors_donor_log VALUES (1566, '2012-06-01', 'FY12', 'PKR', 500, 1, 500, '', 79);
INSERT INTO donors_donor_log VALUES (1567, '2012-06-01', 'FY12', 'PKR', 5000, 1, 5000, '', 225);
INSERT INTO donors_donor_log VALUES (1568, '2012-04-01', 'FY12', 'PKR', 3000, 1, 3000, '', 302);
INSERT INTO donors_donor_log VALUES (1569, '2012-05-01', 'FY12', 'PKR', 35000, 1, 35000, '', 281);
INSERT INTO donors_donor_log VALUES (1570, '2012-02-01', 'FY12', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1571, '2012-03-01', 'FY12', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1572, '2012-04-01', 'FY12', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1573, '2012-06-01', 'FY12', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1574, '2012-06-01', 'FY12', 'PKR', 9000, 1, 9000, '', 28);
INSERT INTO donors_donor_log VALUES (1575, '2012-05-01', 'FY12', 'PKR', 9000, 1, 9000, '', 247);
INSERT INTO donors_donor_log VALUES (1576, '2012-05-01', 'FY12', 'PKR', 25000, 1, 25000, '', 126);
INSERT INTO donors_donor_log VALUES (1577, '2012-05-01', 'FY12', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1578, '2012-06-01', 'FY12', 'PKR', 9000, 1, 9000, '', 282);
INSERT INTO donors_donor_log VALUES (1579, '2011-08-01', 'FY12', 'USD', 100, 87, 8700, '', 177);
INSERT INTO donors_donor_log VALUES (1580, '2011-08-01', 'FY12', 'USD', 500, 87, 43500, '', 98);
INSERT INTO donors_donor_log VALUES (1581, '2011-08-01', 'FY12', 'USD', 1200, 87, 104400, '', 343);
INSERT INTO donors_donor_log VALUES (1582, '2011-08-01', 'FY12', 'USD', 150, 87, 13050, '', 289);
INSERT INTO donors_donor_log VALUES (1583, '2011-08-01', 'FY12', 'USD', 250, 87, 21750, '', 176);
INSERT INTO donors_donor_log VALUES (1584, '2011-08-01', 'FY12', 'USD', 500, 87, 43500, '', 66);
INSERT INTO donors_donor_log VALUES (1585, '2011-08-01', 'FY12', 'USD', 300, 87, 26100, '', 90);
INSERT INTO donors_donor_log VALUES (1586, '2011-08-01', 'FY12', 'USD', 200, 87, 17400, '', 154);
INSERT INTO donors_donor_log VALUES (1587, '2011-08-01', 'FY12', 'USD', 500, 87, 43500, '', 321);
INSERT INTO donors_donor_log VALUES (1588, '2011-09-01', 'FY12', 'USD', 250, 87, 21750, '', 290);
INSERT INTO donors_donor_log VALUES (1589, '2011-09-01', 'FY12', 'USD', 1000, 87, 87000, '', 115);
INSERT INTO donors_donor_log VALUES (1590, '2011-09-01', 'FY12', 'USD', 250, 87, 21750, '', 356);
INSERT INTO donors_donor_log VALUES (1591, '2011-09-01', 'FY12', 'USD', 400, 87, 34800, '', 261);
INSERT INTO donors_donor_log VALUES (1592, '2011-10-01', 'FY12', 'USD', 1000, 87, 87000, '', 119);
INSERT INTO donors_donor_log VALUES (1593, '2011-11-01', 'FY12', 'USD', 600, 87, 52200, '', 264);
INSERT INTO donors_donor_log VALUES (1594, '2011-11-01', 'FY12', 'USD', 500, 87, 43500, '', 138);
INSERT INTO donors_donor_log VALUES (1595, '2011-12-01', 'FY12', 'USD', 500, 87, 43500, '', 250);
INSERT INTO donors_donor_log VALUES (1596, '2012-01-01', 'FY12', 'USD', 100, 87, 8700, '', 252);
INSERT INTO donors_donor_log VALUES (1597, '2012-02-01', 'FY12', 'USD', 1078, 87, 93807, '', 143);
INSERT INTO donors_donor_log VALUES (1598, '2012-02-01', 'FY12', 'USD', 5000, 87, 435000, '', 268);
INSERT INTO donors_donor_log VALUES (1599, '2012-02-01', 'FY12', 'USD', 40, 87, 3480, '', 85);
INSERT INTO donors_donor_log VALUES (1600, '2012-02-01', 'FY12', 'USD', 500, 87, 43500, '', 138);
INSERT INTO donors_donor_log VALUES (1601, '2011-08-01', 'FY12', 'USD', 150, 87, 13050, '', 174);
INSERT INTO donors_donor_log VALUES (1602, '2011-05-01', 'FY13', 'PKR', 345490, 1, 345490, '', 292);
INSERT INTO donors_donor_log VALUES (1603, '2011-05-01', 'FY13', 'PKR', 300000, 1, 300000, '', 153);
INSERT INTO donors_donor_log VALUES (1604, '2012-07-01', 'FY13', 'PKR', 97000, 1, 97000, '', 359);
INSERT INTO donors_donor_log VALUES (1605, '2012-07-01', 'FY13', 'PKR', 300000, 1, 300000, '', 40);
INSERT INTO donors_donor_log VALUES (1606, '2012-07-01', 'FY13', 'PKR', 50000, 1, 50000, '', 19);
INSERT INTO donors_donor_log VALUES (1607, '2012-07-01', 'FY13', 'PKR', 40000, 1, 40000, '', 327);
INSERT INTO donors_donor_log VALUES (1608, '2012-07-01', 'FY13', 'PKR', 20000, 1, 20000, '', 349);
INSERT INTO donors_donor_log VALUES (1609, '2012-08-01', 'FY13', 'PKR', 150000, 1, 150000, '', 248);
INSERT INTO donors_donor_log VALUES (1610, '2012-08-01', 'FY13', 'PKR', 25000, 1, 25000, '', 222);
INSERT INTO donors_donor_log VALUES (1611, '2012-08-01', 'FY13', 'PKR', 10000, 1, 10000, '', 311);
INSERT INTO donors_donor_log VALUES (1612, '2012-08-01', 'FY13', 'PKR', 5000, 1, 5000, '', 105);
INSERT INTO donors_donor_log VALUES (1613, '2012-08-01', 'FY13', 'PKR', 50000, 1, 50000, '', 193);
INSERT INTO donors_donor_log VALUES (1614, '2012-08-01', 'FY13', 'PKR', 100000, 1, 100000, '', 275);
INSERT INTO donors_donor_log VALUES (1615, '2012-08-01', 'FY13', 'PKR', 100000, 1, 100000, '', 183);
INSERT INTO donors_donor_log VALUES (1616, '2012-08-01', 'FY13', 'PKR', 10000, 1, 10000, '', 201);
INSERT INTO donors_donor_log VALUES (1617, '2012-08-01', 'FY13', 'PKR', 300000, 1, 300000, '', 268);
INSERT INTO donors_donor_log VALUES (1618, '2012-08-01', 'FY13', 'PKR', 18480, 1, 18480, '', 320);
INSERT INTO donors_donor_log VALUES (1619, '2012-07-01', 'FY13', 'PKR', 1016610, 1, 1016610, '', 16);
INSERT INTO donors_donor_log VALUES (1620, '2012-08-01', 'FY13', 'PKR', 200000, 1, 200000, '', 259);
INSERT INTO donors_donor_log VALUES (1621, '2012-08-01', 'FY13', 'PKR', 16850, 1, 16850, '', 277);
INSERT INTO donors_donor_log VALUES (1622, '2012-07-01', 'FY13', 'PKR', 20000, 1, 20000, '', 59);
INSERT INTO donors_donor_log VALUES (1623, '2012-08-01', 'FY13', 'PKR', 15000, 1, 15000, '', 284);
INSERT INTO donors_donor_log VALUES (1624, '2012-09-01', 'FY13', 'PKR', 10000, 1, 10000, '', 354);
INSERT INTO donors_donor_log VALUES (1625, '2012-09-01', 'FY13', 'PKR', 3000, 1, 3000, '', 28);
INSERT INTO donors_donor_log VALUES (1626, '2012-09-01', 'FY13', 'PKR', 3000, 1, 3000, '', 28);
INSERT INTO donors_donor_log VALUES (1627, '2012-09-01', 'FY13', 'PKR', 15000, 1, 15000, '', 244);
INSERT INTO donors_donor_log VALUES (1628, '2012-10-01', 'FY13', 'PKR', 200000, 1, 200000, '', 130);
INSERT INTO donors_donor_log VALUES (1629, '2012-07-01', 'FY13', 'PKR', 37200, 1, 37200, '', 44);
INSERT INTO donors_donor_log VALUES (1630, '2012-10-01', 'FY13', 'PKR', 6000, 1, 6000, '', 13);
INSERT INTO donors_donor_log VALUES (1631, '2012-10-01', 'FY13', 'PKR', 6000, 1, 6000, '', 13);
INSERT INTO donors_donor_log VALUES (1632, '2012-10-01', 'FY13', 'PKR', 15000, 1, 15000, '', 126);
INSERT INTO donors_donor_log VALUES (1633, '2012-10-01', 'FY13', 'PKR', 6000, 1, 6000, '', 13);
INSERT INTO donors_donor_log VALUES (1634, '2012-10-01', 'FY13', 'PKR', 12000, 1, 12000, '', 262);
INSERT INTO donors_donor_log VALUES (1635, '2012-10-01', 'FY13', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1636, '2012-10-01', 'FY13', 'PKR', 125000, 1, 125000, '', 212);
INSERT INTO donors_donor_log VALUES (1637, '2012-10-01', 'FY13', 'PKR', 5000, 1, 5000, '', 246);
INSERT INTO donors_donor_log VALUES (1638, '2012-10-01', 'FY13', 'PKR', 30000, 1, 30000, '', 229);
INSERT INTO donors_donor_log VALUES (1639, '2012-10-01', 'FY13', 'PKR', 5000, 1, 5000, '', 144);
INSERT INTO donors_donor_log VALUES (1640, '2012-11-01', 'FY13', 'PKR', 500, 1, 500, '', 35);
INSERT INTO donors_donor_log VALUES (1641, '2012-05-01', 'FY13', 'PKR', 74000, 1, 74000, '', 236);
INSERT INTO donors_donor_log VALUES (1642, '2012-11-01', 'FY13', 'PKR', 5000, 1, 5000, '', 51);
INSERT INTO donors_donor_log VALUES (1643, '2012-11-01', 'FY13', 'PKR', 100000, 1, 100000, '', 259);
INSERT INTO donors_donor_log VALUES (1644, '2012-08-01', 'FY13', 'PKR', 1000, 1, 1000, '', 45);
INSERT INTO donors_donor_log VALUES (1645, '2012-08-01', 'FY13', 'PKR', 4800, 1, 4800, '', 294);
INSERT INTO donors_donor_log VALUES (1646, '2012-10-01', 'FY13', 'PKR', 100000, 1, 100000, '', 147);
INSERT INTO donors_donor_log VALUES (1647, '2012-12-01', 'FY13', 'PKR', 50000, 1, 50000, '', 200);
INSERT INTO donors_donor_log VALUES (1648, '2012-12-01', 'FY13', 'PKR', 700, 1, 700, '', 35);
INSERT INTO donors_donor_log VALUES (1649, '2013-01-01', 'FY13', 'PKR', 6000, 1, 6000, '', 13);
INSERT INTO donors_donor_log VALUES (1650, '2013-01-01', 'FY13', 'PKR', 50000, 1, 50000, '', 237);
INSERT INTO donors_donor_log VALUES (1651, '2013-01-01', 'FY13', 'PKR', 6100, 1, 6100, '', 28);
INSERT INTO donors_donor_log VALUES (1652, '2013-01-01', 'FY13', 'PKR', 6000, 1, 6000, '', 13);
INSERT INTO donors_donor_log VALUES (1653, '2013-01-01', 'FY13', 'PKR', 20000, 1, 20000, '', 92);
INSERT INTO donors_donor_log VALUES (1654, '2012-12-01', 'FY13', 'PKR', 3400, 1, 3400, '', 287);
INSERT INTO donors_donor_log VALUES (1655, '2012-12-01', 'FY13', 'PKR', 3000, 1, 3000, '', 236);
INSERT INTO donors_donor_log VALUES (1656, '2012-12-01', 'FY13', 'PKR', 1000, 1, 1000, '', 106);
INSERT INTO donors_donor_log VALUES (1657, '2012-12-01', 'FY13', 'PKR', 12000, 1, 12000, '', 319);
INSERT INTO donors_donor_log VALUES (1658, '2012-12-01', 'FY13', 'PKR', 5000, 1, 5000, '', 110);
INSERT INTO donors_donor_log VALUES (1659, '2012-12-01', 'FY13', 'PKR', 5000, 1, 5000, '', 277);
INSERT INTO donors_donor_log VALUES (1660, '2012-12-01', 'FY13', 'PKR', 25000, 1, 25000, '', 354);
INSERT INTO donors_donor_log VALUES (1661, '2012-12-01', 'FY13', 'PKR', 10000, 1, 10000, '', 109);
INSERT INTO donors_donor_log VALUES (1662, '2012-12-01', 'FY13', 'PKR', 1000, 1, 1000, '', 164);
INSERT INTO donors_donor_log VALUES (1663, '2012-12-01', 'FY13', 'PKR', 10000, 1, 10000, '', 170);
INSERT INTO donors_donor_log VALUES (1664, '2013-01-01', 'FY13', 'PKR', 150000, 1, 150000, '', 300);
INSERT INTO donors_donor_log VALUES (1665, '2013-05-01', 'FY13', 'PKR', 10000, 1, 10000, '', 326);
INSERT INTO donors_donor_log VALUES (1666, '2013-01-01', 'FY13', 'PKR', 5000, 1, 5000, '', 299);
INSERT INTO donors_donor_log VALUES (1667, '2013-01-01', 'FY13', 'PKR', 10000, 1, 10000, '', 208);
INSERT INTO donors_donor_log VALUES (1668, '2013-01-01', 'FY13', 'PKR', 3000, 1, 3000, '', 349);
INSERT INTO donors_donor_log VALUES (1669, '2013-03-01', 'FY13', 'PKR', 1200, 1, 1200, '', 35);
INSERT INTO donors_donor_log VALUES (1670, '2013-03-01', 'FY13', 'PKR', 10000, 1, 10000, '', 135);
INSERT INTO donors_donor_log VALUES (1671, '2013-03-01', 'FY13', 'PKR', 4860, 1, 4860, '', 235);
INSERT INTO donors_donor_log VALUES (1672, '2013-04-01', 'FY13', 'PKR', 6000, 1, 6000, '', 13);
INSERT INTO donors_donor_log VALUES (1673, '2013-04-01', 'FY13', 'PKR', 3000, 1, 3000, '', 28);
INSERT INTO donors_donor_log VALUES (1674, '2013-04-01', 'FY13', 'PKR', 6000, 1, 6000, '', 13);
INSERT INTO donors_donor_log VALUES (1675, '2013-04-01', 'FY13', 'PKR', 6000, 1, 6000, '', 13);
INSERT INTO donors_donor_log VALUES (1676, '2013-04-01', 'FY13', 'PKR', 3000, 1, 3000, '', 28);
INSERT INTO donors_donor_log VALUES (1677, '2013-04-01', 'FY13', 'PKR', 5000, 1, 5000, '', 345);
INSERT INTO donors_donor_log VALUES (1678, '2013-04-01', 'FY13', 'PKR', 5000, 1, 5000, '', 20);
INSERT INTO donors_donor_log VALUES (1679, '2013-04-01', 'FY13', 'PKR', 27000, 1, 27000, '', 345);
INSERT INTO donors_donor_log VALUES (1680, '2013-04-01', 'FY13', 'PKR', 3000, 1, 3000, '', 105);
INSERT INTO donors_donor_log VALUES (1681, '2013-04-01', 'FY13', 'PKR', 50000, 1, 50000, '', 241);
INSERT INTO donors_donor_log VALUES (1682, '2013-04-01', 'FY13', 'PKR', 270000, 1, 270000, '', 44);
INSERT INTO donors_donor_log VALUES (1683, '2013-04-01', 'FY13', 'PKR', 50000, 1, 50000, '', 122);
INSERT INTO donors_donor_log VALUES (1684, '2013-05-01', 'FY13', 'PKR', 100000, 1, 100000, '', 259);
INSERT INTO donors_donor_log VALUES (1685, '2013-05-01', 'FY13', 'PKR', 1000, 1, 1000, '', 35);
INSERT INTO donors_donor_log VALUES (1686, '2013-05-01', 'FY13', 'PKR', 4800, 1, 4800, '', 175);
INSERT INTO donors_donor_log VALUES (1687, '2013-05-01', 'FY13', 'PKR', 92507, 1, 92507, '', 211);
INSERT INTO donors_donor_log VALUES (1688, '2013-05-01', 'FY13', 'PKR', 400000, 1, 400000, '', 208);
INSERT INTO donors_donor_log VALUES (1689, '2013-05-01', 'FY13', 'PKR', 3000, 1, 3000, '', 187);
INSERT INTO donors_donor_log VALUES (1690, '2013-05-01', 'FY13', 'PKR', 1000, 1, 1000, '', 22);
INSERT INTO donors_donor_log VALUES (1691, '2013-06-01', 'FY13', 'PKR', 25750, 1, 25750, '', 127);
INSERT INTO donors_donor_log VALUES (1692, '2013-06-01', 'FY13', 'PKR', 25000, 1, 25000, '', 67);
INSERT INTO donors_donor_log VALUES (1693, '2013-06-01', 'FY13', 'PKR', 20000, 1, 20000, '', 77);
INSERT INTO donors_donor_log VALUES (1694, '2013-06-01', 'FY13', 'PKR', 10000, 1, 10000, '', 201);
INSERT INTO donors_donor_log VALUES (1695, '2013-06-01', 'FY13', 'PKR', 24000, 1, 24000, '', 354);
INSERT INTO donors_donor_log VALUES (1696, '2013-06-01', 'FY13', 'PKR', 35000, 1, 35000, '', 49);
INSERT INTO donors_donor_log VALUES (1697, '2012-08-01', 'FY13', 'USD', 1500, 94, 141000, '', 281);
INSERT INTO donors_donor_log VALUES (1698, '2012-08-01', 'FY13', 'USD', 5000, 94, 470000, '', 143);
INSERT INTO donors_donor_log VALUES (1699, '2012-08-01', 'FY13', 'USD', 200, 94, 18800, '', 331);
INSERT INTO donors_donor_log VALUES (1700, '2012-08-01', 'FY13', 'USD', 1500, 94, 141000, '', 44);
INSERT INTO donors_donor_log VALUES (1701, '2012-09-01', 'FY13', 'USD', 1500, 94, 141000, '', 27);
INSERT INTO donors_donor_log VALUES (1702, '2012-09-01', 'FY13', 'USD', 1000, 94, 94000, '', 119);
INSERT INTO donors_donor_log VALUES (1703, '2012-09-01', 'FY13', 'USD', 200, 94, 18800, '', 66);
INSERT INTO donors_donor_log VALUES (1704, '2012-09-01', 'FY13', 'USD', 200, 94, 18800, '', 96);
INSERT INTO donors_donor_log VALUES (1705, '2012-09-01', 'FY13', 'USD', 250, 94, 23500, '', 252);
INSERT INTO donors_donor_log VALUES (1706, '2012-09-01', 'FY13', 'USD', 1000, 94, 94000, '', 115);
INSERT INTO donors_donor_log VALUES (1707, '2012-09-01', 'FY13', 'USD', 500, 94, 47000, '', 98);
INSERT INTO donors_donor_log VALUES (1708, '2012-09-01', 'FY13', 'USD', 2000, 94, 188000, '', 264);
INSERT INTO donors_donor_log VALUES (1709, '2012-09-01', 'FY13', 'USD', 100, 94, 9400, '', 154);
INSERT INTO donors_donor_log VALUES (1710, '2012-09-01', 'FY13', 'USD', 500, 94, 47000, '', 261);
INSERT INTO donors_donor_log VALUES (1711, '2012-08-01', 'FY13', 'USD', 2100, 94, 197400, '', 14);
INSERT INTO donors_donor_log VALUES (1712, '2012-09-01', 'FY13', 'USD', 250, 94, 23500, '', 176);
INSERT INTO donors_donor_log VALUES (1713, '2012-08-01', 'FY13', 'USD', 100, 94, 9400, '', 206);
INSERT INTO donors_donor_log VALUES (1714, '2012-08-01', 'FY13', 'USD', 100, 94, 9400, '', 279);
INSERT INTO donors_donor_log VALUES (1715, '2012-08-01', 'FY13', 'USD', 250, 94, 23500, '', 118);
INSERT INTO donors_donor_log VALUES (1716, '2012-08-01', 'FY13', 'USD', 150, 94, 14100, '', 14);
INSERT INTO donors_donor_log VALUES (1717, '2012-10-01', 'FY13', 'USD', 100, 94, 9400, '', 26);
INSERT INTO donors_donor_log VALUES (1718, '2012-10-01', 'FY13', 'USD', 100, 94, 9400, '', 351);
INSERT INTO donors_donor_log VALUES (1719, '2012-11-01', 'FY13', 'USD', 4950, 94, 465300, '', 253);
INSERT INTO donors_donor_log VALUES (1720, '2012-12-01', 'FY13', 'USD', 100, 94, 9400, '', 333);
INSERT INTO donors_donor_log VALUES (1721, '2012-12-01', 'FY13', 'USD', 1000, 94, 94000, '', 138);
INSERT INTO donors_donor_log VALUES (1722, '2012-12-01', 'FY13', 'USD', 1500, 94, 141000, '', 264);
INSERT INTO donors_donor_log VALUES (1723, '2012-12-01', 'FY13', 'USD', 112, 94, 10528, '', 149);
INSERT INTO donors_donor_log VALUES (1724, '2013-01-01', 'FY13', 'USD', 4000, 94, 376000, '', 208);
INSERT INTO donors_donor_log VALUES (1725, '2013-01-01', 'FY13', 'USD', 243, 94, 22795, '', 42);
INSERT INTO donors_donor_log VALUES (1726, '2013-04-01', 'FY13', 'USD', 1000, 94, 94000, '', 115);
INSERT INTO donors_donor_log VALUES (1727, '2013-05-01', 'FY14', 'PKR', 398740, 1, 398740, '', 292);
INSERT INTO donors_donor_log VALUES (1728, '2013-07-01', 'FY14', 'PKR', 36750, 1, 36750, '', 360);
INSERT INTO donors_donor_log VALUES (1729, '2013-07-01', 'FY14', 'PKR', 10000, 1, 10000, '', 293);
INSERT INTO donors_donor_log VALUES (1730, '2013-07-01', 'FY14', 'PKR', 200000, 1, 200000, '', 259);
INSERT INTO donors_donor_log VALUES (1731, '2013-07-01', 'FY14', 'PKR', 500000, 1, 500000, '', 268);
INSERT INTO donors_donor_log VALUES (1732, '2013-07-01', 'FY14', 'PKR', 300000, 1, 300000, '', 40);
INSERT INTO donors_donor_log VALUES (1733, '2013-08-01', 'FY14', 'PKR', 23445, 1, 23445, '', 44);
INSERT INTO donors_donor_log VALUES (1734, '2013-08-01', 'FY14', 'PKR', 50000, 1, 50000, '', 36);
INSERT INTO donors_donor_log VALUES (1735, '2013-08-01', 'FY14', 'PKR', 100000, 1, 100000, '', 183);
INSERT INTO donors_donor_log VALUES (1736, '2013-08-01', 'FY14', 'PKR', 50000, 1, 50000, '', 275);
INSERT INTO donors_donor_log VALUES (1737, '2013-08-01', 'FY14', 'PKR', 18000, 1, 18000, '', 232);
INSERT INTO donors_donor_log VALUES (1738, '2013-08-01', 'FY14', 'PKR', 5150, 1, 5150, '', 314);
INSERT INTO donors_donor_log VALUES (1739, '2013-08-01', 'FY14', 'PKR', 100000, 1, 100000, '', 198);
INSERT INTO donors_donor_log VALUES (1740, '2013-08-01', 'FY14', 'PKR', 100000, 1, 100000, '', 205);
INSERT INTO donors_donor_log VALUES (1741, '2013-08-01', 'FY14', 'PKR', 200000, 1, 200000, '', 248);
INSERT INTO donors_donor_log VALUES (1742, '2013-08-01', 'FY14', 'PKR', 50000, 1, 50000, '', 18);
INSERT INTO donors_donor_log VALUES (1743, '2013-08-01', 'FY14', 'PKR', 5000, 1, 5000, '', 325);
INSERT INTO donors_donor_log VALUES (1744, '2013-08-01', 'FY14', 'PKR', 25000, 1, 25000, '', 328);
INSERT INTO donors_donor_log VALUES (1745, '2013-08-01', 'FY14', 'PKR', 200000, 1, 200000, '', 281);
INSERT INTO donors_donor_log VALUES (1746, '2013-08-01', 'FY14', 'PKR', 150000, 1, 150000, '', 329);
INSERT INTO donors_donor_log VALUES (1747, '2013-08-01', 'FY14', 'PKR', 20500, 1, 20500, '', 308);
INSERT INTO donors_donor_log VALUES (1748, '2013-08-01', 'FY14', 'PKR', 125000, 1, 125000, '', 212);
INSERT INTO donors_donor_log VALUES (1749, '2013-08-01', 'FY14', 'PKR', 45000, 1, 45000, '', 17);
INSERT INTO donors_donor_log VALUES (1750, '2013-08-01', 'FY14', 'PKR', 20000, 1, 20000, '', 296);
INSERT INTO donors_donor_log VALUES (1751, '2013-08-01', 'FY14', 'PKR', 6500, 1, 6500, '', 350);
INSERT INTO donors_donor_log VALUES (1752, '2013-09-01', 'FY14', 'PKR', 75000, 1, 75000, '', 153);
INSERT INTO donors_donor_log VALUES (1753, '2013-09-01', 'FY14', 'PKR', 500, 1, 500, '', 325);
INSERT INTO donors_donor_log VALUES (1754, '2013-09-01', 'FY14', 'PKR', 10000, 1, 10000, '', 63);
INSERT INTO donors_donor_log VALUES (1755, '2013-09-01', 'FY14', 'PKR', 17068, 1, 17068, '', 14);
INSERT INTO donors_donor_log VALUES (1756, '2013-09-01', 'FY14', 'PKR', 17068, 1, 17068, '', 279);
INSERT INTO donors_donor_log VALUES (1757, '2013-09-01', 'FY14', 'PKR', 31034, 1, 31034, '', 118);
INSERT INTO donors_donor_log VALUES (1758, '2013-09-01', 'FY14', 'PKR', 16500, 1, 16500, '', 213);
INSERT INTO donors_donor_log VALUES (1759, '2013-09-01', 'FY14', 'PKR', 11000, 1, 11000, '', 332);
INSERT INTO donors_donor_log VALUES (1760, '2013-09-01', 'FY14', 'PKR', 1500, 1, 1500, '', 35);
INSERT INTO donors_donor_log VALUES (1761, '2013-09-01', 'FY14', 'PKR', 100000, 1, 100000, '', 313);
INSERT INTO donors_donor_log VALUES (1762, '2013-09-01', 'FY14', 'PKR', 5000, 1, 5000, '', 120);
INSERT INTO donors_donor_log VALUES (1763, '2013-09-01', 'FY14', 'PKR', 3000, 1, 3000, '', 28);
INSERT INTO donors_donor_log VALUES (1764, '2013-09-01', 'FY14', 'PKR', 3000, 1, 3000, '', 28);
INSERT INTO donors_donor_log VALUES (1765, '2013-09-01', 'FY14', 'PKR', 3000, 1, 3000, '', 28);
INSERT INTO donors_donor_log VALUES (1766, '2013-09-01', 'FY14', 'PKR', 10000, 1, 10000, '', 20);
INSERT INTO donors_donor_log VALUES (1767, '2013-09-01', 'FY14', 'PKR', 6000, 1, 6000, '', 13);
INSERT INTO donors_donor_log VALUES (1768, '2013-09-01', 'FY14', 'PKR', 6000, 1, 6000, '', 13);
INSERT INTO donors_donor_log VALUES (1769, '2013-09-01', 'FY14', 'PKR', 3000, 1, 3000, '', 28);
INSERT INTO donors_donor_log VALUES (1770, '2013-09-01', 'FY14', 'PKR', 3000, 1, 3000, '', 28);
INSERT INTO donors_donor_log VALUES (1771, '2013-09-01', 'FY14', 'PKR', 7000, 1, 7000, '', 13);
INSERT INTO donors_donor_log VALUES (1772, '2013-09-01', 'FY14', 'PKR', 7000, 1, 7000, '', 13);
INSERT INTO donors_donor_log VALUES (1773, '2013-09-01', 'FY14', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1774, '2013-09-01', 'FY14', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1775, '2013-09-01', 'FY14', 'PKR', 30000, 1, 30000, '', 237);
INSERT INTO donors_donor_log VALUES (1776, '2013-09-01', 'FY14', 'PKR', 15000, 1, 15000, '', 88);
INSERT INTO donors_donor_log VALUES (1777, '2013-09-01', 'FY14', 'PKR', 10000, 1, 10000, '', 262);
INSERT INTO donors_donor_log VALUES (1778, '2013-09-01', 'FY14', 'PKR', 25000, 1, 25000, '', 126);
INSERT INTO donors_donor_log VALUES (1779, '2013-09-01', 'FY14', 'PKR', 10000, 1, 10000, '', 74);
INSERT INTO donors_donor_log VALUES (1780, '2013-09-01', 'FY14', 'PKR', 12000, 1, 12000, '', 210);
INSERT INTO donors_donor_log VALUES (1781, '2013-09-01', 'FY14', 'PKR', 500, 1, 500, '', 65);
INSERT INTO donors_donor_log VALUES (1782, '2013-09-01', 'FY14', 'PKR', 3800, 1, 3800, '', 38);
INSERT INTO donors_donor_log VALUES (1783, '2013-09-01', 'FY14', 'PKR', 1200, 1, 1200, '', 126);
INSERT INTO donors_donor_log VALUES (1784, '2013-09-01', 'FY14', 'PKR', 6000, 1, 6000, '', 140);
INSERT INTO donors_donor_log VALUES (1785, '2013-10-01', 'FY14', 'PKR', 36000, 1, 36000, '', 229);
INSERT INTO donors_donor_log VALUES (1786, '2013-11-01', 'FY14', 'PKR', 6000, 1, 6000, '', 252);
INSERT INTO donors_donor_log VALUES (1787, '2013-11-01', 'FY14', 'PKR', 30000, 1, 30000, '', 200);
INSERT INTO donors_donor_log VALUES (1788, '2013-11-01', 'FY14', 'PKR', 72000, 1, 72000, '', 10);
INSERT INTO donors_donor_log VALUES (1789, '2013-11-01', 'FY14', 'PKR', 10000, 1, 10000, '', 299);
INSERT INTO donors_donor_log VALUES (1790, '2013-12-01', 'FY14', 'PKR', 287840, 1, 287840, '', 78);
INSERT INTO donors_donor_log VALUES (1791, '2013-12-01', 'FY14', 'PKR', 50000, 1, 50000, '', 205);
INSERT INTO donors_donor_log VALUES (1792, '2013-12-01', 'FY14', 'PKR', 500000, 1, 500000, '', 248);
INSERT INTO donors_donor_log VALUES (1793, '2013-12-01', 'FY14', 'PKR', 100000, 1, 100000, '', 153);
INSERT INTO donors_donor_log VALUES (1794, '2013-12-01', 'FY14', 'PKR', 1000, 1, 1000, '', 35);
INSERT INTO donors_donor_log VALUES (1795, '2013-12-01', 'FY14', 'PKR', 100000, 1, 100000, '', 259);
INSERT INTO donors_donor_log VALUES (1796, '2013-12-01', 'FY14', 'PKR', 5500, 1, 5500, '', 58);
INSERT INTO donors_donor_log VALUES (1797, '2014-01-01', 'FY14', 'PKR', 58000, 1, 58000, '', 162);
INSERT INTO donors_donor_log VALUES (1798, '2014-01-01', 'FY14', 'PKR', 100000, 1, 100000, '', 104);
INSERT INTO donors_donor_log VALUES (1799, '2014-02-01', 'FY14', 'PKR', 1000, 1, 1000, '', 191);
INSERT INTO donors_donor_log VALUES (1800, '2014-02-01', 'FY14', 'PKR', 70000, 1, 70000, '', 166);
INSERT INTO donors_donor_log VALUES (1801, '2014-02-01', 'FY14', 'PKR', 25000, 1, 25000, '', 222);
INSERT INTO donors_donor_log VALUES (1802, '2014-02-01', 'FY14', 'PKR', 10000, 1, 10000, '', 112);
INSERT INTO donors_donor_log VALUES (1803, '2014-02-01', 'FY14', 'PKR', 100000, 1, 100000, '', 296);
INSERT INTO donors_donor_log VALUES (1804, '2014-02-01', 'FY14', 'PKR', 500000, 1, 500000, '', 264);
INSERT INTO donors_donor_log VALUES (1805, '2014-03-01', 'FY14', 'PKR', 250000, 1, 250000, '', 301);
INSERT INTO donors_donor_log VALUES (1806, '2014-03-01', 'FY14', 'PKR', 50000, 1, 50000, '', 152);
INSERT INTO donors_donor_log VALUES (1807, '2014-03-01', 'FY14', 'PKR', 35000, 1, 35000, '', 360);
INSERT INTO donors_donor_log VALUES (1808, '2014-03-01', 'FY14', 'PKR', 175000, 1, 175000, '', 68);
INSERT INTO donors_donor_log VALUES (1809, '2014-03-01', 'FY14', 'PKR', 15000, 1, 15000, '', 63);
INSERT INTO donors_donor_log VALUES (1810, '2014-03-01', 'FY14', 'PKR', 4500, 1, 4500, '', 58);
INSERT INTO donors_donor_log VALUES (1811, '2014-03-01', 'FY14', 'PKR', 10000, 1, 10000, '', 223);
INSERT INTO donors_donor_log VALUES (1812, '2014-03-01', 'FY14', 'PKR', 11000, 1, 11000, '', 245);
INSERT INTO donors_donor_log VALUES (1813, '2014-03-01', 'FY14', 'PKR', 35000, 1, 35000, '', 338);
INSERT INTO donors_donor_log VALUES (1814, '2014-03-01', 'FY14', 'PKR', 50000, 1, 50000, '', 93);
INSERT INTO donors_donor_log VALUES (1815, '2014-03-01', 'FY14', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1816, '2014-03-01', 'FY14', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1817, '2014-03-01', 'FY14', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1818, '2014-03-01', 'FY14', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1819, '2014-03-01', 'FY14', 'PKR', 30000, 1, 30000, '', 166);
INSERT INTO donors_donor_log VALUES (1820, '2014-03-01', 'FY14', 'PKR', 920409, 1, 920409, '', 208);
INSERT INTO donors_donor_log VALUES (1821, '2014-04-01', 'FY14', 'PKR', 50000, 1, 50000, '', 44);
INSERT INTO donors_donor_log VALUES (1822, '2014-05-01', 'FY14', 'PKR', 50000, 1, 50000, '', 153);
INSERT INTO donors_donor_log VALUES (1823, '2014-05-01', 'FY14', 'PKR', 10000, 1, 10000, '', 44);
INSERT INTO donors_donor_log VALUES (1824, '2014-05-01', 'FY14', 'PKR', 26330, 1, 26330, '', 44);
INSERT INTO donors_donor_log VALUES (1825, '2014-05-01', 'FY14', 'PKR', 5000, 1, 5000, '', 341);
INSERT INTO donors_donor_log VALUES (1826, '2014-05-01', 'FY14', 'PKR', 50000, 1, 50000, '', 220);
INSERT INTO donors_donor_log VALUES (1827, '2014-06-01', 'FY14', 'PKR', 11000, 1, 11000, '', 175);
INSERT INTO donors_donor_log VALUES (1828, '2014-06-01', 'FY14', 'PKR', 69500, 1, 69500, '', 44);
INSERT INTO donors_donor_log VALUES (1829, '2014-06-01', 'FY14', 'PKR', 3000, 1, 3000, '', 44);
INSERT INTO donors_donor_log VALUES (1830, '2014-06-01', 'FY14', 'PKR', 300000, 1, 300000, '', 40);
INSERT INTO donors_donor_log VALUES (1831, '2014-06-01', 'FY14', 'PKR', 30000, 1, 30000, '', 308);
INSERT INTO donors_donor_log VALUES (1832, '2014-06-01', 'FY14', 'PKR', 340000, 1, 340000, '', 208);
INSERT INTO donors_donor_log VALUES (1833, '2014-06-01', 'FY14', 'PKR', 200000, 1, 200000, '', 259);
INSERT INTO donors_donor_log VALUES (1834, '2014-06-01', 'FY14', 'PKR', 28000, 1, 28000, '', 156);
INSERT INTO donors_donor_log VALUES (1835, '2014-06-01', 'FY14', 'PKR', 59500, 1, 59500, '', 150);
INSERT INTO donors_donor_log VALUES (1836, '2014-06-01', 'FY14', 'PKR', 147670, 1, 147670, '', 81);
INSERT INTO donors_donor_log VALUES (1837, '2013-08-01', 'FY14', 'USD', 1300, 100, 130000, '', 119);
INSERT INTO donors_donor_log VALUES (1838, '2013-08-01', 'FY14', 'USD', 250, 100, 25000, '', 250);
INSERT INTO donors_donor_log VALUES (1839, '2013-08-01', 'FY14', 'USD', 1000, 100, 100000, '', 138);
INSERT INTO donors_donor_log VALUES (1840, '2013-08-01', 'FY14', 'USD', 1000, 100, 100000, '', 92);
INSERT INTO donors_donor_log VALUES (1841, '2013-08-01', 'FY14', 'USD', 1000, 100, 100000, '', 92);
INSERT INTO donors_donor_log VALUES (1842, '2013-08-01', 'FY14', 'USD', 200, 100, 20000, '', 96);
INSERT INTO donors_donor_log VALUES (1843, '2013-08-01', 'FY14', 'USD', 100, 100, 10000, '', 111);
INSERT INTO donors_donor_log VALUES (1844, '2013-08-01', 'FY14', 'USD', 250, 100, 25000, '', 176);
INSERT INTO donors_donor_log VALUES (1845, '2013-08-01', 'FY14', 'USD', 100, 100, 10000, '', 14);
INSERT INTO donors_donor_log VALUES (1846, '2013-08-01', 'FY14', 'USD', 200, 100, 20000, '', 225);
INSERT INTO donors_donor_log VALUES (1847, '2013-08-01', 'FY14', 'USD', 500, 100, 50000, '', 264);
INSERT INTO donors_donor_log VALUES (1848, '2013-11-01', 'FY14', 'USD', 293, 100, 29300, '', 44);
INSERT INTO donors_donor_log VALUES (1849, '2014-01-01', 'FY14', 'USD', 300, 100, 30000, '', 261);
INSERT INTO donors_donor_log VALUES (1850, '2014-01-01', 'FY14', 'USD', 1650, 100, 165000, '', 27);
INSERT INTO donors_donor_log VALUES (1851, '2014-01-01', 'FY14', 'USD', 250, 100, 25000, '', 157);
INSERT INTO donors_donor_log VALUES (1852, '2014-01-01', 'FY14', 'USD', 1500, 100, 150000, '', 281);
INSERT INTO donors_donor_log VALUES (1853, '2014-01-01', 'FY14', 'USD', 1000, 100, 100000, '', 192);
INSERT INTO donors_donor_log VALUES (1854, '2014-04-01', 'FY14', 'USD', 600, 100, 60000, '', 44);
INSERT INTO donors_donor_log VALUES (1855, '2014-04-01', 'FY14', 'USD', 1500, 100, 150000, '', 138);
INSERT INTO donors_donor_log VALUES (1856, '2014-05-01', 'FY14', 'USD', 1650, 100, 165000, '', 44);
INSERT INTO donors_donor_log VALUES (1857, '2014-05-01', 'FY15', 'PKR', 646510, 1, 646510, '', 292);
INSERT INTO donors_donor_log VALUES (1858, '2014-07-01', 'FY15', 'PKR', 20000, 1, 20000, '', 153);
INSERT INTO donors_donor_log VALUES (1859, '2014-07-01', 'FY15', 'PKR', 50000, 1, 50000, '', 153);
INSERT INTO donors_donor_log VALUES (1860, '2014-07-01', 'FY15', 'PKR', 28920, 1, 28920, '', 11);
INSERT INTO donors_donor_log VALUES (1861, '2014-07-01', 'FY15', 'PKR', 30000, 1, 30000, '', 147);
INSERT INTO donors_donor_log VALUES (1862, '2014-07-01', 'FY15', 'PKR', 20000, 1, 20000, '', 349);
INSERT INTO donors_donor_log VALUES (1863, '2014-07-01', 'FY15', 'PKR', 500000, 1, 500000, '', 268);
INSERT INTO donors_donor_log VALUES (1864, '2014-07-01', 'FY15', 'PKR', 200000, 1, 200000, '', 153);
INSERT INTO donors_donor_log VALUES (1865, '2014-07-01', 'FY15', 'PKR', 250000, 1, 250000, '', 259);
INSERT INTO donors_donor_log VALUES (1866, '2014-08-01', 'FY15', 'PKR', 250000, 1, 250000, '', 183);
INSERT INTO donors_donor_log VALUES (1867, '2014-08-01', 'FY15', 'PKR', 500000, 1, 500000, '', 248);
INSERT INTO donors_donor_log VALUES (1868, '2014-08-01', 'FY15', 'PKR', 100000, 1, 100000, '', 205);
INSERT INTO donors_donor_log VALUES (1869, '2014-08-01', 'FY15', 'PKR', 10000, 1, 10000, '', 314);
INSERT INTO donors_donor_log VALUES (1870, '2014-08-01', 'FY15', 'PKR', 50000, 1, 50000, '', 19);
INSERT INTO donors_donor_log VALUES (1871, '2014-08-01', 'FY15', 'PKR', 50000, 1, 50000, '', 30);
INSERT INTO donors_donor_log VALUES (1872, '2014-08-01', 'FY15', 'PKR', 50000, 1, 50000, '', 15);
INSERT INTO donors_donor_log VALUES (1873, '2014-08-01', 'FY15', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1874, '2014-08-01', 'FY15', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1875, '2014-08-01', 'FY15', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1876, '2014-08-01', 'FY15', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (1877, '2014-08-01', 'FY15', 'PKR', 10000, 1, 10000, '', 105);
INSERT INTO donors_donor_log VALUES (1878, '2014-08-01', 'FY15', 'PKR', 2000, 1, 2000, '', 37);
INSERT INTO donors_donor_log VALUES (1879, '2014-08-01', 'FY15', 'PKR', 2000, 1, 2000, '', 37);
INSERT INTO donors_donor_log VALUES (1880, '2014-08-01', 'FY15', 'PKR', 2000, 1, 2000, '', 37);
INSERT INTO donors_donor_log VALUES (1881, '2014-08-01', 'FY15', 'PKR', 2000, 1, 2000, '', 37);
INSERT INTO donors_donor_log VALUES (1882, '2014-08-01', 'FY15', 'PKR', 190000, 1, 190000, '', 296);
INSERT INTO donors_donor_log VALUES (1883, '2014-08-01', 'FY15', 'PKR', 10000, 1, 10000, '', 296);
INSERT INTO donors_donor_log VALUES (1884, '2014-09-01', 'FY15', 'PKR', 100000, 1, 100000, '', 281);
INSERT INTO donors_donor_log VALUES (1885, '2014-09-01', 'FY15', 'PKR', 25000, 1, 25000, '', 58);
INSERT INTO donors_donor_log VALUES (1886, '2014-10-01', 'FY15', 'PKR', 5670, 1, 5670, '', 283);
INSERT INTO donors_donor_log VALUES (1887, '2014-11-01', 'FY15', 'PKR', 140000, 1, 140000, '', 181);
INSERT INTO donors_donor_log VALUES (1888, '2014-11-01', 'FY15', 'PKR', 8000, 1, 8000, '', 174);
INSERT INTO donors_donor_log VALUES (1889, '2014-11-01', 'FY15', 'PKR', 8000, 1, 8000, '', 46);
INSERT INTO donors_donor_log VALUES (1890, '2014-11-01', 'FY15', 'PKR', 500, 1, 500, '', 35);
INSERT INTO donors_donor_log VALUES (1891, '2014-11-01', 'FY15', 'PKR', 28000, 1, 28000, '', 181);
INSERT INTO donors_donor_log VALUES (1892, '2014-11-01', 'FY15', 'PKR', 100000, 1, 100000, '', 259);
INSERT INTO donors_donor_log VALUES (1893, '2014-12-01', 'FY15', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (1894, '2014-12-01', 'FY15', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (1895, '2014-12-01', 'FY15', 'PKR', 50000, 1, 50000, '', 38);
INSERT INTO donors_donor_log VALUES (1896, '2014-12-01', 'FY15', 'PKR', 75000, 1, 75000, '', 153);
INSERT INTO donors_donor_log VALUES (1897, '2014-12-01', 'FY15', 'PKR', 5000, 1, 5000, '', 326);
INSERT INTO donors_donor_log VALUES (1898, '2014-12-01', 'FY15', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (1899, '2014-12-01', 'FY15', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (1900, '2014-12-01', 'FY15', 'PKR', 16000, 1, 16000, '', 360);
INSERT INTO donors_donor_log VALUES (1901, '2014-12-01', 'FY15', 'PKR', 11570, 1, 11570, '', 236);
INSERT INTO donors_donor_log VALUES (1902, '2014-12-01', 'FY15', 'PKR', 5680, 1, 5680, '', 44);
INSERT INTO donors_donor_log VALUES (1903, '2014-12-01', 'FY15', 'PKR', 5000, 1, 5000, '', 147);
INSERT INTO donors_donor_log VALUES (1904, '2015-01-01', 'FY15', 'PKR', 100000, 1, 100000, '', 104);
INSERT INTO donors_donor_log VALUES (1905, '2015-01-01', 'FY15', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (1906, '2015-01-01', 'FY15', 'PKR', 650000, 1, 650000, '', 208);
INSERT INTO donors_donor_log VALUES (1907, '2015-01-01', 'FY15', 'PKR', 45600, 1, 45600, '', 280);
INSERT INTO donors_donor_log VALUES (1908, '2015-01-01', 'FY15', 'PKR', 11000, 1, 11000, '', 360);
INSERT INTO donors_donor_log VALUES (1909, '2015-02-01', 'FY15', 'PKR', 6500, 1, 6500, '', 44);
INSERT INTO donors_donor_log VALUES (1910, '2015-02-01', 'FY15', 'PKR', 2270, 1, 2270, '', 80);
INSERT INTO donors_donor_log VALUES (1911, '2015-03-01', 'FY15', 'PKR', 7126, 1, 7126, '', 80);
INSERT INTO donors_donor_log VALUES (1912, '2015-03-01', 'FY15', 'PKR', 100000, 1, 100000, '', 301);
INSERT INTO donors_donor_log VALUES (1913, '2015-02-01', 'FY15', 'PKR', 60000, 1, 60000, '', 158);
INSERT INTO donors_donor_log VALUES (1914, '2015-02-01', 'FY15', 'PKR', 2800, 1, 2800, '', 44);
INSERT INTO donors_donor_log VALUES (1915, '2015-02-01', 'FY15', 'PKR', 50000, 1, 50000, '', 326);
INSERT INTO donors_donor_log VALUES (1916, '2015-02-01', 'FY15', 'PKR', 20000, 1, 20000, '', 161);
INSERT INTO donors_donor_log VALUES (1917, '2015-02-01', 'FY15', 'PKR', 60000, 1, 60000, '', 326);
INSERT INTO donors_donor_log VALUES (1918, '2015-03-01', 'FY15', 'PKR', 50000, 1, 50000, '', 31);
INSERT INTO donors_donor_log VALUES (1919, '2015-03-01', 'FY15', 'PKR', 56500, 1, 56500, '', 44);
INSERT INTO donors_donor_log VALUES (1920, '2015-04-01', 'FY15', 'PKR', 10000, 1, 10000, '', 44);
INSERT INTO donors_donor_log VALUES (1921, '2015-04-01', 'FY15', 'PKR', 25000, 1, 25000, '', 44);
INSERT INTO donors_donor_log VALUES (1922, '2015-04-01', 'FY15', 'PKR', 25000, 1, 25000, '', 44);
INSERT INTO donors_donor_log VALUES (1923, '2015-04-01', 'FY15', 'PKR', 180000, 1, 180000, '', 44);
INSERT INTO donors_donor_log VALUES (1924, '2015-04-01', 'FY15', 'PKR', 50000, 1, 50000, '', 44);
INSERT INTO donors_donor_log VALUES (1925, '2015-04-01', 'FY15', 'PKR', 18000, 1, 18000, '', 44);
INSERT INTO donors_donor_log VALUES (1926, '2015-04-01', 'FY15', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (1927, '2015-04-01', 'FY15', 'PKR', 15000, 1, 15000, '', 44);
INSERT INTO donors_donor_log VALUES (1928, '2015-04-01', 'FY15', 'PKR', 13000, 1, 13000, '', 44);
INSERT INTO donors_donor_log VALUES (1929, '2015-04-01', 'FY15', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (1930, '2015-04-01', 'FY15', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (1931, '2015-04-01', 'FY15', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (1932, '2015-04-01', 'FY15', 'PKR', 3000, 1, 3000, '', 44);
INSERT INTO donors_donor_log VALUES (1933, '2015-05-01', 'FY15', 'PKR', 6500, 1, 6500, '', 44);
INSERT INTO donors_donor_log VALUES (1934, '2015-05-01', 'FY15', 'PKR', 3500, 1, 3500, '', 44);
INSERT INTO donors_donor_log VALUES (1935, '2015-05-01', 'FY15', 'PKR', 6500, 1, 6500, '', 44);
INSERT INTO donors_donor_log VALUES (1936, '2015-05-01', 'FY15', 'PKR', 10000, 1, 10000, '', 44);
INSERT INTO donors_donor_log VALUES (1937, '2015-05-01', 'FY15', 'PKR', 50000, 1, 50000, '', 44);
INSERT INTO donors_donor_log VALUES (1938, '2015-05-01', 'FY15', 'PKR', 19500, 1, 19500, '', 160);
INSERT INTO donors_donor_log VALUES (1939, '2015-05-01', 'FY15', 'PKR', 10000, 1, 10000, '', 323);
INSERT INTO donors_donor_log VALUES (1940, '2015-05-01', 'FY15', 'PKR', 65000, 1, 65000, '', 44);
INSERT INTO donors_donor_log VALUES (1941, '2015-05-01', 'FY15', 'PKR', 500000, 1, 500000, '', 208);
INSERT INTO donors_donor_log VALUES (1942, '2015-05-01', 'FY15', 'PKR', 700000, 1, 700000, '', 208);
INSERT INTO donors_donor_log VALUES (1943, '2015-05-01', 'FY15', 'PKR', 32500, 1, 32500, '', 44);
INSERT INTO donors_donor_log VALUES (1944, '2015-05-01', 'FY15', 'PKR', 50000, 1, 50000, '', 44);
INSERT INTO donors_donor_log VALUES (1945, '2015-05-01', 'FY15', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (1946, '2015-05-01', 'FY15', 'PKR', 6500, 1, 6500, '', 44);
INSERT INTO donors_donor_log VALUES (1947, '2015-05-01', 'FY15', 'PKR', 3000, 1, 3000, '', 336);
INSERT INTO donors_donor_log VALUES (1948, '2015-05-01', 'FY15', 'PKR', 11130, 1, 11130, '', 219);
INSERT INTO donors_donor_log VALUES (1949, '2015-05-01', 'FY15', 'PKR', 5000, 1, 5000, '', 342);
INSERT INTO donors_donor_log VALUES (1950, '2015-05-01', 'FY15', 'PKR', 25000, 1, 25000, '', 73);
INSERT INTO donors_donor_log VALUES (1951, '2015-05-01', 'FY15', 'PKR', 6500, 1, 6500, '', 110);
INSERT INTO donors_donor_log VALUES (1952, '2015-06-01', 'FY15', 'PKR', 40000, 1, 40000, '', 337);
INSERT INTO donors_donor_log VALUES (1953, '2015-06-01', 'FY15', 'PKR', 100000, 1, 100000, '', 153);
INSERT INTO donors_donor_log VALUES (1954, '2015-06-01', 'FY15', 'PKR', 100000, 1, 100000, '', 153);
INSERT INTO donors_donor_log VALUES (1955, '2015-06-01', 'FY15', 'PKR', 120000, 1, 120000, '', 265);
INSERT INTO donors_donor_log VALUES (1956, '2015-06-01', 'FY15', 'PKR', 26000, 1, 26000, '', 160);
INSERT INTO donors_donor_log VALUES (1957, '2015-06-01', 'FY15', 'PKR', 3500, 1, 3500, '', 60);
INSERT INTO donors_donor_log VALUES (1958, '2015-06-01', 'FY15', 'PKR', 300000, 1, 300000, '', 259);
INSERT INTO donors_donor_log VALUES (1959, '2015-06-01', 'FY15', 'PKR', 15000, 1, 15000, '', 270);
INSERT INTO donors_donor_log VALUES (1960, '2015-06-01', 'FY15', 'PKR', 70000, 1, 70000, '', 147);
INSERT INTO donors_donor_log VALUES (1961, '2014-07-01', 'FY15', 'USD', 200, 100, 20000, '', 154);
INSERT INTO donors_donor_log VALUES (1962, '2014-07-01', 'FY15', 'USD', 2000, 100, 200000, '', 119);
INSERT INTO donors_donor_log VALUES (1963, '2014-07-01', 'FY15', 'USD', 1000, 100, 100000, '', 115);
INSERT INTO donors_donor_log VALUES (1964, '2014-07-01', 'FY15', 'USD', 500, 100, 50000, '', 290);
INSERT INTO donors_donor_log VALUES (1965, '2014-07-01', 'FY15', 'USD', 60, 100, 6000, '', 239);
INSERT INTO donors_donor_log VALUES (1966, '2014-07-01', 'FY15', 'USD', 200, 100, 20000, '', 96);
INSERT INTO donors_donor_log VALUES (1967, '2014-09-01', 'FY15', 'USD', 1000, 100, 100000, '', 98);
INSERT INTO donors_donor_log VALUES (1968, '2014-09-01', 'FY15', 'USD', 300, 100, 30000, '', 250);
INSERT INTO donors_donor_log VALUES (1969, '2014-11-01', 'FY15', 'USD', 3400, 100, 340000, '', 344);
INSERT INTO donors_donor_log VALUES (1970, '2014-11-01', 'FY15', 'USD', 1700, 100, 170000, '', 137);
INSERT INTO donors_donor_log VALUES (1971, '2015-01-01', 'FY15', 'USD', 10000, 100, 1000000, '', 343);
INSERT INTO donors_donor_log VALUES (1972, '2015-03-01', 'FY15', 'USD', 500, 100, 50000, '', 261);
INSERT INTO donors_donor_log VALUES (1973, '2015-03-01', 'FY15', 'USD', 500, 100, 50000, '', 203);
INSERT INTO donors_donor_log VALUES (1974, '2015-03-01', 'FY15', 'USD', 300, 100, 30000, '', 261);
INSERT INTO donors_donor_log VALUES (1975, '2015-03-01', 'FY15', 'USD', 200, 100, 20000, '', 195);
INSERT INTO donors_donor_log VALUES (1976, '2015-03-01', 'FY15', 'USD', 120, 100, 12000, '', 239);
INSERT INTO donors_donor_log VALUES (1977, '2015-03-01', 'FY15', 'USD', 1525, 100, 152500, '', 27);
INSERT INTO donors_donor_log VALUES (1978, '2015-03-01', 'FY15', 'USD', 100, 100, 10000, '', 266);
INSERT INTO donors_donor_log VALUES (1979, '2015-03-01', 'FY15', 'USD', 300, 100, 30000, '', 92);
INSERT INTO donors_donor_log VALUES (1980, '2015-06-01', 'FY15', 'USD', 973, 100, 97300, '', 143);
INSERT INTO donors_donor_log VALUES (1981, '2015-05-01', 'FY16', 'PKR', 95000, 1, 95000, '', 121);
INSERT INTO donors_donor_log VALUES (1982, '2015-05-01', 'FY16', 'PKR', 942830, 1, 942830, '', 292);
INSERT INTO donors_donor_log VALUES (1983, '2015-07-01', 'FY16', 'PKR', 10000, 1, 10000, '', 323);
INSERT INTO donors_donor_log VALUES (1984, '2015-07-01', 'FY16', 'PKR', 52000, 1, 52000, '', 350);
INSERT INTO donors_donor_log VALUES (1985, '2015-07-01', 'FY16', 'PKR', 200000, 1, 200000, '', 183);
INSERT INTO donors_donor_log VALUES (1986, '2015-07-01', 'FY16', 'PKR', 100000, 1, 100000, '', 36);
INSERT INTO donors_donor_log VALUES (1987, '2015-07-01', 'FY16', 'PKR', 50000, 1, 50000, '', 275);
INSERT INTO donors_donor_log VALUES (1988, '2015-07-01', 'FY16', 'PKR', 500000, 1, 500000, '', 248);
INSERT INTO donors_donor_log VALUES (1989, '2015-07-01', 'FY16', 'PKR', 100000, 1, 100000, '', 205);
INSERT INTO donors_donor_log VALUES (1990, '2015-07-01', 'FY16', 'PKR', 25000, 1, 25000, '', 161);
INSERT INTO donors_donor_log VALUES (1991, '2015-07-01', 'FY16', 'PKR', 25000, 1, 25000, '', 188);
INSERT INTO donors_donor_log VALUES (1992, '2015-07-01', 'FY16', 'PKR', 60000, 1, 60000, '', 215);
INSERT INTO donors_donor_log VALUES (1993, '2015-07-01', 'FY16', 'PKR', 50000, 1, 50000, '', 31);
INSERT INTO donors_donor_log VALUES (1994, '2015-07-01', 'FY16', 'PKR', 300000, 1, 300000, '', 40);
INSERT INTO donors_donor_log VALUES (1995, '2015-07-01', 'FY16', 'PKR', 21000, 1, 21000, '', 87);
INSERT INTO donors_donor_log VALUES (1996, '2015-07-01', 'FY16', 'PKR', 9606, 1, 9606, '', 44);
INSERT INTO donors_donor_log VALUES (1997, '2015-07-01', 'FY16', 'PKR', 65000, 1, 65000, '', 44);
INSERT INTO donors_donor_log VALUES (1998, '2015-08-01', 'FY16', 'PKR', 10000, 1, 10000, '', 323);
INSERT INTO donors_donor_log VALUES (1999, '2015-05-01', 'FY16', 'PKR', 0, 1, 0, '', 166);
INSERT INTO donors_donor_log VALUES (2000, '2015-08-01', 'FY16', 'PKR', 350000, 1, 350000, '', 166);
INSERT INTO donors_donor_log VALUES (2001, '2015-08-01', 'FY16', 'PKR', 8000, 1, 8000, '', 60);
INSERT INTO donors_donor_log VALUES (2002, '2015-08-01', 'FY16', 'PKR', 4800, 1, 4800, '', 163);
INSERT INTO donors_donor_log VALUES (2003, '2015-08-01', 'FY16', 'PKR', 3500, 1, 3500, '', 44);
INSERT INTO donors_donor_log VALUES (2004, '2015-08-01', 'FY16', 'PKR', 145000, 1, 145000, '', 44);
INSERT INTO donors_donor_log VALUES (2005, '2015-08-01', 'FY16', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (2006, '2015-08-01', 'FY16', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (2007, '2015-08-01', 'FY16', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (2008, '2015-08-01', 'FY16', 'PKR', 6500, 1, 6500, '', 44);
INSERT INTO donors_donor_log VALUES (2009, '2015-08-01', 'FY16', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (2010, '2015-08-01', 'FY16', 'PKR', 25000, 1, 25000, '', 38);
INSERT INTO donors_donor_log VALUES (2011, '2015-09-01', 'FY16', 'PKR', 3500, 1, 3500, '', 44);
INSERT INTO donors_donor_log VALUES (2012, '2015-09-01', 'FY16', 'PKR', 10000, 1, 10000, '', 44);
INSERT INTO donors_donor_log VALUES (2013, '2015-09-01', 'FY16', 'PKR', 770000, 1, 770000, '', 104);
INSERT INTO donors_donor_log VALUES (2014, '2015-09-01', 'FY16', 'PKR', 31100, 1, 31100, '', 118);
INSERT INTO donors_donor_log VALUES (2015, '2015-09-01', 'FY16', 'PKR', 17100, 1, 17100, '', 14);
INSERT INTO donors_donor_log VALUES (2016, '2015-09-01', 'FY16', 'PKR', 17100, 1, 17100, '', 279);
INSERT INTO donors_donor_log VALUES (2017, '2015-09-01', 'FY16', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (2018, '2015-09-01', 'FY16', 'PKR', 500000, 1, 500000, '', 268);
INSERT INTO donors_donor_log VALUES (2019, '2015-10-01', 'FY16', 'PKR', 7000, 1, 7000, '', 216);
INSERT INTO donors_donor_log VALUES (2020, '2015-10-01', 'FY16', 'PKR', 48000, 1, 48000, '', 215);
INSERT INTO donors_donor_log VALUES (2021, '2015-10-01', 'FY16', 'PKR', 25000, 1, 25000, '', 308);
INSERT INTO donors_donor_log VALUES (2022, '2015-10-01', 'FY16', 'PKR', 50000, 1, 50000, '', 281);
INSERT INTO donors_donor_log VALUES (2023, '2015-10-01', 'FY16', 'PKR', 8000, 1, 8000, '', 335);
INSERT INTO donors_donor_log VALUES (2024, '2015-10-01', 'FY16', 'PKR', 50000, 1, 50000, '', 281);
INSERT INTO donors_donor_log VALUES (2025, '2015-10-01', 'FY16', 'PKR', 7000, 1, 7000, '', 44);
INSERT INTO donors_donor_log VALUES (2026, '2015-10-01', 'FY16', 'PKR', 150000, 1, 150000, '', 212);
INSERT INTO donors_donor_log VALUES (2027, '2015-11-01', 'FY16', 'PKR', 7000, 1, 7000, '', 110);
INSERT INTO donors_donor_log VALUES (2028, '2015-11-01', 'FY16', 'PKR', 87000, 1, 87000, '', 145);
INSERT INTO donors_donor_log VALUES (2029, '2015-11-01', 'FY16', 'PKR', 205140, 1, 205140, '', 316);
INSERT INTO donors_donor_log VALUES (2030, '2015-11-01', 'FY16', 'PKR', 5000, 1, 5000, '', 13);
INSERT INTO donors_donor_log VALUES (2031, '2015-11-01', 'FY16', 'PKR', 105000, 1, 105000, '', 194);
INSERT INTO donors_donor_log VALUES (2032, '2015-11-01', 'FY16', 'PKR', 9670, 1, 9670, '', 80);
INSERT INTO donors_donor_log VALUES (2033, '2015-11-01', 'FY16', 'PKR', 7000, 1, 7000, '', 44);
INSERT INTO donors_donor_log VALUES (2034, '2015-12-01', 'FY16', 'PKR', 48000, 1, 48000, '', 215);
INSERT INTO donors_donor_log VALUES (2035, '2015-12-01', 'FY16', 'PKR', 10000, 1, 10000, '', 234);
INSERT INTO donors_donor_log VALUES (2036, '2015-12-01', 'FY16', 'PKR', 10000, 1, 10000, '', 218);
INSERT INTO donors_donor_log VALUES (2037, '2015-12-01', 'FY16', 'PKR', 100000, 1, 100000, '', 296);
INSERT INTO donors_donor_log VALUES (2038, '2015-12-01', 'FY16', 'PKR', 50000, 1, 50000, '', 355);
INSERT INTO donors_donor_log VALUES (2039, '2015-12-01', 'FY16', 'PKR', 500000, 1, 500000, '', 179);
INSERT INTO donors_donor_log VALUES (2040, '2015-12-01', 'FY16', 'PKR', 160200, 1, 160200, '', 84);
INSERT INTO donors_donor_log VALUES (2041, '2015-12-01', 'FY16', 'PKR', 150000, 1, 150000, '', 57);
INSERT INTO donors_donor_log VALUES (2042, '2015-12-01', 'FY16', 'PKR', 160000, 1, 160000, '', 305);
INSERT INTO donors_donor_log VALUES (2043, '2015-12-01', 'FY16', 'PKR', 14300, 1, 14300, '', 316);
INSERT INTO donors_donor_log VALUES (2044, '2015-12-01', 'FY16', 'PKR', 50000, 1, 50000, '', 44);
INSERT INTO donors_donor_log VALUES (2045, '2016-01-01', 'FY16', 'PKR', 4600, 1, 4600, '', 295);
INSERT INTO donors_donor_log VALUES (2046, '2016-01-01', 'FY16', 'PKR', 7000, 1, 7000, '', 295);
INSERT INTO donors_donor_log VALUES (2047, '2016-01-01', 'FY16', 'PKR', 90000, 1, 90000, '', 215);
INSERT INTO donors_donor_log VALUES (2048, '2016-01-01', 'FY16', 'PKR', 25000, 1, 25000, '', 222);
INSERT INTO donors_donor_log VALUES (2049, '2016-01-01', 'FY16', 'PKR', 100000, 1, 100000, '', 13);
INSERT INTO donors_donor_log VALUES (2050, '2016-01-01', 'FY16', 'PKR', 50000, 1, 50000, '', 138);
INSERT INTO donors_donor_log VALUES (2051, '2016-01-01', 'FY16', 'PKR', 650000, 1, 650000, '', 208);
INSERT INTO donors_donor_log VALUES (2052, '2016-01-01', 'FY16', 'PKR', 100000, 1, 100000, '', 264);
INSERT INTO donors_donor_log VALUES (2053, '2016-02-01', 'FY16', 'PKR', 21000, 1, 21000, '', 260);
INSERT INTO donors_donor_log VALUES (2054, '2016-02-01', 'FY16', 'PKR', 48000, 1, 48000, '', 215);
INSERT INTO donors_donor_log VALUES (2055, '2016-02-01', 'FY16', 'PKR', 100000, 1, 100000, '', 337);
INSERT INTO donors_donor_log VALUES (2056, '2016-02-01', 'FY16', 'PKR', 394590, 1, 394590, '', 337);
INSERT INTO donors_donor_log VALUES (2057, '2016-03-01', 'FY16', 'PKR', 2000, 1, 2000, '', 116);
INSERT INTO donors_donor_log VALUES (2058, '2016-03-01', 'FY16', 'PKR', 30000, 1, 30000, '', 323);
INSERT INTO donors_donor_log VALUES (2059, '2016-03-01', 'FY16', 'PKR', 32320, 1, 32320, '', 165);
INSERT INTO donors_donor_log VALUES (2060, '2016-04-01', 'FY16', 'PKR', 20000, 1, 20000, '', 12);
INSERT INTO donors_donor_log VALUES (2061, '2016-05-01', 'FY16', 'PKR', 0, 1, 0, '', 326);
INSERT INTO donors_donor_log VALUES (2062, '2016-04-01', 'FY16', 'PKR', 7000, 1, 7000, '', 295);
INSERT INTO donors_donor_log VALUES (2063, '2016-04-01', 'FY16', 'PKR', 7000, 1, 7000, '', 272);
INSERT INTO donors_donor_log VALUES (2064, '2016-04-01', 'FY16', 'PKR', 100000, 1, 100000, '', 296);
INSERT INTO donors_donor_log VALUES (2065, '2016-04-01', 'FY16', 'PKR', 22300, 1, 22300, '', 91);
INSERT INTO donors_donor_log VALUES (2066, '2016-04-01', 'FY16', 'PKR', 7000, 1, 7000, '', 295);
INSERT INTO donors_donor_log VALUES (2067, '2016-05-01', 'FY16', 'PKR', 10000, 1, 10000, '', 44);
INSERT INTO donors_donor_log VALUES (2068, '2016-06-01', 'FY16', 'PKR', 203195, 1, 203195, '', 256);
INSERT INTO donors_donor_log VALUES (2069, '2016-06-01', 'FY16', 'PKR', 10000, 1, 10000, '', 323);
INSERT INTO donors_donor_log VALUES (2070, '2016-06-01', 'FY16', 'PKR', 10000, 1, 10000, '', 44);
INSERT INTO donors_donor_log VALUES (2071, '2016-06-01', 'FY16', 'PKR', 120000, 1, 120000, '', 265);
INSERT INTO donors_donor_log VALUES (2072, '2016-06-01', 'FY16', 'PKR', 55000, 1, 55000, '', 44);
INSERT INTO donors_donor_log VALUES (2073, '2016-06-01', 'FY16', 'PKR', 300000, 1, 300000, '', 259);
INSERT INTO donors_donor_log VALUES (2074, '2016-06-01', 'FY16', 'PKR', 500000, 1, 500000, '', 248);
INSERT INTO donors_donor_log VALUES (2075, '2016-06-01', 'FY16', 'PKR', 100000, 1, 100000, '', 205);
INSERT INTO donors_donor_log VALUES (2076, '2016-06-01', 'FY16', 'PKR', 200000, 1, 200000, '', 40);
INSERT INTO donors_donor_log VALUES (2077, '2016-06-01', 'FY16', 'PKR', 200000, 1, 200000, '', 183);
INSERT INTO donors_donor_log VALUES (2078, '2016-06-01', 'FY16', 'PKR', 100000, 1, 100000, '', 36);
INSERT INTO donors_donor_log VALUES (2079, '2016-06-01', 'FY16', 'PKR', 100000, 1, 100000, '', 275);
INSERT INTO donors_donor_log VALUES (2080, '2016-06-01', 'FY16', 'PKR', 5000, 1, 5000, '', 309);
INSERT INTO donors_donor_log VALUES (2081, '2016-06-01', 'FY16', 'PKR', 5000, 1, 5000, '', 201);
INSERT INTO donors_donor_log VALUES (2082, '2016-06-01', 'FY16', 'PKR', 50000, 1, 50000, '', 44);
INSERT INTO donors_donor_log VALUES (2083, '2016-06-01', 'FY16', 'PKR', 8000, 1, 8000, '', 361);
INSERT INTO donors_donor_log VALUES (2084, '2016-06-01', 'FY16', 'PKR', 150000, 1, 150000, '', 153);
INSERT INTO donors_donor_log VALUES (2085, '2016-06-01', 'FY16', 'PKR', 50000, 1, 50000, '', 350);
INSERT INTO donors_donor_log VALUES (2086, '2016-06-01', 'FY16', 'PKR', 25000, 1, 25000, '', 44);
INSERT INTO donors_donor_log VALUES (2087, '2016-06-01', 'FY16', 'PKR', 3980, 1, 3980, '', 80);
INSERT INTO donors_donor_log VALUES (2088, '2016-06-01', 'FY16', 'PKR', 750000, 1, 750000, '', 183);
INSERT INTO donors_donor_log VALUES (2089, '2016-06-01', 'FY16', 'PKR', 100000, 1, 100000, '', 281);
INSERT INTO donors_donor_log VALUES (2090, '2016-06-01', 'FY16', 'PKR', 131000, 1, 131000, '', 296);
INSERT INTO donors_donor_log VALUES (2091, '2016-06-01', 'FY16', 'PKR', 25000, 1, 25000, '', 58);
INSERT INTO donors_donor_log VALUES (2092, '2016-06-01', 'FY16', 'PKR', 21000, 1, 21000, '', 174);
INSERT INTO donors_donor_log VALUES (2093, '2015-07-01', 'FY16', 'USD', 200, 100, 20000, '', 44);
INSERT INTO donors_donor_log VALUES (2094, '2016-05-01', 'FY16', 'USD', 5, 105, 525, '', 80);
INSERT INTO donors_donor_log VALUES (2095, '2016-05-01', 'FY16', 'USD', 50, 100, 5000, '', 208);
INSERT INTO donors_donor_log VALUES (2096, '2016-05-01', 'FY16', 'USD', 1000, 100, 100000, '', 215);
INSERT INTO donors_donor_log VALUES (2097, '2016-05-01', 'FY16', 'USD', 1000, 100, 100000, '', 115);
INSERT INTO donors_donor_log VALUES (2098, '2016-05-01', 'FY16', 'USD', 2000, 100, 200000, '', 119);
INSERT INTO donors_donor_log VALUES (2099, '2016-05-01', 'FY16', 'USD', 1000, 100, 100000, '', 138);
INSERT INTO donors_donor_log VALUES (2100, '2016-05-01', 'FY16', 'USD', 1000, 100, 100000, '', 111);
INSERT INTO donors_donor_log VALUES (2101, '2015-06-01', 'FY16', 'USD', 1, 100, 0, '', 72);
INSERT INTO donors_donor_log VALUES (2102, '2015-06-01', 'FY16', 'USD', 200, 100, 20000, '', 169);
INSERT INTO donors_donor_log VALUES (2103, '2015-07-01', 'FY16', 'USD', 195, 100, 19500, '', 339);
INSERT INTO donors_donor_log VALUES (2104, '2015-07-01', 'FY16', 'USD', 200, 100, 20000, '', 96);
INSERT INTO donors_donor_log VALUES (2105, '2015-07-01', 'FY16', 'USD', 500, 100, 50000, '', 340);
INSERT INTO donors_donor_log VALUES (2106, '2015-07-01', 'FY16', 'USD', 500, 100, 50000, '', 150);
INSERT INTO donors_donor_log VALUES (2107, '2015-07-01', 'FY16', 'USD', 100, 100, 10000, '', 182);
INSERT INTO donors_donor_log VALUES (2108, '2015-07-01', 'FY16', 'USD', 700, 100, 70000, '', 312);
INSERT INTO donors_donor_log VALUES (2109, '2015-07-01', 'FY16', 'USD', 200, 100, 20000, '', 230);
INSERT INTO donors_donor_log VALUES (2110, '2015-07-01', 'FY16', 'USD', 350, 100, 35000, '', 103);
INSERT INTO donors_donor_log VALUES (2111, '2015-07-01', 'FY16', 'USD', 100, 100, 10000, '', 249);
INSERT INTO donors_donor_log VALUES (2112, '2015-07-01', 'FY16', 'USD', 1000, 100, 100000, '', 98);
INSERT INTO donors_donor_log VALUES (2113, '2015-07-01', 'FY16', 'USD', 250, 100, 25000, '', 107);
INSERT INTO donors_donor_log VALUES (2114, '2015-07-01', 'FY16', 'USD', 300, 100, 30000, '', 125);
INSERT INTO donors_donor_log VALUES (2115, '2015-07-01', 'FY16', 'USD', 210, 100, 21000, '', 269);
INSERT INTO donors_donor_log VALUES (2116, '2015-07-01', 'FY16', 'USD', 70, 100, 7000, '', 148);
INSERT INTO donors_donor_log VALUES (2117, '2015-07-01', 'FY16', 'USD', 70, 100, 7000, '', 180);
INSERT INTO donors_donor_log VALUES (2118, '2015-07-01', 'FY16', 'USD', 210, 100, 21000, '', 199);
INSERT INTO donors_donor_log VALUES (2119, '2015-07-01', 'FY16', 'USD', 1000, 100, 100000, '', 240);
INSERT INTO donors_donor_log VALUES (2120, '2015-07-01', 'FY16', 'USD', 300, 100, 30000, '', 97);
INSERT INTO donors_donor_log VALUES (2121, '2015-07-01', 'FY16', 'USD', 600, 100, 60000, '', 349);
INSERT INTO donors_donor_log VALUES (2122, '2015-07-01', 'FY16', 'USD', 350, 100, 35000, '', 273);
INSERT INTO donors_donor_log VALUES (2123, '2015-07-01', 'FY16', 'USD', 1000, 100, 100000, '', 250);
INSERT INTO donors_donor_log VALUES (2124, '2015-07-01', 'FY16', 'USD', 100, 100, 10000, '', 53);
INSERT INTO donors_donor_log VALUES (2125, '2015-08-01', 'FY16', 'USD', 350, 100, 35000, '', 226);
INSERT INTO donors_donor_log VALUES (2126, '2015-09-01', 'FY16', 'USD', 70, 100, 7000, '', 29);
INSERT INTO donors_donor_log VALUES (2127, '2015-12-01', 'FY16', 'USD', 200, 100, 20000, '', 243);
INSERT INTO donors_donor_log VALUES (2128, '2015-10-01', 'FY16', 'USD', 500, 100, 50000, '', 204);
INSERT INTO donors_donor_log VALUES (2129, '2015-11-01', 'FY16', 'USD', 120, 100, 12000, '', 178);
INSERT INTO donors_donor_log VALUES (2130, '2015-12-01', 'FY16', 'USD', 1100, 100, 110000, '', 208);
INSERT INTO donors_donor_log VALUES (2131, '2015-08-01', 'FY16', 'USD', 150, 100, 15000, '', 267);
INSERT INTO donors_donor_log VALUES (2132, '2015-05-01', 'FY17', 'PKR', 36926, 1, 36926, '', 69);
INSERT INTO donors_donor_log VALUES (2133, '2016-07-01', 'FY17', 'USD', 500, 100, 50000, '', 215);
INSERT INTO donors_donor_log VALUES (2134, '2016-05-01', 'FY17', 'PKR', 65333, 1, 65333, '', 121);
INSERT INTO donors_donor_log VALUES (2135, '2016-05-01', 'FY17', 'PKR', 388880, 1, 388880, '', 292);
INSERT INTO donors_donor_log VALUES (2136, '2016-07-01', 'FY17', 'PKR', 150000, 1, 150000, 'Pk-8 Monthly Donation', 153);
INSERT INTO donors_donor_log VALUES (2137, '2016-07-01', 'FY17', 'PKR', 67855, 1, 67855, '', 44);
INSERT INTO donors_donor_log VALUES (2138, '2016-07-01', 'FY17', 'PKR', 22500, 1, 22500, 'Students Sponsorship', 87);
INSERT INTO donors_donor_log VALUES (2139, '2016-07-01', 'FY17', 'PKR', 15000, 1, 15000, 'Students Sponsorship', 95);
INSERT INTO donors_donor_log VALUES (2140, '2016-07-01', 'FY17', 'PKR', 15000, 1, 15000, 'Students Sponsorship', 117);
INSERT INTO donors_donor_log VALUES (2141, '2016-07-01', 'FY17', 'PKR', 50000, 1, 50000, 'All Activities', 231);
INSERT INTO donors_donor_log VALUES (2142, '2016-08-01', 'FY17', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (2143, '2016-08-01', 'FY17', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (2144, '2016-08-01', 'FY17', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (2145, '2016-08-01', 'FY17', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (2146, '2016-08-01', 'FY17', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (2147, '2016-08-01', 'FY17', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (2148, '2016-08-01', 'FY17', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (2149, '2016-08-01', 'FY17', 'PKR', 100000, 1, 100000, '', 44);
INSERT INTO donors_donor_log VALUES (2150, '2016-08-01', 'FY17', 'PKR', 26000, 1, 26000, '', 44);
INSERT INTO donors_donor_log VALUES (2151, '2016-08-01', 'FY17', 'PKR', 200000, 1, 200000, '', 44);
INSERT INTO donors_donor_log VALUES (2152, '2016-08-01', 'FY17', 'PKR', 10000, 1, 10000, '', 44);
INSERT INTO donors_donor_log VALUES (2153, '2016-09-01', 'FY17', 'PKR', 300000, 1, 300000, 'All Activities', 268);
INSERT INTO donors_donor_log VALUES (2154, '2016-09-01', 'FY17', 'PKR', 7500, 1, 7500, 'Student Sponsorship', 175);
INSERT INTO donors_donor_log VALUES (2155, '2016-09-01', 'FY17', 'PKR', 10000, 1, 10000, 'All Activities', 323);
INSERT INTO donors_donor_log VALUES (2156, '2016-09-01', 'FY17', 'PKR', 60000, 1, 60000, 'All Activities', 215);
INSERT INTO donors_donor_log VALUES (2157, '2016-09-01', 'FY17', 'PKR', 60000, 1, 60000, 'All Activities', 215);
INSERT INTO donors_donor_log VALUES (2158, '2016-09-01', 'FY17', 'PKR', 7000, 1, 7000, '', 44);
INSERT INTO donors_donor_log VALUES (2159, '2016-10-01', 'FY17', 'PKR', 60000, 1, 60000, 'All Activities', 234);
INSERT INTO donors_donor_log VALUES (2160, '2016-10-01', 'FY17', 'PKR', 50000, 1, 50000, 'All Activities', 94);
INSERT INTO donors_donor_log VALUES (2161, '2016-10-01', 'FY17', 'PKR', 20000, 1, 20000, 'Bags & Books', 347);
INSERT INTO donors_donor_log VALUES (2162, '2016-10-01', 'FY17', 'PKR', 7420, 1, 7420, 'All Activities', 80);
INSERT INTO donors_donor_log VALUES (2163, '2016-10-01', 'FY17', 'PKR', 20000, 1, 20000, 'All Activities', 323);
INSERT INTO donors_donor_log VALUES (2164, '2016-10-01', 'FY17', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (2165, '2016-10-01', 'FY17', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (2166, '2016-10-01', 'FY17', 'PKR', 5000, 1, 5000, '', 44);
INSERT INTO donors_donor_log VALUES (2167, '2016-11-01', 'FY17', 'PKR', 7900, 1, 7900, 'Office Chairs', 60);
INSERT INTO donors_donor_log VALUES (2168, '2016-11-01', 'FY17', 'PKR', 150000, 1, 150000, 'All Activities', 300);
INSERT INTO donors_donor_log VALUES (2169, '2016-12-01', 'FY17', 'PKR', 3300, 1, 3300, 'Pk-7 Sports Day', 189);
INSERT INTO donors_donor_log VALUES (2170, '2016-12-01', 'FY17', 'PKR', 6000, 1, 6000, 'Pk-6 sweaters & Sports Day', 150);
INSERT INTO donors_donor_log VALUES (2171, '2015-08-01', 'FY17', 'USD', 150, 104, 15600, '', 267);
INSERT INTO donors_donor_log VALUES (2172, '2015-08-01', 'FY17', 'USD', 150, 104, 15600, '', 124);
INSERT INTO donors_donor_log VALUES (2173, '2016-05-01', 'FY17', 'USD', 1000, 104, 104000, '', 115);
INSERT INTO donors_donor_log VALUES (2174, '2016-06-01', 'FY17', 'USD', 6500, 104, 676000, '', 208);
INSERT INTO donors_donor_log VALUES (2175, '2016-06-01', 'FY17', 'USD', 500, 104, 52000, '', 92);
INSERT INTO donors_donor_log VALUES (2176, '2017-01-01', 'FY17', 'USD', 500, 104, 52000, '', 111);
INSERT INTO donors_donor_log VALUES (2177, '2016-06-01', 'FY17', 'USD', 1500, 104, 156000, '', 138);
INSERT INTO donors_donor_log VALUES (2178, '2016-06-01', 'FY17', 'USD', 1000, 104, 104000, '', 48);
INSERT INTO donors_donor_log VALUES (2179, '2017-01-01', 'FY17', 'USD', 200, 104, 20800, '', 217);
INSERT INTO donors_donor_log VALUES (2180, '2016-06-01', 'FY17', 'USD', 1000, 104, 104000, '', 92);
INSERT INTO donors_donor_log VALUES (2181, '2016-06-01', 'FY17', 'USD', 500, 104, 52000, '', 349);
INSERT INTO donors_donor_log VALUES (2182, '2016-07-01', 'FY17', 'USD', 225, 104, 23400, '', 96);
INSERT INTO donors_donor_log VALUES (2183, '2016-07-01', 'FY17', 'USD', 1000, 104, 104000, '', 98);
INSERT INTO donors_donor_log VALUES (2184, '2016-07-01', 'FY17', 'USD', 75, 104, 7800, '', 340);
INSERT INTO donors_donor_log VALUES (2185, '2016-07-01', 'FY17', 'USD', 75, 104, 7800, '', 340);
INSERT INTO donors_donor_log VALUES (2186, '2016-07-01', 'FY17', 'USD', 2000, 104, 208000, '', 119);
INSERT INTO donors_donor_log VALUES (2187, '2016-07-01', 'FY17', 'USD', 500, 104, 52000, '', 204);
INSERT INTO donors_donor_log VALUES (2188, '2016-08-01', 'FY17', 'USD', 75, 104, 7800, '', 252);
INSERT INTO donors_donor_log VALUES (2189, '2016-08-01', 'FY17', 'USD', 75, 104, 7800, '', 358);
INSERT INTO donors_donor_log VALUES (2190, '2016-09-01', 'FY17', 'USD', 1500, 104, 156000, '', 27);
INSERT INTO donors_donor_log VALUES (2191, '2016-09-01', 'FY17', 'USD', 200, 104, 20800, '', 226);
INSERT INTO donors_donor_log VALUES (2192, '2016-10-01', 'FY17', 'USD', 100, 104, 10400, '', 250);
INSERT INTO donors_donor_log VALUES (2193, '2017-01-01', 'FY17', 'USD', 1, 104, 0, '', 44);
INSERT INTO donors_donor_log VALUES (2194, '2017-01-01', 'FY17', 'USD', 1200, 104, 124800, '', 240);
INSERT INTO donors_donor_log VALUES (2195, '2016-10-01', 'FY17', 'USD', 500, 104, 52000, '', 155);
INSERT INTO donors_donor_log VALUES (2196, '2016-12-01', 'FY17', 'USD', 75, 104, 7800, '', 264);
INSERT INTO donors_donor_log VALUES (2197, '2016-12-01', 'FY17', 'USD', 75, 104, 7800, '', 264);
INSERT INTO donors_donor_log VALUES (2198, '2016-12-01', 'FY17', 'USD', 300, 104, 31200, '', 92);
INSERT INTO donors_donor_log VALUES (2199, '2016-07-01', 'FY17', 'USD', 270, 104, 28080, '', 195);
INSERT INTO donors_donor_log VALUES (2200, '2016-07-01', 'FY17', 'USD', 150, 104, 15600, '', 314);
INSERT INTO donors_donor_log VALUES (2201, '2016-11-01', 'FY17', 'USD', 75, 104, 7800, '', 214);
INSERT INTO donors_donor_log VALUES (2202, '2016-12-01', 'FY17', 'USD', 2000, 104, 208000, '', 251);
INSERT INTO donors_donor_log VALUES (2203, '2016-12-01', 'FY17', 'USD', 2000, 104, 208000, '', 138);
INSERT INTO donors_donor_log VALUES (2204, '2016-12-01', 'FY17', 'USD', 8000, 104, 832000, '', 208);
INSERT INTO donors_donor_log VALUES (2205, '2016-12-01', 'FY17', 'USD', 175, 104, 18200, '', 41);
INSERT INTO donors_donor_log VALUES (2206, '2016-12-01', 'FY17', 'USD', 100, 104, 10400, '', 277);
INSERT INTO donors_donor_log VALUES (2207, '2017-01-01', 'FY17', 'USD', 100, 104, 10400, '', 165);
INSERT INTO donors_donor_log VALUES (2208, '2017-01-01', 'FY17', 'USD', 300, 104, 31200, '', 92);


--
-- Name: donors_donor_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('donors_donor_log_id_seq', 2211, true);


--
-- Data for Name: schools_school; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO schools_school VALUES (1, 'PK1', 'something', 'isb', '2013-01-15', NULL);
INSERT INTO schools_school VALUES (2, 'PK2', 'sofkadjs', 'fkdsj', '2017-01-10', NULL);
INSERT INTO schools_school VALUES (3, 'PK3', 'something something something', 'faisalbd', '2005-01-17', NULL);
INSERT INTO schools_school VALUES (4, 'PK4', 'in the vicinity', 'lhr', '2009-01-17', NULL);
INSERT INTO schools_school VALUES (5, 'PK5', 'somewhere', 'Islamabad', '2017-01-10', NULL);
INSERT INTO schools_school VALUES (7, 'PK6', 'Abc', 'Isloo', '2017-02-01', 'recently opened');


--
-- Name: schools_school_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('schools_school_id_seq', 7, true);


--
-- Data for Name: students_student; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO students_student VALUES (1, 'john', 'snow', 'male', '2001-01-15', '', '', '', '', '', '', '', '2014-01-15', '', 1, 1, true, NULL, 1, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (2, 'hillary', 'clinton', 'female', '1995-01-15', '', '', '', '', '', '', '', '2007-01-15', '', 1, 1, true, NULL, 2, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (3, 'super', 'man', 'male', '2005-01-15', '', '', '', '', '', '', '', '2016-01-15', '', 2, 1, true, NULL, 3, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (4, 'barack', 'obama', 'female', '2005-01-15', '', '', '', '', '', '', '', '2017-01-15', '', 2, 1, true, NULL, 4, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (5, 'cat', 'woman', 'female', '1992-01-15', '', '', '', '', '', '', '', '2009-01-15', '', 3, 1, true, NULL, 5, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (6, 'bat', 'man', 'male', '2000-01-15', '', '', '', '', '', '', '', '2015-01-15', '', 3, 1, true, NULL, 6, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (7, 'spider', 'man', 'male', '1999-01-15', '', '', '', '', '', '', '', '2016-03-15', '', 3, 1, true, NULL, 7, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (8, 'johnny', 'depp', 'male', '2017-01-03', '', '', '', '', '', '', '', '2015-01-15', '', 4, 2, true, NULL, 2122, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (9, 'jamie', 'doe', 'female', '2000-01-15', '', '', '', '', '', '', '', '2017-01-05', '', 4, 2, true, NULL, 23, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (11, 'julie', 'meehan', 'female', '2000-01-15', '', '', '', '', '', '', '', '2015-01-15', '', 5, 2, true, NULL, 212, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (12, 'georg', 'muller', 'male', '2000-01-15', '', '', '', '', '', '', '', '2017-01-15', '', 5, 2, true, NULL, 98, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (13, 'wilson', 'turner', 'male', '1995-01-15', '', '', '', '', '', '', '', '2015-01-15', '', 5, 2, true, NULL, 789, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (14, 'ameen', 'khan', 'female', '2012-01-29', '', '', '', '', '', '', '', '2013-11-02', '', 5, 2, true, NULL, 423, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (15, 'jerry', 'springer', 'male', '2017-01-17', '', '', '', '', '', '', '', '2017-02-17', '', 6, 3, true, NULL, 122, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (16, 'shahid', 'afridi', 'male', '2001-01-17', '', '', '', '', '', '', '', '2003-01-17', '', 6, 3, true, NULL, 12, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (17, 'goldi', 'locks', 'female', '1997-01-17', '', '', '', '', '', '', '', '2016-01-17', '', 7, 3, true, NULL, 14, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (18, 'staci', 'kole', 'female', '1990-01-17', '', '', '', '', '', '', '', '2012-01-17', '', 7, 3, true, NULL, 201, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (19, 'dave', 'spade', 'male', '2007-01-17', '', '', '', '', '', '', '', '2005-01-17', '', 7, 3, true, NULL, 203, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (20, 'shakira', 'shakira', 'female', '2000-01-17', '', '', '', '', '', '', '', '2017-01-17', '', 8, 3, true, NULL, 253, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (21, 'aunt', 'jemima', 'female', '2005-01-17', '', '', '', '', '', '', '', '2014-01-17', '', 8, 3, true, NULL, 205, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (22, 'debbie', 'snow', 'female', '2017-01-18', '', '', '', '', '', '', '', '2017-01-17', '', 8, 3, true, NULL, 122, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (23, 'snoop', 'dog', 'female', '2006-01-17', '', '', '', '', '', '', '', '2018-01-17', '', 9, 4, true, NULL, 22, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (24, 'john', 'bonjovi', 'male', '2005-02-02', '', '', '', '', '', '', '', '2015-01-17', '', 9, 4, true, NULL, 15, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (25, 'katie', 'perry', 'female', '2004-01-17', '', '', '', '', '', '', '', '2010-01-17', '', 9, 4, true, NULL, 308, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (26, 'cercei', 'lannister', 'female', '1992-01-17', '', '', '', '', '', '', '', '2016-01-17', '', 10, 4, true, NULL, 309, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (27, 'arya', 'stark', 'female', '1997-01-17', '', '', '', '', '', '', '', '2015-07-17', '', 10, 4, true, NULL, 310, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (28, 'raegar', 'targaryen', 'male', '2000-01-17', '', '', '', '', '', '', '', '2016-01-17', '', 11, 4, true, NULL, 312, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (29, 'danerys', 'targaryen', 'female', '2001-01-17', '', '', '', '', '', '', '', '2010-01-17', '', 11, 4, true, NULL, 506, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (30, 'jamie', 'lannister', 'male', '1994-01-17', '', '', '', '', '', '', '', '2014-01-01', '', 9, 4, true, NULL, 4012, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (31, 'master', 'yoda', 'male', '1950-01-17', '', '', '', '', '', '', '', '2011-01-17', '', 3, 1, true, NULL, 3432, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (33, 'test', 'student', 'male', '2000-12-30', '', '', '', '', '', '', '', '2016-12-30', '', 5, 2, true, NULL, 87, NULL, '2017-02-04', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (37, 'Shan', 'Ali', 'male', '2001-07-25', 'Islamabad', 'Zafar Iqbal', 'Robina Kousar', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak# 148 RS PO.Box Salani Sargohda ', '0302-5036069', '3025036059', '2010-12-27', NULL, 29, 5, true, NULL, 500026, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (38, 'Sulman', 'Shazad', 'male', '2001-07-25', 'Islamabad', 'Amanwal Masih', 'Suria', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#80 Arbi Po.Box Safdar Abbas Shukopura', '0336-5083774', '0315-4568193', '2013-05-28', NULL, 29, 5, true, NULL, 500040, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (39, 'Lal', 'Muhmmad', 'male', '2002-08-13', 'Islamabad', 'Rehmat Zaman', 'Shazia Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Safi Chanra PO.BOX Lakray Mehmmad Agency', '0301-3047600', '3015976288', '2011-06-10', NULL, 29, 5, true, NULL, 500042, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (40, 'Sheraz', 'Ali', 'male', '2003-03-14', 'Islamabad', 'Muhmmad Riaz', 'Nusrat Noreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak # 5 Jonobe PO.BOX Balwal Sargodha', '0302-8966726', 'Nil', '2012-06-28', NULL, 28, 5, true, NULL, 500043, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (41, 'Umaima', 'na', 'female', '2005-08-07', 'Islamabad', 'basheer ahmad', 'arshad bbi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak no 15 jeem bay po box ahmad abad jiniot', '3430248994', '', '2011-08-12', NULL, 28, 5, true, NULL, 500046, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (42, 'Ayesha ', 'Arshad', 'female', '2006-02-11', 'Islamabad', 'Arshad Hussain', 'Parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#245Po.Box Bona Chniot Jhang.', '0333-5362546', 'Nil', '2011-08-20', NULL, 29, 5, true, NULL, 500047, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (43, 'Aqsa ', 'Ghulam', 'female', '2004-08-06', 'Islamabad', 'Ghulam Hussain', 'Sajida Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak Kabaria Raham Shah Po.Box Khanwal.', '3064973078', '', '2012-04-06', NULL, 29, 5, true, NULL, 500049, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (44, 'Root ', 'Sehzadi ', 'female', '2002-12-29', 'Islamabad', 'Amanwal Masih', 'Suria', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#89 Po.Box Safdarbad Shukopura.', '0336-5083774', '0315-4568193', '2011-08-29', NULL, 29, 5, true, NULL, 500050, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (36, 'power', 'ranger', 'male', '2010-01-03', 'lahore', '', '', '', '', '', '', '2017-01-01', 'hi - howdy - sup', 6, 3, true, NULL, 3423999, NULL, '2017-02-04', '', NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (35, 'sabira', 'qureshi', 'female', '1960-01-01', '', '', '', '', '', '', '', '2017-01-05', '', 1, 1, true, NULL, 8787, NULL, '2017-02-04', 'admin', NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (34, 'adele', 'singer', 'female', '2010-01-03', '', '', '', '', '', '', '', '2016-12-30', 'a', 12, 3, true, NULL, 23, NULL, '2017-02-04', 'admin', NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (10, 'allie', 'mcbeal', 'female', '2005-01-15', '', '', '', '', '', '', '', '2016-12-30', '', 4, 2, false, '2017-01-15', 543, NULL, '2017-02-04', '', NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (45, 'Maria', 'Bibi', 'female', '2003-12-04', 'Islamabad', 'Liaqat Ali', 'Shameem Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Mohla Tapa Nara Po.Box Attock.', '0341-3262900', 'Nil', '2011-09-20', NULL, 29, 5, true, NULL, 500054, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (46, 'Sana ', 'Batool', 'female', '2004-06-10', 'Islamabad', 'Sabir Ali', 'Sehnaz Batool', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Gazibad PO.Box MandiShahJewna Jhang', '0343-5367452', 'Nil', '2011-09-15', NULL, 29, 5, true, NULL, 500055, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (47, 'Mehnaz', 'na', 'female', '2004-02-06', 'Islamabad', 'Muhmmad Sulman', 'Farzana ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Mureed Kay Muncipal Committee District Foroz Wala. Shekhpura', '0334-4202567', 'Nil', '2011-09-22', NULL, 28, 5, true, NULL, 500057, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (48, 'Afshan', 'Kanwal', 'female', '2005-01-11', 'Islamabad', 'Muhmmad Zaman', 'Tahira Parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Gao Rabbar Hafizabad ', '3400108680', '', '2011-10-07', NULL, 29, 5, true, NULL, 500059, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (49, 'Muhmmad Ameer ', 'Hamza', 'male', '2002-11-01', 'Islamabad', 'Muhmmad Iqbal Khan', 'Rafia Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Ameer khan Po.Box Banu', '3445439993', '', '2011-10-20', NULL, 29, 5, true, NULL, 500060, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (50, 'Sadiqa', 'Bibi', 'female', '2006-05-10', 'Islamabad', 'Walait Khan', 'Noor Bahar Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Safi Chanra PO.BOX Lakray Mehmmad Agency', '3215352110', '', '2011-12-08', NULL, 28, 5, true, NULL, 500061, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (51, 'Tania ', 'Jemus', 'female', '2004-12-09', 'Islamabad', 'Jemus', 'Parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#58/4 Po.box khas distric Sahiwal', '3085301472', '', '2011-12-08', NULL, 27, 5, true, NULL, 500062, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (52, 'Kousar', 'Riaz', 'female', '2004-04-05', 'Islamabad', 'Muhmmad Riaz', 'kaneez Fatima', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Bhair wali PO.BOX mandi ShahJeewana District jhang', '0343-5155541', 'Nil', '2012-01-08', NULL, 28, 5, true, NULL, 500064, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (53, 'Ishra ', 'Sakandar', 'female', '2006-02-03', 'Islamabad', 'Sakandar Ayat', 'Shenaz Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak#48 PO.BOX District Salana Wali Sargohda ', '3413800164', '', '2012-01-09', NULL, 28, 5, true, NULL, 500065, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (54, 'Zoberia ', 'Munwar', 'female', '2005-09-05', 'Islamabad', 'Munwar Masih', 'Parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#31 RB PO.BOX Khas Shekhpura', '3122322648', '', '2012-02-06', NULL, 28, 5, true, NULL, 500067, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (55, 'Moskan ', 'Naseer', 'female', '2004-04-20', 'Islamabad', 'Naseer Anjum', 'Sajjda Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Mohla Raja Kalooni Ward#9 Shahkot PO.BOX Nankana Sab', '32255488', 'Nil', '2012-02-08', NULL, 28, 5, true, NULL, 500068, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (56, 'Malika ', 'Waris', 'female', '2005-12-12', 'Islamabad', 'Waris Masih', 'Zahida Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Gujranwal road Kot Ranjeeb PO.BOX Shekhpura', '0307-5393955', 'Nil', '2012-02-15', NULL, 28, 5, true, NULL, 500069, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (57, 'Usama ', 'Ali', 'male', '2004-09-25', 'Islamabad', 'Zulfiqar', 'Sehib Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak#4-bjanubi dakh khana sarghodah.', '3455556987', '', '2012-02-17', NULL, 27, 5, true, NULL, 500070, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (58, 'Ali', 'Raza', 'male', '2005-01-07', 'Islamabad', 'Manzoor Ahmad', 'Kaneez Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak #48 janobe Po.BOX Kas Sargohda', '3216589326', '', '2012-04-06', NULL, 28, 5, true, NULL, 500072, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (59, 'Azhar', 'Abbas', 'male', '2005-03-08', 'Islamabad', 'Ghulam Muhmmad', 'Razia ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#115 PO.BOX Janobe District Sarwli Sargodha', '3431505884', '', '2012-04-08', NULL, 28, 5, true, NULL, 500074, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (60, 'Razwan ', 'Ashraf', 'male', '2003-03-10', 'Islamabad', 'Asharf', 'Janat Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Ahmad Nagar PO.BOX District laliya Chiniot.', '3125698745', '3485774424', '2012-04-20', NULL, 28, 5, true, NULL, 500078, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (61, 'Ali ', 'Shair', 'male', '2007-12-02', 'Islamabad', 'basheer ahmad', 'irshad bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak no 15 po box ahmad abad jiniot', '3215896486', '', '2012-05-03', NULL, 28, 5, true, NULL, 500079, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (62, 'Sameer ', 'Ahmad', 'male', '2004-02-08', 'Islamabad', 'Muhmmad Akram', 'Nasreen Akram', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak134 SB PO.BOX Salanwali ', '0305-8988257', 'Nil', '2012-05-06', NULL, 28, 5, true, NULL, 500081, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (63, 'Faizan', 'Ali', 'male', '2005-08-13', 'Islamabad', 'Muhammad Ashraf', 'Shenaz Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak#12 jeem bay post office chak #13 jeem bay chiniot. Jhung', '3458978954', '', '2012-09-05', NULL, 28, 5, true, NULL, 500082, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (64, 'Ali', 'Hassan', 'male', '2006-03-20', 'Islamabad', 'Ghulam Shabir', 'Shakran', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak 160post office chak #255 Jhung', '3452632568', '', '2012-03-06', NULL, 25, 5, true, NULL, 500085, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (65, 'Arshad', 'Khan', 'male', '2006-05-07', 'Islamabad', 'Walait Khan', 'Noor Bahar Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Safi Chanra PO.BOX Lakray Mehmmad Agency', '3442536985', '', '2012-06-05', NULL, 28, 5, true, NULL, 500086, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (66, 'Atif', 'Riaz', 'male', '2007-09-02', 'Islamabad', 'Muhmmad Riaz', 'Haleema Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Kalooni Wala Po.Box District Jhang', '3452879654', '', '2012-06-01', NULL, 25, 5, true, NULL, 500088, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (67, 'Bakhat', 'Muhmmad', 'male', '2003-05-08', 'Islamabad', 'Walait Khan', 'Noor Bahar Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Safi Chanra PO.BOX Lakray Mehmmad Agency', '3422563254', '3439761277', '2012-06-09', NULL, 29, 5, true, NULL, 500091, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (68, 'Muhammad', 'Rohan', 'male', '2004-03-18', 'Islamabad', 'Naeem Akhter', 'Bushra Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#8 Abasia post office chak#10 liaqat pur. Raheem Yar Khan', '3332586963', '', '2012-08-07', NULL, 27, 5, true, NULL, 500093, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (69, 'Nayer ', 'Shabeer', 'male', '2004-01-25', 'Islamabad', 'Ghulam Shabeer', 'Shakran Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak# 160 PO.BOX Chak#255 Jangh', '3216587956', '', '2012-07-15', NULL, 28, 5, true, NULL, 500094, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (70, 'Kanwal Gulshan', 'Batti', 'female', '2001-06-03', 'Islamabad', 'Gulshan Batti', 'Firdos', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Near ralway Sation  Mohla Banjora Lala Mosa District Karrian  Gujrat', '3038512291', '', '2012-09-29', NULL, 28, 5, true, NULL, 500102, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (71, 'Ambreen', 'na', 'female', '2005-09-06', 'Islamabad', 'Qurban', 'Shazadi Begam', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Sander PO.BOX District Lahore', '0321-8978287', '0304-0014034', '2012-10-03', NULL, 28, 5, true, NULL, 500103, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (72, 'Usmanullah', 'Khan', 'male', '2012-10-07', 'Islamabad', 'AsmatUllah khan', 'Naikam Zada', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Manjal Ameer Khan PO.BOX Banu.', '3348847093', '', '2012-10-07', NULL, 28, 5, true, NULL, 500109, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (73, 'Praim', 'na', 'male', '2007-03-18', 'Islamabad', 'Anwar masih', 'Shenaz Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'mohallah raja colony  shah kot. Nankana sahib.', '3357728391', '3357728391', '2012-08-10', NULL, 27, 5, true, NULL, 500110, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (74, 'Usman', 'Maschi Butti', 'male', '2004-04-28', 'Islamabad', 'Gulshan Batti', 'Fardoos ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Near Ralway Sation Mohla Panjorpura Lala Mosam Karia Gjrat.', '0304-5744254', '', '2013-01-04', NULL, 26, 5, true, NULL, 500113, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (75, 'Ali', 'Hassan', 'male', '2007-06-24', 'Islamabad', 'Khuda Bakhsh', 'Sakeena ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Nowa thattha Mahar Wali PO.BOX Mandi Shah Jewana.', '3085795623', '', '2013-01-06', NULL, 26, 5, true, NULL, 500114, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (76, 'Muhmmad ', 'Abid', 'male', '2005-03-25', 'Islamabad', 'Muhmmad Akram ', 'Alan Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Lang Shamli PO.box Jhang.', '3324856985', '', '2013-01-12', NULL, 25, 5, true, NULL, 500117, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (77, 'Muzamil', 'Toqueer', 'male', '2007-07-29', 'Sarghodha', 'Toqeer hassan', 'Shameem ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'jhand post office shah nakdar jhung.', '3477441408', '3477441408', '2013-01-18', NULL, 27, 5, true, NULL, 500118, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (78, 'Kahnan', 'Sadeeq', 'male', '2006-03-11', 'Islamabad', 'Saqeeq Masih', 'Noshi Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Near Noor masjad Street2 Mohla Nowaz Town Faslibad.', '3325487978', '', '2013-01-21', NULL, 26, 5, true, NULL, 500121, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (79, 'Zarka', 'Naseer', 'female', '2006-12-09', 'Islamabad', 'Naseer Anjum', 'Sajida', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'mohallah Raja colony ward#9 shah kot. Nankana sahib.', '3002563214', '', '2013-01-22', NULL, 27, 5, true, NULL, 500122, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (80, 'Samreen ', 'Riaz', 'female', '2005-05-16', 'Islamabad', 'Riaz', 'Khatoon Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Ward #3 Mohla Ansaria Noor Wala PO.BOX Jhang', '3025623147', '', '2012-10-05', NULL, 28, 5, true, NULL, 500124, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (81, 'Rehman', 'Hussain', 'male', '2007-05-12', 'Islamabad', 'Nasir Ali', 'Fatima Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'khairpur bahiwall postoffice linker makhdoon tehsil lalian chiniot.', '3437634263', '3437634263', '2013-01-28', NULL, 27, 5, true, NULL, 500125, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (82, 'Muhmmad ', 'Saqlain', 'male', '2005-02-21', 'Islamabad', 'Sarfaz', 'Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#48 Janabe P/O Box Salani sargohda.', '3072564875', '', '2013-02-26', NULL, 26, 5, true, NULL, 500127, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (83, 'Sadaqat', 'na', 'male', '2007-05-20', 'Islamabad', 'Walait Khan', 'Noor Bahar Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Safi Chanra PO.BOX Lakray Mehmmad Agency', '3456985698', '', '2013-04-06', NULL, 26, 5, true, NULL, 500130, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (84, 'Mubashir', 'Ali', 'male', '2006-09-14', 'Narra', 'Liaqat Ali Khan', 'Shameem Akhter', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'mohallah narra post office khas jhund Attock.', '3413262900', '3413262900', '2012-06-09', NULL, 27, 5, true, NULL, 500132, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (85, 'Muhammad', 'Sami', 'male', '2004-04-17', 'Islamabad', 'muhammad asif', 'nasreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'kachi abadi golra shareef po box islambad', '3435713451', '', '2013-09-15', NULL, 26, 5, true, NULL, 500135, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (86, 'Arwa ', 'Rani', 'female', '2008-08-14', 'Islamabad', 'Noor Hussain', 'Zora bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Bon Kalar Karlya Po.Box Haizfabad.', '3055444447', '', '2013-04-16', NULL, 26, 5, true, NULL, 500137, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (87, 'Maryam', 'na', 'female', '2006-01-31', 'Islamabad', 'Ali Sher', 'Anees Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Maka kala Po.Box Raswaliya Pandi Bhattia.', '0302-5444648', 'Nil', '2013-04-18', NULL, 25, 5, true, NULL, 500138, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (88, 'Ahmad', 'Ali', 'male', '2008-03-02', 'Islamabad', 'faraz khan', 'hajira', '', 'chak no 169 jeem bay po box mochiwala jhang', '3406090615', '', '2013-04-20', NULL, 24, 5, true, NULL, 500140, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (89, 'Waseem', 'na', 'male', '2005-08-18', 'Islamabad', 'Dost Muhmmad ', 'Bibi fatima', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Rahma Wala Chak #68 Janobe PO.BOX Sargohda.', '3216598774', '', '2013-04-21', NULL, 25, 5, true, NULL, 500141, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (90, 'Lubna', 'na', 'female', '2003-07-08', 'Islamabad', 'Akmal Kahn', 'Nazeera', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#15 bay jeem po.box Ahmad abad', '3475467893', '3475467893', '2013-04-21', NULL, 27, 5, true, NULL, 500142, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (91, 'Abdul', 'Rehman', 'male', '2005-04-15', 'Islamabad', 'Muhmmad Riaz Ahmad ', 'Kouser Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#56 Alaf Janabe P/O Box Sargohda ', '3485240143', '', '2013-04-22', NULL, 26, 5, true, NULL, 500146, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (92, 'Farhan', 'Ali', 'male', '2005-03-14', 'Islamabad', 'Asif', 'Khusheed', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', '', '3003728734', '3003728734', '2013-04-23', NULL, 27, 5, true, NULL, 500147, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (93, 'Hazma ', 'Ali', 'male', '2009-03-27', 'Islamabad', 'Akbar ', 'Sidra ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#126 (Alaf Baa Jem) Po.Box jhang.', '3085422873', '', '2013-04-10', NULL, 26, 5, true, NULL, 500148, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (94, 'Saqlain', 'na', 'male', '2008-02-21', 'Islamabad', 'Yasir Yaseen', 'Sadia Shzia ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'BaraMeal Mastpur P/O Box khanawal.', '3485774332', '', '2013-04-22', NULL, 26, 5, true, NULL, 500149, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (95, 'Suriya', 'Bibi', 'female', '2007-01-03', 'Islamabad', 'Arif', 'nasreen Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'beer wali mandi shah jeevna Po box khas jhung.', '3325644548', '', '2013-04-05', NULL, 27, 5, true, NULL, 500152, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (96, 'Jibran', 'na', 'male', '2007-05-19', 'Faisalabad', 'Taj Mashi', 'Shakeela', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chirstian colony mohallah civil line khanewal.', '3055991462', '3055991462', '2013-04-22', NULL, 27, 5, true, NULL, 500153, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (97, 'Touqeer', 'Riaz', 'male', '2006-04-15', 'Islamabad', 'Muhammad Riaz', 'Kaneez Fatima', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'beer wali mandi shah jeevna Po box khas jhung.', '3325648548', '', '2013-01-06', NULL, 27, 5, true, NULL, 500155, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (98, 'Ali', 'Raza', 'male', '2007-05-16', 'Islamabad', 'Muhammad Manshah', 'Maqbool Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'beraj dar postoffice kalki mandi tehsil Hafiza abad.', '3438904637', '3438904637', '2013-04-24', NULL, 27, 5, true, NULL, 500156, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (99, 'Ali', 'Husnain', 'male', '2007-07-27', 'Islamabad', 'zulfqar', 'noreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'mandi sha jewna po box jahng', '3545185147', '', '2013-04-25', NULL, 27, 5, true, NULL, 500157, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (100, 'Ifra ', 'Bibi', 'female', '2007-03-01', 'Islamabad', 'Sarfraz', 'Irshed', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'NowaTahtta Po.Box Mandi ShahJewana Jhang.', '3325648977', 'Nil', '2013-05-04', NULL, 25, 5, true, NULL, 500159, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (101, 'Kainat', 'na', 'female', '2007-06-04', 'Islamabad', 'Qurban', 'Sehzadi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'sandr po.box distric lahore.', '3040014034', '3040014034', '2013-05-08', NULL, 27, 5, true, NULL, 500160, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (102, 'Saba', 'Munawar', 'female', '2004-04-22', 'Islamabad', 'Munawar Mash', 'Parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Rarryana Chak#31R B Po.box khas shekhpura.', '3356987452', '', '2013-08-05', NULL, 27, 5, true, NULL, 500161, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (103, 'Sherial', 'na', 'male', '2005-03-05', 'Islamabad', 'Munwar Iqbal', 'Eman Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Matila P/O Box sargohda ', '3364481444', '', '2005-03-05', NULL, 26, 5, true, NULL, 500163, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (104, 'Gulfraz ', 'na', 'male', '2005-09-01', 'Islamabad', 'Muhmmad Riaz', 'Nusrat Noreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak#5 janobe PO.Box Phool Sargohda.', '3342564586', '', '2013-09-03', NULL, 26, 5, true, NULL, 500164, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (105, 'Amir ', 'Shazad', 'male', '2009-04-28', 'Islamabad', 'Khuda Bakhsh', 'Ghulam Sakeena ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Nowa thattha Mahar Wali PO.BOX Mandi Shah Jewana.', '3336154555', '', '2014-02-10', NULL, 26, 5, true, NULL, 500165, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (106, 'Fahad', 'Ahmed', 'male', '2005-07-31', 'Islamabad', 'Ahmed Ali', 'Kouser Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'mohallah maskeen pura eid gah road chiniot . Jhung', '3055888762', '3055888762', '2013-01-06', NULL, 27, 5, true, NULL, 500168, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (107, 'Nathsa ', 'Sadiq', 'female', '2008-11-25', 'Islamabad', 'Sadiq Mascih ', 'Noshi Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Near Noor masjad Street2 Mohla Nowaz Town Faslibad.', '3654586544', '', '2014-01-07', NULL, 26, 5, true, NULL, 500170, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (108, 'Abdullah', 'na', 'male', '2009-05-04', 'Islamabad', 'Muhmmad Riaz Ahmad ', 'Kousar Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak rajapoota Tahla waga Po.box Shakupura ', '0306-4631484', '', '2014-12-01', NULL, 25, 5, true, NULL, 500173, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (109, 'Muhmmad ', 'Adil', 'male', '2005-10-20', 'Islamabad', 'Muhmmad Riaz', 'Akhter Riaz', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Nae Abadi Chak#5 Po.Box Ahmdabad cheniot', '0312-5544779', '', '2014-01-13', NULL, 26, 5, true, NULL, 500174, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (110, 'Mudasir', 'Toqeer', 'male', '2009-06-24', 'Islamabad', 'Toqeer hassan', 'shameem', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'janda po box sha nagtr jhang', '3477441408', '', '2014-01-04', NULL, 23, 5, true, NULL, 500175, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (111, 'Naveed ', 'na', 'male', '2009-09-13', 'Islamabad', 'Muhmmad Mansha', 'Maqbool Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'beraj dar postoffice kalki mandi tehsil Hafiza abad.', '0343-8904637', 'Nil', '2014-01-22', NULL, 24, 5, true, NULL, 500177, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (112, 'Muhmmad ', 'Sajid ', 'male', '2007-09-16', 'Islamabad', 'Muhmmad Riaz', 'Akhter Riaz', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Nae Abadi Chak#5 Po.Box Ahmdabad cheniot', '3125144779', '', '2014-01-28', NULL, 26, 5, true, NULL, 500178, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (113, 'Arooj', 'Fatima', 'female', '2009-12-27', 'Islamabad', 'Muhmmad Yaseen', 'Shazia Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#12 AH Po.box Khanawal.', '0343-641278', '', '2014-03-02', NULL, 23, 5, true, NULL, 500181, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (114, 'Ghulam', 'Fiza', 'female', '2008-03-20', 'Islamabad', 'Muhmmad Farooq', 'Parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Near chak#44 Shamal House #4 Street #3 Mohla Sulman PO.BOX Sargohda', '3072564895', '', '2014-03-02', NULL, 25, 5, true, NULL, 500183, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (115, 'Maryyam', 'Shameem', 'female', '2008-07-27', 'Islamabad', 'Zulfaqar ', 'Noreen Akhter', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'mandi shahJewna PO.box Jhang', '3222654879', '', '2014-02-04', NULL, 23, 5, true, NULL, 500186, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (116, 'Amna ', 'Bibi', 'female', '2009-05-11', 'Islamabad', 'Allah Bakhsh', 'Nasreen Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#9 A R8 Po.boxChak R8,B9.', '0300-5197988', 'Nil', '2014-02-04', NULL, 25, 5, true, NULL, 500188, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (117, 'Aliya', 'Bibi', 'female', '2008-04-02', 'Islamabad', 'Arif', 'Nasreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'BeherWali MandiShahJewna Jhang.', '0344-8562893', '', '2014-02-04', NULL, 25, 5, true, NULL, 500189, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (118, 'Samreen ', 'Batool', 'female', '2009-09-10', 'Islamabad', 'Sabir Ali ', 'Shenaz Batool', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Gazibad PO.Box MandiShahJewna Jhang', '0343-5367452', '', '2014-02-10', NULL, 25, 5, true, NULL, 500192, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (119, 'Mohsin', 'Ali', 'male', '2008-09-23', 'Islamabad', 'imdad husain', 'parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'pasti husain abad rmna po box sha jewna jhang', '3326958478', '', '2014-02-12', NULL, 25, 5, true, NULL, 500196, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (120, 'Sharoon', 'Siddique', 'male', '2009-03-10', 'Islamabad', 'Siddique Masih', 'Mumtaz', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#12 Mohla Yousaf Town Fasilabad.', '3345263698', '', '2014-02-12', NULL, 25, 5, true, NULL, 500197, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (121, 'Asif', 'na', 'male', '2006-07-21', 'Islamabad', 'Muhmmad Safdar Buhtta', 'Shenaz Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Neko kara Chak#126 Po.Box Khas.', '3362563214', '', '2014-02-13', NULL, 25, 5, true, NULL, 500198, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (122, 'Tayyab ', 'Ali', 'male', '2008-08-14', 'Islamabad', 'Muhmmad Azhar', 'Nazo', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak# 148 RS PO.Box Salani Sargohda ', '3345236547', '', '2014-02-13', NULL, 26, 5, true, NULL, 500199, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (123, 'Sania', 'na', 'female', '2009-04-03', 'Islamabad', 'zulfqar', 'noreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'mandi sha jewna po box jahng', '3405171150', '', '2014-02-18', NULL, 21, 5, true, NULL, 500203, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (124, 'Noman', 'Abbas', 'male', '2015-05-11', 'Islamabad', 'Arif', 'Nasreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'beer wali mandi shah jeevna Po box khas jhung.', '3356958759', '0344-8562893', '2014-04-15', NULL, 24, 5, true, NULL, 500205, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (125, 'Adnan', 'Abbas', 'male', '2012-05-11', 'Islamabad', 'Arif', 'Nasreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'beer wali mandi shah jeevna Po box khas jhung.', '3365698745', '0344-8562893', '2014-04-15', NULL, 24, 5, true, NULL, 500206, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (126, 'Shumila ', 'Batool', 'female', '2005-10-03', 'Islamabad', 'Laiqat Hussain', 'Parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#35 Shamle Po.Box  Sargohda', '3040014034', '', '2014-08-21', NULL, 26, 5, true, NULL, 500213, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (127, 'Mehwish', 'na', 'female', '2007-06-19', 'Islamabad', 'Laiqat Hussain', 'Parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#35 Shamle Po.Box  Sargohda', '3025321435', '', '2014-08-21', NULL, 26, 5, true, NULL, 500214, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (128, 'Shfqat ', 'Abbas', 'male', '2010-12-12', 'Islamabad', 'liaqat husain', 'parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak no 35 shumali po box sarghoda', '3025321435', '', '2014-08-21', NULL, 23, 5, true, NULL, 500215, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (129, 'Usman', 'Shahid', 'male', '2008-07-02', 'Islamabad', 'Shahid Iqbal ', 'khatoon Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak135 Po.box Choniot Jhang', '0341-5264584', 'Nil', '2014-09-04', NULL, 24, 5, true, NULL, 500219, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (130, 'Aqsa ', 'Batool', 'female', '2009-12-17', 'Islamabad', 'Muhmmad Sarfaz ', 'Sima Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Hussan Khan Po.box Jhang ', '0306-5310576', '', '2014-09-15', NULL, 25, 5, true, NULL, 500221, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (131, 'Akmal ', 'Khan', 'male', '2006-01-22', 'Islamabad', 'Akmal Khan', 'Nazeera', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#5(Alaf Baa Jem) Po.Box Ahmad Abadi Jhang ', '3445567912', '', '2014-11-11', NULL, 26, 5, true, NULL, 500231, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (132, 'Taskeen', 'na', 'female', '2006-10-11', 'Islamabad', 'Tanveer Abbas ', 'Shaiza Noreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Shree Mandi Shah Jeewana PO.Box Jhang.', '3419447497', '', '2014-12-09', NULL, 26, 5, true, NULL, 500233, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (133, 'Tauqeer', 'Abbas', 'male', '2007-11-15', 'Islamabad', 'Tanveer Abbas', 'Shaiza Noreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Shree Mandi Shah Jeewana PO.Box Jhang.', '3419447497', '', '2014-12-09', NULL, 26, 5, true, NULL, 500234, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (134, 'Rizwan', 'Ali', 'male', '2007-08-03', 'Islamabad', 'asif', 'khursheed', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', '', '3003728734', '', '2014-12-09', NULL, 24, 5, true, NULL, 500235, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (135, 'Fizan ', 'Ali', 'male', '2008-02-03', 'Islamabad', 'muhammad yousaf', 'Musrat Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', '', '3418951665', '', '2014-12-10', NULL, 24, 5, true, NULL, 500238, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (136, 'Jaweria', 'Jaemus', 'female', '2006-09-14', 'Islamabad', 'Jaemus', 'Praveen Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#58/4 Po.box khas distric Sahiwal', '3232654785', '', '2014-12-10', NULL, 24, 5, true, NULL, 500242, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (137, 'Mehnaz ', 'Bibi', 'female', '2007-01-08', 'Islamabad', 'Muhmmad Nawaz', 'Kousar Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#204Jeem Bay PO.BOX Chiniot.', '3467729047', '', '2014-12-10', NULL, 26, 5, true, NULL, 500244, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (138, 'Mummad ', 'Farman', 'male', '2007-09-08', 'Islamabad', 'Muhmmad Akram', 'Nasreen Akram', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak134 SB PO.BOX Salanwali ', '0305-8988257', 'Nil', '2014-12-10', NULL, 25, 5, true, NULL, 500245, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (139, 'Shakif ', 'Riaz', 'male', '2010-04-03', 'Islamabad', 'Muhammad Riaz', 'Reema Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'golrra Shareef Khatchi Abadi Islamabad.', '3216598745', '', '2014-12-10', NULL, 24, 5, true, NULL, 500246, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (140, 'Alisha ', 'na', 'female', '2009-12-18', 'Islamabad', 'Arshad Hussain', 'Parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#245Po.Box Bona Chniot Jhang.', '3326987456', '', '2014-10-11', NULL, 24, 5, true, NULL, 500248, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (141, 'Hadier ', 'Ali', 'male', '2009-12-15', 'Islamabad', 'Muhmmad Riaz', 'Akhter Riaz', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Nae Abadi Chak#5 Po.Box Ahmdabad cheniot', '3365236179', '', '2014-12-11', NULL, 23, 5, true, NULL, 500249, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (142, 'Aman', 'Ali', 'male', '2008-05-05', 'Islamabad', 'shebaz', '', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'dhom po box bakhsh wala jiniot jhang', '3135446235', '', '2014-12-11', NULL, 21, 5, true, NULL, 500250, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (143, 'Sana ', 'Raiz', 'female', '2009-08-03', 'Islamabad', 'Muhmmad Riaz', 'Kaneez Fatima', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'beer wali mandi shah jeevna Po box khas jhung.', '0343-5155541', 'Nil', '2014-12-11', NULL, 24, 5, true, NULL, 500251, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (144, 'Irfan', 'na', 'male', '2006-09-01', 'Islamabad', 'khalid husain', 'kalsoom', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'dely wala po box kot sarwar pindi bhatia hafiza abad', '3067035197', '', '2014-12-11', NULL, 23, 5, true, NULL, 500253, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (145, 'Fariha', 'Bibi', 'female', '2007-08-12', 'Islamabad', 'Khaild Hussain', 'kalsoom', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Dalywala Po.Box lot Sarwar Pindi Bhattia HazifaBad.', '0306-7035197', 'Nil', '2014-12-11', NULL, 25, 5, true, NULL, 500254, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (146, 'Alisha ', 'Fatima ', 'female', '2010-08-07', 'Islamabad', 'Khalid Hussain', 'kalsoom', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Delywala Po.Box Kot Sarwar Pindi Buttia Hafizabad', '0340-7035197', '', '2014-12-11', NULL, 24, 5, true, NULL, 500255, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (147, 'Ali', 'Asghar', 'male', '2008-08-14', 'Islamabad', 'Noor Hussain', 'Zora bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Bon Kalar Karlya Po.Box Haizfabad.', '3326598745', '', '2014-10-11', NULL, 24, 5, true, NULL, 500256, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (148, 'Abbas', 'na', 'male', '2009-06-28', 'Islamabad', 'liaqat ali', 'Shazia Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'mohla yoba fail kota swabi', '3465457781', '', '2014-12-11', NULL, 24, 5, true, NULL, 500256, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (149, 'Rubab', 'Zara', 'female', '2012-04-04', 'Islamabad', 'Imran Shazad', 'Asma Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Laliya choinot Po.Box Jhang', '3342369854', '', '2015-04-09', NULL, 23, 5, true, NULL, 500261, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (150, 'Bilal ', 'Ahmad', 'male', '2016-08-05', 'Islamabad', 'niaz ali', 'Nargis ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak rajpota dhala whga po box mureed kay shekhupora', '3064631684', '', '2015-04-12', NULL, 23, 5, true, NULL, 500271, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (151, 'Abdullah', 'na', 'male', '2008-10-15', 'Islamabad', 'Naiaz Ali', 'Nargis ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak rajapoota Tahla waga Po.box Shakupura ', '3369874562', '', '2015-12-04', NULL, 21, 5, true, NULL, 500272, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (152, 'Usman', 'Ali', 'male', '2011-12-29', 'Islamabad', 'Naiaz Ali', 'Nargis ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak rajapoota Tahla waga Po.box Shakupura ', '3426574859', '', '2015-12-04', NULL, 21, 5, true, NULL, 500274, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (153, 'Azima ', 'na', 'female', '2012-04-14', 'Islamabad', 'Mahboob Ul Rehman', 'Sakeen Jan', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Naka Basa Po.box Halkot Manseera ', '3452698745', '', '2015-04-18', NULL, 21, 5, true, NULL, 500281, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (154, 'Mehak ', 'na', 'female', '2011-06-02', 'Islamabad', 'Muhmmad Zafar', 'Saima', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#53 Po.box Sargohda', '0343-5995190', '', '2015-04-20', NULL, 21, 5, true, NULL, 500288, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (155, 'Gul ', 'Naz', 'female', '2002-01-01', 'Islamabad', 'Muhmmad Mansha', 'Maqbool Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'beraj dar postoffice kalki mandi tehsil Hafiza abad.', '3438904637', '3438904637', '2015-04-21', NULL, 20, 5, true, NULL, 500296, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (156, 'Fizan ', 'Ali', 'male', '2009-05-04', 'Islamabad', 'Ejaz ali', 'shenaz ijaz', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'maira jaffr po box golra qureshi markit ict', '3085013409', '', '2015-04-23', NULL, 23, 5, true, NULL, 500313, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (157, 'Mehnoor', 'Fatima', 'female', '2008-10-07', 'Islamabad', 'muhammad saleem', 'kosar bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'golra shareef po box islambad', '3065064490', '', '2016-12-06', NULL, 21, 5, true, NULL, 500314, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (158, 'Hajira ', 'Bibi', 'female', '2011-06-26', 'Islamabad', 'Muhammad saleem', 'Kousar bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Katchi Abadi sector G11/2 Islamabad', '3056958426', '', '2015-04-23', NULL, 23, 5, true, NULL, 500315, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (159, 'Muhmmad', 'Faizan', 'male', '2011-01-01', 'Islamabad', 'Ahsanullah Khan', 'Bisnazada', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', '', '0301-5184067', '', '2016-06-15', NULL, 20, 5, true, NULL, 500324, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (160, 'Sawera', 'na', 'female', '2009-05-15', 'Islamabad', 'zafar iqbal', 'arshad bbi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'basti nilot raheem sha po box jania khanewal', '3051239548', '', '2015-04-25', NULL, 22, 5, true, NULL, 500337, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (161, 'Ali', 'Arman', 'male', '2012-05-27', 'Islamabad', 'Zafar iqbal', 'Nazia Nusrrat', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'thatta beran post office mudha ranjha kot. Sarghodha', '3062632495', '', '2016-04-14', NULL, 20, 5, true, NULL, 500342, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (162, 'Rafqat ', 'Ali', 'male', '2002-01-01', 'Islamabad', 'Ather ', 'Abida ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Jhanga AhmadPuar Bhawalpur', '0348-5489777', '', '2015-04-25', NULL, 21, 5, true, NULL, 500347, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (163, 'Zara ', 'Liqat', 'female', '2007-12-12', 'Islamabad', 'Liaqat Ali Khan', 'Shameem Akhter', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Mohallah tappa narra po box jund attock', '3070632567', '', '2015-04-25', NULL, 21, 5, true, NULL, 500359, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (164, 'Rabika', 'Riaz', 'female', '2007-04-06', 'Islamabad', 'Riaz', 'Khatoon', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'ward #31Mohallah ansarian noor wala chaniot Zila Jhung.', '3351654879', '', '2015-04-25', NULL, 26, 5, true, NULL, 500364, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (165, 'Zeeshan', 'Naseer', 'male', '2007-09-17', 'Islamabad', 'Naseer Anjum', 'Sajjda Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Mohla Raja Kalooni Ward#9 Shahkot PO.BOX Nankana Sab', '3335623784', '', '2013-04-25', NULL, 25, 5, true, NULL, 500366, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (166, 'Rehmeem', 'na', 'female', '2006-08-06', 'Islamabad', 'Ahmad Ali', 'Kousar Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Eidgah Mohla Maskeenpura Jhang', '3336569123', '', '2015-04-27', NULL, 26, 5, true, NULL, 500370, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (167, 'Sahil', 'Masih', 'male', '2002-01-01', 'Islamabad', 'Sadiq Masih', 'Mumtaz', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#12 Mohla Yousaf Town Fasilabad.', '3345263698', '', '2013-05-08', NULL, 22, 5, true, NULL, 500374, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (168, 'Muhmmad', 'Yahya Khan', 'male', '2009-05-03', 'Islamabad', 'Muhmmad Iqbal ', 'Rafia Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Muhbal Ameer Khan Po.box Bannu ', '3365231468', ' ', '2015-05-08', NULL, 24, 5, true, NULL, 500375, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (169, 'Badal ', 'Masih', 'male', '2010-05-03', 'Islamabad', 'Patras Masih', 'Shumail', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#34 Po.box Samandri', '0301-3727607', '', '2015-05-08', NULL, 22, 5, true, NULL, 500376, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (170, 'Adil', 'Masih', 'male', '2009-05-03', 'Islamabad', 'Patras Masih', 'Shumail', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#34 Po.box Samandri', '0301-3727607', '', '2015-05-08', NULL, 22, 5, true, NULL, 500377, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (171, 'Nisha ', 'Bibi', 'female', '2008-05-09', 'Islamabad', 'patras masih', 'shumaila', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak no 134 gaf bay po box samndri', '3335847956', '', '2015-05-08', NULL, 24, 5, true, NULL, 500378, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (172, 'Usman', 'Sarfraz ', 'male', '2010-06-21', 'Islamabad', 'Muhmmad sarfraz ', 'Shameem Akhtar', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Hassan Khan Po.Box Jhang.', '3332598745', '', '2015-05-08', NULL, 24, 5, true, NULL, 500383, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (173, 'Furqan', 'Ullah Khan', 'male', '2005-03-29', 'Banu', 'Asmatullah', 'Nakum Zada', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Manjal Ameer khan post office Banu.', '3040014034', '', '2015-08-05', NULL, 29, 5, true, NULL, 500397, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (174, 'Amir', 'Ali', 'male', '2007-02-05', 'Islamabad', 'Atta Muhammad', 'Satta bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Muzafar colony akranwala post office Jhung', '3052598745', '', '2015-08-05', NULL, 26, 5, true, NULL, 500400, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (175, 'Waqar', 'na', 'male', '2008-09-10', 'Islamabad', 'Ajaz mula bakhsh', 'Rani bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'noor wala mohallah ansarian chiniot', '3252365987', '', '2015-05-18', NULL, 26, 5, true, NULL, 500413, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (176, 'Nakash', 'Ali', 'male', '2010-01-24', 'Islamabad', 'Amjad Ali', 'Gulshan bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Mohla Daly Wala Burhan Po.box Attock', '3010232236', '', '2015-05-18', NULL, 21, 5, true, NULL, 500420, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (177, 'Jaweria', 'Afreen', 'female', '2006-08-15', 'Islamabad', 'Allah Bakhsh', 'Shenaz Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Colar Po.Box Kot Essa Shah', '3405580713', '', '2015-08-24', NULL, 26, 5, true, NULL, 500428, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (178, 'Munawar', 'na', 'male', '2004-01-01', 'Islamabad', 'Allah bakhsh', 'Shenaz Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'colar post office kot essa shah jhung', '3405580713', '', '2015-08-24', NULL, 27, 5, true, NULL, 500430, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (179, 'Hafiza ', 'na', 'female', '2012-04-15', 'Islamabad', 'Muhmmad Safdar ', 'Shaiza ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Butta Wala Po.Box Gulzapura Multan', '3418571207', '', '2015-08-25', NULL, 20, 5, true, NULL, 500432, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (180, 'Arooj', 'Tahir', 'female', '2009-10-18', 'Islamabad', 'Tariq mashi', 'jusfeen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak 132  b post office sarghodha.', '3043749894', '3043749894', '2015-02-09', NULL, 22, 5, true, NULL, 500439, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (181, 'Atif', 'Ali', 'male', '2010-06-04', 'Islamabad', 'Ata Muhmmad ', 'Kousar', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak no 115 rasla alaf janobi po box sargodha', '0347-9854298', '', '2015-08-24', NULL, 22, 5, true, NULL, 500441, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (182, 'Muskan', 'na', 'female', '2006-07-05', 'Islamabad', 'Naiaz Ahmad Faridi', 'Hassna Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Village Maira Jaffar PO.Box Gholra Sharif ICT.', '3045698254', '', '2015-11-05', NULL, 26, 5, true, NULL, 500452, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (183, 'Rabia ', 'Bibi', 'female', '2009-10-28', 'Islamabad', 'Muhmmad Yousaf', 'Musrat Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Sargoda Road Chak #66 Janbe Kotmomin ', '3075236541', '', '2015-09-17', NULL, 24, 5, true, NULL, 500454, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (184, 'Kiran', 'Javed', 'female', '2004-01-21', 'Baho Nagar', 'Muhammad Javed', 'Nusreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak#308H R PO.Box khas Tehsil Fort Abbas.', '3004627308', '3004627308', '2015-05-10', NULL, 27, 5, true, NULL, 500455, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (185, 'Iram', 'Javed', 'female', '2007-05-04', 'Islamabad', 'Muhmmad Javed ', 'Nusreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#308 Janbe Po.Box Bawal Nagar.', '3004627308', '', '2015-10-05', NULL, 25, 5, true, NULL, 500456, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (186, 'Kanwal ', 'Javed ', 'female', '2009-04-05', 'Islamabad', 'Muhmmad Javed ', 'Nusreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#308 Janbe Po.Box Bawal Nagar.', '3004627308', '', '2015-10-05', NULL, 26, 5, true, NULL, 500457, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (187, 'Mehak ', 'Bibi', 'female', '2010-11-01', 'Islamabad', 'Naiaz Ahmad Faridi', 'Hassna Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Village Maira Jaffar PO.Box Gholra Sharif ICT.', '3085697485', '', '2015-11-05', NULL, 22, 5, true, NULL, 500461, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (188, 'Muhammad Sami ', 'Ullha Faredi', 'male', '2009-03-19', 'Islamabad', 'niaz ahmad faredi', 'haseena bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Village Maira Jaffar PO.Box Gholra Sharif ICT.', '3335698745', '', '2015-11-05', NULL, 23, 5, true, NULL, 500463, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (189, 'Iqra', 'Bibi', 'male', '2003-03-30', 'Islamabad', 'Naiaz Ahmad Faridi', 'Hassna Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Village Maira Jaffar PO.Box Gholra Sharif ICT.', '3345646666', '', '2015-11-05', NULL, 25, 5, true, NULL, 500464, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (190, 'Muhmmad', 'Khalid', 'male', '2007-03-20', 'Islamabad', 'Muhmmad Akram', 'Manzooran', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Village Jhang Shamle Jhang', '3215545789', '', '2015-11-05', NULL, 24, 5, true, NULL, 500467, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (191, 'Usman', 'na', 'male', '2009-06-09', 'Islamabad', 'imtiaz husain', 'khalida parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak no 48 shumaili po box sargodha', '3245896233', '', '2015-11-06', NULL, 24, 5, true, NULL, 500468, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (192, 'Nadia ', 'na', 'female', '2011-02-20', 'Islamabad', 'Imtiaz Hussain', 'Khalada Parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#28 Shamli Po.Box Sargohda ', '3442563258', '', '2015-11-06', NULL, 23, 5, true, NULL, 500469, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (193, 'Shial', 'Abbas ', 'male', '2010-07-18', 'Islamabad', 'Muhmmad Waseem ', '', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', '', '3426456211', '', '2015-11-06', NULL, 22, 5, true, NULL, 500472, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (194, 'Hamna ', 'Bibi', 'female', '2011-07-27', 'Islamabad', 'Muhmmad Shebaz', 'Shenaz Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Mohla Shreef Pora Chak#119 Attock', '3325265455', '', '2011-07-27', NULL, 22, 5, true, NULL, 500474, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (195, 'Malyka', 'na', 'female', '2006-06-15', 'Islamabad', 'Muhammad shebaz', 'Shenaz Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#119R B Balair PO box khas tehsil sangla hil nankana sab.', '3366598745', '', '2015-11-16', NULL, 26, 5, true, NULL, 500475, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (196, 'Waheeda', 'Bibi', 'female', '2009-08-15', 'Islamabad', 'Muhmmad Shabaz ', 'Shenaz Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Mohla SheefPura Village Chak#129 RB Bear', '3215423698', '', '2016-11-16', NULL, 24, 5, true, NULL, 500476, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (197, 'Rida ', 'Amdad', 'female', '2011-06-05', 'Islamabad', 'Amdad Hussian', 'Parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Basti hussinaBad  Po.box Mandishahjeewna jhng', '0343-1219330', '', '2015-11-23', NULL, 20, 5, true, NULL, 500482, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (198, 'Pazeer', 'Khan', 'male', '2004-01-01', 'Islamabad', 'Yar muhammad', 'Rajmina', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'House No SA 1027 St#2 Mohallah Kareem Abad Sadiq abad', '3439761277', '', '2015-11-23', NULL, 26, 5, true, NULL, 500483, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (199, 'Mussarat ', 'Bibi', 'female', '2006-05-02', 'Sarghodha', 'Yaseen', 'Razia Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak No 155 N B post office nakda Sargodha', '0346-8668378', '', '2015-11-23', NULL, 23, 5, true, NULL, 500484, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (200, 'Qasim ', 'Yaseen', 'male', '2010-03-10', 'Islamabad', 'Yaseen', 'Razia Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak#155  NB Po.Box ShahNakdar Siawalli', '0343-35696474', '', '2015-11-23', NULL, 20, 5, true, NULL, 500485, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (201, 'Arshad', 'Yaseen', 'male', '2010-05-05', 'Islamabad', 'Yaseen', 'Razia Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak#155  NB Po.Box ShahNakdar Siawalli', '0343-35696474', '', '2015-11-23', NULL, 20, 5, true, NULL, 500486, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (202, 'Mafia ', 'Javaid', 'female', '2002-01-01', 'Islamabad', 'Muhmmad Javed ', 'Nusreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#308 Janbe Po.Box Bawal Nagar.', '3004627308', 'Nil', '2015-12-07', NULL, 21, 5, true, NULL, 500490, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (203, 'Labia ', 'Shaid', 'female', '2002-01-01', 'Islamabad', 'Shahid Iqbal ', 'khatoon Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak135 Po.box Choniot Jhang', '0341-5264584', 'Nil', '2010-01-06', NULL, 22, 5, true, NULL, 500491, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (204, 'Adan', 'Shehzad', 'male', '2005-09-13', 'Islamabad', 'Tariq mashi', 'jusfeen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak 132  b post office sarghodha.', '3043749894', '3043749894', '2015-12-22', NULL, 25, 5, true, NULL, 500496, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (205, 'Abbas', 'Ali', 'male', '2009-08-23', 'Islamabad', 'Ghulam Murtaza', 'Rani bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak#73 Bagna Chapal Sadar Fasliabad', '3365426987', '', '2015-12-13', NULL, 23, 5, true, NULL, 500501, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (206, 'Hadier ', 'Ali', 'male', '2009-08-23', 'Islamabad', 'Ghulam Murtaza', 'Rani bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak#73 Bagna Chapal Sadar Fasliabad', '3332631568', '', '2015-12-13', NULL, 24, 5, true, NULL, 500502, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (207, 'Chashman', 'na', 'female', '2003-05-26', 'Islamabad', 'Ghulam Murtaza', 'Rani bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak#73 Bagna Chapal Sadar Fasliabad', '3425037245', '', '2015-12-13', NULL, 24, 5, true, NULL, 500503, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (208, 'Sadia ', 'na', 'female', '2001-12-05', 'Islamabad', 'muhammad ramzan', 'kalsoom bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak no 34 nb po box sarghoda', '3325698125', '', '2016-01-05', NULL, 20, 5, true, NULL, 500506, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (209, 'Muhammad', 'Adnan', 'male', '2008-01-28', 'Islamabad', 'muhammad ramzan', 'kalsoom bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak no 34 nb po box sarghoda', '3425698745', '', '2016-01-05', NULL, 20, 5, true, NULL, 500507, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (210, 'Mavish', 'Batool', 'female', '2002-01-01', 'Islamabad', 'Saleem', 'Humira Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak no 34 nb po box sarghoda', '3325698125', '', '2016-01-05', NULL, 20, 5, true, NULL, 500510, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (211, 'Aysha ', 'Sadiqa', 'female', '2011-03-05', 'Islamabad', 'Muhammad Afzal', 'Shameem Akhter', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Allah yar joota dakhna tehsil shorkot jhung', '3005615234', '', '2016-01-19', NULL, 20, 5, true, NULL, 500514, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (212, 'Muhmmad ', 'Tahir', 'male', '2009-02-10', 'Islamabad', 'Muhmmad Afzal ', 'Shameem Akhtar', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Allah Yar Po.box ShorKot jhang.', '3072569874', '', '2016-01-20', NULL, 22, 5, true, NULL, 500516, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (213, 'Fiza', 'Rahmat', 'female', '2002-01-01', 'Islamabad', 'Rahmat Ali', 'Rasoola Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Sargoda Road Chak #66 Janbe Kotmomin ', '0324-8765442', 'Nil', '2016-02-01', NULL, 24, 5, true, NULL, 500521, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (214, 'Sahba', 'Riast', 'female', '2009-05-06', 'Islamabad', 'Riast Ali', 'Humrra Rasiat', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Mohla GulshanAbad AliPur Chatha Wazeraabad Po.box Gujjrawala', '0304-8234097', '', '2016-11-01', NULL, 21, 5, true, NULL, 500525, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (215, 'Amir', 'Hassan', 'male', '2011-08-26', 'Islamabad', 'Riasat Ali', 'Humaira Riasat', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Ghulshan Bad Alipur chattha tehsil wazira abad gujranwala.', '3048234097', '3048234097', '2011-08-26', NULL, 22, 5, true, NULL, 500526, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (216, 'Muhammad', 'Usman', 'male', '2012-02-20', 'Nankana Sahib', 'Liaqat Ali ', 'Rukhsana Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'sector 1 ganji peeran post office morr nankana sahib', '3002563148', '', '2016-11-04', NULL, 21, 5, true, NULL, 500527, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (217, 'Aman ', 'Fatima', 'female', '2009-01-09', 'Islamabad', 'Liyqat Ali', 'Rukhsana Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Setor ganje Peera Po.box Morkada Nakana Sab', '3425698245', '', '2016-04-11', NULL, 22, 5, true, NULL, 500529, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (218, 'Hafiza ', 'Bibi', 'female', '2012-07-02', 'Islamabad', 'Muhmmad Hashim', 'Nasreen Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Jhanga AhmadPuar Bhawalpur', '0301-5331583', '', '2016-05-07', NULL, 22, 5, true, NULL, 500529, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (219, 'Ali', 'Zain', 'male', '2007-10-11', 'Islamabad', 'Tanveer Hussian', 'Shahida Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', '', '3152563149', '', '2016-04-11', NULL, 20, 5, true, NULL, 500531, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (220, 'Samar', 'Abbas', 'male', '2009-12-21', 'Islamabad', 'Muhmmad Akram', 'Sahiba Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Wala Ray PO.box Ranjwa District Chiniot.', '3325697854', '', '2016-04-16', NULL, 21, 5, true, NULL, 500544, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (221, 'Qamar', 'Abbas', 'male', '2007-12-01', 'Islamabad', 'Muhmmad Akram', 'Sahiba Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Wala Ray PO.box Ranjwa District Chiniot.', '3312563214', '', '2015-12-01', NULL, 25, 5, true, NULL, 500545, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (222, 'Samar', 'Abbas', 'male', '2006-12-16', 'Islamabad', 'mian gul muhammad', 'Janat Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'kalam kangal po box muhammdi shareef jiniot', '0341-4377482', '', '2016-04-15', NULL, 21, 5, true, NULL, 500550, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (223, 'Shahida ', 'Fareedi', 'male', '2013-03-13', 'Islamabad', 'Mian Gul Muhmmad ', 'Janat Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Mohla kattira Po.Box Muhmmadi Shareef Chinoit.', '0341-4377482', '', '2016-04-15', NULL, 21, 5, true, NULL, 500552, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (224, 'Fahad ', 'Ali', 'male', '2006-09-24', 'Islamabad', 'zafar iqbal', 'samina bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'house no 13 a45 mohla krachi compni sectr g9/2', '3375136468', '', '2016-12-02', NULL, 24, 5, true, NULL, 500557, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (225, 'Muskan', 'Bibi', 'female', '2006-01-10', 'Islamabad', 'Muhmmad Ramzan ', 'Noreen Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Ward#10 Baste RasoolPur Sianwal.', '3028906873', '', '2016-04-18', NULL, 25, 5, true, NULL, 500559, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (226, 'Nirma', 'Batool', 'female', '2008-12-15', 'Islamabad', 'Muhmmad Ramzan', 'Noreen Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Word#10 Mohla Baste Rasool Pur Farooqa Po.box Sargohda', '3028906873', '', '2016-04-18', NULL, 21, 5, true, NULL, 500560, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (227, 'Mehboob Ul', 'Hassan', 'male', '2004-09-20', 'Islamabad', 'Muhmmad Ramzan', 'Noreen Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Ward #10 Mohla RasoolPur Po.Box Sianwal.', '3028906873', '', '2016-05-18', NULL, 26, 5, true, NULL, 500561, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (228, 'Farwa ', 'Bibi', 'female', '2011-01-25', 'Islamabad', 'Muhmmad Ramzan', 'Noreen Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Word#10 Mohla Baste Rasool Pur Farooqa Po.box Sargohda', '3028906873', '', '2016-04-18', NULL, 21, 5, true, NULL, 500562, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (229, 'Aman', 'Fatima', 'female', '2012-12-13', 'Islamabad', 'Muhammad Akram', 'Nasreen Akram', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak 134 s b post office sarghodha.', '0305-8988252', '', '2016-01-06', NULL, 20, 5, true, NULL, 500563, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (230, 'Tehreem', 'Fatima', 'female', '2008-08-01', 'Shekhpura', 'Faqeer Hussain', 'Sadia perveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak damoaana po.box khas tehsil shekupura.', '3372564879', '', '2016-11-04', NULL, 27, 5, true, NULL, 500565, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (231, 'Muhmmad', 'Razwan', 'male', '2011-11-20', 'Islamabad', 'Zafar iqbal', 'Samina Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Gao Kalooni PO.box Kanveewala Laiya ', '3331456254', '', '2012-12-02', NULL, 27, 5, true, NULL, 500565, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (232, 'Zeeshan', 'na', 'male', '2011-01-20', 'Islamabad', 'Umer Daras ', 'Asia ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Kalooni#1 Laiya PO.box kanwawala Choniot', '3215214632', '', '2016-04-21', NULL, 20, 5, true, NULL, 500567, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (233, 'Muhammad', 'Yaseen', 'male', '2013-12-28', 'Islamabad', 'Amir Rasheed', 'Razia Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'bagh kuhna post office pindi bhatian .', '0304-8232806', '', '2016-04-22', NULL, 20, 5, true, NULL, 500571, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (234, 'Mobeen', 'Fatima', 'female', '2009-08-27', 'Islamabad', 'Amir Rasheed ', 'Raiza Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'bagh kuhna post office pindi bhatian .', '0304-8232806', '', '2016-04-22', NULL, 20, 5, true, NULL, 500571, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (235, 'Muhammad', 'Shazaib', 'male', '2011-12-23', 'Islamabad', 'Amir Rasheed', 'Razia Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'bagh kuhna post office pindi bhatian .', '0304-8232806', '', '2013-01-06', NULL, 24, 5, true, NULL, 500572, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (236, 'Sawiara ', 'Bibi', 'female', '2010-12-26', 'Islamabad', 'Amir Rasheed ', 'Razia Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Pandi battia Po.Box Hazifabad.', '0304-8232806', '', '2016-04-22', NULL, 21, 5, true, NULL, 500573, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (237, 'Alisha ', 'Fatima', 'female', '2011-06-23', 'Islamabad', 'Sarfaraz khan', 'Umaira rifat', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak# 81 janubi post office khas Sarghodha', '0301-6487454', '', '2016-06-05', NULL, 22, 5, true, NULL, 500579, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (238, 'Sugrra ', 'Fatima', 'female', '2008-07-04', 'Islamabad', 'Muhammad Fiaz', 'Farzana', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'cha jangi wala jag khuch post office Jhung', '0304-0014034', '', '2016-06-05', NULL, 22, 5, true, NULL, 500582, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (239, 'Muqadas', 'Fiaz', 'female', '2008-06-05', 'Islamabad', 'Muhammad Fiaz', 'Farzana', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'cha jangi wala jag khuch post office Jhung', '0304-0014034', '', '2016-06-05', NULL, 22, 5, true, NULL, 500583, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (240, 'Amna ', 'Fiaz', 'female', '2010-04-05', 'Islamabad', 'Muhammad Fiaz', 'Farzana', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'cha jangi wala jag khuch post office Jhung', '0304-0014034', '', '2016-06-05', NULL, 22, 5, true, NULL, 500584, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (241, 'Zain', 'Abbas', 'male', '2012-04-05', 'Islamabad', 'Muhammad Fiaz', 'Farzana', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'cha jangi wala jag khuch post office Jhung', '0304-0014034', '', '2016-06-05', NULL, 20, 5, true, NULL, 500585, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (242, 'Rabia ', 'Sinkandar', 'female', '2007-05-21', 'Islamabad', 'Sikandar hyyat', 'Naseem', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#39 NG Po.Box Sargohda ', '0304-0014034', '', '2016-05-06', NULL, 22, 5, true, NULL, 500586, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (243, 'Batool ', 'Sikandar', 'female', '2006-09-10', 'Islamabad', 'Sikandar hyyat', 'Naseem', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#39 NG Po.Box Sargohda ', '0304-0014034', '', '2016-05-06', NULL, 22, 5, true, NULL, 500587, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (244, 'Abbas ', 'Sinkandar', 'male', '2009-05-05', 'Islamabad', 'Sinder Hayat ', 'Naseem Fatima ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#039NB Po.box Sargohda ', '0345-5159866', '', '2016-07-06', NULL, 20, 5, true, NULL, 500588, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (245, 'Umair', 'na', 'male', '2003-03-25', 'Islamabad', 'Muhmmad Hashim', 'Nasreen Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Jhanga AhmadPuar Bhawalpur', '0301-5331583', '', '2016-05-07', NULL, 20, 5, true, NULL, 500591, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (246, 'Muqadas', 'Bibi', 'female', '2006-11-12', 'Islamabad', 'Ghulam Muhammad', 'Razia Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak 115 janubi po box sanawali Srghodha', '3022563214', '', '2016-05-07', NULL, 23, 5, true, NULL, 500594, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (247, 'Amna ', 'Shazadi', 'female', '2009-09-27', 'Islamabad', 'Muhmmad Ali ', 'Abiada Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Kan Muttowar Po.BOX jalpur Buttia Pindi Buttia  Hazifabad ', '3225698547', 'Nil', '2016-08-02', NULL, 20, 5, true, NULL, 500606, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (248, 'Mukhtar', 'Ahmad ', 'male', '2007-11-02', 'Islamabad', 'Muhmmad Ali ', 'Abida Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Kan Muttowar Po.BOX jalpur Buttia Pindi Buttia  Hazifabad ', '3225698547', '', '2016-08-02', NULL, 20, 5, true, NULL, 500607, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (249, 'Abdul', 'Rehman', 'male', '2001-12-15', 'Khanewal', 'Muhammad Ramzan', 'Robina Kouser', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'house no5 street no 7 mohallah sadar bazar Khanewall.', '3122563214', '', '2016-11-08', NULL, 27, 5, true, NULL, 500611, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (250, 'Yashwa', 'na', 'female', '2010-09-25', 'Islamabad', 'Mushtaq mashi', 'Parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chaq 341 miltarry form post office khas okarra', '3132563214', '', '2016-12-08', NULL, 24, 5, true, NULL, 500612, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (251, 'Muskan', 'na', 'female', '2013-01-19', 'Islamabad', 'Mustaq Masih', 'Parveen Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#314 L Meltire Foam Po.box Okara ', '3345048340', '', '2016-08-12', NULL, 20, 5, true, NULL, 500613, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (252, 'Maryam', 'Fatima', 'female', '2014-09-12', 'Islamabad', 'allha dita', 'nazia ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak no 100 sbpoboxsarghodha', '3425632569', '', '2016-09-19', NULL, 20, 5, true, NULL, 500614, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (253, 'Shehrooz ', 'Ali', 'male', '2008-04-25', 'Islamabad', '', 'Naiaz Noreen ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#100 SG Po.Box Sargohda.', '0344-9151922', '', '2016-09-19', NULL, 22, 5, true, NULL, 500615, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (254, 'Ghulam', 'Bibi', 'female', '2005-05-03', 'Islamabad', 'Ghulam Ali', 'Rifat bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#59 Janubi dakhana Sarghodha', '3475123489', '', '2016-04-19', NULL, 24, 5, true, NULL, 500617, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (255, 'Anus ', 'na', 'female', '2013-12-27', 'Islamabad', 'Muhmmad Jameel', 'Fozia Bano', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Jamtar PO.box Kohta Rawlpindi', '3225698416', '', '2016-09-19', NULL, 24, 5, true, NULL, 500617, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (256, 'Sofian ', 'Fida ', 'male', '2010-02-05', 'Islamabad', 'Fida Hussain', 'faiz mai', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Shakuwala hafiazabad Po.Box kas jalapur.', '0345-599766', 'Nil', '2016-09-20', NULL, 20, 5, true, NULL, 500618, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (257, 'Saqib', 'Ali', 'male', '2010-10-20', 'Islamabad', 'Jangeer Hussain', 'Farzana ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'gao Allah Hoo PO.box Deen Pur Kabilwala Khanwala ', '3370597845', '', '2016-09-20', NULL, 20, 5, true, NULL, 500619, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (258, 'Yaseen', 'na', 'male', '2008-05-09', 'Islamabad', 'Liaqat Ali ', 'Zahrra Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'waran Post office khas shekupura ', '0344-400593', '', '2016-09-20', NULL, 21, 5, true, NULL, 500621, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (259, 'Saqlain ', 'Abbas', 'male', '2010-10-18', 'Islamabad', 'Laiqat Ali ', 'Zahrra Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'waran Post office khas shekupura ', '0344-400593', '', '2016-09-20', NULL, 22, 5, true, NULL, 500622, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (260, 'Fatima ', 'Bibi', 'female', '2009-01-26', 'Islamabad', 'Omer Nawaz Khan', 'Bushra Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'norod tehsil bannu.', '0332-9924248', '', '2016-09-21', NULL, 22, 5, true, NULL, 500623, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (261, 'Muhammad', 'na', 'male', '2011-04-17', 'Islamabad', 'Omer Nawaz Khan', 'Bushra', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'norod tehsil Bannu.', '0332-9924248', '', '2016-09-21', NULL, 22, 5, true, NULL, 500624, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (262, 'Palwasha', 'na', 'female', '2006-06-06', 'Islamabad', 'Salamat Mashi', 'Taraza Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak# 36 janubi post office khas Sarghodha', '3345069854', '', '2016-09-21', NULL, 21, 5, true, NULL, 500625, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (263, 'Dauod', 'na', 'male', '2008-08-05', 'Islamabad', 'Salamt Mashi', 'Taraza Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak# 36 janubi post office khas Sarghodha', '3040014034', '', '2016-09-21', NULL, 21, 5, true, NULL, 500626, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (264, 'Usman', 'Saqlain', 'male', '2006-11-15', 'Islamabad', 'Muhammad Saqlain', 'Sajida Saqlain', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'beer wali mandi shah jeevna Po box khas jhung.', '3142564789', '', '2016-09-21', NULL, 27, 5, true, NULL, 500627, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (265, 'Irfan ', 'Salqlan', 'male', '2008-03-03', 'Islamabad', 'Muhammad Saqlain', 'Sajida Saqlain', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'beer wali mandi shah jeevna Po box khas jhung.', '3142564789', '', '2016-09-21', NULL, 20, 5, true, NULL, 500628, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (266, 'Alisha ', 'Saqlain', 'female', '2009-08-06', 'Islamabad', 'Muhmmad Saqlain', 'Sajjida Saqlian', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'beer wali mandi shah jeevna Po box khas jhung.', '3075698456', '', '2016-09-21', NULL, 21, 5, true, NULL, 500629, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (267, 'Kinza', 'Sultan', 'female', '2006-10-07', 'Islamabad', 'Suyltan Ahmed', 'Zahida Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#59 Janubi dakhana Sarghodha', '33265', '', '2016-09-22', NULL, 24, 5, true, NULL, 500630, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (268, 'Zeeshan', 'na', 'male', '2011-11-01', 'Islamabad', 'Mushtaq Maseeh', 'Parveen Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#34 Mintre Foam Po.box Okra .', '0300-5505742', '', '2016-09-20', NULL, 22, 5, true, NULL, 500637, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (269, 'Ameer', 'Hamza', 'male', '2007-04-07', 'Islamabad', 'irfan ullha', 'Husan Taja ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'alladad naiko khair po box saray norang laki marwat', '0300-5138786', '', '2016-10-05', NULL, 20, 5, true, NULL, 500638, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (270, 'Afnan', 'na', 'male', '2008-04-16', 'Islamabad', 'irfan ullha', 'Husan Taja ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'alladad naiko khair po box saray norang laki marwat', '0300-5138786', '', '2016-10-05', NULL, 20, 5, true, NULL, 500639, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (271, 'Ayesha ', 'Bibi', 'female', '2007-04-09', 'Islamabad', 'Irfaullah Khan', 'Husan Taja ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Nadarullah BekoKhail Po.Box Sarha lorang laki Marwat.', '0300-5138786', '', '2016-10-05', NULL, 25, 5, true, NULL, 500640, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (272, 'Zahrra ', 'na', 'female', '2013-05-03', 'Islamabad', 'Khalid Ahmed', 'Shehnaz', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak#115 A S  B post office khas sarghodgha', '0341-3822164', 'Nil', '2016-10-10', NULL, 20, 5, true, NULL, 500641, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (273, 'Zoya ', 'Zahid', 'female', '2009-09-23', 'Islamabad', 'Ahtasham Ismail', 'Nasra ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', '', '0343-0023866', 'Nil', '2016-11-07', NULL, 22, 5, true, NULL, 500642, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (274, 'Shehran', 'Zahid', 'male', '2016-07-16', 'Islamabad', 'Ahtasham Ismail', 'Nasra ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', '', '0343-0023866', '', '2016-11-07', NULL, 22, 5, true, NULL, 500643, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (275, 'Muzamil', 'Zahid', 'male', '2008-11-06', 'Islamabad', 'Ehtasham Ismail', 'Nasira', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Pindi kandi wall post office khas jhung', '0343-0023866', '', '2016-07-11', NULL, 22, 5, true, NULL, 500644, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (276, 'Yasir', 'Abbas', 'male', '2012-01-01', 'Islamabad', 'Nasir', 'Kouser', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Pindi kandi wall post office khas jhung', '3325251234', '', '2016-10-11', NULL, 20, 5, true, NULL, 500645, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (277, 'Ahmaed', 'Hassan', 'male', '2009-01-01', 'Islamabad', 'Nasir ', 'Kouser ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Pindi kandi wall post office khas jhung', '3425695412', '', '2016-10-11', NULL, 20, 5, true, NULL, 500646, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (278, 'Alisha', 'Bibi', 'female', '2011-01-01', 'Islamabad', 'Nasir', 'Kousar', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Kanpuwal PO.box Chonoit Jhang', '0345-3016455', '', '2016-11-10', NULL, 20, 5, true, NULL, 500647, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (279, 'Moudsir ', 'Iqbal', 'male', '2002-01-01', 'Islamabad', 'zafir iqbal', 'asia bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'street hajia wali street no1 mohla manzoor hayat kalonibhalwal', '3225698457', '', '2016-11-16', NULL, 20, 5, true, NULL, 500648, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (280, 'Rabia ', 'Fatima', 'female', '2013-01-10', 'Islamabad', 'Muhammad Luqman', 'Nosheen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Muhammad wala dakhana dera jharra shapur sargodha.', '3215231459', '', '2016-11-20', NULL, 20, 5, true, NULL, 500649, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (281, 'Saima', 'Bibi', 'female', '2010-01-15', 'Islamabad', 'Muhmmad Luqman', 'Naseem Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Muhmmad Wala Dara Jera Shahpur PO.box Sargoda', '3335698745', '', '2016-11-20', NULL, 21, 5, true, NULL, 500650, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (282, 'Muhmmad', 'Imarn', 'male', '2008-01-01', 'Islamabad', 'Muhmmad Luqman', 'Naseem Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Muhmmad Wala Dara Jera Shahpur PO.box Sargoda', '3362569587', '', '2014-11-01', NULL, 23, 5, true, NULL, 500651, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (283, 'Kainat', 'Bibi', 'female', '2008-01-01', 'Islamabad', 'Muhammad luqman', 'Naseem', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'mohammadwala post office dera charra sarghodha.', '3461903048', '3461903048', '2016-11-20', NULL, 22, 5, true, NULL, 500652, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (284, 'Allah', 'Ditta', 'male', '2008-07-14', 'Islamabad', 'Muhmmad Ejaz ', 'Kousar Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Muhabat kalooni koat Momin Po.Box Bhwal Sargodha ', '3315698745', '', '2016-12-01', NULL, 20, 5, true, NULL, 500653, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (285, 'Muhammad', 'Waseem', 'male', '2003-07-18', 'Islamabad', 'Mehmood Akhter', 'Noreen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'house 369jandinwala dalgira behra bhalwal sargodha', '3362541689', '', '2016-01-12', NULL, 23, 5, true, NULL, 500654, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (286, 'Sadia ', 'na', 'female', '2010-08-14', 'Islamabad', 'Zafar iqbal', 'Samina', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Gao Kalooni PO.box Kanveewala Laiya ', '3316958462', '', '2016-12-01', NULL, 20, 5, true, NULL, 500655, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (287, 'Irfan', 'na', 'male', '2005-01-01', 'Islamabad', 'Muhammad Arif', 'hufizan Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'lak shamali post office khas jhung', '0344-0560155', '3440560155', '2016-02-12', NULL, 22, 5, true, NULL, 500658, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (288, 'Danish', 'na', 'male', '2006-02-03', 'Islamabad', 'Muhammad Arif', 'Hafeezan Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'lak shamali post office khas jhung', '0344-0560155', '', '2016-02-12', NULL, 22, 5, true, NULL, 500659, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (289, 'Roshan ', 'Ishtiaq', 'male', '2008-08-28', 'Islamabad', 'Ishttaq Maseeh', 'Margayat', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Near ralway Sation Godam Gujar Khan Rawlpindi.', '0341-5179646', '', '2016-12-03', NULL, 22, 5, true, NULL, 500660, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (290, 'Ume', 'Farwa', 'female', '2012-04-21', 'Islamabad', 'Sarfaraz Ahmad', 'Rehnan Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Jode Sultan Po.box Khanawala Jhang', '3356958745', '', '2016-12-03', NULL, 20, 5, true, NULL, 500661, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (291, 'Ahmar', 'Sarfraz ', 'male', '2010-11-22', 'Islamabad', 'Sarfaraz Ahmad', 'Rehnan Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Jode Sultan Po.box Khanawala Jhang', '3346952634', '', '2016-12-03', NULL, 20, 5, true, NULL, 500662, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (292, 'Kiran ', 'Bibi', 'female', '2010-09-04', 'Islamabad', 'Sabar Ali', 'Gughee Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#129 Jeeb Bay Po.Box Jhang', '3332562314', '', '2016-12-03', NULL, 20, 5, true, NULL, 500664, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (293, 'Manoor ', 'Bibi', 'female', '2012-01-15', 'Islamabad', 'Noshair Ali', 'Shanaz ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Jamal jutti chak No 129 post office chiniot', '0345-1786788', '', '2016-12-03', NULL, 20, 5, true, NULL, 500665, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (294, 'Mehnaz', 'Bibi', 'female', '2008-08-25', 'Islamabad', 'Noshair Ali', 'Shehnaz ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Jamal jutti chak No 129 post office chiniot', '0345-1786788', '', '2016-03-12', NULL, 20, 5, true, NULL, 500666, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (295, 'Attia ', 'Tofail', 'female', '2009-04-14', 'Mureedky', 'Muhammad tufail', 'Kubra bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Mohallah shehzad town narowal road feroz wala zila shekhpura.', '3215698745', '', '2016-03-12', NULL, 20, 5, true, NULL, 500667, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (296, 'Fazian', 'Ali', 'male', '2011-08-12', 'Islamabad', 'Muhmmad Sajad ', 'Naseera batool', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#302 Jeem Bah Kathor Galan Po.box Gujra Tobatexsing ', '3332654789', '', '2016-12-05', NULL, 20, 5, true, NULL, 500668, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (297, 'Rehan ', 'Abbas', 'male', '2009-02-07', 'Islamabad', 'Muhmmad Sajid ', 'Nasira Batool', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak #303 Kashhoor Kala Po.Box Gobara Toba tek Sing', '3042365897', '', '2016-12-05', NULL, 21, 5, true, NULL, 500669, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (298, 'Muskan ', 'Bibi', 'female', '2011-08-02', 'Islamabad', 'Muhmmad Irfan', 'Samina Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'PO.box Kas Chak#536 Bakat Askeep TobaTexsing', '3325236124', '', '2006-12-05', NULL, 20, 5, true, NULL, 500670, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (299, 'Manoor ', 'Bibi', 'female', '2009-02-02', 'Islamabad', 'Muhmmad Irfan', 'Samina Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'PO.box Kas Chak#536 Bakat Askeep TobaTexsing', '3362531478', '', '2006-12-05', NULL, 20, 5, true, NULL, 500671, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (300, 'Sadaf ', 'Balooch', 'female', '2008-12-01', 'Islamabad', 'Ghulam Asghar', 'Saeeda bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'PO.box Sajeera Mahkoolkula  Gazi Khan', '3425236214', '', '2016-12-05', NULL, 25, 5, true, NULL, 500673, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (301, 'Zeeshan ', 'Haider', 'male', '2011-01-03', 'Islamabad', 'Allah Yar shera', 'Fatima', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak#139 S G po.box khas mianwali.', '3320124891', '', '2016-05-12', NULL, 21, 5, true, NULL, 500674, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (302, 'Sahail', 'na', 'male', '2007-10-04', 'Islamabad', 'Waris Slass', '', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Bher Chak#119 Po.Box nakana sab', '3346598745', '', '2016-12-05', NULL, 22, 5, true, NULL, 500675, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (303, 'Sawera ', 'na', 'female', '2010-03-01', 'Islamabad', 'Muhammad Afzal', 'Shameem Akhter', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Allah yar joota dakhna tehsil shorkot jhung', '3005615234', '', '2011-01-19', NULL, 26, 5, true, NULL, 500676, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (304, 'Shiza ', 'Batool', 'female', '2010-05-04', 'Islamabad', 'Riasat Ali', 'Shaida Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Po box rasool pur tarrar. Pindi bhatian hafizabad', '3132569874', '', '2016-12-06', NULL, 20, 5, true, NULL, 500677, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (305, 'Muhammad', 'Haroon', 'male', '2012-05-20', 'Islamabad', 'fariad khan', 'iram bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'po box shebaz azmat khel shebaz azmat khail banu', '3025040298', '', '2016-12-06', NULL, 20, 5, true, NULL, 500678, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (306, 'Ali', 'Hassan', 'male', '2009-01-16', 'Islamabad', 'Fiaz Ahmad', 'Balkees ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Kot Ameer Shah Po.Box laiya Chinoet', '3325632145', '', '2016-12-06', NULL, 22, 5, true, NULL, 500679, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (308, 'Miryab', 'Javed', 'female', '2010-04-10', 'Islamabad', 'Javed Masih', 'Razia Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak no14r58poboxsahiwal', '3435369547', '', '2016-12-07', NULL, 20, 5, true, NULL, 500681, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (309, 'Wahid ', 'Ali', 'male', '2009-07-18', 'Islamabad', 'Saeed Ahmad', 'Sidra Gulshan', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Bakan Kurda Po.Box hazfiabad.', '0341-0444125', '', '2016-11-09', NULL, 22, 5, true, NULL, 500683, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (310, 'Nayyar', 'Abbas', 'male', '2011-11-18', 'Islamabad', 'malik amjad mehmood', 'nasreen bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'kanywala po box lalian jiniot', '3435691324', '', '2016-12-08', NULL, 20, 5, true, NULL, 500684, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (311, 'Sanam', 'na', 'female', '2006-06-03', 'Islamabad', 'Allah Dita ', 'Allah Raki', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'bagna Japal Po.box Faslibad Sadar Fasliabab', '0304-5987258', 'Nil', '2016-12-08', NULL, 20, 5, true, NULL, 500686, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (312, 'Mustehsan', 'na', 'male', '2005-03-15', 'Islamabad', 'Nasir Ahmed', 'Shazia Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Mera jafar po box Golrra shareef Islabmabad', '3425697461', '', '2016-12-08', NULL, 27, 5, true, NULL, 500687, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (313, 'Zulifqar', 'Abdullah', 'male', '2010-02-15', 'Islamabad', 'muhmmad Shafi', 'Tanzela Shafi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Shamale Ghosht Market Po.Box Kattrain', '0304-5588230', '0342-432668', '2016-12-08', NULL, 21, 5, true, NULL, 500688, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (314, 'Nazim', 'Ali', 'male', '2007-12-27', 'Islamabad', 'Muhammab Azam', 'Nusrat Iqbal', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#100 janubi post office khas Sarghodha', '3402563145', '', '2016-08-12', NULL, 22, 5, true, NULL, 500689, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (315, 'Maryam', 'Rani', 'female', '2007-12-27', 'Islamabad', 'Muhammab Azam', 'Nusrat Iqbal', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#100 janubi post office khas Sarghodha', '3321569745', '', '2016-08-12', NULL, 21, 5, true, NULL, 500690, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (316, 'Zeeshan', 'Haidar', 'male', '2010-10-01', 'Islamabad', 'Ghulam Abbas', 'Zahora Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'jalabala PO.box Randar Sahiwal', '0302-2530432', '', '2016-12-13', NULL, 20, 5, true, NULL, 500691, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (317, 'Fazal ', 'Abbas', 'male', '2004-12-30', 'Islamabad', 'ghulam abbas', 'Zahora Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'bala po box radan sahiwal sargodha', '3325123654', '', '2016-12-13', NULL, 20, 5, true, NULL, 500692, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (318, 'Sulman', 'na', 'male', '2010-11-18', 'Islamabad', 'Muhmmad Hussian', 'Samina ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'jabana post office Lalian chiniot.', '3365123658', '', '2016-12-16', NULL, 20, 5, true, NULL, 500693, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (319, 'Mobeen', 'Ali', 'male', '2012-12-08', 'Islamabad', 'Muhammad Hasnain', 'Samina', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'jabana post office Lalian chiniot.', '0341-5655575', 'Nil', '2016-12-16', NULL, 20, 5, true, NULL, 500694, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (320, 'Aliza ', 'Khalid ', 'female', '2009-07-12', 'Islamabad', 'Khalid Mahmood', 'Noreen Kanwal', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#379 TTS Po.box Tobatexsing', '3325469851', '', '2016-12-20', NULL, 20, 5, true, NULL, 500695, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (321, 'Usman', 'na', 'male', '2011-06-19', 'Islamabad', 'Khalid Mahmood', 'Noreen Kanwal', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#379 TTS Po.box Tobatexsing', '3325123654', '', '2016-12-20', NULL, 20, 5, true, NULL, 500696, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (322, 'Athsam ', 'Ali', 'male', '2012-09-12', 'Islamabad', 'Muhmmad Safdar Butta', 'Shanaz ', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Niko Kara Chak#126 Jeem  BAY PO.box Choniot.', '0341-5883099', '', '2017-01-02', NULL, 20, 5, true, NULL, 500697, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (323, 'Muhmmad', 'Rehan', 'male', '2006-06-11', 'Islamabad', 'Muhmmad Ramzan', 'Robina Kousar', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Home#5 StReet #& Mohla Sadar Bazar Jahnia Po.box Khanwal', '3405135156', '', '2017-01-02', NULL, 20, 5, true, NULL, 500698, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (307, 'Imran', 'Ali', 'male', '2012-01-01', 'Islamabad', 'Dilawar Hussain', 'Shameem', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Shakuwala hafiazabad Po.Box kas jalapur.', '0345-599976', '', '2016-12-07', 'check', 22, 5, true, NULL, 500680, NULL, '2017-02-09', 'admin', NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (324, 'Muhmmad', 'Rehan', 'female', '2006-06-11', 'Islamabad', 'Muhmmad Ramzan', 'Robina Kousar', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Home#5 StReet #& Mohla Sadar Bazar Jahnia Po.box Khanwal', '3405135156', '', '2017-01-02', NULL, 20, 5, true, NULL, 500698, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (325, 'Adeel', 'Amir Ali', 'male', '2011-04-13', 'Islamabad', 'Amir Ali', 'Asima Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Pul ner bacha Khalna PO.box Kot Momin', '0340-6090866', '', '2017-01-01', NULL, 20, 5, true, NULL, 500699, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (326, 'Habibullah', 'na', 'male', '2012-05-18', 'Islamabad', 'Amir Ali', 'Aisma Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Pull Neer Bacha Kalan  Koat Momin Po.box Sargohda', '0340-6090866', '', '2016-11-02', NULL, 20, 5, true, NULL, 500700, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (327, 'Fatima ', 'na', 'female', '2006-11-30', 'Islamabad', 'Muhammad Shafeeq', 'Yasmeen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Lopowali PO.box Samriyal Sialkot.', '3105129511', '', '2017-01-02', NULL, 24, 5, true, NULL, 500701, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (328, 'Ali', 'Hadier ', 'male', '2012-03-28', 'Islamabad', 'Muhmmad Shafeeq', 'Yasmeen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Lopowali PO.box Samriyal Sialkot.', '0334-478657', '', '2017-01-02', NULL, 20, 5, true, NULL, 500702, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (329, 'Mehronisa', 'na', 'female', '2002-01-01', 'Islamabad', 'Younas Masih ', 'Rashma Bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Mohla Baly Bani wala Foroz Wala PO.box Shukopura ', '0324-5490834', '', '2017-01-02', NULL, 20, 5, true, NULL, 500703, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (330, 'Rafqat ', 'Abbas ', 'male', '2009-10-19', 'Islamabad', 'Laiqat Hussain ', 'Parveen', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Chak#35 Shamle Po.Box  Sargohda', '0302-5321435', 'Nil', '2017-01-02', NULL, 20, 5, true, NULL, 500704, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (331, 'Sumera', 'na', 'female', '2002-01-01', 'Islamabad', 'muhammd manzoor', '', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak no 115 rasla alaf janobi po box sargodha', '3045698745', '', '2017-01-02', NULL, 20, 5, true, NULL, 500705, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (332, 'Aleeza', 'Fatima', 'female', '2013-01-08', 'Islamabad', 'saefraz khan', 'humera riffat', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'chak no 81 janobi po box sarghodha', '0301-6487454', '', '2016-05-06', NULL, 20, 5, true, NULL, 500706, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (333, 'Ambreen', 'na', 'female', '2002-01-01', 'Islamabad', 'khizar hayyat', 'safia bibi', 'Opposit F11/1 Dead End nazimudin Road Village Maira Jaffer ICT', 'Pull Neer Bacha Kalan  Koat Momin Po.box Sargohda', '0340-6090866', '', '2017-01-02', NULL, 20, 5, true, NULL, 500706, NULL, '2017-02-05', NULL, NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (32, 'anushay', 'qureshi', 'female', '2000-01-15', '', '', '', '', '', '', '', '2017-01-20', 'left for another school', 5, 2, false, '2017-02-19', 123, 'gone_to_regular_school', '2017-02-18', 'admin', NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (334, 'kanye', 'west', 'male', '2014-11-20', '', '', '', '', '', '', '', '2016-11-20', 'yo', 20, 5, false, '2017-02-14', 211, 'returned_to_village', '2017-02-18', 'admin', '', 100, '', 20);
INSERT INTO students_student VALUES (335, 'goldi', 'locks', 'female', '2012-01-01', '', '', '', '', '', '', '', '2015-01-01', '', 26, 5, true, NULL, 12312, NULL, '2017-02-18', 'admin', '', 100, '', 1);
INSERT INTO students_student VALUES (338, 'de', 'dee', 'female', '2017-01-01', '', '', '', '', '', '', '', '2017-01-01', '', 1, 1, true, NULL, 21211, NULL, '2017-02-18', 'admin', NULL, 100, NULL, 1);
INSERT INTO students_student VALUES (339, 'gsdf', 'gsdfs', 'male', '2013-02-14', '', '', '', '', '', '', '', '2017-02-19', '', 21, 5, true, NULL, 7676, NULL, '2017-02-19', 'admin', NULL, 100, NULL, 21);
INSERT INTO students_student VALUES (336, 'Mickey', 'Mouse', 'male', '2010-01-01', 'Disneyland', '', '', '', '', '', '', '2017-02-01', '3rd student from this HH', 6, 3, false, '2017-02-08', 123, 'started_work', '2017-02-18', 'admin', '', 100, '', 1);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('students_student_id_seq', 339, true);


--
-- Data for Name: students_studenthistory; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO students_studenthistory VALUES (1, '2017-02-01', 'PK1_M1_A_evening', '2017-02-18', 336);
INSERT INTO students_studenthistory VALUES (2, '2017-02-18', 'PK2_M2_A_evening', '2017-02-18', 336);
INSERT INTO students_studenthistory VALUES (3, '2017-02-18', 'PK3_Class 3_A_evening', '2017-02-18', 336);
INSERT INTO students_studenthistory VALUES (4, '2016-11-20', 'PK5_Play Group_A_morning', '2017-02-18', 334);
INSERT INTO students_studenthistory VALUES (5, '2017-01-01', 'PK1_M1_A_evening', '2017-02-18', 338);
INSERT INTO students_studenthistory VALUES (6, '2017-02-19', 'PK5_Nursery_A_morning', '2017-02-19', 339);


--
-- Name: students_studenthistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('students_studenthistory_id_seq', 6, true);


--
-- Data for Name: tattendance_teacherattendance; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--



--
-- Name: tattendance_teacherattendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('tattendance_teacherattendance_id_seq', 1, false);


--
-- Data for Name: teachers_teacher; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO teachers_teacher VALUES (2, 'principal', 'the', 'principal', 'female', '2015-01-21', NULL, NULL, 'fasd', 3, 'something', '3dsa', 'something', NULL);
INSERT INTO teachers_teacher VALUES (3, 'teacher', 'katy', 'perry', 'female', '2012-05-21', NULL, NULL, 'the address', 4, 'end', '324123 324', 'start', NULL);
INSERT INTO teachers_teacher VALUES (4, 'principal', 'irfan', 'khan', 'male', '2016-09-05', NULL, NULL, '32fad', 5, 'fasd', '23423', 'asdfsd', NULL);
INSERT INTO teachers_teacher VALUES (1, 'management', 'admin', 'admin', 'male', '2017-01-15', NULL, NULL, 'something', 1, 'something', 'something', 'somethin', NULL);


--
-- Name: teachers_teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('teachers_teacher_id_seq', 4, true);


--
-- Data for Name: teachers_teacher_pkss_school; Type: TABLE DATA; Schema: public; Owner: pkss_admin
--

INSERT INTO teachers_teacher_pkss_school VALUES (1, 1, 1);
INSERT INTO teachers_teacher_pkss_school VALUES (2, 1, 2);
INSERT INTO teachers_teacher_pkss_school VALUES (3, 1, 3);
INSERT INTO teachers_teacher_pkss_school VALUES (4, 1, 4);
INSERT INTO teachers_teacher_pkss_school VALUES (5, 2, 1);
INSERT INTO teachers_teacher_pkss_school VALUES (6, 3, 1);
INSERT INTO teachers_teacher_pkss_school VALUES (7, 4, 2);
INSERT INTO teachers_teacher_pkss_school VALUES (8, 1, 5);
INSERT INTO teachers_teacher_pkss_school VALUES (9, 1, 7);


--
-- Name: teachers_teacher_pkss_school_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pkss_admin
--

SELECT pg_catalog.setval('teachers_teacher_pkss_school_id_seq', 9, true);


--
-- Name: access_useraccess_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY access_useraccess
    ADD CONSTRAINT access_useraccess_pkey PRIMARY KEY (id);


--
-- Name: access_useraccess_user_id_key; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY access_useraccess
    ADD CONSTRAINT access_useraccess_user_id_key UNIQUE (user_id);


--
-- Name: attendance_attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY attendance_attendance
    ADD CONSTRAINT attendance_attendance_pkey PRIMARY KEY (id);


--
-- Name: attendance_attendance_student_id_c444ff4c_uniq; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY attendance_attendance
    ADD CONSTRAINT attendance_attendance_student_id_c444ff4c_uniq UNIQUE (student_id, attendance_date);


--
-- Name: attendance_attendancecalendar_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY attendance_attendancecalendar
    ADD CONSTRAINT attendance_attendancecalendar_pkey PRIMARY KEY (id);


--
-- Name: attendance_attendancecalendar_school_id_8a884e70_uniq; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY attendance_attendancecalendar
    ADD CONSTRAINT attendance_attendancecalendar_school_id_8a884e70_uniq UNIQUE (school_id, first_day_of_month);


--
-- Name: attendance_nonscheduledholidays_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY attendance_nonscheduledholidays
    ADD CONSTRAINT attendance_nonscheduledholidays_pkey PRIMARY KEY (id);


--
-- Name: attendance_nonscheduledholidays_school_id_bd1bf519_uniq; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY attendance_nonscheduledholidays
    ADD CONSTRAINT attendance_nonscheduledholidays_school_id_bd1bf519_uniq UNIQUE (school_id, holiday_date);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: classes_class_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY classes_class
    ADD CONSTRAINT classes_class_pkey PRIMARY KEY (id);


--
-- Name: classes_class_school_id_316cb331_uniq; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY classes_class
    ADD CONSTRAINT classes_class_school_id_316cb331_uniq UNIQUE (school_id, class_name, section);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: donors_donor_log_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY donors_donor_log
    ADD CONSTRAINT donors_donor_log_pkey PRIMARY KEY (id);


--
-- Name: donors_donor_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY donors_donor
    ADD CONSTRAINT donors_donor_pkey PRIMARY KEY (id);


--
-- Name: schools_school_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY schools_school
    ADD CONSTRAINT schools_school_pkey PRIMARY KEY (id);


--
-- Name: students_student_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY students_student
    ADD CONSTRAINT students_student_pkey PRIMARY KEY (id);


--
-- Name: students_studenthistory_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY students_studenthistory
    ADD CONSTRAINT students_studenthistory_pkey PRIMARY KEY (id);


--
-- Name: tattendance_teacherattendance_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY tattendance_teacherattendance
    ADD CONSTRAINT tattendance_teacherattendance_pkey PRIMARY KEY (id);


--
-- Name: tattendance_teacherattendance_teacher_id_d2be30b8_uniq; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY tattendance_teacherattendance
    ADD CONSTRAINT tattendance_teacherattendance_teacher_id_d2be30b8_uniq UNIQUE (teacher_id, attendance_date);


--
-- Name: teachers_teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY teachers_teacher
    ADD CONSTRAINT teachers_teacher_pkey PRIMARY KEY (id);


--
-- Name: teachers_teacher_pkss_school_pkey; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY teachers_teacher_pkss_school
    ADD CONSTRAINT teachers_teacher_pkss_school_pkey PRIMARY KEY (id);


--
-- Name: teachers_teacher_pkss_school_teacher_id_31024a8c_uniq; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY teachers_teacher_pkss_school
    ADD CONSTRAINT teachers_teacher_pkss_school_teacher_id_31024a8c_uniq UNIQUE (teacher_id, school_id);


--
-- Name: teachers_teacher_user_id_key; Type: CONSTRAINT; Schema: public; Owner: pkss_admin; Tablespace: 
--

ALTER TABLE ONLY teachers_teacher
    ADD CONSTRAINT teachers_teacher_user_id_key UNIQUE (user_id);


--
-- Name: attendance_attendance_30a811f6; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX attendance_attendance_30a811f6 ON attendance_attendance USING btree (student_id);


--
-- Name: attendance_attendancecalendar_5fc7164b; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX attendance_attendancecalendar_5fc7164b ON attendance_attendancecalendar USING btree (school_id);


--
-- Name: attendance_nonscheduledholidays_5fc7164b; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX attendance_nonscheduledholidays_5fc7164b ON attendance_nonscheduledholidays USING btree (school_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: classes_class_5fc7164b; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX classes_class_5fc7164b ON classes_class USING btree (school_id);


--
-- Name: classes_class_d9614d40; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX classes_class_d9614d40 ON classes_class USING btree (teacher_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: donors_donor_log_a08afa2e; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX donors_donor_log_a08afa2e ON donors_donor_log USING btree (contact_name_id);


--
-- Name: students_student_2c86f667; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX students_student_2c86f667 ON students_student USING btree (pkss_class_id);


--
-- Name: students_student_e3d1f1f9; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX students_student_e3d1f1f9 ON students_student USING btree (pkss_school_id);


--
-- Name: students_student_f76c02c8; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX students_student_f76c02c8 ON students_student USING btree (pkss_class_original_id);


--
-- Name: students_studenthistory_a0e00b8e; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX students_studenthistory_a0e00b8e ON students_studenthistory USING btree (student_name_id);


--
-- Name: tattendance_teacherattendance_5fc7164b; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX tattendance_teacherattendance_5fc7164b ON tattendance_teacherattendance USING btree (school_id);


--
-- Name: tattendance_teacherattendance_d9614d40; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX tattendance_teacherattendance_d9614d40 ON tattendance_teacherattendance USING btree (teacher_id);


--
-- Name: teachers_teacher_pkss_school_5fc7164b; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX teachers_teacher_pkss_school_5fc7164b ON teachers_teacher_pkss_school USING btree (school_id);


--
-- Name: teachers_teacher_pkss_school_d9614d40; Type: INDEX; Schema: public; Owner: pkss_admin; Tablespace: 
--

CREATE INDEX teachers_teacher_pkss_school_d9614d40 ON teachers_teacher_pkss_school USING btree (teacher_id);


--
-- Name: access_useraccess_user_id_9b1de5c5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY access_useraccess
    ADD CONSTRAINT access_useraccess_user_id_9b1de5c5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attendance_attendanc_student_id_94863613_fk_students_student_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY attendance_attendance
    ADD CONSTRAINT attendance_attendanc_student_id_94863613_fk_students_student_id FOREIGN KEY (student_id) REFERENCES students_student(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attendance_attendanceca_school_id_10525020_fk_schools_school_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY attendance_attendancecalendar
    ADD CONSTRAINT attendance_attendanceca_school_id_10525020_fk_schools_school_id FOREIGN KEY (school_id) REFERENCES schools_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: attendance_nonscheduled_school_id_5e38b73b_fk_schools_school_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY attendance_nonscheduledholidays
    ADD CONSTRAINT attendance_nonscheduled_school_id_5e38b73b_fk_schools_school_id FOREIGN KEY (school_id) REFERENCES schools_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classes_class_school_id_3e37b9ab_fk_schools_school_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY classes_class
    ADD CONSTRAINT classes_class_school_id_3e37b9ab_fk_schools_school_id FOREIGN KEY (school_id) REFERENCES schools_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: classes_class_teacher_id_e236cda2_fk_teachers_teacher_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY classes_class
    ADD CONSTRAINT classes_class_teacher_id_e236cda2_fk_teachers_teacher_id FOREIGN KEY (teacher_id) REFERENCES teachers_teacher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: donors_donor_log_contact_name_id_3bd5e27c_fk_donors_donor_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY donors_donor_log
    ADD CONSTRAINT donors_donor_log_contact_name_id_3bd5e27c_fk_donors_donor_id FOREIGN KEY (contact_name_id) REFERENCES donors_donor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: students_st_pkss_class_original_id_24501aa2_fk_classes_class_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY students_student
    ADD CONSTRAINT students_st_pkss_class_original_id_24501aa2_fk_classes_class_id FOREIGN KEY (pkss_class_original_id) REFERENCES classes_class(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: students_studen_student_name_id_a3de6da5_fk_students_student_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY students_studenthistory
    ADD CONSTRAINT students_studen_student_name_id_a3de6da5_fk_students_student_id FOREIGN KEY (student_name_id) REFERENCES students_student(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: students_student_pkss_class_id_06c3bb8e_fk_classes_class_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY students_student
    ADD CONSTRAINT students_student_pkss_class_id_06c3bb8e_fk_classes_class_id FOREIGN KEY (pkss_class_id) REFERENCES classes_class(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: students_student_pkss_school_id_756911a9_fk_schools_school_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY students_student
    ADD CONSTRAINT students_student_pkss_school_id_756911a9_fk_schools_school_id FOREIGN KEY (pkss_school_id) REFERENCES schools_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tattendance_teachera_teacher_id_d309820c_fk_teachers_teacher_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY tattendance_teacherattendance
    ADD CONSTRAINT tattendance_teachera_teacher_id_d309820c_fk_teachers_teacher_id FOREIGN KEY (teacher_id) REFERENCES teachers_teacher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tattendance_teacheratte_school_id_c723ef1a_fk_schools_school_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY tattendance_teacherattendance
    ADD CONSTRAINT tattendance_teacheratte_school_id_c723ef1a_fk_schools_school_id FOREIGN KEY (school_id) REFERENCES schools_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teachers_teacher_pks_teacher_id_8ee9d574_fk_teachers_teacher_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY teachers_teacher_pkss_school
    ADD CONSTRAINT teachers_teacher_pks_teacher_id_8ee9d574_fk_teachers_teacher_id FOREIGN KEY (teacher_id) REFERENCES teachers_teacher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teachers_teacher_pkss_s_school_id_6c2c5c0a_fk_schools_school_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY teachers_teacher_pkss_school
    ADD CONSTRAINT teachers_teacher_pkss_s_school_id_6c2c5c0a_fk_schools_school_id FOREIGN KEY (school_id) REFERENCES schools_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: teachers_teacher_user_id_cdea3fc2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: pkss_admin
--

ALTER TABLE ONLY teachers_teacher
    ADD CONSTRAINT teachers_teacher_user_id_cdea3fc2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

