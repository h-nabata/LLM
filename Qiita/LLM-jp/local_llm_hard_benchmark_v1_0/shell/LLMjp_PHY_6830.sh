#!/bin/bash


curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-PHY-P01_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "A hoop of mass $M$ and radius $a$ is constrained to remain in a vertical plane. Its orientation is fixed, but its center can move freely along a frictionless horizontal rail. No external horizontal force acts on the hoop.\n\nA bead of mass $m$ moves without friction along the hoop. Let $X$ be the horizontal coordinate of the center of the hoop, and let $\\theta$ denote the angular position of the bead measured from the lowest point of the hoop. Thus, the coordinates of the bead are\n\n$$\nx=X+a\\sin\\theta,\\qquad y=-a\\cos\\theta.\n$$\n\nLet $g$ be the gravitational acceleration.\n\n(1) Write the Lagrangian $L$ of the system in terms of $X$ and $\\theta$, and show that the momentum $P_X$ conjugate to $X$ is conserved.\n\n(2) Suppose that the total horizontal momentum of the system is zero, i.e. $P_X=0$. Eliminate $X$ and obtain an effective Lagrangian involving only $\\theta$. Then derive the exact equation of motion for $\\theta$.\n\n(3) Determine the angular frequency of small oscillations about $\\theta=0$.\n\n(4) Assume $P_X=0$, and suppose that at some instant $X=0$ and $\\theta=\\theta_0$. Determine the subsequent position $X$ of the center of the hoop as a function of $\\theta$."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-PHY-P02_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "A particle of mass $m$ moves in a plane under the central potential\n\n$$\nV(r)=-\\frac{k}{r}+\\frac{\\lambda}{2r^2},\n$$\n\nwhere $k>0$ and $\\lambda$ is a real constant. Let the nonzero angular momentum be $\\ell$.\n\n(1) Determine the effective potential $V_{\\mathrm{eff}}(r)$. Find the condition under which a stable circular orbit of finite radius exists, and determine its radius $r_0$.\n\n(2) Let $u=1/r$. Derive the differential equation satisfied by the orbit $u(\\phi)$.\n\n(3) For a bound orbit, express the solution in the form\n\n$$u(\\phi)=u_0 \\left( 1+e\\cos[\\nu(\\phi-\\phi_0)]\\right )$$\n\nand determine $u_0$ and $\\nu$. Also determine the increase in azimuthal angle between two successive periapses.\n\n(4) Relative to the Kepler problem $\\lambda=0$, determine the periapsis precession per radial period. Then obtain its leading-order approximation for\n\n$$\n\\left|\\frac{m\\lambda}{\\ell^2}\\right|\\ll1,\n$$\n\nand state whether the precession is prograde or retrograde for each sign of $\\lambda$.\n\nFinally, for a noncircular bound orbit with $e\\neq0$, state the necessary and sufficient condition in terms of $\\nu$ for the orbit to be closed."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-PHY-P03_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "Consider a two-dimensional, steady flow of an incompressible and inviscid fluid of density $\\rho$. Outside a circular cylinder of radius $a$, i.e. for $r\\ge a$, the stream function is\n\n$$\n\\psi(r,\\theta)=U\\left(r-\\frac{a^2}{r}\\right)\\sin\\theta\n-\\frac{\\Gamma}{2\\pi}\\ln\\frac{r}{a}.\n$$\n\nThe velocity components in polar coordinates are defined by\n\n$$\nv_r=\\frac{1}{r}\\frac{\\partial\\psi}{\\partial\\theta},\n\\qquad\nv_\\theta=-\\frac{\\partial\\psi}{\\partial r}.\n$$\n\nLet $U>0$. The circulation $\\Gamma$ is real, with $\\Gamma>0$ corresponding to counterclockwise circulation.\n\n(1) Determine $v_r$ and $v_\\theta$, and show that the fluid does not penetrate the cylinder surface $r=a$.\n\n(2) Determine the condition on $\\Gamma$ for stagnation points to exist on the surface of the cylinder, and determine their angular positions.\n\n(3) Let the pressure at infinity be $p_\\infty$. Using Bernoulli's theorem, determine the pressure distribution $p(a,\\theta)$ on the surface of the cylinder.\n\n(4) Integrate the pressure over the cylinder surface and determine the $x$- and $y$-components of the force per unit length exerted by the fluid on the cylinder.\n\nDo not merely quote the Kutta?Joukowski formula. Derive the sign of the force explicitly using the circulation convention specified above."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-PHY-P04_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "A perfectly conducting sphere of radius $a$ is centered at the origin. A point charge $q$ is placed on the $z$-axis at $z=d$, where $d>a$. Let $\\varepsilon_0$ denote the vacuum permittivity.\n\nFirst consider the case in which the conducting sphere is grounded.\n\n(1) Using the method of images, determine the magnitude and position of the image charge that reproduces the electrostatic potential outside the sphere.\n\n(2) Determine the force acting on the point charge $q$. Also determine the total charge induced on the conducting sphere.\n\nNow consider the same conducting sphere when it is isolated rather than grounded, with total charge zero.\n\n(3) Determine the additional image charge required to represent the electric field outside the sphere while satisfying the neutrality condition. Also determine the electric potential of the conducting sphere.\n\n(4) Determine the force acting on the point charge $q$.\n\n(5) In the limit $d\\gg a$, obtain the leading asymptotic form of the force found in (4). Compare its dependence on $d$ with that for the grounded sphere."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-PHY-P05_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "A homogeneous conductor of conductivity $\\sigma$ and permeability $\\mu$ occupies the half-space $x>0$. The displacement current may be neglected relative to the conduction current.\n\nAt the surface $x=0$, an external magnetic field is applied such that\n\n$$\nH_z(0,t)=H_0\\cos\\omega t.\n$$\n\nAll physical quantities depend only on $x$, and the electromagnetic fields vanish as $x\\to\\infty$ inside the conductor.\n\nUse the complex time dependence $e^{i\\omega t}$.\n\n(1) Starting from Maxwell's equations and Ohm's law, derive the diffusion equation satisfied by $H_z(x,t)$ inside the conductor.\n\n(2) Define the skin depth $\\delta$, and determine the complex amplitude $\\widetilde H_z(x)$ of the magnetic field.\n\n(3) Determine the electric field $\\widetilde E_y(x)$ inside the conductor and the surface impedance\n\n$$\nZ_s=\\frac{\\widetilde E_y(0)}{\\widetilde H_z(0)}.\n$$\n\n(4) Determine the time-averaged Joule heating per unit volume and integrate it over the conductor to obtain the average absorbed power per unit surface area."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-PHY-P06_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "A uniform string of tension $T$ and linear mass density $\\mu$ extends over $-\\infty<x<\\infty$.\n\nAt $x=0$, a point mass $M$ is inserted into the string. The mass is also connected to a fixed support by a spring of spring constant $K>0$. The displacement of the point mass is always equal to the displacement of the string at $x=0$. There is no dissipation.\n\nA wave of angular frequency $\\omega$ is incident from the left. Define the wave speed and wavenumber by\n\n$$\nc=\\sqrt{\\frac{T}{\\mu}},\n\\qquad\nk=\\frac{\\omega}{c}.\n$$\n\nThe displacement is written as\n\n$$\ny(x,t)=\n\\begin{cases}\n\\operatorname{Re}\\left[(e^{ikx}+r e^{-ikx})e^{-i\\omega t}\\right],&x<0,\\\\\n\\operatorname{Re}\\left[t e^{ikx}e^{-i\\omega t}\\right],&x>0.\n\\end{cases}\n$$\n\n(1) Using continuity of displacement at $x=0$ and the equation of motion of the point mass, derive the equations satisfied by the reflection and transmission amplitudes $r$ and $t$.\n\n(2) Define\n\n$$\n\\eta=\\frac{K-M\\omega^2}{2kT}.\n$$\n\nDetermine $r$ and $t$ in terms of $\\eta$.\n\n(3) Determine the energy reflection coefficient $R$ and the energy transmission coefficient $\\mathcal T$, and show that\n\n$$\nR+\\mathcal T=1.\n$$\n\n(4) Determine the angular frequency at which perfect transmission occurs, and explain the physical reason for this phenomenon."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-PHY-P07_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "Consider the $n=2$ level of the hydrogen atom. Neglect electron spin, fine structure, hyperfine structure, and the diamagnetic term proportional to $B^2$.\n\nApply simultaneously a weak uniform electric field\n\n$$\n\\mathbf E=E\\mathbf e_z\n$$\n\nand a weak uniform magnetic field\n\n$$\n\\mathbf B=B\\mathbf e_x.\n$$\n\nRestrict attention to the degenerate $n=2$ subspace and use the real orbital basis\n\n$$\n|2s\\rangle,\\quad |2p_x\\rangle,\\quad |2p_y\\rangle,\\quad |2p_z\\rangle.\n$$\n\nThe perturbation Hamiltonian is\n\n$$\nH'=eEz+\\frac{\\mu_BB}{\\hbar}L_x,\n$$\n\nwhere $e>0$ is the elementary charge and $\\mu_B$ is the Bohr magneton.\n\nChoose the phases of the basis states such that\n\n$$\n\\langle 2s|eEz|2p_z\\rangle=d,\n\\qquad\nd=3ea_0E.\n$$\n\nAll other Stark matrix elements between $|2s\\rangle$ and the $2p$ states may be taken to vanish.\n\n(1) Determine the $4\\times4$ matrix representation of $H'$ in the ordered basis\n\n$$\n(|2s\\rangle,|2p_z\\rangle,|2p_y\\rangle,|2p_x\\rangle).\n$$\n\n(2) Determine all first-order energy shifts of the $n=2$ level and state their degeneracies.\n\n(3) Show that the limits $E=0$ and $B=0$ reproduce the usual orbital Zeeman effect and linear Stark effect, respectively.\n\n(4) Explain why, when the electric and magnetic fields are perpendicular, it is incorrect simply to add the Stark shifts $\\pm d$ independently to the Zeeman shifts $\\pm\\mu_BB$."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON

