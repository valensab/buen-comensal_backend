from pandas.core.base import ShallowMixin as ShallowMixin
from pandas.core.groupby.base import GroupByMixin as GroupByMixin
from pandas.core.groupby.groupby import _GroupBy
from pandas.core.groupby.grouper import Grouper as Grouper
from pandas._typing import FrameOrSeriesUnion

class Resampler(_GroupBy, ShallowMixin):
    def __init__(self, obj, groupby=..., axis: int = ..., kind=..., **kwargs) -> None: ...
    def __getattr__(self, attr: str): ...
    def __iter__(self): ...
    @property
    def obj(self): ...
    @property
    def ax(self): ...
    def pipe(self, func, *args, **kwargs): ...
    def aggregate(self, func, *args, **kwargs): ...
    agg = aggregate
    def transform(self, arg, *args, **kwargs): ...
    def pad(self, limit=...): ...
    def nearest(self, limit=...): ...
    def backfill(self, limit=...): ...
    bfill = backfill
    def fillna(self, method, limit=...): ...
    def interpolate(
        self,
        method: str = ...,
        axis: int = ...,
        limit=...,
        inplace: bool = ...,
        limit_direction: str = ...,
        limit_area=...,
        downcast=...,
        **kwargs,
    ): ...
    def asfreq(self, fill_value=...): ...
    def std(self, ddof: int = ..., *args, **kwargs): ...
    def var(self, ddof: int = ..., *args, **kwargs): ...
    def size(self): ...
    def count(self): ...
    def quantile(self, q: float = ..., **kwargs): ...
    def sum(self, _method=..., min_count: int = ..., *args, **kwargs) -> FrameOrSeriesUnion: ...
    def prod(self, _method=..., min_count: int = ..., *args, **kwargs) -> FrameOrSeriesUnion: ...
    def min(self, _method=..., min_count: int = ..., *args, **kwargs) -> FrameOrSeriesUnion: ...
    def max(self, _method=..., min_count: int = ..., *args, **kwargs) -> FrameOrSeriesUnion: ...
    def first(self, _method=..., min_count: int = ..., *args, **kwargs) -> FrameOrSeriesUnion: ...
    def last(self, _method=..., min_count: int = ..., *args, **kwargs) -> FrameOrSeriesUnion: ...
    def mean(self, _method=..., *args, **kwargs) -> FrameOrSeriesUnion: ...
    def sem(self, _method=..., *args, **kwargs) -> FrameOrSeriesUnion: ...
    def median(self, _method=..., *args, **kwargs) -> FrameOrSeriesUnion: ...
    def ohlc(self, _method=..., *args, **kwargs) -> FrameOrSeriesUnion: ...

class _GroupByMixin(GroupByMixin):
    groupby = ...
    def __init__(self, obj, *args, **kwargs) -> None: ...

def resample(obj, kind=..., **kwds): ...
def get_resampler_for_grouping(groupby, rule, how=..., fill_method=..., limit=..., kind=..., **kwargs): ...
def asfreq(obj, freq, method=..., how=..., normalize: bool = ..., fill_value=...): ...
