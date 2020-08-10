from tests.database_controller import drop_all_tables, execute_sql_file


class BaseTest:
    def setup(self):
        drop_all_tables()
        execute_sql_file('soft.sql')

    def teardown(self):
        drop_all_tables()
        execute_sql_file('soft.sql')
