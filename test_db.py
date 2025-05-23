import pymysql

# Connect to the database
connection = pymysql.connect(
    host='localhost',
    user='root',             # or 'user' if you created one
    password='',             # fill in if you set a password
    db='Quiz_Database',
    port=3306,
    use_unicode=True,
    charset="utf8"
)

try:
    with connection.cursor() as cursor:
        # Insert a sample question
        insert_query = "INSERT INTO questions (question_text, answer) VALUES (%s, %s)"
        cursor.execute(insert_query, ("What is the capital of France?", "Paris"))
        connection.commit()

        # Fetch all questions
        cursor.execute("SELECT * FROM questions")
        results = cursor.fetchall()
        for row in results:
            print(f"ID: {row[0]}, Question: {row[1]}, Answer: {row[2]}")

finally:
    connection.close()
