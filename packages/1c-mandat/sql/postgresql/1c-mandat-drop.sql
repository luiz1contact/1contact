-- drop script
--
-- @author joel@aufrecht.org
-- @cvs-id &Id:$
--
select content_folder__unregister_content_type(-100, 'mandat_object', 't');
select content_type__drop_type('mandat_object', 't', 't');

DROP FUNCTION mandat__new(integer, char, char, char, char, varchar, integer, varchar, varchar, varchar, varchar, text, text, text, char, varchar, char, char, char);

DROP FUNCTION mandat__new(integer, character varying, character, text, text, text, character, character varying, character, character, character);

DROP FUNCTION mandat__delete(integer);

DROP TABLE mandats CASCADE;

     