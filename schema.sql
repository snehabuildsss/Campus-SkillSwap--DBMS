
-- Campus SkillSwap
-- Database schema and sample data

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department VARCHAR(50) NOT NULL
);

CREATE TABLE Skills (
    skill_id INT PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50) NOT NULL
);

CREATE TABLE Offers (
    offer_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    skill_id INT NOT NULL,
    offer_type VARCHAR(10) NOT NULL,
    description VARCHAR(200),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id),
    CHECK (offer_type IN ('TEACH', 'LEARN')),
    UNIQUE (student_id, skill_id, offer_type)
);

CREATE TABLE Sessions (
    session_id INT PRIMARY KEY,
    offer_id INT NOT NULL,
    learner_id INT NOT NULL,
    session_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'PLANNED',
    FOREIGN KEY (offer_id) REFERENCES Offers(offer_id),
    FOREIGN KEY (learner_id) REFERENCES Students(student_id),
    CHECK (status IN ('PLANNED', 'COMPLETED', 'CANCELLED'))
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    session_id INT NOT NULL UNIQUE,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comments VARCHAR(200),
    FOREIGN KEY (session_id) REFERENCES Sessions(session_id)
);

-- Sample students
INSERT INTO Students VALUES
(1, 'Aarav Mehta', 'aarav@example.com', 'CSE'),
(2, 'Riya Kapoor', 'riya@example.com', 'ECE'),
(3, 'Kabir Singh', 'kabir@example.com', 'IT'),
(4, 'Ananya Verma', 'ananya@example.com', 'CSE'),
(5, 'Ishaan Gupta', 'ishaan@example.com', 'ECE'),
(6, 'Meera Joshi', 'meera@example.com', 'IT');

-- Sample skills
INSERT INTO Skills VALUES
(1, 'Python', 'Programming'),
(2, 'UI/UX Design', 'Design'),
(3, 'French', 'Language'),
(4, 'Excel', 'Productivity'),
(5, 'Public Speaking', 'Communication');

-- Sample offers
INSERT INTO Offers VALUES
(1, 1, 1, 'TEACH', 'Python fundamentals'),
(2, 1, 2, 'LEARN', 'Wants to learn UI/UX'),
(3, 2, 2, 'TEACH', 'Figma and interface design'),
(4, 2, 3, 'LEARN', 'French conversation practice'),
(5, 3, 3, 'TEACH', 'Beginner French'),
(6, 3, 4, 'LEARN', 'Wants to learn Excel'),
(7, 4, 4, 'TEACH', 'Excel and data analysis'),
(8, 4, 1, 'LEARN', 'Python programming'),
(9, 5, 5, 'TEACH', 'Presentation skills'),
(10, 6, 1, 'TEACH', 'Python problem-solving');

-- Sample sessions
INSERT INTO Sessions VALUES
(1, 1, 2, '2026-10-05', 'COMPLETED'),
(2, 3, 1, '2026-10-07', 'COMPLETED'),
(3, 5, 4, '2026-10-09', 'COMPLETED'),
(4, 7, 3, '2026-10-12', 'PLANNED'),
(5, 9, 6, '2026-10-14', 'COMPLETED'),
(6, 10, 5, '2026-10-18', 'PLANNED');

-- Sample reviews
INSERT INTO Reviews VALUES
(1, 1, 5, 'Clear and helpful Python session'),
(2, 2, 4, 'Useful introduction to design'),
(3, 3, 5, 'Great French practice'),
(4, 5, 4, 'Helpful presentation tips');
