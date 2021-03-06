from typing import Any, Optional, Sequence

from django.apps.config import AppConfig
from django.core.checks.messages import Error

E001: Error

def check_async_unsafe(app_configs: Optional[Sequence[AppConfig]], **kwargs: Any) -> Sequence[Error]: ...
