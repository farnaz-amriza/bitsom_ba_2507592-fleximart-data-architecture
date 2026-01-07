# Database Schema Documentation

## Entity-Relationship Description 

### ENTITY: students

**Purpose:** Stores master information about students enrolled in the institution.

**Attributes:**

* `student_id` – Unique identifier for each student (Primary Key)
* `first_name` – Student’s first name
* `last_name` – Student’s last name
* `email` – Student’s official email address (unique)
* `date_of_birth` – Student’s date of birth
* `enrollment_date` – Date the student enrolled

**Relationships:**

* One student can enroll in MANY enrollments (1:M relationship with `enrollments`)

---

### ENTITY: courses

**Purpose:** Stores information about courses offered by the institution.

**Attributes:**

* `course_id` – Unique identifier for each course (Primary Key)
* `course_name` – Name of the course
* `department` – Department offering the course
* `credits` – Number of academic credits for the course

**Relationships:**

* One course can have MANY enrollments (1:M relationship with `enrollments`)

---

### ENTITY: instructors

**Purpose:** Stores details of instructors who teach courses.

**Attributes:**

* `instructor_id` – Unique identifier for each instructor (Primary Key)
* `first_name` – Instructor’s first name
* `last_name` – Instructor’s last name
* `email` – Instructor’s email address
* `hire_date` – Date the instructor was hired

**Relationships:**

* One instructor can teach MANY course offerings (1:M relationship with `course_offerings`)

---

### ENTITY: enrollments

**Purpose:** Represents the association between students and courses for a specific term.

**Attributes:**

* `enrollment_id` – Unique identifier for each enrollment record (Primary Key)
* `student_id` – References the enrolled student (Foreign Key)
* `course_id` – References the enrolled course (Foreign Key)
* `instructor_id` – References the instructor teaching the course (Foreign Key)
* `term` – Academic term (e.g., Fall 2025)
* `grade` – Final grade received by the student

**Relationships:**

* MANY enrollments belong to ONE student
* MANY enrollments belong to ONE course
* MANY enrollments reference ONE instructor

---

## Normalization Explanation (Third Normal Form)

This database design adheres to Third Normal Form (3NF) by ensuring that all non-key attributes are fully functionally dependent on the primary key of their respective tables and that no transitive dependencies exist. Each table represents a single entity or relationship, and attributes are grouped based on their direct relevance to that entity.

Functional dependencies are clearly defined within each table. In the `students` table, the primary key `student_id` functionally determines attributes such as first name, last name, email, date of birth, and enrollment date. Similarly, in the `courses` table, `course_id` determines course name, department, and credits. The `instructors` table follows the same pattern, where `instructor_id` determines instructor-specific attributes. In the `enrollments` table, `enrollment_id` uniquely determines the associated student, course, instructor, term, and grade.

The schema satisfies First Normal Form (1NF) by ensuring all attributes contain atomic values with no repeating groups. Second Normal Form (2NF) is achieved because there are no partial dependencies; all non-key attributes depend on the entire primary key. Third Normal Form (3NF) is satisfied as there are no transitive dependencies—for example, instructor or course details are not stored in the enrollments table.

This design avoids update anomalies by storing student, course, and instructor information in separate tables, ensuring each fact is updated in only one place. Insert anomalies are avoided because students, courses, and instructors can be added independently of enrollments. Delete anomalies are prevented since removing an enrollment does not remove student, course, or instructor records.

---

## Sample Data Representation

### students

| student_id | first_name | last_name | email                                 | date_of_birth | enrollment_date |
| ---------- | ---------- | --------- | ------------------------------------- | ------------- | --------------- |
| 1          | Aditi      | Sharma    | [aditi@uni.edu](mailto:aditi@uni.edu) | 2002-04-15    | 2021-08-01      |
| 2          | Rohan      | Verma     | [rohan@uni.edu](mailto:rohan@uni.edu) | 2001-11-02    | 2020-08-01      |

### courses

| course_id | course_name      | department | credits |
| --------- | ---------------- | ---------- | ------- |
| 101       | Data Analytics   | Management | 4       |
| 102       | Database Systems | IT         | 3       |

### instructors

| instructor_id | first_name | last_name | email                                 | hire_date  |
| ------------- | ---------- | --------- | ------------------------------------- | ---------- |
| 10            | Neha       | Kapoor    | [neha@uni.edu](mailto:neha@uni.edu)   | 2018-06-15 |
| 11            | Arjun      | Malhotra  | [arjun@uni.edu](mailto:arjun@uni.edu) | 2019-09-01 |

### enrollments

| enrollment_id | student_id | course_id | instructor_id | term      | grade |
| ------------- | ---------- | --------- | ------------- | --------- | ----- |
| 1001          | 1          | 101       | 10            | Fall 2025 | A     |
| 1002          | 2          | 102       | 11            | Fall 2025 | B+    |
