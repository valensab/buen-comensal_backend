import sys
import types
from contextlib import ContextDecorator
from datetime import date
from datetime import datetime as datetime
from datetime import time
from datetime import timedelta as timedelta
from datetime import timezone
from datetime import tzinfo as tzinfo
from typing import Any, Optional, Type, Union, overload

if sys.version_info < (3, 8):
    from typing_extensions import Literal
else:
    from typing import Literal

if sys.version_info < (3, 10):
    from typing_extensions import TypeGuard
else:
    from typing import TypeGuard

import pytz
from pytz import BaseTzInfo

_PytzTzInfoT = Union[pytz.tzinfo.BaseTzInfo, pytz._FixedOffset]
_TzInfoT = Union[_PytzTzInfoT, tzinfo]

utc: Any = ...

def get_fixed_timezone(offset: Union[timedelta, int]) -> timezone: ...
def get_default_timezone() -> BaseTzInfo: ...
def get_default_timezone_name() -> str: ...

# Strictly speaking, it is possible to activate() a non-pytz timezone,
# in which case BaseTzInfo is incorrect. However, this is unlikely,
# so we use it anyway, to keep things ergonomic for most users.
def get_current_timezone() -> BaseTzInfo: ...
def get_current_timezone_name() -> str: ...
def activate(timezone: Union[_TzInfoT, str]) -> None: ...
def deactivate() -> None: ...

class override(ContextDecorator):
    timezone: Optional[Union[str, _TzInfoT]] = ...
    old_timezone: Optional[_TzInfoT] = ...
    def __init__(self, timezone: Optional[Union[str, _TzInfoT]]) -> None: ...
    def __enter__(self) -> None: ...
    def __exit__(
        self,
        exc_type: Optional[Type[BaseException]],
        exc_value: Optional[BaseException],
        traceback: Optional[types.TracebackType],
    ) -> None: ...

def localtime(value: Optional[datetime] = ..., timezone: Optional[_TzInfoT] = ...) -> datetime: ...
def localdate(value: Optional[datetime] = ..., timezone: Optional[_TzInfoT] = ...) -> date: ...
def now() -> datetime: ...
@overload
def is_aware(value: time) -> Literal[False]: ...
@overload
def is_aware(value: datetime) -> bool: ...
@overload
def is_naive(value: time) -> Literal[True]: ...
@overload
def is_naive(value: datetime) -> bool: ...
def make_aware(value: datetime, timezone: Optional[_TzInfoT] = ..., is_dst: Optional[bool] = ...) -> datetime: ...
def make_naive(value: datetime, timezone: Optional[_TzInfoT] = ...) -> datetime: ...
def _is_pytz_zone(tz: _TzInfoT) -> TypeGuard[_PytzTzInfoT]: ...
