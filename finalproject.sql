CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    diabetes_type TINYINT CHECK (diabetes_type IN (1, 2))
);

CREATE TABLE Days (
    day_id INT PRIMARY KEY AUTO_INCREMENT,
    day_name VARCHAR(20)
);

CREATE TABLE Meals (
    meal_id INT PRIMARY KEY AUTO_INCREMENT,
    meal_type VARCHAR(20)
);

CREATE TABLE BloodGlucose (
    bg_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    bg_level INT,
    bg_time TIME,
    bg_status VARCHAR(10),
    day_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (day_id) REFERENCES Days(day_id)
);

CREATE TABLE CarbIntake (
    carb_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    carbs INT,
    timestamp TIME,
    meal_id INT,
    day_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (meal_id) REFERENCES Meals(meal_id),
    FOREIGN KEY (day_id) REFERENCES Days(day_id)
);

CREATE TABLE Insulin (
    insulin_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    bg_id INT,
    dose DECIMAL(5,2),
    timestamp TIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (bg_id) REFERENCES BloodGlucose(bg_id)
);

CREATE TABLE Status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_label VARCHAR(10)
);

INSERT INTO Days (day_name) VALUES
('Monday'), ('Tuesday'), ('Wednesday'), ('Thursday'), 
('Friday'), ('Saturday'), ('Sunday');

INSERT INTO Meals (meal_type) VALUES
('breakfast'), ('lunch'), ('dinner'), ('bedtime');

INSERT INTO Status (status_label) VALUES ('low'), ('normal'), ('high');

INSERT INTO Users (name, age, diabetes_type) VALUES
('Amir', 22, 1),
('David', 52, 2),
('Jimmy', 17, 1);

INSERT INTO BloodGlucose (user_id, bg_level, bg_time, bg_status, day_id) VALUES
(1, 290, '07:08:00', 'high', 1),
(1, 158, '14:20:00', 'normal', 1),
(1, 98, '20:15:00', 'normal', 1),
(1, 162, '00:44:00', 'normal', 1),
(1, 184, '08:33:00', 'normal', 2),
(1, 233, '12:15:00', 'high', 2),
(1, 61, '18:48:00', 'low', 2),
(1, 124, '23:23:00', 'normal', 2),
(1, 188, '07:53:00', 'normal', 3),
(1, 213, '12:30:00', 'high', 3),
(1, 107, '18:22:00', 'normal', 3),
(1, 187, '23:50:00', 'normal', 3),
(1, 117, '09:30:00', 'normal', 4),
(1, 186, '13:45:00', 'normal', 4),
(1, 157, '19:45:00', 'normal', 4),
(1, 144, '01:04:00', 'normal', 4),
(1, 100, '08:00:00', 'normal', 5),
(1, 461, '13:29:00', 'high', 5),
(1, 248, '19:00:00', 'high', 5),
(1, 155, '23:05:00', 'normal', 5),
(1, 189, '09:42:00', 'normal', 6),
(1, 138, '15:22:00', 'normal', 6),
(1, 68, '21:04:00', 'low', 6),
(1, 125, '01:32:00', 'normal', 6),
(1, 192, '08:55:00', 'normal', 7),
(1, 257, '13:22:00', 'high', 7),
(1, 231, '19:39:00', 'high', 7),
(1, 226, '02:33:00', 'high', 7);

INSERT INTO CarbIntake (user_id, carbs, timestamp, meal_id, day_id) VALUES
(1, 42, '07:08:00', 1, 1),
(1, 55, '14:20:00', 2, 1),
(1, 44, '20:15:00', 3, 1),
(1, 0, '00:44:00', 4, 1),
(1, 37, '08:33:00', 1, 2),
(1, 69, '12:15:00', 2, 2),
(1, 48, '18:48:00', 3, 2),
(1, 0, '23:23:00', 4, 2),
(1, 39, '07:53:00', 1, 3),
(1, 51, '12:30:00', 2, 3),
(1, 48, '18:22:00', 3, 3),
(1, 0, '23:50:00', 4, 3),
(1, 62, '09:30:00', 1, 4),
(1, 37, '13:45:00', 2, 4),
(1, 54, '19:45:00', 3, 4),
(1, 0, '01:04:00', 4, 4),
(1, 42, '08:00:00', 1, 5),
(1, 33, '13:29:00', 2, 5),
(1, 77, '19:00:00', 3, 5),
(1, 0, '23:05:00', 4, 5),
(1, 44, '09:42:00', 1, 6),
(1, 53, '15:22:00', 2, 6),
(1, 32, '21:04:00', 3, 6),
(1, 0, '01:32:00', 4, 6),
(1, 36, '08:55:00', 1, 7),
(1, 55, '13:22:00', 2, 7),
(1, 43, '19:39:00', 3, 7),
(1, 0, '02:33:00', 4, 7);

