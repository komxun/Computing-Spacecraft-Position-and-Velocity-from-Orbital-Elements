# Computing_Spacecraft_Position_and_Velocity_from_Orbital_Elements

# Problem Statement
![image](https://github.com/komxun/Computing_Spacecraft_Position_and_Velocity_from_Orbital_Elements/assets/133139057/c304eb6d-80eb-4c15-8747-1a997c4fe715)

# Required Knowledge
This problem can be solved with the following knowledge:
- Converting Classical Orbital Elements (CoE) to spacecraft's position and velocity vectors (**rv2coe**)
- Converting Satellite coordinate system (RSW) to Geocentric Equatorial System (IJK) (**rsw2ijk**)
- Solving Kepler's Equation with Newton's Iteration method 

# Solution Steps
1. Obtain the semi-major axis ($a$), eccentricity ($e$), and angular momentum ($h$) from the initial position and velocity vector with **rv2coe.m**
https://github.com/komxun/Computing-Spacecraft-Position-and-Velocity-from-Orbital-Elements/blob/74a83d5946d9d6320cf3412625b9c206f7c30e79/rv2coe.m#L1-L37

2. For each time step, obtain the eccentric anomaly ($E$) from the given mean anomaly ($M$) with Newton's iteration. This has been coded in **eccanomaly_newt.m**
https://github.com/komxun/Computing-Spacecraft-Position-and-Velocity-from-Orbital-Elements/blob/b3d1e54e31946eaf97c9201e32ea28c986e546be/eccanomaly_newt.m#L1-L15

3. Calculate True Anomaly ($f$) from the following equation:
$${f = 2\arctan\left(\sqrt{ 1+e \over 1-e} \times \tan{E \over 2}\right)}$$

4. Position and velocity vector in RSW coordinate frame can be obtained as follow:

$${  { {\vec{r}\_{rsw}} = \left\lbrack \matrix{r \cr 0 \cr 0} \right\rbrack } ,{{\vec{v}\_{rsw}} = \left\lbrack \matrix{{h \over a(1-e^2)} e\sin f \cr h/r \cr 0} \right\rbrack} }$$


5. Transform position and velocity vectors from RSW to IJK coordinate with directional cosine matrices. This is coded in **rsw2ijk.m**

https://github.com/komxun/Computing-Spacecraft-Position-and-Velocity-from-Orbital-Elements/blob/366f8e27ad22d0ed856c3f24ca73eb2bfcb2ae30/rsw2ijk.m#L1-L21



The main loop for finding spacecraft's position and velocity is shown below:
https://github.com/komxun/Computing-Spacecraft-Position-and-Velocity-from-Orbital-Elements/blob/82d4dfc1497b5721f96a174d55b7e24e1f60a9ed/main.m#L31-L53



# Results
![Molniya Orbit](https://github.com/komxun/Computing_Spacecraft_Position_and_Velocity_from_Orbital_Elements/assets/133139057/a3c8cfee-14ae-461b-9494-12cfe1bf4d67)

## More time steps
![more time step Molniya Orbit](https://github.com/komxun/Computing_Spacecraft_Position_and_Velocity_from_Orbital_Elements/assets/133139057/4f77d179-9aa1-42c5-95c8-685c3b4316be)

## Animated Simulation
https://github.com/komxun/Computing_Spacecraft_Position_and_Velocity_from_Orbital_Elements/assets/133139057/f5565c8a-3927-485c-bd6d-2cb99683ed2b

# Answer
![image](https://github.com/komxun/Computing_Spacecraft_Position_and_Velocity_from_Orbital_Elements/assets/133139057/57b80984-a94a-4e2f-8710-04a03e4a0aa0)

# References
[1] H. Curtis, _Orbital mechanics for engineering students_, Butterworth-Heinemann, 2013.

[2] J. E. Prussing, B. A. Conway, _Orbital mechanics_, Oxford University Press, 2012.
