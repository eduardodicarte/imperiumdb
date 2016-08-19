CREATE TABLE twords ( 
    id serial not null,
    code numeric[10] not null,
    val varchar[40] not null,
    CONSTRAINT pk_twords PRIMARY KEY(id),
    CONSTRAINT uk_code_twords UNIQUE(code),
    CONSTRAINT uk_val_twords UNIQUE(val)
)

CREATE TABLE dict (
    id serial not null,
    code numeric[10] not null,
    id_twords integer not null,
    CONSTRAINT pk_dict PRIMARY KEY(id),
    CONSTRAINT uk_code_dict UNIQUE(code),
    CONSTRAINT fk_twords_dict FOREIGN KEY(id_twords) REFERENCES twords
)
   
CREATE TABLE words (
    id serial not null,
    code numeric[10] not null,
    val varchar[40] not null,
 	id_dict integer not null,
    CONSTRAINT pk_words PRIMARY KEY(id),
    CONSTRAINT uk_code_words UNIQUE(code),
    CONSTRAINT uk_val_words UNIQUE(val),
    CONSTRAINT fk_dict FOREIGN KEY(id_dict) REFERENCES dict
)


CREATE TABLE tkwords (
    id smallserial not null,
    val varchar[15] not null,
    CONSTRAINT pk_tkwords PRIMARY KEY(id),
	CONSTRAINT uk_tk_words UNIQUE(val)
)

CREATE TABLE kwords (
 	id smallint not null,
    val varchar[15] not null,
    id_tkwords smallint not null,
    CONSTRAINT pk_kwords PRIMARY KEY(id),
    CONSTRAINT fk_tkwords_kwords FOREIGN KEY(id_tkwords) REFERENCES tkwords
)    

CREATE TABLE sentc (
    id serial not null,
    id_word int not null,
    sorder smallint not null,
    CONSTRAINT pk_sentc PRIMARY KEY(id),
    CONSTRAINT fk_words_sentc FOREIGN KEY(id_word) REFERENCES words
)

CREATE TABLE quest(
    id serial not null,
    code numeric[10] not null,
    id_sentc int not null,
    id_kword smallint not null,
    CONSTRAINT pk_questions PRIMARY KEY(id),
    CONSTRAINT uk_code_questions UNIQUE(code),
    CONSTRAINT fk_sentc_quest FOREIGN KEY(id_sentc) REFERENCES sentc,
    CONSTRAINT fk_kword_quest FOREIGN KEY(id_kword) REFERENCES kwords
)

CREATE TABLE answs (
    id bigserial not null,
    code numeric[10] not null,
    id_sentc integer not null,
    id_quest integer not null,
    rright boolean default false,
    CONSTRAINT uk_code_answs UNIQUE(code),
    CONSTRAINT fk_sentc_answs FOREIGN KEY(id_sentc) REFERENCES sentc,
    CONSTRAINT fk_quest_answs FOREIGN KEY(id_quest) REFERENCES quest
)

COMMENT ON TABLE dict IS 'Table contain translation of english for portuguese';
COMMENT ON TABLE answs IS 'Table contain the answers for the questions, the field rrigth says if the answer is correct';
COMMENT ON TABLE kwords IS 'Table contain the key words that made the question for example';
COMMENT ON TABLE quest IS 'Table contain the questions, the key words are required';
COMMENT ON TABLE sentc IS 'Table contain the sentences, each sentence is made of one group of words';
COMMENT ON TABLE tkwords IS 'Table contain the kind of key words, how question for example.'
COMMENT ON TABLE twords IS 'Table contain all the translations for the words, only for portuguese.'
COMMENT ON TABLE words IS 'Table contain all the words that willbe show in the application.'

