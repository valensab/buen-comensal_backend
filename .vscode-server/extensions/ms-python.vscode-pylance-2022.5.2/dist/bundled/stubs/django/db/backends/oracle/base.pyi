from contextlib import contextmanager
from typing import Any, Generator, Optional, Type

from django.db.backends.base.base import BaseDatabaseWrapper as BaseDatabaseWrapper

from .client import DatabaseClient
from .creation import DatabaseCreation
from .features import DatabaseFeatures
from .introspection import DatabaseIntrospection
from .operations import DatabaseOperations
from .validation import DatabaseValidation

@contextmanager
def wrap_oracle_errors() -> Generator[None, None, None]: ...

class _UninitializedOperatorsDescriptor:
    def __get__(self, instance: Any, cls: Optional[Any] = ...): ...

class DatabaseWrapper(BaseDatabaseWrapper):
    client: DatabaseClient
    creation: DatabaseCreation
    features: DatabaseFeatures
    introspection: DatabaseIntrospection
    validation: DatabaseValidation
    ops: DatabaseOperations

    client_class: Type[DatabaseClient]
    creation_class: Type[DatabaseCreation]
    features_class: Type[DatabaseFeatures]
    introspection_class: Type[DatabaseIntrospection]
    ops_class: Type[DatabaseOperations]
    validation_class: Type[DatabaseValidation]

    vendor: str = ...
    display_name: str = ...
    data_types: Any = ...
    data_type_check_constraints: Any = ...
    operators: Any = ...
    pattern_esc: str = ...
    Database: Any = ...
    SchemaEditorClass: Any = ...
    def __init__(self, *args: Any, **kwargs: Any) -> None: ...
    def get_connection_params(self): ...
    def get_new_connection(self, conn_params: Any): ...
    pattern_ops: Any = ...
    def init_connection_state(self) -> None: ...
    def create_cursor(self, name: Optional[Any] = ...): ...
    def check_constraints(self, table_names: Optional[Any] = ...) -> None: ...
    def is_usable(self): ...
    @property
    def cx_oracle_version(self): ...
    @property
    def oracle_version(self): ...

class OracleParam:
    force_bytes: Any = ...
    input_size: Any = ...
    def __init__(self, param: Any, cursor: Any, strings_only: bool = ...) -> None: ...

class VariableWrapper:
    var: Any = ...
    def __init__(self, var: Any) -> None: ...
    def bind_parameter(self, cursor: Any): ...
    def __getattr__(self, key: Any): ...
    def __setattr__(self, key: Any, value: Any) -> None: ...

class FormatStylePlaceholderCursor:
    charset: str = ...
    cursor: Any = ...
    def __init__(self, connection: Any) -> None: ...
    def execute(self, query: Any, params: Optional[Any] = ...): ...
    def executemany(self, query: Any, params: Optional[Any] = ...): ...
    def close(self) -> None: ...
    def var(self, *args: Any): ...
    def arrayvar(self, *args: Any): ...
    def __getattr__(self, attr: Any): ...
    def __iter__(self) -> Any: ...
