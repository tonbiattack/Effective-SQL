-- Ensure you've run StudentGradesStructure.sql and StudentGradesData.sql in order to run this example.

-- 【概要】文字成績に変換後、科目・文字成績別に学生数を集計する。GradeRangesテーブルで数値→文字変換を行い、成績分布を取得する実践的な集計例。

USE StudentGradesExample;

-- Listing 9.11 Summarizing StudentGrade data by LetterGrade
-- StudentGrades is a view based on the base tables, since MySQL doesn't support CTEs
-- Compare this with Listing 9.11 in the Microsoft SQL Server folder
-- to see the difference.

-- 数値成績を文字成績に変換して科目・文字成績ごとに学生数を集計
SELECT SG.Subject, GR.LetterGrade, COUNT(*) AS NumberOfStudents
FROM StudentGrades AS SG INNER JOIN GradeRanges AS GR
  ON SG.FinalGrade >= GR.LowGradePoint
  AND SG.FinalGrade <= GR.HighGradePoint
GROUP BY SG.Subject, GR.LetterGrade
ORDER BY SG.Subject, GR.LetterGrade;