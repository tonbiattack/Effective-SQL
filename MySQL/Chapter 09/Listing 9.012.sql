-- Ensure you've run StudentGradesStructure.sql and StudentGradesData.sql in order to run this example.

-- 【概要】GradeRangesContinuousテーブル（上限値を含まない連続範囲）を使用して数値成績を文字成績に変換し科目別集計する。GradeRangesとの違いは上限値の扱い（< vs <=）にある。

USE StudentGradesExample;

-- Listing 9.12 Joining the GradeRangeContinuous Tally Table to convert continuous numeric grades to letter grades
-- StudentGrades is a view based on the base tables, since MySQL doesn't support CTEs
-- Compare this with Listing 9.12 in the Microsoft SQL Server folder
-- to see the difference.


-- GradeRangesContinuousで上限を含まない範囲（>=下限 AND <上限）で成績変換して集計
SELECT SG.Subject, GR.LetterGrade, COUNT(*) AS NumberOfStudents
FROM StudentGrades AS SG INNER JOIN GradeRangesContinuous AS GR
  ON SG.FinalGrade >= GR.LowGradePoint
  AND SG.FinalGrade < GR.HighGradePoint
GROUP BY SG.Subject, GR.LetterGrade
ORDER BY SG.Subject, GR.LetterGrade;