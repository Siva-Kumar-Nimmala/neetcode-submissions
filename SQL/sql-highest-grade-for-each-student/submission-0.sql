-- Write your query below

--Retrun  student_id,exam_id, score
-- each student with highest score along with exam_id --- max(score) in group by student_id

-- if he have highest score in multiple exams then return the highest score with smallest exam_id
-- order by student_id asc

with Students_highest_score AS (
    select student_id, exam_id, score,
    Row_number() over(partition by student_id
    order by score desc, exam_id asc
    )as rn
    from exam_results 
    
    
) 
select shs.student_id, shs.exam_id, shs.score 
from students_highest_score  as shs
where shs.rn = 1
order by shs.student_id asc;



