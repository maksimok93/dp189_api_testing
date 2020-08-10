from tests.database_controller import drop_all_tables, execute_sql_file


class BaseTest:
    @classmethod
    def setup_class(cls):
        drop_all_tables()
        execute_sql_file('soft.sql')

    @classmethod
    def teardown_class(cls):
        drop_all_tables()
        execute_sql_file('soft.sql')
