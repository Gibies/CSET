# Copyright 2022 Met Office and contributors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Graph tests."""

from pathlib import Path

import pytest

from CSET import graph


def test_save_graph():
    """Generate a graph from a recipe file without the output specified."""
    graph.save_graph(Path("tests/test_data/plot_instant_air_temp.yaml"))


def test_save_graph_detailed(tmp_path: Path):
    """Generate a graph from a recipe file with the output specified."""
    graph.save_graph(
        Path("tests/test_data/plot_instant_air_temp.yaml"),
        tmp_path / "graph.svg",
        detailed=True,
    )


def test_save_graph_no_operators_exception():
    """Exception raised from recipe with no operators."""
    with pytest.raises(ValueError):
        # Inline YAML form used.
        graph.save_graph('{"steps": [{"argument": "no_operators"}]}')
