from dataBase.database_controller import drop_all_tables, execute_sql_file


class BaseTest:
    def setup(self):
        drop_all_tables()
        execute_sql_file('../dataBase/soft.sql')

    def teardown(self):
        drop_all_tables()
        execute_sql_file('../dataBase/soft.sql')
