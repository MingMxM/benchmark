# Multicomponent diffusion in fractured basalt
# CO2-rich water diffuses from inlet (left) into fracture/matrix
# 10 fluid components: H2O + H+ + Na+ + K+ + Ca++ + Mg++ + Al+++ + Fe++ + SiO2(aq) + HCO3-
# 9 primary variables (N-1), H2O is implicit
# Diffusion coefficient = 7.5e-9 m2/s at 100C (Xiong et al. 2017)

[Mesh]
  type = MeshGeneratorMesh
  [file]
    type = FileMeshGenerator
    file = benchmark.msh
  []
  [scale_to_m]
    type = TransformGenerator
    input = file
    transform = SCALE
    vector_value = '0.001 0.001 0.001'
  []
[]

[GlobalParams]
  PorousFlowDictator = dictator
  gravity = '0 0 0'
[]

[Variables]
  [f_H]
    initial_condition = 1e-07
  []
  [f_Na]
    initial_condition = 1e-06
  []
  [f_K]
    initial_condition = 1e-06
  []
  [f_Ca]
    initial_condition = 1e-06
  []
  [f_Mg]
    initial_condition = 1e-06
  []
  [f_Fe]
    initial_condition = 1e-06
  []
  [f_Al]
    initial_condition = 1e-06
  []
  [f_SiO2]
    initial_condition = 1e-06
  []
  [f_HCO3]
    initial_condition = 1e-06
  []
[]

[AuxVariables]
  [pressure]
    initial_condition = 1e7   # 10 MPa
  []
[]

[UserObjects]
  [dictator]
    type = PorousFlowDictator
    number_fluid_components = 10
    number_fluid_phases = 1
    porous_flow_vars = 'f_H f_Na f_K f_Ca f_Mg f_Fe f_Al f_SiO2 f_HCO3'
  []
[]

[Kernels]
  # H+
  [mass_H]
    type = PorousFlowMassTimeDerivative
    fluid_component = 0
    variable = f_H
  []
  [diff_H]
    type = PorousFlowDispersiveFlux
    fluid_component = 0
    disp_long = 0
    disp_trans = 0
    variable = f_H
  []
  # Na+
  [mass_Na]
    type = PorousFlowMassTimeDerivative
    fluid_component = 1
    variable = f_Na
  []
  [diff_Na]
    type = PorousFlowDispersiveFlux
    fluid_component = 1
    disp_long = 0
    disp_trans = 0
    variable = f_Na
  []
  # K+
  [mass_K]
    type = PorousFlowMassTimeDerivative
    fluid_component = 2
    variable = f_K
  []
  [diff_K]
    type = PorousFlowDispersiveFlux
    fluid_component = 2
    disp_long = 0
    disp_trans = 0
    variable = f_K
  []
  # Ca++
  [mass_Ca]
    type = PorousFlowMassTimeDerivative
    fluid_component = 3
    variable = f_Ca
  []
  [diff_Ca]
    type = PorousFlowDispersiveFlux
    fluid_component = 3
    disp_long = 0
    disp_trans = 0
    variable = f_Ca
  []
  # Mg++
  [mass_Mg]
    type = PorousFlowMassTimeDerivative
    fluid_component = 4
    variable = f_Mg
  []
  [diff_Mg]
    type = PorousFlowDispersiveFlux
    fluid_component = 4
    disp_long = 0
    disp_trans = 0
    variable = f_Mg
  []
  # Fe++
  [mass_Fe]
    type = PorousFlowMassTimeDerivative
    fluid_component = 5
    variable = f_Fe
  []
  [diff_Fe]
    type = PorousFlowDispersiveFlux
    fluid_component = 5
    disp_long = 0
    disp_trans = 0
    variable = f_Fe
  []
  # Al+++
  [mass_Al]
    type = PorousFlowMassTimeDerivative
    fluid_component = 6
    variable = f_Al
  []
  [diff_Al]
    type = PorousFlowDispersiveFlux
    fluid_component = 6
    disp_long = 0
    disp_trans = 0
    variable = f_Al
  []
  # SiO2(aq)
  [mass_SiO2]
    type = PorousFlowMassTimeDerivative
    fluid_component = 7
    variable = f_SiO2
  []
  [diff_SiO2]
    type = PorousFlowDispersiveFlux
    fluid_component = 7
    disp_long = 0
    disp_trans = 0
    variable = f_SiO2
  []
  # HCO3-
  [mass_HCO3]
    type = PorousFlowMassTimeDerivative
    fluid_component = 8
    variable = f_HCO3
  []
  [diff_HCO3]
    type = PorousFlowDispersiveFlux
    fluid_component = 8
    disp_long = 0
    disp_trans = 0
    variable = f_HCO3
  []
