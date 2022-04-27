import os
from typing import Any, List
from typing_extensions import Self
from xmlrpc.client import Boolean
import psycopg2 as postgres
from dotenv import load_dotenv

load_dotenv()


class MetaPostgresConnect(type):
    """
    The Singleton class can be implemented in different ways in Python. Some
    possible methods include: base class, decorator, metaclass. We will use the
    metaclass because it is best suited for this purpose.
    """

    _instances = {}

    def __call__(cls, *args, **kwargs):
        """
        Possible changes to the value of the `__init__` argument do not affect
        the returned instance.
        """
        if cls not in cls._instances:
            instance = super().__call__(*args, **kwargs)
            cls._instances[cls] = instance
        return cls._instances[cls]


class PostgresConnect(metaclass=MetaPostgresConnect):
    
    connection = None
    cursor = None

    def connect(self) -> None:
        if(self.connected()):
            self.close(True)
        self.connection = postgres.connect(
                host=os.environ.get('DB_HOST'),
                database=os.environ.get('DB_NAME'),
                user=os.environ.get('DB_USER'),
                password=os.environ.get('DB_PASSWORD'),
                port=os.environ.get('DB_PORT')
        )
        self.cursor = self.connection.cursor()

    def connected(self) -> Boolean:
        return self.connection != None and self.cursor != None and not self.connection.closed and not self.cursor.closed

    def sql(self, query, params = None, commit=True, file=False) -> Self:
        if(not self.connected()):
            raise Exception('not connected to database')
        if(file):
            try:
                file_stream = open(query, "r")
                query = file_stream.read()
                file_stream.close()
            except Exception as e:
                raise e

        try:
            self.cursor.execute(query, params)
        except Exception as e:
            raise e
        if(commit):
            self.connection.commit()

        return self

    def all(self) -> List:
        if(not self.connected()):
            raise Exception('not connected to database')
        return list(self.cursor.fetchall())
    
    def one(self):
        if(not self.connected()):
            raise Exception('not connected to database')
        return list(self.cursor.fetchone())

    def many(self, size) -> List:
        if(not self.connected()):
            raise Exception('not connected to database')
        return list(self.cursor.fetchmany(size))
    
    def commit(self) -> List:
        if(not self.connected()):
            raise Exception('not connected to database')
        self.connection.commit()
        return
    
    def copy_from(self, stream, filename, separator=',', nullValue='None', commit=True) -> None:
        if(not self.connected()):
            raise Exception('not connected to database')

        self.cursor.copy_from(stream, filename, sep=separator, null=nullValue)
        if(commit):
            self.connection.commit()
        return
    
    def close(self, shutdown=True) -> None:
        if(not self.connected()):
            raise Exception('not connected to database')

        try:
            self.cursor.close()
            if(shutdown):
                self.connection.close()
        except Exception  as e:
            print(e)
        return
