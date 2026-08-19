# harVesta — Flutter Project Context & Architecture Memory

> **System Memory File for AI Agents & Developers**  
> *Read this file at the start of every session to align on architecture, conventions, active state, and phase progress.*

---

## 🧭 Project Overview
- **Goal:** Port the **harVesta** web game (PHP 8.4 / MariaDB) to a single-player **Flutter/Dart** application targeting **Android, Web, and Linux**.
- **Supported Platforms:**
  - 📱 **Android:** Mobile/tablet responsive UI (native SQLite via `sqlite3_flutter_libs`)
  - 🌐 **Web:** Wasm/CanvasKit browser build (SQLite via `drift_flutter` IndexedDB/Wasm)
  - 🐧 **Linux:** Native desktop executable (native SQLite)
- **Original Source Codebase:** `~/lithium/harvesta.oaf.monster` (`/home/corey/lithium/harvesta.oaf.monster`)
  - SQL Schema: `/home/corey/lithium/harvesta.oaf.monster/udgdwxxz_harvesta(2).sql`
  - Core logic reference: `data.php`, `advance-turn.php`, `battle_v2.class.php`, `interruptors.class.php`, etc.
- **Porting Roadmap & Playbook:** [`harvesta_flutter_llm_phases.md`](file:///home/corey/AndroidStudioProjects/harvesta/harvesta_flutter_llm_phases.md)

---

## 🛠️ Technology Stack
- **Framework:** Flutter (Channel stable, targeting **Android**, **Web**, and **Linux Desktop**)
- **Language:** Dart 3.x (Sound null safety)
- **State Management:** Riverpod (`flutter_riverpod`)
- **Persistence / Database:** Drift (`drift`, `drift_flutter` with SQLite native & Wasm/IndexedDB)
- **Routing & Navigation:** `go_router`
- **Data Models:** `freezed` + `json_serializable` (Immutable data classes)
- **Visualization / Charts:** `fl_chart`
- **Animations:** `flutter_animate`

---

## 📁 Directory Structure
```text
lib/
├── config/             # Static game catalogs, string pools (e.g., gregg_lines.dart), formulas
├── data/               # Drift SQLite database, schemas, DAOs, and seeders
│   ├── daos/           # Domain Data Access Objects (FleetDao, CrewDao, etc.)
│   ├── tables/         # Drift table definitions (one file per entity)
│   └── app_database.dart # Central Drift database definition
├── game/               # Pure Dart domain logic (NO Flutter or UI dependencies)
│   ├── advisor/        # Gregg Advisor service and advice evaluation
│   ├── ai/             # AI Corporation decision loop and simulation
│   ├── combat/         # Pure Dart Naval Combat Engine v2 & AAR generation
│   ├── economy/        # Market pricing formulas and ledger computations
│   ├── missions/       # Mission generator and Interruptor sealed class engine
│   └── station/        # Scanning, mining, salvage, and research systems
├── models/             # Freezed immutable models, snapshots, and DTOs
├── providers/          # Riverpod providers (GameStateProvider, TurnActionsProvider, etc.)
├── screens/            # Flutter UI screens and navigation targets
└── main.dart           # App entrypoint, ProviderScope, theme, and router setup
```

---

## 🏷️ Naming & Code Conventions
1. **Drift Tables:** CamelCase class names matching domain entities (e.g. `Fleet`, `Crew`, `CorpInventory`, `CorpFinanceLedger`).
2. **DAOs:** PascalCase with `Dao` suffix (e.g. `FleetDao`, `CrewDao`, `MarketDao`).
3. **Providers:** camelCase with `Provider` suffix (e.g. `gameStateProvider`, `turnActionsProvider`).
4. **Screens & Widgets:** PascalCase with `Screen` / `Widget` suffix (e.g. `CorpHqScreen`, `MarketScreen`).
5. **Pure Game Logic Isolation:** Everything under `lib/game/` must be pure Dart. Zero imports of `package:flutter/...` and zero direct SQLite queries (use immutable snapshot inputs).
6. **Null Safety & Immutability:** Prefer immutable snapshots (`freezed` or Dart records) for inter-module data transfer.

---

## 🚦 Progress & Phase Checklist

| Phase | Description | Status | Notes |
|---|---|---|---|
| **Phase 0** | Project Setup & CONTEXT.md | **DONE** | Scaffolding, dependencies, folder structure, CONTEXT.md |
| **Phase 1** | Database Schema & Seed Data | **DONE** | 27 Drift tables, 11 DAOs, DatabaseSeeder, 100% tests passing |
| **Phase 2** | Corp Initialization & Turn Engine | **DONE** | NewGameScreen, CorpHqScreen, GameStateProvider, TurnEngine |
| **Phase 3** | Economy: Market, Resources & Ledger | **DONE** | MarketPriceService, MarketScreen, LedgerService, LedgerScreen, fl_chart |
| **Phase 4** | Station: Scanning, Mining, Research | **DONE** | ScanningService, MiningService, ResearchService, StationService, StationScreen |
| **Phase 5** | Fleet, Ships, Modules & Crew | **DONE** | ShipService, ShipModService, CrewService, FleetScreen, CadetAcademyScreen |
| **Phase 6** | Mission Board & Interruptors | **DONE** | MissionGeneratorService, InterruptorEngine, MissionRunnerService, MissionCockpitScreen |
| **Phase 7** | Combat Engine (Pure Dart) | **DONE** | CombatEngine, CombatService, Weaving Initiative, 6-Subsystem HP, Salvage |
| **Phase 8** | Combat Screen & Animation | **DONE** | CombatScreen, Action Playback Engine, flutter_animate FX, AAR Debriefing |
| **Phase 9** | AI Corporations | **DONE** | AiCorpService, 6 Rival Megacorps, Turn Simulation, Leaderboards & Dossiers |
| **Phase 10** | Polish, Codex, Gregg & Release | **DONE** | CodexScreen, SettingsScreen, GreggAdvisorService, Multi-Platform Verified |

---

## 📊 Database Entities (Drift)
- **Tables (27):**
  - `Asteroids` (master asteroids catalog: m3 volume, minerals, gases)
  - `AsteroidsScanned` (permanently discovered asteroids)
  - `TempAsteroidsScanned` (turn-discovered asteroids cache)
  - `Cadets` (cadet academy candidates roster)
  - `CadetsProgress` (cadet level progression and training logs)
  - `Characters` (officer templates and named characters)
  - `CombatStats` (historical attack logs and battle stats)
  - `CorpInventory` (Solars currency + 7 resource commodity quantities)
  - `CorpResearch` (10 research disciplines, levels, progress, next goals)
  - `Crew` (active officers, 8 skills, assignments, and ranks)
  - `CrewGenerate` (1,256 name generation pool entries)
  - `Fleet` (active ships, hull HP, 6 subsystem status gauges, market values)
  - `GameData` (global game turn counter)
  - `Members` (player and AI corporation entities)
  - `MissionHolder` (active turn mission board contracts)
  - `MissionInterruptors` (9 encounter scenarios with choices and outcomes)
  - `MissionTextGenerator` (station names and procedural mission templates)
  - `Rolls` (dice roll history and audit logs)
  - `Salvage` (derelict recovery targets and scrap yield)
  - `ScavengeList` (salvage component lookup items)
  - `ShipModels` (47 ship models across civilian/military classes with base stats)
  - `ShipMods` (fitted upgrade modules per ship)
  - `ShipModsAvailable` (26 purchasable upgrade modules across tiers)
  - `ShipPersonalities` (ship quirks and behavioral traits)
  - `StationBuildings` (station infrastructure: HQ, Radar, Lab, Refinery, Drydock, etc.)
  - `CorpTurnActions` (per-turn action lockouts: scan, mine, research, cadets, expedition, market)
  - `CorpFinanceLedger` (historical financial P&L and net worth snapshots)

- **DAOs (11):**
  - `GameDataDao`, `CorpDao`, `InventoryDao`, `ResearchDao`, `StationDao`, `FleetDao`, `CrewDao`, `AsteroidDao`, `MissionDao`, `LedgerDao`, `CatalogDao`

---

## ⚡ Active State Providers (Riverpod)
- `databaseProvider` (`AppDatabase` singleton)
- `databaseSeederProvider` (`DatabaseSeeder`)
- Domain DAO providers (`gameDataDaoProvider`, `corpDaoProvider`, etc.)