curl -sS http://127.0.0.1:8080/v1/chat/completions \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON' | python3 -m json.tool > SP-PHY-P08_LLMjp.log
{
  "messages": [
    {
      "role": "user",
      "content": "A single planet moves in a circular orbit around a star. The orbit is exactly edge-on as viewed by the observer, and the transit passes through the center of the stellar disk.\n\nLet the stellar mass and radius be $M_\\*$ and $R_\\*$, and the planetary mass and radius be $M_p$ and $R_p$, respectively. Assume\n\n$$M_p\\ll M_\\*.$$\n\nThe stellar surface brightness is uniform, and limb darkening may be neglected.\n\nThe following four quantities are measured exactly:\n\n- orbital period $P$,\n- transit depth $\\delta$,\n- total transit duration $\\tau$, measured from first contact to fourth contact,\n- stellar radial-velocity semi-amplitude $K$.\n\nLet $a$ denote the orbital separation, i.e. the semimajor axis of the relative orbit.\n\n(1) Determine $k=\\dfrac{R_p}{R_{\\*}}$ from $\\delta$. Then, using the exact transit geometry, express $a/R_\\*$ solely in terms of $P$, $\\tau$, and $\\delta$.\n\n(2) Using Kepler's third law, express the stellar mean density\n\n$$\\rho_\\* = \\dfrac{3M_\\*}{4\\pi {R_\\*}^3}$$\n\nsolely in terms of the observables $P$, $\\tau$, and $\\delta$.\n\n(3) Determine the combination of $M_p$ and $M_\\*$ that is fixed by the radial-velocity semi-amplitude $K$.\n\n(4) Can the absolute values of $M_\\*$, $R_\\*$, $M_p$, $R_p$ be determined uniquely from these four observables alone?\n\nIf not, explicitly exhibit a one-parameter scaling transformation that leaves all four observables $P,\\delta,\\tau,K$ invariant, thereby proving the non-uniqueness.\n\n(5) Suppose an independent external observation provides the absolute value of $R_\\*$. Give formulas for determining $M_\\*$, $R_p$, and $M_p$."
    }
  ],
  "reasoning_effort": "medium",
  "thinking_budget_tokens": 24576,
  "temperature": 0.0,
  "max_tokens": 30000,
  "seed": 42
}
JSON


