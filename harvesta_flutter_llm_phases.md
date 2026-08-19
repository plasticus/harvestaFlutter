# harVesta → Flutter: LLM Port Playbook
> **Using an LLM to Do the Heavy Lifting**  
> *A structured, phase-by-phase execution plan for porting harVesta from PHP/MariaDB to a single-player Flutter/Dart app, driven by an LLM coding assistant. Each phase specifies what to build, what context files to feed the LLM, sample prompts, and gate checklists.*

---

## 📅 Metadata & High-Level Architecture
- **Date:** August 2026
- **Target:** Flutter / Dart 3.x (Single-Player Android primary, iOS/Desktop ready)
- **Methodology:** LLM-Driven Development (Director + QA Model)

---

## 📦 Committed Flutter Stack

| Layer | Technology | Rationale |
|---|---|---|
| **Language** | Dart 3.x | Strong typing, sound null safety, async/await |
| **Framework** | Flutter (latest stable) | Android primary + cross-platform readiness |
| **State Management** | Riverpod 2.0 | Best LLM generation support; explicit, typed providers |
| **Local Database** | Drift (SQLite) | Type-safe ORM; schema mirrors SQL dump directly |
| **Navigation** | go_router | Declarative routing; ideal for mission state machines |
| **Charts** | fl_chart | Replaces PHP SVG net-worth / P&L charts |
| **Animations** | flutter_animate | Declarative animation chains for combat/event playback |
| **Data Models** | freezed + json_serializable | Immutable data classes generated reliably by LLMs |
| **Dependency Injection** | Riverpod (built-in) | Unified state & DI without extra overhead |

---

## 💡 How to Work With an LLM on This Project

### 🎯 The PHP Files Are Your Context
Your existing PHP codebase is the single best prompt context. For each phase, paste the relevant PHP file(s) directly into the prompt. The LLM reads the business logic and translates it directly into Dart—no need to describe complex rules in prose when the reference code exists.

### 🧩 One System Per Session
Never ask the LLM to *"port the whole game."* Scope tasks strictly to individual phase boundaries (e.g., *"implement the market pricing formula in Dart using this PHP reference"*).

### ✅ LLMs Are Great At:
- Generating Drift table schemas from SQL `CREATE TABLE` definitions.
- Writing Riverpod providers with clear specifications.
- Translating pure math and game logic (formulas, combat rolls, modifier math).
- Building Flutter widget trees from structured descriptions.
- Generating `freezed` / `json_serializable` boilerplate.
- Converting PHP static arrays into Dart seed maps/catalogs.

### 🚫 LLMs Struggle With:
- Holding the full game state across multiple sessions without context.
- Subtle game balance discrepancies (always verify the math against original logic).
- Complex Flutter animation sequences without explicit specs.
- Database migrations (always manually review generated schema migration code).
- Catching cross-system contradictions across multiple detached files.

### ⚠️ Always Run the Gate Checklist
Run every item on each phase's deliverables checklist before advancing to the next phase. Bugs in early systems compound rapidly when downstream systems depend on them.

### ⚠️ Maintain a `CONTEXT.md` File
Keep a living `CONTEXT.md` in the Flutter project root. Have the LLM read this file at the start of every session to maintain memory of architecture decisions, table definitions, existing providers, and completed milestones.

---

## 👤 Feature Character: Gregg — Corporate Advisor

### Character Profile
- **Name:** Gregg — *Your Corporate Advisor*
- **Role:** Appears on the Corp HQ screen each turn with 2–3 lines of contextual advice based on current game state.
- **Personality:** Genuinely loves his job. Enthusiastic, helpful, completely non-serious. Speaks in a continuous stream of mangled Gregg-portmanteau words that he treats as standard professional corporate vocabulary.
- **Future:** Serves as the foundation for a future *"Choose Your Advisor"* feature (3 personalities planned). Gregg is the launch advisor.

