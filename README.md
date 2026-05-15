# 9-Lens-Symplectic-Realization
MATLAB implementation of optical realizations of arbitrary 4×4 symplectic transformations using rotated thin cylindrical lenses and free-space propagation.

# Sp4-Symplectic-Optics-Realization

MATLAB implementation of constructive optical realizations of arbitrary
4×4 symplectic matrices using rotated astigmatic lenses and free-space
propagation.

This project is based on the paper: https://doi.org/10.1364/JOSAA.423143

---

## Overview

The code implements:

- Generation of arbitrary 4×4 symplectic matrices
- Pre-Iwasawa decomposition
- Euler decomposition of U(2)
- Diagonalization routines for symplectic blocks
- Rotated astigmatic thin lenses
- Lens composition algorithms
- Optical realization based on Eq. (79) of the paper

The implementation uses the phase-space ordering:

[x, px, y, py]

throughout the codebase.

---

## Current Features

- Arbitrary Sp(4,R) matrix generation
- Numerical verification of symplecticity
- Extraction of decomposition parameters
- Full reconstruction of the target symplectic matrix
- Numerical verification using Frobenius norms
- Rotated cylindrical and astigmatic lenses
- 9-lens realization corresponding to Eq. (79)

---

## Current Limitation

The present implementation uses Eq. (79) only.

Therefore, singular configurations satisfying

sin(alpha + gamma) = 0

are excluded because some focal lengths diverge in this limit.

Future versions will include:
- Eq. (90)
- Eq. (94)
- Eq. (100)

to cover complementary singular regions.

---

## Main Program

Run:

```matlab
Decompose_9Lens.m
```

The program:
1. Generates a random symplectic matrix
2. Computes the pre-Iwasawa decomposition
3. Extracts all realization parameters
4. Constructs the optical realization
5. Verifies the reconstruction numerically

---

## Numerical Verification

Reconstruction accuracy is checked using the Frobenius norm:

```matlab
norm(Sym - Sy,'fro')
```

Typical errors are near machine precision.

---

## Important Conventions

### Rotation matrix

```math
R(\theta)=
\begin{bmatrix}
\cos\theta & -\sin\theta \\
\sin\theta & \cos\theta
\end{bmatrix}
```

### Thin lens convention

```math
L=
\begin{bmatrix}
I & 0 \\
K & I
\end{bmatrix}
```

### Optical power matrix

```math
K=
R_\theta
\begin{bmatrix}
-1/f_x & 0 \\
0 & -1/f_y
\end{bmatrix}
R_{-\theta}
```

---

## License

MIT License

---

## Citation

If you use this code in academic work, please cite:

P. A. A. Yasir, "Realization of general first-order optical systems using nine thin cylindrical lenses of arbitrary focal length and four units of free propagation distance", Journal of the Optical Society of America A 38 644 (2021).

https://doi.org/10.1364/JOSAA.423143
