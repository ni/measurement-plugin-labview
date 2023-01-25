# NI-DMM Measurement

This is a MeasurementLink example that performs a measurement using an NI DMM.

## Features

- Pin-aware, supporting one session, one pin, and one selected site
- Uses the NI gRPC Device Server to allow sharing instrument sessions with other
  measurement services when running measurements from TestStand

## Required Driver Software

- NI-DMM

## Required Hardware

This example requires an NI DMM (e.g. PXI-4072).

To simulate an NI DMM in software: open `NI MAX`, right-click `Devices and Interfaces`,
select `Create New...`, and select `Simulated NI-DAQmx Device or Modular Instrument`.
DMMs are in the `Digital Multimeters` category.