### The Gregg Lexicon
- **Greggsactly** → *exactly*
- **Gregstimate** → *estimate*
- **Greggcellent** → *excellent*
- **Greggnomics** → *economics*
- **Con-Gregg-ulations** → *congratulations*
- **Gregg-pectations** → *expectations*
- **In-Gregg-dible** → *incredible*
- **Gregg-onomically** → *economically*
- **Gregg-ressive** → *aggressive*
- **Gregg-istered** → *registered*
- **Gregg-ulatory** → *regulatory*
- **Gregg-asaurus** → *expressed when excited*

### Contextual Trigger Conditions
Gregg evaluates current state each turn and selects advice based on priority conditions:
1. 🔴 **Low Solars:** Nags you to sell resources or accept a paying contract.
2. 🟢 **Good Net Worth Growth:** Compliments recent turn performance.
3. 🟡 **Ships Damaged:** Suggests prioritizing drydock repairs.
4. 🔵 **No Mission Taken This Turn:** Reminds you that contracts are expiring.
5. 🟣 **Research Level-Up:** Celebrates the scientific breakthrough.
6. 🟠 **Falling Behind on Leaderboard:** Strategically panics.
7. 🟢 **Leaderboard Lead:** Expresses pride in his advisory role.
8. ⚪ **No Specific Condition:** General turn-opening motivational pep talk.

### Sample Lines
> *"Greggcellent turn, chief. Our net worth trajectory is — and I mean this Gregg-onomically speaking — going straight up. Greggsactly where we want it."*

> *"Okay so, uh, our Solar situation is — my Gregstimate — not great. Might want to hit the market before Cyberdyne notices we can't afford lunch."*

> *"Con-Gregg-ulations!! Research breakthrough on Astrogation Level 3! I personally had nothing to do with it but I feel like I really contributed energy-wise."*

> *"So Goliath just leapfrogged us on the leaderboard and I'm not Gregg-istering any concerns here but... I'm Gregg-istering some concerns."*

### Implementation Note (Phase 10)
Build `GreggAdvisorService` in `lib/game/advisor/` that takes a `GameStateSnapshot` (turn, Solars, net worth delta, leaderboard rank, damaged ships count, recent research level-up flag, skipped mission flag) and returns a `GreggAdvice` model with 2–3 lines. Keep all string pools in `lib/config/gregg_lines.dart` for modularity.

---

## 🚀 Phase-by-Phase Execution Plan

---

### Phase 0: Project Setup & `CONTEXT.md`
> **Effort:** 2–3 days · *Foundation*  
> **Summary:** Architecture lock-in, project scaffolding, folder structures, and LLM project memory initialization.

#### What You Do (Not the LLM)
- Initialize project: `flutter create harvesta`
- Configure `pubspec.yaml` with required dependencies: `flutter_riverpod`, `drift`, `drift_flutter`, `go_router`, `fl_chart`, `flutter_animate`, `freezed`, `json_serializable`, `build_runner`.
- Establish target directory structure:
  - `lib/data/` — Drift database, tables, and DAOs
  - `lib/models/` — Freezed immutable data classes
  - `lib/providers/` — Riverpod state providers
  - `lib/screens/` — Flutter UI widgets and layouts
  - `lib/game/` — Pure game logic (zero Flutter dependencies)
  - `lib/config/` — Static catalogs and configuration
- Export SQL schema from web database.
- Commit starter `CONTEXT.md`.

#### `CONTEXT.md` Starter Template
```markdown
You are porting the harVesta web game (PHP/MariaDB) to a Flutter/Dart single-player Android app.

Stack: Flutter, Dart 3, Riverpod 2.0, Drift (SQLite), go_router, fl_chart, flutter_animate, freezed.

Folder structure:
  lib/data/      → Drift DB and DAOs
  lib/models/    → freezed immutable data classes
  lib/providers/ → Riverpod providers
  lib/screens/   → Flutter UI widgets
  lib/game/      → pure game logic (no Flutter imports)
  lib/config/    → static JSON/Dart data catalogs

Naming conventions:
  - Drift tables: CamelCase (Fleet, Crew, CorpInventory)
  - Providers: camelCaseProvider
  - Screens: NameScreen

Completed phases: [update as completed]
Known DB tables: [list as created]
Known providers: [list as created]
```

