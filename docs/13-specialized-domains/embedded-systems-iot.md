---
layout: default
title: Embedded Systems & IoT
parent: Specialized Domains
---

# Embedded Systems & IoT

## Introduction

Embedded systems & IoT covers firmware development for microcontrollers, real-time operating systems, communication protocols, and connected devices. Roles: Embedded Engineer, Firmware Engineer, IoT Developer, RTOS Engineer, Embedded Linux Engineer, and Automotive Embedded Engineer.

## What the Role Does

- Develop firmware in C/C++ for MCUs (ARM Cortex-M, ESP32, STM32, AVR).
- Work with RTOS (FreeRTOS, Zephyr, RT-Thread) — tasks, scheduling, inter-task comms.
- Interface sensors and actuators over SPI, I2C, UART, CAN, and one-wire.
- Implement wireless connectivity: BLE, Wi-Fi, Zigbee, LoRa, cellular (NB-IoT).
- Debug at the register/peripheral level; handle low-power and energy budgets.
- For IoT: cloud connectivity (MQTT), OTA updates, and device security.

## Hiring Companies

TI, NXP, STMicro, Infineon, Bosch, Siemens, Honeywell, and India: eInfochips, L&T Technology Services, Tata Elxsi, KPIT, VVDN, Cyient, and automotive Tier-1s (Continental, Bosch India, Aptiv).

## Core Topics

| Topic | What to Know |
|-------|--------------|
| C & C++ | Pointers, memory management, bit manipulation, embedded C ([30-CPP](../../30-CPP/)) |
| Microcontrollers | Registers, GPIO, timers, ADC, PWM, interrupts, DMA |
| RTOS | Tasks, scheduling, semaphores, mutexes, queues, ISR vs task ([32-Operating-System](../../32-Operating-System/)) |
| Protocols | SPI, I2C, UART, CAN, USB, Ethernet (PHY/MAC) |
| Wireless | BLE, Wi-Fi, Zigbee, LoRa, NB-IoT, MQTT/CoAP |
| Low Power | Sleep modes, wake sources, energy profiling |
| Debugging | JTAG/SWD, logic analyzer, crash analysis, watchdogs |
| Boot & BSP | Startup code, linker scripts, device drivers, HAL/LL |
| Safety | MISRA C, watchdog, fail-safe design |
| IoT Cloud | MQTT brokers, device shadow, OTA, device identity/security |

## Interview Roadmap (12 Weeks)

```
Weeks 1-2:   C language deep dive (pointers, memory, bit-fields)
Weeks 3-4:   MCU peripherals on a dev board (STM32/ESP32): GPIO, timers, ADC, interrupts
Weeks 5-6:   RTOS: FreeRTOS tasks, scheduling, semaphores, queues
Weeks 7-8:   Protocols: SPI/I2C/UART/CAN + sensor interfacing
Weeks 9-10:  Wireless (BLE/WiFi) + MQTT cloud integration + low-power
Weeks 11-12: Debugging practice + mock embedded rounds
```

## Sample Interview Questions

- Explain the difference between a task and an ISR in FreeRTOS.
- What is the difference between volatile, const, and static in C?
- How do you prevent priority inversion in an RTOS?
- Design firmware for a button-debounced, low-power sensor node.
- Explain how I2C addressing and clock stretching work.
- What is DMA and when would you use it over CPU-based transfers?
- How would you implement OTA updates securely on an ESP32?

## Projects for Portfolio

- Build an IoT node: ESP32/STM32 + sensors + BLE/WiFi + MQTT to a cloud dashboard.
- Write a bare-metal RTOS scheduler or device driver for a peripheral.
- Implement a low-power battery device with >6 months battery life.
- Build a real-time control loop (e.g., temperature PID controller).

## Tools to Learn

- Boards: STM32 (CubeIDE/HAL), ESP32 (ESP-IDF/Arduino), Raspberry Pi Pico
- RTOS: FreeRTOS, Zephyr, RT-Thread
- Debug: J-Link/ST-Link, logic analyzer, Saleae, oscilloscope
- Build: GCC, CMake, Make; Git for firmware versioning
- Cloud: AWS IoT Core / Azure IoT Hub / ThingSpeak

## Key Links

- C++: [30-CPP](../../30-CPP/)
- Operating Systems: [32-Operating-System](../../32-Operating-System/)
- Linux: [40-Linux](../../40-Linux/)
- Computer Architecture: [39-Computer-Architecture](../../39-Computer-Architecture/)
- Career Pages: [Company Career Pages](../01-getting-started/career-pages)

## Common Mistakes

1. Knowing C syntax but not hardware reality (memory-mapped I/O, volatile).
2. Not understanding RTOS scheduling and inter-task communication.
3. Skipping low-power design — a #1 IoT interview topic.
4. Being unable to read a datasheet or a schematic.
5. Not debugging methodically (power → clock → reset → peripherals → app).
