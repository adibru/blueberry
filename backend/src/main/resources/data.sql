delete from child_observation;
delete from child;
delete from observation;

INSERT INTO child (birthdate, entry_date, first_name, gender, name, nationality) VALUES ('2021-02-01', '2023-02-01', 'Pascal', 0, 'Strebel', 'AUT');
INSERT INTO child (birthdate, entry_date, first_name, gender, name, nationality) VALUES ('2020-02-01', '2023-02-01', 'Aron', 0, 'Halef', 'IT');
INSERT INTO child (birthdate, entry_date, first_name, gender, name, nationality) VALUES ('2021-08-01', '2023-02-01', 'Adrian', 0, 'Brunner', 'CH');
INSERT INTO child (birthdate, entry_date, first_name, gender, name, nationality) VALUES ('2019-10-01', '2023-02-01', 'Britney', 1, 'Spears', 'US');
INSERT INTO child (birthdate, entry_date, first_name, gender, name, nationality) VALUES ('2021-07-01', '2023-02-01', 'Shanaia', 1, 'Twain', 'CA');
INSERT INTO child (birthdate, entry_date, first_name, gender, name, nationality) VALUES ('2021-07-01', '2023-02-01', 'Spongebob', 2, 'Schwammkopf', 'CHN');
INSERT INTO child (birthdate, entry_date, first_name, gender, name, nationality) VALUES ('2019-05-01', '2023-02-01', 'Robin', 2, 'Meier', 'CH');

INSERT INTO observation (category, expected_at_months, text) VALUES ('Posture and Movement', 24, 'Can shoot a ball');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Posture and Movement', 24, 'Can throw a ball');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Posture and Movement', 24, 'Can safelv run');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Posture and Movement', 24, 'Copes with stairs in readjustment step');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Posture and Movement', 30, 'Can run and stop safely');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Posture and Movement', 30, 'Jump off the ground with both feet');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Posture and Movement', 36, 'Can ride a tricycle');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Posture and Movement', 48, 'Can perform a final jump');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Fine and Visual Morot Skills', 24, 'Can turn book pages one by one');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Fine and Visual Morot Skills', 24, 'Can stack four to six blocks');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Fine and Visual Morot Skills', 24, 'Can eat alone');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Fine and Visual Morot Skills', 24, 'Can unwrap candies');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Fine and Visual Morot Skills', 30, 'Can pour liquid');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Fine and Visual Morot Skills', 30, 'Traces a straight line');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Fine and Visual Morot Skills', 36, 'Can thread large beads onto a string');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Fine and Visual Morot Skills', 48, 'Can hold a crayon in three-point grip');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Language', 24, 'Can show body parts');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Language', 24, 'Follows directions or understands announcements');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Language', 24, 'Can speak one word sentences');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Language', 24, 'Uses the word "no" correctly');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Language', 30, 'Understands quantity terms "one", "many"');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Language', 30, 'Shows objects on pictures');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Language', 36, 'Can show activities on pictures');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Language', 48, 'Can remember little stories');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Cognitive', 24, 'Arranges the same objects');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Cognitive', 24, 'Can match shapes');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Cognitive', 24, 'Put three cups according to size into each other');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Cognitive', 24, 'Use a staff to grab the contents of a to reach the tube');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Cognitive', 30, 'Can role play');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Cognitive', 30, 'Maps objects to two sizes');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Cognitive', 36, 'Can stack blocks on top of each other');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Cognitive', 48, 'Recreate a pyramid');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Social Development', 24, 'Properly uses in-game items');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Social Development', 24, 'Plays in parallel with peers');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Social Development', 24, 'Shows increasing attachment');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Social Development', 24, 'Is curious');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Social Development', 30, 'Wants to help');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Social Development', 30, 'Has a preferred playing partner');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Social Development', 36, 'Enjoys praise');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Social Development', 48, 'Can accept limits');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Emotional Development', 24, 'Seeks the attention of reference persons');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Emotional Development', 24, 'Can express enthusiasm');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Emotional Development', 24, 'Defends his property');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Emotional Development', 24, 'Is interested in the feelings of others');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Emotional Development', 30, 'Seeks physical closeness');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Emotional Development', 30, 'Can show the emotions of shame and pride');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Emotional Development', 36, 'Copes well with failure');
INSERT INTO observation (category, expected_at_months, text) VALUES ('Emotional Development', 48, 'Has a positive self-efficacy feel');


INSERT INTO child_observation (child_id, observation_id, comment, created_at, points) VALUES (1, 2, 'Does it perfectly. Wow!', '2023-02-07 13:08:36.000000', 2);
INSERT INTO child_observation (child_id, observation_id, comment, created_at, points) VALUES (2, 5, 'Good start. Still needs some things', '2023-02-07 13:08:36.000000', 1);
INSERT INTO child_observation (child_id, observation_id, comment, created_at, points) VALUES (2, 10, 'Solid improvement with that one thing.', '2023-02-07 13:08:36.000000', 1);
INSERT INTO child_observation (child_id, observation_id, comment, created_at, points) VALUES (4, 15, 'Still struggling', '2023-02-07 13:08:36.000000', 0);
INSERT INTO child_observation (child_id, observation_id, comment, created_at, points) VALUES (5, 20, 'Absolutely fascinating. Great improvement with the ball.', '2023-02-07 13:08:36.000000', 2);
INSERT INTO child_observation (child_id, observation_id, comment, created_at, points) VALUES (3, 9, 'Play time outside.', '2023-02-07 13:08:36.000000', 2);
INSERT INTO child_observation (child_id, observation_id, comment, created_at, points) VALUES (3, 10, 'Must be doing this already for a long time. (Ask parents)', '2023-02-07 13:08:36.000000', 2);

commit;