#### Gate Checklist
- [ ] `flutter pub get` executes cleanly.
- [ ] `flutter run` launches a dark scaffold without runtime errors.
- [ ] Package versions resolve without dependency conflicts.
- [ ] `CONTEXT.md` committed in repository root.
- [ ] Directory structure verified.

#### Watch Out For
- Version incompatibilities between Drift, Riverpod, and Freezed—pin compatible versions before coding.

---

### Phase 1: Database Schema & Seed Data
> **Effort:** 1.5–2 weeks · *Data Foundation*  
> **Summary:** All 27 Drift database tables and static catalog seeders (ships, modules, asteroids, research disciplines).

#### What the LLM Builds
- Drift `@DataClassName` table definitions for each relational entity.
- Central `AppDatabase` class registering all table schemas.
- Domain DAOs: `FleetDao`, `CrewDao`, `InventoryDao`, `MissionDao`, `ResearchDao`, etc.
- `DatabaseSeeder` to populate static data on first launch (38 ships, 26 modules, ~400 asteroids, 10 research trees, 7 commodities, crew name tables).
- `GameDataDao` for single-row game state and turn tracking.

#### Reference Files to Feed
- `udgdwxxz_harvesta(2).sql`
- `data.php`
- `db.php`

#### Sample Prompt
```text
Here is the SQL schema for the harVesta database.
Convert each CREATE TABLE into a Drift table class.

Produce:
1. One Dart file per table in lib/data/tables/
2. A central AppDatabase in lib/data/app_database.dart
3. Use int primary keys where SQL uses INT AUTO_INCREMENT
4. TextColumn for VARCHAR, IntColumn for INT, RealColumn for DECIMAL/FLOAT

[paste SQL CREATE TABLE statements here]
```

#### Gate Checklist
- [ ] `dart run build_runner build` succeeds without warnings or errors.
- [ ] SQLite database file initializes cleanly on cold launch.
- [ ] Seeder populates ship catalog, modules, and asteroid datasets.
- [ ] `GameDataDao.getTurn()` returns `1`.
- [ ] All 27 tables visible and verifiable in Database Inspector.

#### Watch Out For
- `combatTable` in the PHP app was a temporary scratch table for global battle state—do not create a Drift table for it; handle combat state purely in-memory (Phase 7).
- Re-architect dynamic `"CREATE TABLE IF NOT EXISTS"` PHP tables (e.g. `corp_turn_actions`, `corpFinanceLedger`) as standard Drift tables.

---

### Phase 2: Corp Initialization & Turn Engine
> **Effort:** 3–5 days · *Core Loop Heart*  
> **Summary:** New game flow, corp setup, turn management, action lockouts, and turn advancement orchestration.

#### What the LLM Builds
- `NewGameScreen`: Corp creation, difficulty choice, starting resource allocation.
- `GameStateProvider`: Riverpod provider managing active turn, corp metadata, and Solars balance.
- `TurnActionsProvider`: Tracks per-turn action completion (scan, mine, research, cadets, expedition, market).
- `TurnEngine` (`lib/game/turn_engine.dart`): Coordinates sequential per-turn resolution logic, updating state and advancing the turn counter.
- Corp HQ dashboard scaffold with action readiness indicators.

#### Reference Files to Feed
- `advance-turn.php`
- `turn_actions.class.php`
- `onboarding.class.php`

#### Gate Checklist
- [ ] Starting a new game populates initial corp records in SQLite.
- [ ] `TurnActionsProvider` logs completed actions and resets on turn advance.
- [ ] "Advance Turn" increments the global turn counter in the database.
- [ ] Corp HQ reflects the correct turn number and available actions.
- [ ] Action locks prevent repeating single-turn actions.

