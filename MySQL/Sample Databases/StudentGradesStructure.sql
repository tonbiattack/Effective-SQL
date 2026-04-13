-- 【概要】StudentGradesExampleデータベースを作成し、学生成績管理システムのテーブルを定義する。成績範囲テーブル（通常版・連続版）・科目・学生・学生科目の各テーブルとStudentGradesビューを含む。

CREATE DATABASE StudentGradesExample;

USE StudentGradesExample;

-- 成績範囲テーブル（成績ID・文字成績・下限ポイント・上限ポイント）
CREATE TABLE GradeRanges (
  GradeRangeID int NOT NULL, 
  LetterGrade varchar(5) NOT NULL, 
  LowGradePoint float NOT NULL, 
  HighGradePoint float NOT NULL
);

-- 連続成績範囲テーブル（上限を含まない範囲で成績区間を定義、GradeRangesと比較用）
CREATE TABLE GradeRangesContinuous (
  GradeRangeID int NOT NULL,
  LetterGrade varchar(5) NOT NULL, 
  LowGradePoint float NOT NULL, 
  HighGradePoint float NOT NULL
);

-- 科目テーブル（科目ID・科目名）
CREATE TABLE Subjects (
  SubjectID int NOT NULL,
  SubjectNM varchar(50) NULL
);

-- 学生テーブル（学生ID・姓・名）
CREATE TABLE Students (
  StudentID int NOT NULL,
  StudentFirstNM varchar(50) NULL,
  StudentLastNM varchar(50) NULL
);

-- 学生科目テーブル（学生科目ID・学生ID・科目ID・最終成績）
CREATE TABLE StudentSubjects (
  StudentSubjectID int NOT NULL,
  StudentID int NOT NULL, 
  SubjectID int NOT NULL, 
  FinalGrade float NULL
);


ALTER TABLE GradeRanges  
  ADD CONSTRAINT GradeRanges_PK PRIMARY KEY ( GradeRangeID );

ALTER TABLE GradeRangesContinuous  
  ADD CONSTRAINT GradeRangesContinuous_PK PRIMARY KEY ( GradeRangeID );

ALTER TABLE Subjects 
  ADD CONSTRAINT Subjects_PK PRIMARY KEY ( SubjectID );

ALTER TABLE Students  
  ADD CONSTRAINT Students_PK PRIMARY KEY ( StudentID );

ALTER TABLE StudentSubjects 
  ADD CONSTRAINT StudentSubjects_FK00 
    FOREIGN KEY ( StudentID ) 
    REFERENCES Students (StudentID),
  ADD CONSTRAINT StudentSubjects_FK01
    FOREIGN KEY ( SubjectID ) 
    REFERENCES Subjects (SubjectID),
  ADD CONSTRAINT StudentSubjects_PK PRIMARY KEY ( StudentSubjectID ),
  ADD CONSTRAINT StudentSubjects_Unique UNIQUE ( StudentID, SubjectID );
 
CREATE INDEX GradeLow ON GradeRanges(LowGradePoint);

CREATE INDEX GradeHigh ON GradeRanges(HighGradePoint);

CREATE INDEX GradeLowContinuous ON GradeRangesContinuous(LowGradePoint);

CREATE INDEX GradeHighContinous ON GradeRangesContinuous(HighGradePoint);

CREATE INDEX StudentSubjectsSubject ON StudentSubjects(SubjectID);

-- 学生・科目・最終成績を結合して取得するビュー（CTEの代替としてChapter 09クエリで使用）
CREATE VIEW StudentGrades AS
SELECT Stu.StudentFirstNM AS Student, Sub.SubjectNM AS Subject, SS.FinalGrade
FROM StudentSubjects AS SS INNER JOIN Students AS Stu 
  ON SS.StudentID = Stu.StudentID
INNER JOIN Subjects AS Sub
  ON SS.SubjectID = Sub.SubjectID;
