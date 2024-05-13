CREATE TABLE User (
 id BIGSERIAL,
 type CHAR(10) NOT NULL DEFAULT 'NULL',
 email CHAR(20) NOT NULL,
 password CHAR(10) NOT NULL DEFAULT 'NULL',
 userName CHAR,
 profile_id INTEGER NOT NULL,
 group_id INTEGER NOT NULL
);


ALTER TABLE User ADD CONSTRAINT User_pkey PRIMARY KEY (id);

CREATE TABLE Profile (
 id BIGSERIAL,
 name CHAR(30) NOT NULL DEFAULT 'NULL',
 birthday DATE,
 gender CHAR(10),
 timeZone TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT 'NULL',
 country_id INTEGER NOT NULL,
 university_id INTEGER NOT NULL,
 archetype_id INTEGER NOT NULL
);


ALTER TABLE Profile ADD CONSTRAINT Profile_pkey PRIMARY KEY (id);

CREATE TABLE Country (
 id BIGSERIAL,
 name CHAR(20) NOT NULL DEFAULT 'NULL',
 flagIcon CHAR(10) NOT NULL DEFAULT 'NULL',
 userCoutryDescription_id INTEGER NOT NULL
);


ALTER TABLE Country ADD CONSTRAINT Country_pkey PRIMARY KEY (id);

CREATE TABLE Group (
 id BIGSERIAL,
 name CHAR(20),
 tutor_id INTEGER,
 groupMembers_id INTEGER,
 currentRound SMALLINT(1) NOT NULL
);


ALTER TABLE Group ADD CONSTRAINT Group_pkey PRIMARY KEY (id);

CREATE TABLE UserCountryDescription (
 id BIGSERIAL,
 description TEXT NOT NULL DEFAULT 'NULL'
);


ALTER TABLE UserCountryDescription ADD CONSTRAINT UserCountryDescription_pkey PRIMARY KEY (id);

CREATE TABLE GroupMembers (
 id INTEGER,
 member1_id INTEGER,
 member2_id INTEGER,
 member3_id INTEGER,
 member4_id INTEGER,
 member5_id INTEGER
);


ALTER TABLE GroupMembers ADD CONSTRAINT GroupMembers_pkey PRIMARY KEY (id);

CREATE TABLE University (
 id BIGSERIAL,
 name CHAR(20) NOT NULL DEFAULT 'NULL',
 icon CHAR(10),
 country_id INTEGER NOT NULL
);


ALTER TABLE University ADD CONSTRAINT University_pkey PRIMARY KEY (id);

CREATE TABLE Archetype (
 id BIGSERIAL,
 selfDefined_id INTEGER NOT NULL,
 groupDefined_id INTEGER
);


ALTER TABLE Archetype ADD CONSTRAINT Archetype_pkey PRIMARY KEY (id);

CREATE TABLE SelfArchetype (
 id BIGSERIAL,
 name CHAR NOT NULL DEFAULT 'NULL',
 justification TEXT
);


ALTER TABLE SelfArchetype ADD CONSTRAINT SelfArchetype_pkey PRIMARY KEY (id);

CREATE TABLE GroupArchetype (
 id BIGSERIAL,
 name CHAR(10) NOT NULL DEFAULT 'NULL',
 receivedFeedbacks_id INTEGER NOT NULL
);


ALTER TABLE GroupArchetype ADD CONSTRAINT GroupArchetype_pkey PRIMARY KEY (id);

CREATE TABLE ReceivedFeedbacks (
 toUser_id BIGSERIAL,
 fromUser_id INTEGER NOT NULL,
 name CHAR(10) NOT NULL DEFAULT 'NULL',
 justification TEXT
);


ALTER TABLE ReceivedFeedbacks ADD CONSTRAINT ReceivedFeedbacks_pkey PRIMARY KEY (toUser_id);

ALTER TABLE User ADD CONSTRAINT User_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES Profile(id);
ALTER TABLE User ADD CONSTRAINT User_group_id_fkey FOREIGN KEY (group_id) REFERENCES Group(id);
ALTER TABLE Profile ADD CONSTRAINT Profile_country_id_fkey FOREIGN KEY (country_id) REFERENCES Country(id);
ALTER TABLE Profile ADD CONSTRAINT Profile_university_id_fkey FOREIGN KEY (university_id) REFERENCES University(id);
ALTER TABLE Profile ADD CONSTRAINT Profile_archetype_id_fkey FOREIGN KEY (archetype_id) REFERENCES Archetype(id);
ALTER TABLE Country ADD CONSTRAINT Country_userCoutryDescription_id_fkey FOREIGN KEY (userCoutryDescription_id) REFERENCES UserCountryDescription(id);
ALTER TABLE Group ADD CONSTRAINT Group_tutor_id_fkey FOREIGN KEY (tutor_id) REFERENCES User(id);
ALTER TABLE Group ADD CONSTRAINT Group_groupMembers_id_fkey FOREIGN KEY (groupMembers_id) REFERENCES GroupMembers(id);
ALTER TABLE GroupMembers ADD CONSTRAINT GroupMembers_member1_id_fkey FOREIGN KEY (member1_id) REFERENCES User(id);
ALTER TABLE GroupMembers ADD CONSTRAINT GroupMembers_member2_id_fkey FOREIGN KEY (member2_id) REFERENCES User(id);
ALTER TABLE GroupMembers ADD CONSTRAINT GroupMembers_member3_id_fkey FOREIGN KEY (member3_id) REFERENCES User(id);
ALTER TABLE GroupMembers ADD CONSTRAINT GroupMembers_member4_id_fkey FOREIGN KEY (member4_id) REFERENCES User(id);
ALTER TABLE GroupMembers ADD CONSTRAINT GroupMembers_member5_id_fkey FOREIGN KEY (member5_id) REFERENCES User(id);
ALTER TABLE University ADD CONSTRAINT University_country_id_fkey FOREIGN KEY (country_id) REFERENCES Country(id);
ALTER TABLE Archetype ADD CONSTRAINT Archetype_selfDefined_id_fkey FOREIGN KEY (selfDefined_id) REFERENCES SelfArchetype(id);
ALTER TABLE Archetype ADD CONSTRAINT Archetype_groupDefined_id_fkey FOREIGN KEY (groupDefined_id) REFERENCES GroupArchetype(id);
ALTER TABLE GroupArchetype ADD CONSTRAINT GroupArchetype_receivedFeedbacks_id_fkey FOREIGN KEY (receivedFeedbacks_id) REFERENCES ReceivedFeedbacks(toUser_id);
ALTER TABLE ReceivedFeedbacks ADD CONSTRAINT ReceivedFeedbacks_toUser_id_fkey FOREIGN KEY (toUser_id) REFERENCES User(id);
ALTER TABLE ReceivedFeedbacks ADD CONSTRAINT ReceivedFeedbacks_fromUser_id_fkey FOREIGN KEY (fromUser_id) REFERENCES User(id);