[]

[BCs]
  # CO2-rich water inlet boundary conditions
  # H+ and HCO3- are higher to represent CO2-rich water
  [inlet_H]
    type = DirichletBC
    boundary = inlet
    variable = f_H
    value = 0.0007      # high H+ for CO2-rich water (low pH)
  []
  [inlet_Na]
    type = DirichletBC
    boundary = inlet
    variable = f_Ca
    value = 1e-06
  []
  [inlet_K]
    type = DirichletBC
    boundary = inlet
    variable = f_K
    value = 1e-06
  []
  [inlet_Ca]
    type = DirichletBC
    boundary = inlet
    variable = f_Ca
    value = 1e-06
  []
  [inlet_Mg]
    type = DirichletBC
    boundary = inlet
    variable = f_Mg
    value = 1e-06
  []
  [inlet_Fe]
    type = DirichletBC
    boundary = inlet
    variable = f_Fe
    value = 1e-06
  []
  [inlet_Al]
    type = DirichletBC
    boundary = inlet
    variable = f_Al
    value = 1e-06
  []
  [inlet_SiO2]
    type = DirichletBC
    boundary = inlet
    variable = f_SiO2
    value = 1e-06
  []
  [inlet_HCO3]
    type = DirichletBC
    boundary = inlet
    variable = f_HCO3
    value = 0.0423       # high HCO3- for CO2-rich water
  []
[]

[FluidProperties]
  [the_simple_fluid]
    type = SimpleFluidProperties
    bulk_modulus = 2e9
    viscosity = 0.001
    density0 = 1000
  []
[]

[Materials]
  [temperature]
    type = PorousFlowTemperature
    temperature = 373.15   # 100C in Kelvin
  []
  [matrix_porosity]
    type = PorousFlowPorosity
    block = Matrix
    porosity_zero = 0.3
  []
  [fracture_porosity]
    type = PorousFlowPorosity
    block = Fracture
    porosity_zero = 0.7
  []
  [matrix_permeability]
    type = PorousFlowPermeabilityConst
    block = Matrix
    permeability = '1e-16 0 0  0 1e-16 0  0 0 1e-16'
  []
  [fracture_permeability]
    type = PorousFlowPermeabilityConst
    block = Fracture
    permeability = '1e-14 0 0  0 1e-14 0  0 0 1e-14'
  []
  [fs]
    type = PorousFlow1PhaseFullySaturated
    porepressure = pressure
  []
  [massfrac]
    type = PorousFlowMassFraction
    mass_fraction_vars = 'f_H f_Na f_K f_Ca f_Mg f_Fe f_Al f_SiO2 f_HCO3'
  []
  [simple_fluid]
    type = PorousFlowSingleComponentFluid
    fp = the_simple_fluid
    phase = 0
  []
  [diffusion_coefficient]
    type = PorousFlowDiffusivityConst
    # 7.5e-9 m2/s for all 10 components (9 solutes + H2O)
    diffusion_coeff = '7.5e-9 7.5e-9 7.5e-9 7.5e-9 7.5e-9 7.5e-9 7.5e-9 7.5e-9 7.5e-9 7.5e-9'
    tortuosity = 1
  []
  [relp]
    type = PorousFlowRelativePermeabilityConst
    phase = 0
  []
[]

[Preconditioning]
  active = basic
  [basic]
    type = SMP
    full = true
    petsc_options = '-ksp_diagonal_scale -ksp_diagonal_scale_fix'
    petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type -pc_asm_overlap'
    petsc_options_value = ' asm      lu           NONZERO                   2'
  []
  [preferred_but_might_not_be_installed]
    type = SMP
    full = true
    petsc_options_iname = '-pc_type -pc_factor_mat_solver_package'
    petsc_options_value = ' lu       mumps'
  []
[]

[Executioner]
  type = Transient
  solve_type = Newton
  end_time = 8e5    # ~28 days in seconds (100 days = 8.64e6)
  
  [TimeStepper]
    type = SolutionTimeAdaptiveDT
    dt = 1000
  []

  # dt = 8.64e4          # 1 day in seconds
  nl_rel_tol = 1e-7
[]

[Outputs]
  exodus = true
  csv = true
[]