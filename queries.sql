
-- Campus SkillSwap
-- SQL queries for a student skill exchange platform

-- 1. Count teaching offers for each skill
SELECT
    sk.skill_name,
    COUNT(o.offer_id) AS total_teaching_offers
FROM Skills sk
LEFT JOIN Offers o
    ON sk.skill_id = o.skill_id
    AND o.offer_type = 'TEACH'
GROUP BY sk.skill_id, sk.skill_name
ORDER BY total_teaching_offers DESC;

-- 2. Find completed sessions
SELECT session_id, session_date
FROM Sessions
WHERE status = 'COMPLETED'
ORDER BY session_date DESC;

-- 3. Calculate average student review rating
SELECT
    ROUND(AVG(rating), 2) AS average_rating,
    COUNT(*) AS total_reviews
FROM Reviews;

-- 4. Find skills with at least two teaching offers
SELECT
    sk.skill_name,
    COUNT(o.offer_id) AS total_offers
FROM Skills sk
JOIN Offers o ON sk.skill_id = o.skill_id
WHERE o.offer_type = 'TEACH'
GROUP BY sk.skill_id, sk.skill_name
HAVING COUNT(o.offer_id) >= 2;
