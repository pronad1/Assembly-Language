# 🛠️ EMU8086 Assembly Programs

This repository contains a collection of **8086 Assembly Language Programs** implemented and tested using **EMU8086**. All programs are manually written and serve as practice for understanding low-level system operations.

---

## 📁 Structure

/
├── program1.asm
├── program2.asm
├── ...
└── README.md

---

## ✅ Features

- Written in **x86 Assembly (8086)**
- Compatible with **EMU8086**
- Covers:
  - Basic I/O (INT 21h)
  - Data segment usage
  - String printing
  - Character input/output
  - Simple logic and arithmetic

---

## ▶️ How to Run

1. Open **EMU8086**.
2. Load any `.asm` file from this repo.
3. Assemble and Run.
4. Observe the output in the emulator.

---

## 💻 Example Snippet

```asm
.model small
.stack 100h
.data
    msg db "Enter a character:$"
    ch db ?
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    mov dx, offset msg
    int 21h

    mov ah, 1
    int 21h
    mov ch, al

    mov ah, 2
    mov dl, ch
    int 21h

    mov ah, 4ch
    int 21h
main endp
end main

```
📚 References
emu8086.com
INT 21h DOS Interrupt List
Assembly textbooks and class notes

👨‍💻 Author
Prosenjit Mondol
Faculty of CSE, PSTU
All programs manually implemented and tested on EMU8086.
