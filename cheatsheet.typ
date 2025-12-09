#import "lib.typ": cheatsheet

#show: cheatsheet.with(
  title: "ADBC driver management with dbc",
  logo_source: "assets/dbc.svg",
  docs: link("https://docs.columnar.tech/dbc/")[#text(weight: "semibold")[docs.columnar.tech/dbc]],
  version: "dbc v0.1.0",
  updated: datetime(day: 8, month: 12, year: 2025)
)

= Introduction

*dbc* is a command-line tool for installing and managing ADBC drivers.

*ADBC* (Arrow Database Connectivity) is a modern data connectivity standard built to accelerate and simplify data access for analytics applications.

= Installing dbc

dbc provides a standalone installer to download and insall dbc.

macOS and Linux:

```console
curl -LsSf https://dbc.columnar.tech/install.sh | sh
```

Windows:

```console
powershell -ExecutionPolicy ByPass -c "irm https://dbc.columnar.tech/install.ps1 | iex"
```

dbc is also published on PyPI and can be installed with Python package managers.

pip:

```console
pip install dbc
```

uv:

```console
uv tool install dbc
```

= Driver discovery

List all available drivers:

```console
dbc search
```

List all available drivers (verbose):

```console
dbc search -v
```

Get information about a driver:

```console
dbc info <driver>
```

= Driver management

dbc makes it easy to install the right driver for your system architecture and operating system, in the right location.

Install a driver:

```console
dbc install <driver>
```

Install a driver at a specified level:

```console
dbc install -l <level> <driver>
```

Uninstall a driver:

```console
dbc uninstall <driver>
```

Uninstall a driver at a specified level:

```console
dbc uninstall -l <level> <driver>
```

= Driver lists

*Driver lists* are `dbc.toml` files managed by dbc. They are ideal for checking into version control alongside your project.

Create a new driver list:

```console
dbc init
```

Add a driver to the driver list:

```console
dbc add <driver>
```

Remove a driver from the driver list:

```console
dbc remove <driver>
```

Install drivers from the driver list:

```console
dbc sync
```

Install drivers from the driver list at a level:

```console
dbc sync -l <level>
```

= Level configuration

The `--level` (or `-l`) argument can be set to specify the installation level for drivers.

When this argument is not explicitly set, dbc first searches a list of environment variables, before defaulting to the user level for driver installation.
