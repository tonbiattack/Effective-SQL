-- Ensure you've run StudentGradesStructure.sql and StudentGradesData.sql in order to run this example.

-- 【概要】学生の成績データを科目・最終成績別に集計する。数値成績をそのままGROUP BYするため、成績範囲への変換なしでの集計結果を確認する試み。

USE StudentGradesExample;

-- Listing 9.9 Attempt to summarize Student Grade data
-- StudentGrades is a view based on the base tables, since MySQL doesn't support CTEs
-- Compare this with Listing 9.9 in the Microsoft SQL Server folder
-- to see the difference.

-- 科目・最終成績（数値）ごとの学生数を集計
SELECT Subject, FinalGrade, COUNT(*) AS NumberOfStudents
FROM StudentGrades
GROUP BY Subject, FinalGrade
ORDER BY Subject, FinalGrade;