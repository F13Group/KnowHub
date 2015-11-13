-- New column type of confirmation

ALTER TABLE confirmations ADD COLUMN type character varying(4);

-- Function: delete_old_rows()

-- DROP FUNCTION delete_old_rows();

CREATE OR REPLACE FUNCTION delete_old_rows()
  RETURNS void AS
$BODY$ begin delete from confirmations where reg_date < now() - interval '1 days'; end; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION delete_old_rows()
  OWNER TO root;