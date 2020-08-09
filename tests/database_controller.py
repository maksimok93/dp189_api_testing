import mysql.connector
from database_credentials import HOST, USER, PASSWORD, DATABASE


database_connect = mysql.connector.connect(
    host=HOST,
    user=USER,
    password=PASSWORD,
    database=DATABASE
)

cursor = database_connect.cursor()


def drop_all_tables():
    cursor.execute('DROP TABLE mentor_of_course')
    cursor.execute('DROP TABLE mentor_of_student_group')
    cursor.execute('DROP TABLE student_of_student_group')
    cursor.execute('DROP TABLE visit')
    cursor.execute('DROP TABLE lesson')
    cursor.execute('DROP TABLE mentor')
    cursor.execute('DROP TABLE student')
    cursor.execute('DROP TABLE student_group')
    cursor.execute('DROP TABLE theme')
    cursor.execute('DROP TABLE course')
    cursor.execute('DROP TABLE account')
    database_connect.commit()


drop_all_tables()


def execute_sql_file(filename):
    file_stream = open(filename, 'r', encoding="utf8")
    file_data = file_stream.read()
    file_stream.close()
    sql_commands = file_data.split(';')

    for command in sql_commands:
        try:
            if command.strip() != '':
                cursor.execute(command)
        except IOError as msg:
            print("Command skipped: ", msg)
    database_connect.commit()


execute_sql_file('soft.sql')