#### Watch Out For
- Enforce turn advancement permissions and lockouts in the provider/domain layer, not solely in UI widget logic.
- AI turn execution step in `TurnEngine` should be stubbed out with `runAiCorps()` until Phase 9.

---

### Phase 3: Economy: Market, Resources & Financial Ledger
> **Effort:** 1–1.5 weeks · *Money Systems*  
> **Summary:** 7-commodity market, deterministic pricing formulas, inventory management, financial P&L ledger, and `fl_chart` dashboards.

#### What the LLM Builds
- `MarketPriceService`: Pure Dart deterministic price calculation:  
  $\text{hash}(\text{commodity} + \text{turn}) \rightarrow \pm 10\%$ variance.  
  $\text{Buy} = \text{Base} \times 1.20 \times \text{TradeBonus}$  
  $\text{Sell} = \text{Base} \times 0.90 \times \text{TradeBonus}$
- `InventoryProvider`: Reactive state for Solars and 7 commodity inventories.
- `MarketScreen`: Buy/Sell interface with real-time price calculators, volume sliders, and transaction confirmation.
- `LedgerService`: Records financial P&L snapshots to `CorpFinanceLedger` on each turn advance.
- `LedgerScreen`: Interactive `fl_chart` net-worth line chart and revenue/expense breakdown tables.

#### Reference Files to Feed
- `market.php`
- `market-trade.php`
- `ledger.class.php`
- `ledger.php`

#### Gate Checklist
- [ ] Market prices change deterministically turn-over-turn (repeating the same turn yields identical prices).
- [ ] Transactions correctly credit/debit Solars and adjust commodity quantities in SQLite.
- [ ] Trade Relationships research bonus (3%/level, max 20%) properly modifies prices at the service level.
- [ ] Financial snapshots log to `CorpFinanceLedger` on every turn increment.
- [ ] `fl_chart` renders historical net worth curve correctly across multiple turns.

#### Watch Out For
- Ensure the Solars balance in `corpInventory` is the single source of truth for all transactions and net worth calculations.
- Avoid using PHP-specific `crc32()` negative integer quirks; use standard FNV-1a or Dart hash codes for deterministic pricing.

---

### Phase 4: Station: Scanning, Mining, Salvage, Research & Upgrades
> **Effort:** 1.5–2 weeks · *Station Systems*  
> **Summary:** Radar sweeps, asteroid mining operations, salvage missions, research progression trees, and station facility upgrades.

#### What the LLM Builds
- `ScanningService`: Selects $N$ random asteroids into the corporation's scanned cache ($N = \text{Scanner Level} + \text{Research Bonus}$).
- `MiningService`: Dispatches mining operations; depletes asteroid volume ($m^3$); calculates yield based on mineral composition and mining tech.
- `SalvageService`: Resolves derelict salvage recovery from the salvage table.
- `ResearchService`: Evaluates per-turn research points $(\text{Scientist Stats} + \text{Lab Level})$ against exponential thresholds ($300 \times 2^{\text{level}}$).
- `StationUpgradeService`: Handles facility level-ups and Solar deductions.
- `StationScreen`: Hub UI featuring building tiers, scan controls, mining dispatch, research queue, and storage inventories.

#### Reference Files to Feed
- `station.php`
- `station-radarsweep.php`
- `station-mineasteroid.php`
- `station-scanasteroids.php`
- `station-salvage.php`
- `station-research.php`
- `station-upgradebuilding.php`

#### Gate Checklist
- [ ] Radar sweeps discover and record the correct number of asteroids based on scanner level.
- [ ] Mining depletes asteroid $m^3$ volume and deletes/archives exhausted targets.
- [ ] Research progress accumulates each turn and triggers level-up when targets are met.
- [ ] All 10 research bonuses correctly wire into their respective consumer services.
- [ ] Facility upgrades deduct correct Solars and unlock corresponding perks.
- [ ] Action locks prevent duplicate scans or mining operations in a single turn.