INSERT INTO Insulin (user_id, bg_id, dose, timestamp) VALUES
(1, 1, 13.5, '07:08:00'),
(1, 2, 11.9, '14:20:00'),
(1, 3, 8.8, '20:15:00'),
(1, 4, 1.2, '00:44:00'),
(1, 5, 5.7, '08:33:00'),
(1, 6, 11.2, '12:15:00'),
(1, 7, 6.8, '18:48:00'),
(1, 8, 0, '23:23:00'),
(1, 9, 7.4, '07:53:00'),
(1, 10, 11.3, '12:30:00'),
(1, 11, 7.8, '18:22:00'),
(1, 12, 1.5, '23:50:00'),
(1, 13, 10.2, '09:30:00'),
(1, 14, 8.2, '13:45:00'),
(1, 15, 11.8, '19:45:00'),
(1, 16, 0.5, '01:04:00'),
(1, 17, 9.1, '08:00:00'),
(1, 18, 15, '13:29:00'),
(1, 19, 15, '19:00:00'),
(1, 20, 0.3, '23:05:00'),
(1, 21, 11.6, '09:42:00'),
(1, 22, 11.9, '15:22:00'),
(1, 23, 6.7, '21:04:00'),
(1, 24, 0, '01:32:00'),
(1, 25, 10, '08:55:00'),
(1, 26, 15, '13:22:00'),
(1, 27, 13, '19:39:00'),
(1, 28, 2.3, '02:33:00');

DELIMITER //

CREATE PROCEDURE InsertBloodGlucose (
    IN p_user_id INT,
    IN p_bg_level INT,
    IN p_bg_time TIME,
    IN p_bg_status VARCHAR(10),
    IN p_day_id INT
)
BEGIN
    INSERT INTO BloodGlucose (user_id, bg_level, bg_time, bg_status, day_id)
    VALUES (p_user_id, p_bg_level, p_bg_time, p_bg_status, p_day_id);
END //

CREATE PROCEDURE UpdateBloodGlucose (
    IN p_bg_id INT,
    IN p_bg_level INT,
    IN p_bg_time TIME,
    IN p_bg_status VARCHAR(10)
)
BEGIN
    UPDATE BloodGlucose
    SET bg_level = p_bg_level,
        bg_time = p_bg_time,
        bg_status = p_bg_status
    WHERE bg_id = p_bg_id;
END //

CREATE PROCEDURE DeleteBloodGlucose (
    IN p_bg_id INT
)
BEGIN
    DELETE FROM BloodGlucose WHERE bg_id = p_bg_id;
END //

DELIMITER ;

CREATE VIEW WeeklyUserSummary AS
SELECT 
    u.name,
    ROUND(AVG(bg.bg_level), 2) AS Avg_BG_Level,
    ROUND(AVG(ci.carbs), 2) AS Avg_Carb_Intake,
    ROUND(AVG(ins.dose), 2) AS Avg_Insulin_Dose
FROM Users u
LEFT JOIN BloodGlucose bg ON u.user_id = bg.user_id
LEFT JOIN CarbIntake ci ON u.user_id = ci.user_id AND bg.day_id = ci.day_id
LEFT JOIN Insulin ins ON u.user_id = ins.user_id
GROUP BY u.name;

CREATE VIEW DailyUserSummary AS
SELECT
    u.name,
    d.day_name,
    ROUND(AVG(bg.bg_level), 2) AS Avg_BG_Level,
    ROUND(SUM(ci.carbs), 2) AS Total_Carb_Intake,
    ROUND(SUM(ins.dose), 2) AS Total_Insulin_Dose
FROM Users u
JOIN Days d ON 1=1
LEFT JOIN BloodGlucose bg ON u.user_id = bg.user_id AND bg.day_id = d.day_id
LEFT JOIN CarbIntake ci ON u.user_id = ci.user_id AND ci.day_id = d.day_id
LEFT JOIN Insulin ins ON u.user_id = ins.user_id
GROUP BY u.name, d.day_name;






