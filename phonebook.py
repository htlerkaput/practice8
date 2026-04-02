from connect import get_connection

def search(pattern):
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("SELECT * FROM search_contacts(%s)", (pattern,))
    rows = cur.fetchall()

    for row in rows:
        print(row)

    conn.close()


def add_user(name, surname, phone):
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("CALL upsert_user(%s, %s, %s)", (name, surname, phone))
    conn.commit()

    conn.close()


add_user("Ali", "Khan", "87771234567")
search("Ali")