#### Watch Out For
- Research bonuses are cross-cutting: ensure bonuses are consumed directly inside `ScanningService`, `MiningService`, and `MarketPriceService`, rather than sitting isolated in `ResearchService`.
- Differentiate between permanently scanned asteroids (`asteroidsScanned`) and temporary turn discoveries (`tempAsteroidsScanned`).

---

### Phase 5: Fleet, Ships, Modules & Crew
> **Effort:** 3–4 weeks · *Largest Phase*  
> **Summary:** Fleet roster, squadron assignments, hardpoint module loadouts, ship quirks, drydock repair math, officer skills, and cadet academy.

#### What the LLM Builds
- **Ships & Squadrons:**
  - Fleet management screen grouped by active squadrons.
  - Ship detail panel with 6 subsystem health gauges, fitted modules, quirks, and assigned officers.
  - Shipyard purchasing, decommission/sales, and drydock repairs (discounted by Ship Building research).
  - Dynamic Admiral auto-assignment to the flagship/highest-value vessel.
- **Module Loadouts:**
  - Module fitting interface with slot validation (Weapon, Armor, and Bay hardpoints).
  - 26 module catalog across equipment tiers.
  - Hardpoint expansions unlocked via Ship Bay research tiers (L3/L5).
  - `ShipModService` for constraint and loadout verification.
- **Crew & Cadet Academy:**
  - Officer roster tracking 8 individual skill proficiencies and payroll costs.
  - Payroll deduction during turn processing.
  - Cadet academy featuring a 20-candidate rotating recruitment pool.
  - AI poaching simulation and organic turn-by-turn candidate walk-ins.

#### Reference Files to Feed
- `fleet.php`
- `fleet-purchaseship.php`
- `fleet-modbuy.php`
- `fleet-repair.php`
- `fleet-sellship.php`
- `fleet-adjustcrew.php`
- `shipyard.php`
- `station-cadethire.php`
- `station-cadetprogress.php`
- `station-cadetrecruit.php`
- `recent_graduates.class.php`

#### Gate Checklist
- [ ] Purchased ships register in SQLite and display in their assigned squadron.
- [ ] Hardpoint slot limits (Weapon/Armor/Bay) are strictly enforced during module fitting.
- [ ] Ship quirks render accurately in ship details.
- [ ] Drydock repair costs accurately follow the original calculation formula.
- [ ] Cadet board populates 20 candidates and refreshes on turn advance.
- [ ] Crew payroll deducts correctly during turn processing.
- [ ] Admiral rank auto-assigns to the captain of the highest-value ship.

#### Watch Out For
- `fleet.php` is over 1,000 lines: break UI generation into modular widgets (`ShipCard`, `SubsystemBar`, `ModuleSlotTile`, `OfficerAvatar`).
- Ship hardpoint capacities equal the chassis baseline **plus** the Ship Bay research bonus.

---

### Phase 6: Mission Board, Runner & Interruptors
> **Effort:** 2.5–4 weeks · *Most Dynamic Gameplay Systems*  
> **Summary:** Mission procedural generation, 3-waypoint flight state machine, and all 10 sector encounter/interruptor scenarios.

#### What the LLM Builds
- `MissionGeneratorService`: Generates 5 missions per turn across 9 mission archetypes, procedural narrative generation, AU distances ($0.20 - 6.00\text{ AU}$), and fuel costs ($\text{⁂}1,200/\text{AU}$).
- `MissionBoardScreen`: Contract browser showing payouts, distance, danger rating, and bonus objectives.
- `MissionStateProvider` (`StateNotifier` / `Notifier`): 3-waypoint state machine:  
  $\text{Squadron Selection} \rightarrow \text{WP 1} \rightarrow [\text{Interruptor?}] \rightarrow \text{WP 2} \rightarrow [\text{Interruptor?}] \rightarrow \text{WP 3} \rightarrow \text{Resolution}$
