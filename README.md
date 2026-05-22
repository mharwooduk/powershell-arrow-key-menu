# Car menu example (PowerShell)

A minimal **arrow-key navigation menu** for Windows PowerShell. Pick a favourite car, then a colour, and the script prints your choices.

Compatible with **Windows PowerShell 5.1** and later (including PowerShell 7). Uses only APIs available in 5.1.

## Files

| File | Description |
|------|-------------|
| `car-menu-example.ps1` | Runnable script |
| `car-menu-example.README.md` | This file |

## Requirements

- Windows PowerShell 5.1+ or PowerShell 7+
- An **interactive console** (Windows Terminal, `powershell.exe`, or `pwsh.exe`)

The script uses `[Console]::ReadKey` and will not work when stdin is redirected or when there is no real console (for example, some IDE “Run” panels).

## Run

```powershell
& "$HOME\car-menu-example.ps1"
```

Or with the full path:

```powershell
& 'C:\Users\Mark.MH-LAPTOP1\car-menu-example.ps1'
```

## Controls

| Key | Action |
|-----|--------|
| **Up** | Move highlight up |
| **Down** | Move highlight down |
| **Enter** | Select the highlighted option |

The current choice is shown with a `>` prefix and a cyan highlight.

## Flow

1. **Main menu** — “What is your favourite car?” (6 options)
2. **Sub menu** — “What colour is your car?” (4 options)
3. **Summary** — Prints car and colour, then exits

Example output:

```text
You selected:
  Car:   Porsche 911
  Color: Blue

Goodbye.
```

## Customize

Edit the option arrays at the bottom of `car-menu-example.ps1`:

- `$cars` — main menu (6 items)
- `$colors` — sub menu (4 items)

Reuse `Show-ArrowMenu` for other menus:

```powershell
$choice = Show-ArrowMenu -Title 'Pick one' -Options @('A', 'B', 'C')
```

## How it works

`Show-ArrowMenu` clears the screen, redraws all options with one row highlighted, and reads a single key per loop via `[System.Console]::ReadKey($true)`. **Enter** returns the highlighted string to the caller.
