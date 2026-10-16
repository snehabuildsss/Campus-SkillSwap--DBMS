
-- Campus SkillSwap: SQL Queries

-- 1. List students and the skills they teach
SELECT
    s.student_name,
    sk.skill_name,
    o.description
FROM Students s
JOIN Offers o ON s.student_id = o.student_id
JOIN Skills sk ON o.skill_id = sk.skill_id
WHERE o.offer_type = 'TEACH';

-- 2. Count teaching offers for every skill
SELECT
    sk.skill_name,
    COUNT(o.offer_id) AS total_teaching_offers
FROM Skills sk
LEFT JOIN Offers o
    ON sk.skill_id = o.skill_id
    AND o.offer_type = 'TEACH'
GROUP BY sk.skill_id, sk.skill_name
ORDER BY total_teaching_offers DESC;

-- 3. Find skills with above-average teaching offers
SELECT
    sk.skill_name,
    COUNT(o.offer_id) AS teaching_offers
FROM Skills sk
JOIN Offers o ON sk.skill_id = o.skill_id
WHERE o.offer_type = 'TEACH'
GROUP BY sk.skill_id, sk.skill_name
HAVING COUNT(o.offer_id) > (
    SELECT AVG(skill_count)
    FROM (
        SELECT COUNT(*) AS skill_count
        FROM Offers
        WHERE offer_type = 'TEACH'
        GROUP BY skill_id
    ) AS skill_totals
);

-- 4. Find skills with at least two teaching offers
SELECT
    sk.skill_name,
    COUNT(o.offer_id) AS total_teaching_offers
FROM Skills sk
JOIN Offers o ON sk.skill_id = o.skill_id
WHERE o.offer_type = 'TEACH'
GROUP BY sk.skill_id, sk.skill_name
HAVING COUNT(o.offer_id) >= 2
ORDER BY total_teaching_offers DESC;

-- 5. Calculate average review rating
SELECT
    ROUND(AVG(rating), 2) AS average_rating,
    COUNT(*) AS total_reviews
FROM Reviews;

-- 6. Display completed sessions using the view
SELECT *
FROM CompletedSessions
ORDER BY session_id;