- `MissionCockpitScreen`: Flight instrumentation, narrative feed, and squadron status HUD.
- `InterruptorEngine`: Sealed class hierarchy for the 10 encounter types. Evaluates `resolve(SquadronSnapshot, int threatRating)` via dice rolls against squadron stats, outputting `InterruptorOutcome`.
- Interactive interruptor UI cards with tactical choices and result displays.

#### Reference Files to Feed
- `mission.php`
- `mission-generate.php`
- `mission-zonulae.php`
- `mission-confirm.php`
- `interruptors.class.php`
- `mission_narrative.class.php`

#### Key Prompt Template
```text
interruptors.class.php uses global PHP variables ($link, $_SESSION, $crew, $squadron, $CR).

Replace ALL global dependencies with explicit Dart constructor parameters:
  - SquadronSnapshot (immutable stats snapshot)
  - int threatRating (replaces $CR)

Do NOT use global state. Each interruptor resolves purely from its input parameters.

Use a sealed class hierarchy — one subclass per encounter type. Not a giant switch statement.
```

#### Gate Checklist
- [ ] 5 procedural missions generate on every turn rollover.
- [ ] Fuel expenses deduct based on flight distance.
- [ ] Flight cockpit progresses across all 3 waypoints seamlessly.
- [ ] Interruptors trigger at waypoints and present branching choices.
- [ ] All 10 encounter archetypes verified with proper probability curves.
- [ ] Contract rewards, bonuses, and salvage credit to database on mission complete.
- [ ] Mid-mission flight state persists in SQLite across app restarts.

#### Watch Out For
- Ensure the LLM uses Dart sealed classes / pattern matching instead of an unmaintainable switch statement.
- Persist in-flight state to SQLite to survive app lifecycle closures.

---

### Phase 7: Combat Engine — Pure Dart Logic
> **Effort:** 2–3 weeks · *Core Computational Logic*  
> **Summary:** Complete port of Naval Combat Engine v2 to pure Dart. No UI or Flutter dependencies—pure business logic with thorough unit test coverage.

#### What the LLM Builds (Logic Only — No Flutter Imports)
- `CombatEngine` in `lib/game/combat/`.
- Input: Immutable `PlayerSquadron` and `EnemySquadron` snapshots captured prior to engagement.
- Output: `CombatLog` containing an ordered list of `CombatRound` state frames.
- 6-subsystem progressive damage tracking (Engines, Weapons, Maneuver, Life Support, Cargo, Hull).
- Weapon initiative scheduling based on `WeapCtrl` ratings.
- Officer skill modifiers: Captain (Morale), First Officer (Offense), Pilot (Evasion), Science Officer (Emergency Field Repairs).
- Ship quirk initial debuffs.
- Morale break and fleet rout cascades.
- Surrender conditions and evaluation.
- After-Action Report (AAR) engine: total damage, casualty logs, officer XP distribution, salvage, and net Solars balance.
- Comprehensive unit test suite.

#### Reference Files to Feed
- `battle_v2.class.php`
- `battle.class.php`

#### Key Prompt Template
```text
Port this PHP combat engine to pure Dart.
No Flutter imports. No database calls inside the engine — all data passed in as immutable snapshot objects at construction time.

The engine must be deterministic given the same inputs and the same Random seed. Add a seed parameter to support replays and testing.

Output a CombatLog with a List of CombatRound objects (one per exchange). Each round must record enough state to animate the combat later — do not discard intermediate subsystem values.
```

#### Gate Checklist
- [ ] 100 automated battles execute without null errors, division-by-zero, or infinite loops.
- [ ] Engagements conclude via ship destruction, rout, surrender, or round caps.
- [ ] AAR payout and bounty values remain non-negative.
- [ ] Determinism test: Identical inputs + identical random seed produce exact bit-for-bit `CombatLog` outputs.
- [ ] Officer skill differentials produce statistically significant outcome shifts.
- [ ] Ship quirks apply correct Round 1 subsystem penalties.
- [ ] Zero Flutter or database imports within `lib/game/combat/`.

