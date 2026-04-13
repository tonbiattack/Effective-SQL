-- Ensure you've run StudentGradesStructure.sql and StudentGradesData.sql in order to run this example.

-- 【概要】GradeRangesタリーテーブルとINNER JOINして数値成績を文字成績（A/B/C等）に変換する。成績範囲テーブルを利用した数値→文字変換の基本的な実装例。

USE StudentGradesExample;

-- Listing 9.10 Joining the GradeRange Tally Table to convert numeric grades to letter grades
-- StudentGrades is a view based on the base tables, since MySQL doesn't support CTEs
-- Compare this with Listing 9.10 in the Microsoft SQL Server folder
-- to see the difference.

-- GradeRangesテーブルとINNER JOINして数値成績をLowGradePoint〜HighGradePointの範囲で文字成績に変換
SELECT SG.Student, SG.Subject, SG.FinalGrade, GR.LetterGrade
FROM StudentGrades AS SG INNER JOIN GradeRanges AS GR
  ON SG.FinalGrade >= GR.LowGradePoint
  AND SG.FinalGrade <= GR.HighGradePoint
ORDER BY SG.Student, SG.Subject;