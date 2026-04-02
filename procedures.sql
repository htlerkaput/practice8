-- upsert (добавить или обновить)
CREATE OR REPLACE PROCEDURE upsert_user(p_name VARCHAR, p_surname VARCHAR, p_phone VARCHAR)
LANGUAGE plpgsql AS $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM contacts 
        WHERE name = p_name AND surname = p_surname
    ) THEN
        UPDATE contacts SET phone = p_phone
        WHERE name = p_name AND surname = p_surname;
    ELSE
        INSERT INTO contacts(name, surname, phone)
        VALUES(p_name, p_surname, p_phone);
    END IF;
END;
$$;

-- удаление
CREATE OR REPLACE PROCEDURE delete_contact(p_value TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    DELETE FROM contacts
    WHERE name = p_value
       OR surname = p_value
       OR phone = p_value;
END;
$$;