#### Watch Out For
- The PHP engine relied on a temporary MySQL `combatTable`—replace all temporary database reads/writes with in-memory Dart collections.
- Ensure `Random(seed)` is explicitly injectable for determinism and unit testing.

---

### Phase 8: Combat Screen & Animation
> **Effort:** 2–3 weeks · *Visual Experience*  
> **Summary:** Tactical combat visualization, frame-by-frame playback from pre-computed `CombatLog`, animated subsystem bars, tactical ticker, and AAR flow.

#### What the LLM Builds
- `CombatScreen`: Plays back pre-computed `CombatLog` events on a timed tick.
- Dual combatant displays: Friendly squadron (left) vs. Hostile squadron (right) featuring animated `LinearProgressIndicator` gauges across all 6 subsystems.
- Real-time combat narrative ticker with auto-scrolling combat log events.
- `flutter_animate` triggers for weapon discharge, impact flashes, shield depletion, hull breaches, and ship destruction.
- Playback rate controls: $0.5\times$, $1\times$, $2\times$, and Instant Resolution.
- Tactical directive selection modal prior to combat initiation.
- Mid-battle surrender confirmation dialog.
- `AARScreen`: Damage summary, casualty counts, officer XP awards, financial breakdown, and database sync on return to station.

#### Reference Files to Feed
- `combat-lab.php`
- `battle_v2.class.php`

#### Sample Prompt
```text
The CombatEngine (lib/game/combat/) produces a CombatLog. Build a Flutter CombatScreen that:

1. Takes a CombatLog as input (pre-computed)
2. Plays through rounds using a Timer
3. Left column: player ships. Right: enemy ships.
4. Each ship: name + 6 LinearProgressIndicator bars for Hull, Engines, WeapCtrl, Maneuv, LifeSupp, Cargo
5. A scrolling text panel shows narrative per round
6. Speed buttons: ×0.5, ×1, ×2, Instant

Use flutter_animate for damage flash effects.
The screen does NOT re-run the engine — it only reads from the pre-computed CombatLog.
```

#### Gate Checklist
- [ ] Combat animation plays sequentially across all recorded rounds without desync.
- [ ] All 6 subsystem progress indicators accurately mirror the underlying round state.
- [ ] Destroyed vessels visually indicate neutral/disabled state.
- [ ] "Instant" mode immediately transitions to final combat results and opens AAR.
- [ ] Final AAR bounty matches the `CombatEngine` computed total.
- [ ] Confirming AAR correctly writes officer XP and fleet damage back to SQLite.

#### Watch Out For
- Build playback on simple timer-driven state first before adding `flutter_animate` flourishes.
- The UI must never re-evaluate combat math during playback—it is strictly a visual renderer of the static `CombatLog`.

---

### Phase 9: AI Corporations
> **Effort:** 2–3 weeks · *Competition & Living World*  
> **Summary:** 6 rival AI corporations across 3 difficulty tiers autonomously scanning, mining, researching, expanding fleets, and simulating contracts.

#### What the LLM Builds
- `AiCorpService` (`lib/game/ai/`), triggered by `TurnEngine.advanceTurn()`.
- 6 unique rival corporate entities: *Syndicate, Apex, Titan, Goliath, Cyberdyne, Spectre*.
- 3 difficulty profiles: Easy ($\text{⁂}100\text{k}$ seed), Medium ($\text{⁂}250\text{k}$ seed), Hard ($\text{⁂}500\text{k}$ seed) with customized ship class preferences.
- Per-turn AI decision loop: Scanning $\rightarrow$ Resource Mining $\rightarrow$ Tech Research $\rightarrow$ Station Upgrades $\rightarrow$ Ship Procurement $\rightarrow$ Fast-Resolution Mission Dice Roll.
- Net worth tracking and historical curve logging for each competitor.
- `IntelScreen`: Competitor leaderboard displaying corporate valuations, fleet strength, and intelligence estimates.

