# Campus SkillSwap — DBMS Mini Project

## Overview
Campus SkillSwap is a SQL-based database project designed to support a peer-to-peer campus skill exchange platform. Students can offer skills to teach, request skills to learn, participate in learning sessions, and submit reviews.

## Objectives
- Organise student and skill information in a relational database.
- Record teaching offers and learning requests.
- Track planned and completed skill exchange sessions.
- Store ratings and feedback.
- Practise SQL queries for data analysis and reporting.

## Database Tables
| Table | Purpose |
|---|---|
| `Students` | Stores student details |
| `Skills` | Stores available skills |
| `Offers` | Records teaching offers and learning requests |
| `Sessions` | Tracks skill exchange sessions |
| `Reviews` | Stores session ratings and feedback |

## SQL Features
- Primary and foreign keys
- `NOT NULL`, `UNIQUE`, `CHECK`, and `DEFAULT` constraints
- `INSERT` statements and sample data
- Multi-table joins
- Aggregate functions and grouping
- `HAVING` and `ORDER BY`
- Views and subqueries (to be completed and verified)

## Project Files
- `schema.sql` — Table definitions and sample data
- `queries.sql` — Analytical SQL queries

## How to Run
1. Open a compatible SQL environment.
2. Execute `schema.sql` in a fresh database.
3. Execute the queries in `queries.sql`.
4. Review the results to understand the database operations.

## Project Status
In progress — additional query verification, database views, testing, and report documentation remain.

## Author
Sneha Sharma


## Live SQL Workspace

Explore the Campus SkillSwap database and run its SQL queries in DB Fiddle.

[Open Campus SkillSwap on DB Fiddle](https://www.db-fiddle.com/f/kiZy9ozJgKzhx8AzJA4bHQ/2)

## Database Relationships

The Campus SkillSwap database contains five related tables:

- **Students → Offers:** One student can create multiple skill offers.
- **Skills → Offers:** One skill can appear in multiple offers.
- **Offers → Sessions:** One offer can be associated with multiple learning sessions.
- **Students → Sessions:** A student can participate as a learner in multiple sessions.
- **Sessions → Reviews:** A session can have at most one review.

These relationships use primary keys and foreign keys to maintain referential integrity.
