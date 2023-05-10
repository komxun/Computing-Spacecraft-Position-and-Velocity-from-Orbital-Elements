# Computing_Spacecraft_Position_and_Velocity_from_Orbital_Elements
(Homework from Aerospace Engineering IIA class, Kyushu University)
# Problem Statement
![image](https://github.com/komxun/Computing_Spacecraft_Position_and_Velocity_from_Orbital_Elements/assets/133139057/c304eb6d-80eb-4c15-8747-1a997c4fe715)

# Solutions
This problem can be solved with the following knowledge:
- Converting Classical Orbital Elements (CoE) to spacecraft's position and velocity vectors (**rv2coe**)
- Converting Satellite coordinate system (RSW) to Geocentric Equatorial System (IJK) (**rsw2ijk**)
- Solving Kepler's Equation with Newton's Iteration method (**eccanomaly_newt**)

## Solution Steps
1. Obtain the semi-major axis ($a$), eccentricity ($e$), and angular momentum ($h$) with **rv2coe**
https://github.com/komxun/Computing_Spacecraft_Position_and_Velocity_from_Orbital_Elements/blob/74a83d5946d9d6320cf3412625b9c206f7c30e79/rv2coe.m#L1-L37

2. For each time step, obtain the eccentric anomaly ($E$) from the given mean anomaly ($M$) with **eccanomaly_newt**

# Results
![Molniya Orbit](https://github.com/komxun/Computing_Spacecraft_Position_and_Velocity_from_Orbital_Elements/assets/133139057/a3c8cfee-14ae-461b-9494-12cfe1bf4d67)

## More time steps
![more time step Molniya Orbit](https://github.com/komxun/Computing_Spacecraft_Position_and_Velocity_from_Orbital_Elements/assets/133139057/4f77d179-9aa1-42c5-95c8-685c3b4316be)