#### Reference Files to Feed
- `login/ai_handler.class.php`
- `advance-turn.php`
- `data.php`

#### Gate Checklist
- [ ] All 6 rival corporations instantiate during initial new game seeding.
- [ ] AI treasury, fleet counts, and research tiers advance dynamically turn-by-turn.
- [ ] Intel leaderboard displays accurate relative standings between the player and rivals.
- [ ] Hard-tier AI demonstrates higher capital accumulation and larger ship acquisition compared to Easy-tier AI.
- [ ] Turn advancement completes smoothly without main-thread UI frame drops.

#### Watch Out For
- If AI turn resolution causes UI stutter, offload `AiCorpService` execution to a background Dart `Isolate`.
- Strictly isolate AI data mutations to AI-owned database rows to avoid corrupting player state.

---

### Phase 10: Polish, Codex, Gregg Advisor, Onboarding & Release
> **Effort:** 3–4 weeks · *Final Packaging & Store Readiness*  
> **Summary:** In-game encyclopedia, interactive onboarding tutorials, multi-slot save manager, Gregg advisor integration, notifications, and store deployment.

#### What the LLM Builds
- `CodexScreen`: Offline reference database of 38 ship chassis, 26 module specifications, 10 research trees, and resource guides (driven directly by static seed data).
- `GreggAdvisorService`: Turn advice generator with character string pools in `lib/config/gregg_lines.dart`.
- First-time user onboarding overlays for Corp HQ and Station hubs.
- Save Slot Manager: Support for naming, creating, backing up, restoring, and deleting separate game profiles.
- Settings Screen: Configurable animation speeds, audio/haptic toggles, and notification preferences.
- Local notification schedules (research breakthroughs, drydock completions, market rotations).
- Application launcher icons, splash screen, and Play Store metadata assets.

#### Reference Files to Feed
- `codex.php`
- `codex-ships.php`
- `onboarding.class.php`

#### Final Release Gate Checklist
- [ ] New install $\rightarrow$ New Game $\rightarrow$ 10 consecutive turns completed without errors or memory leaks.
- [ ] Save Game $\rightarrow$ Force Close App $\rightarrow$ Relaunch $\rightarrow$ State fully and accurately restored.
- [ ] All 10 interruptor encounter variants trigger and resolve cleanly across a 20-turn playthrough.
- [ ] Combat mechanics resolve cleanly across all 9 mission types.
- [ ] Rival corporations exhibit dynamic economic growth over 30 turns.
- [ ] Release AAB/APK satisfies all Google Play Store pre-launch report criteria.
- [ ] Final package size optimized under 50MB.

---

## ⏱️ Timeline & Effort Estimates

```
Phase 0:  Setup & CONTEXT.md               [■                       ]  2–3 days
Phase 1:  Database Schema & Seeds          [■■■                     ]  1.5–2 weeks
Phase 2:  Corp Init & Turn Engine          [■                       ]  3–5 days
Phase 3:  Market, Economy & Ledger         [■■                      ]  1–1.5 weeks
Phase 4:  Station: Scan, Mine, Research    [■■■                     ]  1.5–2 weeks
Phase 5:  Fleet, Ships, Modules, Crew      [■■■■■■                  ]  3–4 weeks
Phase 6:  Missions, Runner & Interruptors  [■■■■■                   ]  2.5–4 weeks
Phase 7:  Combat Engine Logic (Dart)       [■■■■                    ]  2–3 weeks
Phase 8:  Combat Screen & Animation        [■■■■                    ]  2–3 weeks
Phase 9:  AI Corporations                  [■■■                     ]  2–3 weeks
Phase 10: Polish, Codex & Release          [■■■■■                   ]  3–4 weeks
```

### Summary Metrics
- **Total Projected Duration:** 20–32 weeks (~5–8 months, LLM-assisted)
- **Efficiency Gain vs. Manual:** ~40–55% faster
- **Your Role:** **Director & QA Lead** (System architecture prompts, code review, running verification checklists, validating balance and edge cases).
