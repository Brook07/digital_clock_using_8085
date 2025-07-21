# 8085 Digital Clock in BCD Format

This project simulates a **Digital Clock** using the **8085 microprocessor**, with time maintained in **BCD (Binary-Coded Decimal)** format. The simulation is tested and verified using the **SIM-8085** emulator.

---

## 🧠 Features

- Simulates hours, minutes, and seconds in BCD format
- Uses memory-mapped locations for time tracking
- Handles BCD carryover (60 seconds → 1 minute, 60 minutes → 1 hour, 24 hours → reset)
- Includes manually tuned delay subroutine to simulate a 1-second interval

---

## ⚙️ Memory Map

| Address | Purpose |
|---------|---------|
| 4200H   | Seconds (BCD) |
| 4201H   | Minutes (BCD) |
| 4202H   | Hours   (BCD) |

---

## ▶️ How to Run on SIM-8085

1. Open **SIM-8085**.
2. Load the program into memory using the code editor.
3. **Manually set the memory range from `4200H` to `4202H`** using the memory view panel.
4. Assemble and run the program.
5. Watch the values at `4200H`, `4201H`, and `4202H` increment as a clock.


