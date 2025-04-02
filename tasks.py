"""
Pyinvoke tasks.py file for automating releases and admin stuff.

"""

from __future__ import annotations

from typing import TYPE_CHECKING

from pathlib import Path
from invoke import task
import glob


if TYPE_CHECKING:
    from invoke import Context

@task
def publish(ctx: Context, fname) -> None:
    toks = Path(fname).name.split(".")
    name = toks[1]
    tag = "latest"
    if len(toks) == 3:
        tag = f"latest-{toks[2]}"

    ctx.run(f"docker build -t materialsvirtuallab/{name}:{tag} -f {fname} .")
    ctx.run(f"docker push materialsvirtuallab/{name}:{tag}")


@task
def publish_all(ctx: Context) -> None:
    """
    Publish all.

    Args:
        ctx (Context): The context.
    """

    for fname in glob.glob("docker/Dockerfile.*"):
        publish(ctx, fname)